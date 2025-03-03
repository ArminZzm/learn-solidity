// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

contract FunctionTypes {
    uint256 public number = 5;

    // 默认function
    function add() external {
        number = number + 1;
    }

    // pure：纯纯牛马
    function addPure(uint256 _number) external pure returns (uint256) {
        return _number + 1;
    }

    // view：看客
    function addView() external view returns (uint256) {
        return number + 1;
    }

    // internal：内部函数
    function minus() internal {
        number = number - 1;
    }

    // 合约内的函数可以调用内部函数
    function minusCall() external {
        minus();
    }

    // payable：递钱，能给合约支付ETH的函数
    function minusPayable() external payable returns (uint256) {
        minus();
        return address(this).balance;
    }
}
