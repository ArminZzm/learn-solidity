// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

// 在Solidity中，抛出异常的方式有3种：
// 1.error
// 2.require
// 3.assert
contract Error {
    // error：用于参数检查，条件判断
    error CheckNumber(uint256 number);

    function foo1(uint256 _number) public pure {
        if (_number < 100) {
            revert CheckNumber(_number);
        }
    }

    // require：用于参数检查，条件判断
    function foo2(uint256 _number) public pure {
        require(_number < 100, "error msg");
    }

    // assert：用于程序员debug
    function foo3(uint256 _number) public pure {
        assert(_number < 100);
    }
}
