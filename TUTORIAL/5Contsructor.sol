//SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.0;

contract Constructor {

    string public tokenName;
    uint public totalSupply;

    constructor (string memory name, uint number) {
        tokenName = name;
        totalSupply = number;
    }

/* İki değişkinemiz var dedik, sonra bu değişkenlere atama yapmak için constructor komutunu kullandık.
Dışarıdan girilecek olan değerleri bekliyor. Deploydan sonra FUNCTIONS bölümünden bu değişkenleri gireceğiz.*/

// Yukarıdaki fonksiyondaki değerlerde değişiklik yapmak istediğimde aşağıdaki gibi:

    function set(uint number) public {
        totalSupply = number;
    }
}

// Bazen ilk atanan verilerin değişmemesini isteyebiliriz bu durumda kullanacağımız iki komut var: Constant ve Immutable

contract Constant{

    //uint public constant number = 10;
//Bir number belirledik ve değer olarak 10 atadık. Bu değeri değiştirmek için
//yukarıdaki örneklerde olduğu gibi bir funkction yazdığımızda hata alırız.
//Çünkü constant olarak işaretlemiştik.

   /*  function set(uint num) public {
        number = num;
    } */
}


contract Immutable {

    uint public immutable Number2;

    constructor(uint num2) {
        Number2 = num2;
    }
} //devamı immutable da 