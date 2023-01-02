// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IToken {
    // Fonksiyonlarda override gerekli
    function transferFrom(address from, address to, uint256 amount) external;
    function transfer(address to, uint256 amount) external;
    function balanceOf(address user) external view returns(uint256);

    // Eventlerde gerekli değil
    event Transfer(address indexed from, address indexed to, uint256 amount);
}
Footer
// © 2022 GitHub, Inc.