// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

contract DataStorage {
    function fCallData(
        uint[] calldata _x
    ) public pure returns (uint[] calldata) {
        // 参数为calldata数组，不能被修改
        // _x[0] = 0 // 这样修改会报错
        return (_x);
    }

    uint[] x = [1, 2, 3]; // 状态变量：数组 x

    function fStorage() public {
        // 声明一个storage的变量 xStorage，指向x。修改xStorage也会影响x
        uint[] storage xStorage = x;
        xStorage[0] = 100;
    }

    // 状态变量
    uint public x_ = 1;
    uint public y;
    string public z;

    function foo() external {
        x_ = 5;
        y = 2;
        z = "0xAA";
    }

    // 局部变量
    function bar() external pure returns (uint) {
        uint xx = 1;
        uint yy = 3;
        uint zz = xx + yy;
        return zz;
    }

    // 全局变量
    function global() external view returns(address,uint,bytes memory) {
        address sender = msg.sender;
        uint blockNum = block.number;
        bytes memory data = msg.data;
        return(sender,blockNum,data);
    }

    // 全局变量-以太单位
    function weiUint() external pure returns(uint) {
        assert(1 wei == 1e0);
        assert(1 wei == 1);
        return 1 wei;
    }

    function gweiUint() external pure returns(uint) {
        assert(1 gwei ==1e9);
        assert(1 gwei == 1000000000);
        return 1 gwei;
    }

    function etherUint() external pure returns(uint) {
        assert(1 ether == 1e18);
        assert(1 ether == 1000000000000000000);
        return 1 ether;
    }

    // 全局变量-时间单位
    function secondsUint()external pure returns(uint) {
        assert(1 seconds ==1);
        return 1 seconds;
    }

    function minutesUint() external pure returns(uint) {
        assert(1 minutes == 60);
        assert(1 minutes == 60 seconds);
        return 1 minutes;
    }

    function hoursUint() external pure returns(uint) {
        assert(1 hours == 3600);
        assert(1 hours == 60 seconds);
        return 1 hours;
    }

    function daysUint() external pure returns(uint) {
        assert(1 days == 86400);
        assert (1 days == 24 hours);
        return 1 days;
    }

    function weeksUint() external pure returns(uint) {
        assert(1 weeks == 604800);
        assert(1 weeks == 7 days);
        return 1 weeks;
    }
}