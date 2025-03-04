// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

contract OtherContract {
    uint256 private _x = 0;

    event Log(uint256 amount, uint256 gas);

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function setX(uint256 x) external payable {
        _x = x;

        if (msg.value > 0) {
            emit Log(msg.value, gasleft());
        }
    }

    function getX() external view returns (uint256) {
        return _x;
    }
}

// 在合约中调用其他合约的方式有3种：
// 1.传入合约地址
// 2.传入合约变量
// 3.创建合约变量
contract CallContract {
    // 传入合约地址
    function callSetX1(address _address, uint256 x) external {
        OtherContract(_address).setX(x);
    }

    // 传入合约变量
    function callSetx2(OtherContract _address, uint256 x) external {
        _address.setX(x);
    }

    // 创建合约变量
    function callSetX3(address _address, uint256 x) external {
        OtherContract oc = OtherContract(_address);
        oc.setX(x);
    }

    // 调用合约并发送ETH
    function callSetX4(address _address, uint256 x) external payable {
        OtherContract(_address).setX{value: msg.value}(x);
    }
}
