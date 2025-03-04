// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

// Solidity库合约
// 1.不能存在状态变量
// 2.不能够继承或被继承
// 3.不能接收以太坊
// 4.不可以被销毁
library Library {
    function doAdd(uint256 _a, uint256 _b) public pure returns (uint256) {
        return _a + _b;
    }
}

contract A {
    using Library for uint;

    function foo(uint256 _a, uint256 _b) public pure returns (uint256) {
        return _a.doAdd(_b);
    }
}
