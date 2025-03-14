// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

contract ControlFlow {
    // if-else
    function ifElseTest(uint256 _number) public pure returns (bool) {
        if (_number == 0) {
            return true;
        } else {
            return false;
        }
    }

    // for循环
    function forLoopTest() public pure returns (uint256) {
        uint256 sum = 0;
        for (uint256 i = 0; i < 10; i++) {
            sum += i;
        }
        return sum;
    }

    // while循环
    function whileTest() public pure returns (uint256) {
        uint256 sum = 0;
        uint256 i = 0;
        while (i < 10) {
            sum += i;
            i++;
        }
        return sum;
    }

    // do-while循环
    function doWhileTest() public pure returns (uint256) {
        uint256 sum = 0;
        uint256 i = 0;
        do {
            sum += i;
            i++;
        } while (i < 10);
        return sum;
    }

    // 三元运算符
    function ternaryTest(uint256 x, uint256 y) public pure returns (uint256) {
        return x > y ? x : y;
    }

    // 插入排序 正确版
    function insertionSort(
        uint256[] memory a
    ) public pure returns (uint256[] memory) {
        // note that uint can not take negative value
        for (uint256 i = 1; i < a.length; i++) {
            uint256 temp = a[i];
            uint256 j = i;
            while ((j >= 1) && (temp < a[j - 1])) {
                a[j] = a[j - 1];
                j--;
            }
            a[j] = temp;
        }
        return (a);
    }
}
