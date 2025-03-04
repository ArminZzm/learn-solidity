// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

contract OnlyEven {
    constructor(uint256 a) {
        require(a != 0, "invalid number");
        assert(a != 1);
    }

    function onlyEven(uint256 b) external pure returns (bool success) {
        require(b % 2 == 0, "Ups! Reverting");
        success = true;
    }
}

contract TryCatch {
    event SuccessEvent();

    event CatchEvent(string message);
    event CatchByte(bytes data);

    OnlyEven even;

    constructor() {
        even = new OnlyEven(2);
    }

    // 处理函数调用异常
    function exectue(uint256 amount) external returns (bool success) {
        try even.onlyEven(amount) returns (bool _success) {
            emit SuccessEvent();
            return _success;
        } catch Error(string memory reason) {
            emit CatchEvent(reason);
        }
    }

    // 处理合约创建异常
    function exectueNew(uint256 a) external returns (bool success) {
        try new OnlyEven(2) returns (OnlyEven _even) {
            emit SuccessEvent();
            success = _even.onlyEven(a);
        } catch Error(string memory reason) {
            emit CatchEvent(reason);
        } catch (bytes memory reason) {
            emit CatchByte(reason);
        }
    }
}
