// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

contract Selector {
    // 基础类型参数
    function elementaryParamSelector(
        uint256 param1,
        bool param2
    ) external returns (bytes4 selectorWithElementaryParam) {
        return bytes4(keccak256("elementaryParamSelector(uint256,bool)"));
    }

    // 固定长度类型参数
    function fixedSizeParamSelector(
        uint256[3] memory param1
    ) external returns (bytes4 selectorWithFixedSizeParam) {
        return bytes4(keccak256("fixedSizeParamSelector(uint256[3])"));
    }

    // 可变长度类型参数
    function nonFixedSizeParamSelector(
        uint256[] memory param1,
        string memory param2
    ) external returns (bytes4 selectorWithNonFixedSizeParam) {
        return bytes4(keccak256("nonFixedSizeParamSelector(uint256[],string)"));
    }

    // 映射类型参数
}

contract DemoContract {
    // empty contract
    // Struct User
    struct User {
        uint256 uid;
        bytes name;
    }
    // Enum School
    enum School {
        SCHOOL1,
        SCHOOL2,
        SCHOOL3
    }

    // mapping（映射）类型参数selector
    // 输入：demo: 0x9D7f74d0C41E726EC95884E0e97Fa6129e3b5E99， user: [1, "0xa0b1"], count: [1,2,3], mySchool: 1
    // mappingParamSelector(address,(uint256,bytes),uint256[],uint8) : 0xe355b0ce
    function mappingParamSelector(
        DemoContract demo,
        User memory user,
        uint256[] memory count,
        School mySchool
    ) external returns (bytes4 selectorWithMappingParam) {
        return
            bytes4(
                keccak256(
                    "mappingParamSelector(address,(uint256,bytes),uint256[],uint8)"
                )
            );
    }
}
