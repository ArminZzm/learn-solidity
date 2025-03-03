// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

// 接口规则：
// 1.不能包含状态变量
// 2.不能包含构造函数
// 3.不能继承除接口外的其他合约
// 4.所有函数都必须是external且不能有函数体
// 5.继承接口的非抽象合约必须实现接口定义的所有功能
interface A {
    function foo() external;

    function bar() external;
}

contract B is A {
    function foo() public {}

    function bar() public {}
}

// 抽象合约
abstract contract C is A {
    function foo() external override {}
}
