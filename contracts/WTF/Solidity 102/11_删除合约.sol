// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

contract DeleteContract {
    uint256 public value = 10;

    constructor() payable {}

    receive() external payable {}

    function deleteContract() external {
        selfdestruct(payable(msg.sender));
    }

    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }
}

contract DepolyContract {
    struct DemoResult {
        address addr;
        uint256 balance;
        uint256 value;
    }

    constructor() payable {}

    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }

    function demo() public payable returns (DemoResult memory) {
        DeleteContract del = new DeleteContract{value: msg.value}();

        DemoResult memory res = DemoResult({
            addr: address(del),
            balance: del.getBalance(),
            value: del.value()
        });
        del.deleteContract();
        return res;
    }
}
