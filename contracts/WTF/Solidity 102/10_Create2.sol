// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

contract A {
    function foo() public pure returns (string memory) {
        return "hello";
    }
}

contract Create2 {
    function foo() public returns (string memory) {
        bytes32 b = keccak256("hello");
        A a = new A{salt: b}();
        return a.foo();
    }
}
