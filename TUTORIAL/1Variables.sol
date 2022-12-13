//SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.9;

contract Variables {
    int number = 12;
// Statik bir dil olduğundan değişkenleri belirtmeliyiz, yukarıdaki gibi "int"
// Her satırın sonu ';' ile kapatılmalıdır.

// Üç tür değişkenimiz bulunuyor:

// Fixed-Size Types
    
    bool isTrue = false; // false
    // type name;    veya     type name = değişken şeklinde yazılır.

    int number = 12;
    // int şeklinde yazıp bıraktığımızda bunun anlamı 2^256 dır, bunun anlamı da -2^256 ile 2^256 arasında bir veri tutulur
    // int8 şeklinde yazıldığında -2^8 ile 2^8 arasında veri tutulmuş olur.

    uint number2 = 5;
    // bunun anlamı ise eksi değerlerin olmamasıdır. 0 to 2^256

    address myAddress = 0x67A6a6C348467ad65164642c23dCA6aad18d5005;
    // 20 byte uzunluğundadır, tüm eth adresleri aynı uzunlukta olduğundan boyutu sabittir.

    bytes32 name1 = "ismail";
    // stringlere benzer. dinamik boyutludur fakat örneğin bytes32 şeklinde yazılırsa sınırlandırma yapılmış olur.
    // bytes lar 1 to 32 şeklinde değerlenebilir.


//Dynamic Size Types
    
    string name2 = "karaduman";
    /* stringlerde yazı karakterlerini tutarız. Bytes ile farkı: byteslar veriyi koda dönüştürerek tutarken 
    stringler yazı olarak tutulur */

    bytes name3 = "sahin";
    // yukarıda da belirttiğimiz gibi eğer bytes'ın yanına değer yazmazsak dinamik veri olmuş olur.

    uint[] array = [1, 2, 3, 4, 5];
    // arrayler yani dizinler birden çok veriyi tutmamıza yarar. arraye sonradan veri eklenebilir ya da çıkarılabilir.
    // pyhton daki gibi arrayler 0. indexten başlar.

    mapping (uint => string) list;
    // mapping arraylere benzer. Farkı ise vereceğimiz bir anahtar kelimenin belirli bir veriyi tutmasıdır.
    // yukarıdaki örnek üzerinden gidersek ben bir numara (uint) söyleyeceğim bu da bir string verisini tutacak.


//User Defined Variables
    
    // bu tür değişkenleri biz belirliyoruz, örneğin:
    struct human {
        uint ID;
        string name;
        uint age;
        address address1;
    }

    Human person1;
       person1.ID = 64389540905 
       person1.name = "Eda";
       erson1.age = 24;
       person1.address = 0x67A6a6C348467ad65164642c23dCA6aad18d5005 //sepolia test network

    enum trafficLight; {
        RED,
        YELLOW,
        GREEN,
    }

    trafficLight.RED;
    /* struct a benzer bir yapı. Yukarıdaki örnekten yola çıkacak olursak, üç eleman arasında bir seçim yapmak
    veya RED olursa ... olsun Yellow olursa ... olsun şeklinde kullanılabilir. if else true false şeklinde kullanılabilir */


//OPERATORS

if(number == 12) {

}
//if (condition) {  } bunun anlamı eğer durum yani number= 12 ise true döndür değilse false döndür.

if(number !=2);
// eğer durumun doğru olmamasını sorguluyorsak == yerine != yazılır.
// bu durumda if (number != 2) şeklinde ise true yanıtı alınır. çünkü number 2'ye eşit değildir.

if(number >=2);
//2 ye eşit veya büyük olmasını sorguladığımız durumlarda bu şekilde kullanılır.



1 wei = 1;
1 eth = 10^18 wei;
1 gwei = 10^9 wei;

1 = 1 seconds; // veya direkt 1'de yazılabilir.
1 minutes = 60 seconds;
1 hours = 60 minutes = 3600 seconds;
// ay hafta yıl olarak devam edilebilir.


//State Variable
//Local Variable
//Global Variable