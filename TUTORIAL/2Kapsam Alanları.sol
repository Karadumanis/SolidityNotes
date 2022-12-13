//SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.0;

//KAPSAM ALANLARI

/* örneğin tüm kodların bir bölümünü seçtim ve ctrl + k + c yorum satırı oluşur.
ctrl + k + u ise yorum satırından çıkarmaya yarar. */

contract Variables {
    
    string public bestClub = "itu blockchain";   //satate variable olarak anılır

    function show() public view returns(string memory){
        return bestClub;
    }
