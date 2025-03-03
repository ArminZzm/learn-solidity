// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

contract Return {
    // 返回多个变量
    function returnMutiple()
        public
        pure
        returns (uint256, bool, uint256[3] memory)
    {
        return (1, true, [uint256(1), 2, 5]);
    }

    // 命名式返回
    function returnNamed()
        public
        pure
        returns (uint256 _number, bool _bool, uint256[3] memory _array)
    {
        _number = 2;
        _bool = false;
        _array = [uint256(3), 2, 1];
    }

    // 命名式返回，依然支持return
    function returnNamed2()
        public
        pure
        returns (uint256 _number, bool _bool, uint256[3] memory _array)
    {
        return (1, true, [uint256(1), 2, 5]);
    }

    // 解构式赋值
    function foo()
        public
        pure
        returns (uint256 _number, bool _bool, uint256[3] memory _array)
    {
        (_number, _bool, _array) = returnNamed();

        (, _bool, ) = returnNamed();
    }
}
