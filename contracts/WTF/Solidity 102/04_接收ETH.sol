// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

contract ReceiveETH {
    event Received(address sender, uint256 value);

    receive() external payable {
        emit Received(msg.sender, msg.value);
    }

    event FallbackCalled(address sender, uint256 value, bytes data);

    fallback() external payable {
        emit FallbackCalled(msg.sender, msg.value, msg.data);
    }
}
