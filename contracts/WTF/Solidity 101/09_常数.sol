// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

contract Constant {
    // constant变量必须在声明的时候初始化，之后不能改变
    uint256 constant CONSTANT_NUM = 10;
    string constant CONSTANT_STRING = "0xAA";
    bytes constant CONSTANT_BYTES = "WTF";
    address constant CONSTANT_ADDRESS = address(0);

    // immutable变量可以在constructor里初始化，之后不能改变
    uint256 public immutable IMMUTABLE_NUM = 999999;
    // 在Solidity v8.0.21以后，下列变量数值暂为初始值
    address public immutable IMMUTABLE_ADDRESS;
    uint256 public immutable IMMUTABLE_BLOCK;
    uint256 public immutable IMMUTABLE_TEST;

    constructor() {
        // immutable变量既在声明时初始化，又在constructor中初始化，会使用constructor中的初始化值
        IMMUTABLE_NUM = 520;
        IMMUTABLE_ADDRESS = address(this);
        IMMUTABLE_BLOCK = block.number;
    }
}
