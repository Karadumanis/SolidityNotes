//SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.0;

contract Functions {
    
    uint luckyNumber = 7;

    function showNumber() public view returns(uint) {
        return luckyNumber;
    }

/* Önce bir luckynumber belirledik ardından compile ve deploy ettikten sonra deploy altında yer alan tanımladığımız
function için bir buton görüyoruz ki bu butona -functiona- atadığımız isimde bir buton çıktı -showNumber-.
tıkladığımız da function çalıştı, luckyNumber 7 olarak görüntülendi*/

//yukarıdaki functionı daha kısa şu şekilde yazabiliriz:
// uint public luckyNumber = 7;

    function setNumber(uint newNumber) public {
        luckyNumber = newNumber;
    }
/* ilk satırda yeni bir number olsun ve bu number dışarıdan atansın dedik. Dışarıdan gelecek olan bu newNumber ı da
luckNumber a eşitledik. compile deploy işlemleri sonrası deployed conts kısmında luckyNumber ın belirlenmesi ve showNumber..*/

    function afewVariables() public pure returns(uint, bool, bool) {
        return(5, false, true);
    }

/*yukarıda belirlediğimiz variable türlerine isim atayarak da yazabilir ve return komutu olamadan geri dönüş alabiliriz: */

    function anotherVariables() public pure returns( uint x, bool y, bool z) {
        x = 6;
        y = false;
        z = true;
    }

// örneğin bir Q için bir değer atadık ve sonrasında bu değeri değişrtirmek istiyoruz:
    
    uint public Q = 72;
    
    function setQ(uint newQ) public {
        Q = newQ;
    }

// Eğer bir veriyi yalnızca görüntülemek istiyorsak view komutunu kullanıyoruz:

    uint public Y = 17;

    function setY(uint newY) view public {
    }

    uint k = 9;
    function setK(uint m) public view returns (uint) {
        return k + m;
    }

    function add2(uint a, uint b) public view returns(uint){
        return a + b + block.timestamp;
    }

// Eğer bir veriyi okuma veya veride değişiklik yapmayacaksak pure komutunu ekliyoruz.

    function add(uint t, uint y) public pure returns(uint) {
        return t + y;
    }


}