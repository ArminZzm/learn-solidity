// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

contract Hash {
    // 使用keccak256Hash函数生成唯一标识
    function hash(
        uint256 _num,
        string calldata _string,
        address _addr
    ) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(_num, _string, _addr));
    }
}
