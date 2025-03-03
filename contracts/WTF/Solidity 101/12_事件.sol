// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

contract Event {
    mapping(address => uint256) public _balances;

    // 生命事件
    event Transfer(address indexed from, address indexed to, uint256 value);

    function _transfer(address from, address to, uint256 value) public {
        _balances[from] -= value;
        _balances[to] += value;

        // 释放事件
        emit Transfer(from, to, value);
    }
}
