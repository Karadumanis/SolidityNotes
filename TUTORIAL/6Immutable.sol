//SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.0;

/* burada Number2 adında bir girdi oluşturduk bu girdinin değerinin belirlenmesi için
constructor komutu ile num2 ye eşit olacağını söyledik, num2 ye de 12 değerini atadık */

contract Immutable {

    /*uint public immutable Number2;

    constructor(uint num2) {
        Number2 = num2;
    } */
// Number2 değerini değiştirmek için bir function yazdığımızda hata alacağız.
// Çünkü immutable olduğunu belirtmiştik

/* Immutable ile Constant farkı: Constant komutunda atanan değer en başta belirlenmelidir,
immutable da ise yukarıdaki gibi constructor yapısı içinde sonradan atama yapılabilir */

/* Örneğin bir owner olsun istiyorum ve bu ownerın kontratı deploy eden kullanıcı olmasını istiyorum: */

    address public immutable owner;

    constructor() {
    owner = msg.sender;
    }
// kodu compile ettim ve 0xAb8...35cb2 adresi seçiliyken deploy ettim. Böylelikle bu adres owner olarak atanmış oldu.
}
