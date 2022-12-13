//SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.0;

// mapping bir keye bir value eşleştirmemize yarar. sonradan ekleme ve silme yapılabilir.
//Mapping'in dezavantajı eklenen tüm key değerlirini görüntüleyemiyoruz (itterate edemiyoruz.)
//Yani eklenen tüm key değerlerini göster ya da for döngüsü üzerinden göster, while döngüsünde göster diyemiyoruz.
//Bunu yapmaya yarayan kütüphaneler var, ileride görülecek.

contract Mapping {
    mapping (address => bool) public registered;
    mapping (address => int256) public favNums;

    function register(int256 _favNum) public {
        // require(!registered[msg.sender], "Kullanici Daha Once Giris Yapti");  /*bu satır register işleminin bir kullanıcı tarafından yalnızca bir kez çağırılmasını sağlar.*/
        require(!isRegistered(), "Kullanici Daha Once Giris Yapti");
        registered[msg.sender] = true;
        favNums[msg.sender] = _favNum;
    }

    function isRegistered() public view returns(bool) {
        return registered[msg.sender];
        //bu komut register olup olmadığına dair true false döndürecek. 
    }

    function deleteRegistered() public {
        require(isRegistered(), "Kullanici kayitli degildir.");
        delete(registered[msg.sender]);
        delete(favNums[msg.sender]);
        //Bu fonksiyon kullanıcı registered ve favnum silmek için.
    }
}


//Bu kontratta bir mappingin key değerini değiştirmeden value değerini değiştireceğiz.
//Bir borçlanma ve borç ödeme neticisinde toplam borçtan düşme örneği göreceğiz.
contract NestedMapping {
 
    mapping(address => mapping(address => uint256)) public debts; 
/*ilk address kullanıcı adresim, karşısındaki value değerindeki address ise borçlu kullanıcının adresi, bunun karşısındaki (=> UİNT256) ise borç miktarını tanımlar.*/

    function incDebt(address _borrower, uint256 _amount) public {
/*fonksiyon adı incDebt, iki parametre var: address _borrower(ismi), uint256 _amount(borç miktarı*/
        debts[msg.sender][_borrower] += _amount;
/*köşeli parantez içinde key değeri(yukarıda tanımlanan ilk address değeri). 
ikinci köşeli parantezde daha önce parametre olarak tanımladığım _borrower,    
üçüncü olarak borç değerini += _amount (amount kadar arttır)*/
    }

//yukarıdaki borç arttırma fonksiyonuna ek olarak borç düşürme fonk.
    function decDebt(address _borrower, uint256 _amount) public {
//Kullanıcının borç miktarından daha fazla ödeme yapması durumunda, uint256 eksi değere inmediği için hata alınır, önlem olarak:
//ödeme yapmak isteyen kullanıcı ***debts[msg.sender][_borrower]*** borcu büyükse miktardan ***_amount***, hata ver.
        require(debts[msg.sender][_borrower] >= _amount, "Not enough debt!");
        debts[msg.sender][_borrower] -= _amount;
    }

//borç görüntülemek için fonk:
    function getDebt(address _borrower) public view returns(uint256) {
        return debts[msg.sender][_borrower];
    }
}
