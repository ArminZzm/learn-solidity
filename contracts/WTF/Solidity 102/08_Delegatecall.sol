// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

// delegatecall应用场景：1.代理合约（合约升级）
contract C {
    uint256 public num;
    address public sender;

    function setVars(uint256 _num) public payable {
        num = _num;
        sender = msg.sender;
    }
}

contract B {
    uint256 public num;
    address public sender;

    function callSetVars(
        address _addr,
        uint256 _num
    ) external payable returns (bool) {
        (bool success, ) = _addr.call(
            abi.encodeWithSignature("setVars(uint256)", _num)
        );

        return success;
    }

    function delegatecallSetVars(
        address _addr,
        uint256 _num
    ) external payable returns (bool) {
        (bool success, ) = _addr.delegatecall(
            abi.encodeWithSignature("setVars(uint256)", _num)
        );

        return success;
    }
}
