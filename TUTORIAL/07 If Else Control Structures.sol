//SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.0;

contract IfElse {

    bytes32 private hashedPassword;
    uint256 private logincount;

    constructor(string memory _password) {
        hashedPassword = keccak256(abi.encode(_password));
    }

    function login(string memory _password) public returns (bool) {
        if(hashedPassword == keccak256(abi.encode(_password))) {
            loginCount++;                              /*her başarılı girişten sonra logincount değişkeni +1 artacak. logincount += 1 'de aynı işlevi görür. Eksiltmek için logincount--. */
            return true;
        } else {
            return false;
        }
    //return (hashedPassword == keccak256(abi.encode(_password)));
    //yukarıdaki if else kısmını bu şekilde kısaca da yazabilirdik. Böylece daha az gas harcamış oluruz.
    }
    
    function loginlogin(string memory _password) public view returns (uint256) {
        if(hashedPassword == keccak256(abi.encode(_password))) {
            return 1;
        } else {
            return 0;
    //return (hashedPassword == keccak256(abi.encode(_password))) ? 1 : 0);
    //Bu kod da yine yukarıdaki if else ifadesini kısaca yazma şekillenrinden biri
    //Java ile birebir aynı
    }

    function loginStatus() public view returns(uint256) {
        if(loginCount == 0) {
            return 0;
        } else if(loginCount > 0 && loginCount != 1) {
            return 1;
        } else if(loginCount == 1) {
            return 2;
        } else {
            return 3;
        }
    }

// ctrl+k+c seçili satırı yorum satırına dönüştürür.
// ctrl+k+u seçili satırı komut satırına dönüştürür.
}
