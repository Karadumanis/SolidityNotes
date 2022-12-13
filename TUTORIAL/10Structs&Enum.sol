//SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.0;

contract StructsEnum {

// Bu konuları çalışırken oluşturacağımız senaryo: bir mağaza ve o mağazanın siparişlerinin takibi.
// Struct oluşturulan farklı veri tiplerini bir paket halinde topladığımız yeni bir veri tipidir.
// Enum ise siparişin durumlarını belirten bir veri tipi olarak ele alacağız.

    enum Status {    // enum da sıralanan veriler tanımlanan isimleri ile değil sıralandıklar index nosu ile görüntülenecek.
    //enum Satatus {Taken, Preparing, ...} şeklinde de yazılabilir.
        Taken,       //0
        Preparing,   //1
        Boxed,       //2
        Shipped     //3
    }
    
    struct Order {
        address customer;    /*müşterinin adresi(cüzdan nosu)*/
        string zipCode;      /*zipcode un yer aldığı bir string*/
        uint256[] products;  /* products yer alacak bir array*/
        Status status;       //enumı struct içine yerleştirdik.
    }

    Order[] public orders;  //orders arrayi oluşturduk
    address public owner;   //sipariş durumlarını (enum) takip edecek yetkili tanımladık

    constructor() {            //ownerın kim olacağını söyledik
        owner = msg.sender ;
    } 


    function creatorOrder(string memory _zipCode, uint256[] memory _products) external returns(uint256) {  //memory yalnızca bu func içinde yer alıp sonra yok olacak veriler için kullanıyoruz. stringler, arrayler, bytelar functiona parametre olarak gönderilirken konumu belirtilmeli, memory de bu işe yarar.
        require (_products.length > 0, "No Stocked");    //parametre olarak girdiğimiz ürünler arrayi boş mu değil mi kontrolü için

//Bir struct oluşturmak için 3 farklı yazım yolu var:
       
        Order memory order; //Bir struct kopyası oluşturuldu.
        order.customer = msg.sender;
        order.zipCode = _zipCode;
        order.products = _products;
        order.status = Status.Taken;
    
        orders.push(order);         //Yukarıda yapay olarak oluşturulan order değişkenini yine yukarıda oluşturulan orderS arrayine eklemiş olduk.
        return orders.length - 1;   //returns değeri uint256 eklemiştik
                                    //arrayler 0.elemandan başlar. ama biz 1 order oluşturduğumuz için 1-1=0 olsun diye -1 yazdık. örnek 0 1 2 3 burada 4 eleman var biz birincisine ulaşmak için 1-1=0
        
//orderı başka şekilde de oluşturabiliriz:
        // orders.push(
        //     Order({
        //         customer: msg.sender,
        //         zipCode: _zipCode,
        //         products: _products,
        //         status: Status.Taken
        //     })
        // );
        // return orders.length - 1;
    
//Order oluşturmanın 3. ve en kısa yolu:

    // orders.push(Order(msg.sender, _zipCode, _products, Status.Taken));
    
    // return orders.length - 1;
    
    }

   function advancedOrder(uint256 _orderId) external {   //enum değerlerinin takibi yani sipariş durum güncellemesi yapmak için bir funct.
       require (owner == msg.sender, "Invalid User") ;  //bu sipariş durumunu güncelleyen kişi yetkili mi? owner mı? değilse hata mesajı
       require (_orderId < orders.length, "Invalid Order Id");   //oldu ki kullanıcı hatalı giriş yapmak istedi. Yani orders adlı arrayde 3 eleman varken 5.eleman girilmek istedi, bu durumun önüne geçmek için 

       Order storage order = orders[_orderId] ; //Order adlı arrayde bulunan order adlı değişkene işaret etmiş olduk. function bittikten sonra da bu değişken hayatta kalmaya devam edecek çünkü storage ile point ettik.
       require (order.status != Status.Shipped, "Order is already shipped") ;    //Burada bir engelleme/kontrol dah ekliyoruz o da: ürün shipped olmuşsa kullanıcı hata yaparak onun boxed vs olarak sisteme girilmesini engellemek için.
   
       if (order.status == Status.Taken) {
           order.status = Status.Preparing;

       } else if (order.status == Status.Preparing) {
           order.status = Status.Boxed;
       
       }else if (order.status == Status.Boxed) {
           order.status = Status.Shipped;
       }
   
   } 
    
    //Bir struct a nasıl erişilir. Pek gerekli bir funct. değil. Çünkü arrayi public olarak tanımlamıştık

    function getOrder(uint256 _orderId) external view returns(Order memory) {
        require (_orderId < orders.length, "Invalid Order Id");   //böyle bir eleman var mı? Aynısını yukarıda yazmıştık.
        
        //bu sorgulamayı da 2 şekilde yapabiliriz:

        return orders[_orderId];

        //VEYA:

       /* Order memory order == orders[_orderId];  //daha yaptığımız gibi bir kopyasına erişmiş, işaret etmiş olduk.
        return order; */


    }

    //Örneğin sipariş adresini değiştirmek istiyoruz:

    function updateZip (uint256 _orderId, string memory _zip) external {   //view yok çünkü değişiklik yapacağız.
        require (_orderId < orders.length, "Invalid Order Id");          //order-eleman- var mı yok mu?
        Order storage order = orders[_orderId];
        require (order.customer == msg.sender, "You are not owner.") ;  // herkes herkesin teslimat adresini değiştirmesin diye sorduk: sen order structı içindeki customer değişkeni misin?
        order.zipCode = _zip ;
    
    }

}

//son olarak değişkenler hariç tüm public leri external a çevirdik ki daha güvenli olsun

//Notlar: enum zorunlu bir kullanım değil fakat okunması açısından kolaylık sağlıyor. enum yerine doğrudan sayılarla da tanımlayabilirdik
//structlar yerine ayrı ayrı mappingler de oluşturabiliriz ama dağınık bir yapı yerine structlar dah düzenli.
//örneğin: mapping (uint => address) customer;
//         mapping (uint => string) zipCode;
//         mapping (uint => ?burada array için ne yazmalı?