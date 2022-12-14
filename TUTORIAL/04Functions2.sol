//SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.0;

// PUBLİC, EXTERNAL, INTERNAL, PRIVATE
// Public: Bu fonksiyonu hem dışarıdan kullanıcılar çağırabilir hem de sözleşme çağırabilir.

contract Functions {

    function add(uint a, uint b) public pure returns(uint) {
        return a + b;
    }

    function add2(uint c, uint d) public pure returns(uint){
        return c + d;
    }

// İki farklı fonksiyonu birbiriyle iletişime sokmak için:

    function publicKeyWord() public pure returns(string memory) {
        return "Bu bir Public fonksiyondur";
    }

    function callpublicKeyWord() public pure returns(string memory) {
        return publicKeyWord();
    }

// Private: Dışarıdan kimse bu fonksiyona ulaşamaz, yalnızca sözleşme ulaşabilir.

    function privateKeyWord() private pure returns(string memory) {
        return "Bu bir Private fonksiyondur.";
    }

//Yukarıda yazılan kod compile ve deploy işlemlerinin ardından FUNCTIONS kısmında görünmeyecektir.
//Yukarıdaki fonksiyona erişmek için şöyle yapılabilir:

    function callprivateKeyWord() public pure returns(string memory) {
        return privateKeyWord();
    }
// Yani bir üstteki privateKeyWord olarak tanımlanan bilgiyi public komutu ile ulaşılabilir hale getirdik.


//Internal: Sadece miras alan kontratlar bu fonksiyonu çağırabilir. Dışarıdan bir çağıramaz.

    function InternalKeyword() internal pure returns(string memory) {
        return "Bu bir internal fonksiyondur.";
    }

// Bu haliyle kod FUNCTIONS kısmında görünmüyor. Ama şu şekilde ek bir kod yazarsak:

    function callInternalKeyword() public pure returns(string memory) {
        return InternalKeyword();
}

// External: Dışarıdan çağırılabilir fakat kontrat içerisinden çağırılamaz.

    function externalKeyWord() external pure returns(string memory) {
        return "Bu bir external fonksiyondur.";
    }
// Yukarıdaki fonksiyon dışarıdan çağıralabilir olduğu için deploydan sonra FONKSİYONLAR kısmında görüntülebiliyorum.
// Fakat daha yaptığım gibi kontrat içinden çağırmak için şöyle yaparsam hata alacağım:

    function callExternalKeyWord() public pure returns(string memory) {
        return externalKeyWord();
    }
}
