//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library Math {
    //Kullanılabilirliği

    function plus(uint x, uint y) public pure returns(uint) {
        return x + y;
    }

    function minus(uint x, uint y) public pure returns(uint) {
        return x - y;
    }

    function multi(uint x, uint y) public pure returns(uint) {
        return x * y;
    }

    function divide(uint x, uint y) public pure returns(uint) {
        require (x != 0, "bu sayi olmaz moruk");
        return x / y;
    }

    function min(uint x, uint y) public pure returns(uint) {
        if(x <= y){
            return x;
        }else {
            return y;
        }
    }

    function max(uint x, uint y) public pure returns(uint) {
        if(x >= y){
            return x;
        }else {
            return y;
        }
    }
}

contract Library {

    function trial1(uint x, uint y) public pure returns(uint) {
        return Math.plus(x, y);
    }

    function trial2(uint x, uint y) public pure returns(uint) {
        return Math.minus(x, y);
    }

    function trial3(uint x, uint y) public pure returns(uint) {
        return Math.multi(x, y);
    }

    function trial4(uint x, uint y) public pure returns(uint) {
        return Math.divide(x, y);
    }

    function trial5(uint x, uint y) public pure returns(uint) {
        return Math.max(x, y);
    }
}

library Search {
    function indexOf(uint[] memory list, uint data) public pure returns(uint){
        for (uint i = 0; i < list.length; i++) {
            if (list[i] == data) {
                return i;
            }
        } return list.length;
    }
}

contract Library2 {
    
    using Math for uint;
    using Search for uint[];

    function trial6(uint[] memory x, uint y) public pure returns(uint){
        return x.indexOf(y);  //Search.indexOf(x, y) 
    }
}


library Human {
    struct Person {
        uint age;
    }

    function birthday(Person storage _person) public{
        _person.age += 1;
    }

    function showBirthday(Person storage _person) public view returns(uint) {
        return _person.age;
    }
}

contract HumanCont{
    mapping(uint => Human.Person) people;

    function newYear() public{
        Human.birthday(people[0]);
    }

    function show() public view returns(uint){
        return Human.showBirthday(people[0]);
    }
}