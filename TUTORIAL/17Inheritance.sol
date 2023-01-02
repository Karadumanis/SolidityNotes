//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//virtual: virtual olarak nitelendirilen bir fonksiyon miras bırakıldığı kontrat içerisinde değiştirilebilir.

contract A {
    uint public x;

    uint public y;

    function setx(uint _x) virtual public {
        x = _x;
    }

    function sety(uint _y) public {
        y = _y;
    }
}

//override

contract B is A {
    
    uint public z;

    function setZ(uint _z) public {
        z = _z;
    }

    function setx(uint _x) override public {
        x = _x + 2;
    }
}

contract Human {
    
    function sayHello() public pure virtual returns(string memory) {
        return "itublockchain adresinden bize ulasabilirsiniz." ;
    }
}

contract superHuman is Human {

    function sayHello() public pure override returns(string memory) {
        return "Aramiza hosgeldin :)" ;
    }

    function welcomeMsg(bool _isMember) public pure returns(string memory) {
        return _isMember ? sayHello() : Human.sayHello() ;  // Human. yerine super. yazarak da fonksiyona erişilebilir.
    } 
}

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract Wallet is Ownable {
    fallback() payable external {}

    function sendEther(address payable to, uint amount) onlyOwner public {
        to.transfer(amount);
    }

    function showBalance() public view returns(uint) {
        return address(this).balance;
    }
}