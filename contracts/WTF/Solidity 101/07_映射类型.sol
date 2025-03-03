// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

contract MappingTypes {
    mapping(uint256 => address) public idToAddress;
    mapping(address from => address to) public swapPair;

    struct Student {
        string name;
        uint8 age;
    }

    mapping(uint256 id => Student student) public idToStudent;

    function foo() public {
        idToStudent[1] = Student("hello", 20);
    }
}
