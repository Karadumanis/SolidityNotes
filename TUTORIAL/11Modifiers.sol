//SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.0;

contract Modifier {

    enum Status {   
        Taken,       //0
        Preparing,   //1
        Boxed,       //2
        Shipped     //3
    }
    
    struct Order {
        address customer;    
        string zipCode;      
        uint256[] products; 
        Status status;       
    }

    Order[] public orders;  //orders arrayi oluşturduk
    address public owner;   //sipariş durumlarını (enum) takip edecek yetkili tanımladık
    uint256 public txCount;


    constructor() {            //ownerın kim olacağını söyledik
        owner = msg.sender ;
    } 


    function creatorOrder(string memory _zipCode, uint256[] memory _products) checkProducts(_products) incTx external returns(uint256) {  //memory yalnızca bu func içinde yer alıp sonra yok olacak veriler için kullanıyoruz. stringler, arrayler, bytelar functiona parametre olarak gönderilirken konumu belirtilmeli, memory de bu işe yarar.
        //require (_products.length > 0, "No Stocked");    //bu kısma artık ihtiyaç yok, modifier ile kontrol yapacağız.

//Bir struct oluşturmak için 3 farklı yazım yolu var:
       
        Order memory order; //Bir struct kopyası oluşturuldu.
        order.customer = msg.sender;
        order.zipCode = _zipCode;
        order.products = _products;
        order.status = Status.Taken;
    
        orders.push(order);         //Yukarıda yapay olarak oluşturulan order değişkenini yine yukarıda oluşturulan orderS arrayine eklemiş olduk.
        return orders.length - 1;   //returns değeri uint256 eklemiştik
                                    //arrayler 0.elemandan başlar. ama biz 1 order oluşturduğumuz için 1-1=0 olsun diye -1 yazdık. örnek 0 1 2 3 burada 4 eleman var biz birincisine ulaşmak için 1-1=0

    
    }

   function advancedOrder(uint256 _orderId) checkOrderId(_orderId) onlyOwner external {   //enum değerlerinin takibi yani sipariş durum güncellemesi yapmak için bir funct.
      //require (owner == msg.sender, "Invalid User") ;  //gerek kalmadı
       //require (_orderId < orders.length, "Invalid Order Id");   //oldu ki kullanıcı hatalı giriş yapmak istedi. Yani orders adlı arrayde 3 eleman varken 5.eleman girilmek istedi, bu durumun önüne geçmek için 

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

    function getOrder(uint256 _orderId) checkOrderId (_orderId) external view returns(Order memory) {
        //require (_orderId < orders.length, "Invalid Order Id");   //gerek kalmadı
        
        //bu sorgulamayı da 2 şekilde yapabiliriz:

        return orders[_orderId];


    }

    //Örneğin sipariş adresini değiştirmek istiyoruz:

    function updateZip (uint256 _orderId, string memory _zip) onlyCustomer (_orderId) incTx external {   //view yok çünkü değişiklik yapacağız.
        //require (_orderId < orders.length, "Invalid Order Id");          //gerek kalmadı
        Order storage order = orders[_orderId];
        //require (order.customer == msg.sender, "You are not owner.") ;  // gerek kalmadı
        order.zipCode = _zip ;
    
    }

    modifier checkProducts (uint256[] memory _products) {
        require (_products.length > 0, "No Stocked");
        _; //bu kısım functiondaki bodyi temsil ediyor, require dan önce çalışmasını istiyorsan yukarı, öncesine de alabilirsin.
    }

    modifier checkOrderId (uint256 _orderId) {
        require (_orderId < orders.length, "Invalid Order Id");
        _;
    }

    modifier incTx {
        _;  // Yukarıda bahsedildiği gibi önce func çalışacak sonra txcount artacak
        txCount++ ;
    }

    modifier onlyOwner {
        require (owner == msg.sender, "Invalid User") ;
        _;
    }

    modifier onlyCustomer (uint256 _orderId) {
        require (orders[_orderId].customer == msg.sender, "You are not owner.") ;
        _;
    }

}