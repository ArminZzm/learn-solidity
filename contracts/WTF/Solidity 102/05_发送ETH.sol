// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

contract ReceiveETH {
    event Log(uint256 amount, uint256 gas);

    receive() external payable {
        emit Log(msg.value, gasleft());
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}

contract SendETH {
    constructor() payable {}

    receive() external payable {}

    function transferETH(address payable _to, uint256 _value) external payable {
        _to.transfer(_value);
    }

    function sendETH(
        address payable _to,
        uint256 _value
    ) external payable returns (bool) {
        bool success = _to.send(_value);
        return success;
    }

    function callETH(
        address payable _to,
        uint256 _value
    ) external payable returns (bool) {
        (bool success, ) = _to.call{value: _value}("");
        return success;
    }
}
