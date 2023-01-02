//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Interact {
    address public caller;
    mapping (address => uint256) public counts;

    function callThis() external {
        caller = msg.sender;
        counts[msg.sender]++;
    }
}

contract Pay {
    mapping(address => uint256) public userBalance;

    function payETH(address _payer) external payable {
        userBalance[_payer] += msg.value ;
    }
}

// msg.sender => A => B bir kontrattaki msg.sender başka bir kontrattan çağırıldığında address farklı görünecektir.

contract Caller{
    Interact interact;   // ilk yazılan type, ikinci yazılan tanımladığım şeyin adı. Aynı kontrat içinde oldukları için Interact isimli kontrat çağrılmış oldu.

    constructor (address _interactContract) {     // bir constructor tanımladık _interacContract adında adress tutan.
        interact = Interact(_interactContract);   // yukarıda tanımladığımız interact isimli yapıyı Interact'e eşitledik.
    }

    function callInteract() external payable {
        interact.callThis();
    }

    function readCaller() external view returns(address) {
        return interact.caller();
    }

    function readCallerCount() public view returns(uint256) {
        return interact.counts(msg.sender);
    }

     function payToPay(address _payAddress) public payable {
        Pay pay = Pay(_payAddress);
        pay.payETH{value: msg.value}(msg.sender);

        // Pay(_payAddress).payEth{value: msg.value}(msg.sender);
    }

    function sendEthByTransfer() public payable {
        payable(address(interact)).transfer(msg.value);
    }
}