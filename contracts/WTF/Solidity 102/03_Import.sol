// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

// 通过文件相对位置import
// import "./Yeye.sol";
// 通过`全局符号`导入特定的合约
// import {Yeye} from "./Yeye.sol";
// 通过网址引用
// import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Address.sol";
// 引用OpenZeppelin合约
// import "@openzeppelin/contracts/access/Ownable.sol";

contract Import {
    // 成功导入Address库
    // using Address for address;
    // 声明yeye变量
    // Yeye yeye = new Yeye();

    // 测试是否能调用yeye的函数
    function test() external {
        // yeye.hip();
    }
}
