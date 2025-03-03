// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

contract InitialValue {
    // 值类型初始值
    bool public _bool; // false
    string public _string; // ""
    int public _int; // 0
    uint public _uint; // 0
    address public _address; // address(0)

    enum ActionSet {
        Buy,
        Hold,
        Sell
    }
    ActionSet public _num; // enum中的第一个值的索引

    function fi() internal {} // internal 空白函数

    function fe() external {} // external 空白函数

    // 引用类型初始值
    uint8[8] public _staticArray; // 所有成员设为其默认值的静态数组[0,0,0,0,0,0,0,0]
    uint[] public _dynamicArray; // []
    mapping(uint => address) public _mapping; // 所有元素都为其默认值的mapping
    struct Student {
        uint id;
        string name;
    }
    Student public _student; // 所有成员都设为其默认值的结构体

    // delete操作符
    bool public _bool2 = true;

    function foo() external {
        delete _bool2;
    }
}
