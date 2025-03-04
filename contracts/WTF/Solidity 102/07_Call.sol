// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

contract OtherContract {
    uint256 private _x = 0;

    event Log(uint256 amount, uint256 gas);

    receive() external payable {}

    fallback() external payable {}

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

contract Call {
    event Response(bool success, bytes data);

    function callSetX(address payable _address, uint256 x) external payable {
        (bool success, bytes memory data) = _address.call(
            abi.encodeWithSignature("setX(uint256)", x)
        );

        emit Response(success, data);
    }

    function callGetX(address _address) external returns (uint256) {
        (bool success, bytes memory data) = _address.call(
            abi.encodeWithSignature("getX()")
        );

        emit Response(success, data);

        return abi.decode(data, (uint256));
    }

    // 调用不存在的函数
    function callNonExist(address _address) external {
        (bool success, bytes memory data) = _address.call(
            abi.encodeWithSignature("foo()")
        );

        emit Response(success, data);
    }
}
