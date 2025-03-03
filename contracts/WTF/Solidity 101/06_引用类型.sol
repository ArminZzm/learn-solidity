// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

contract ArrayTypes {
    // 固定长度数组（静态数组）：长度一旦固定，不可改变，无法使用push/pop
    uint256[2] arr1 = [uint256(1), 2];

    // 可变长度数组（动态数组）：长度可以修改，可以使用push/pop
    uint256[] arr2 = [uint256(1), 2, 3];

    // 特殊的动态数组
    bytes public arr3;

    function foo1() public pure returns (string[] memory) {
        // 内存数组：必须使用new创建，并且声明时要指定长度，无法使用push/pop，只能通过下标赋值
        string[] memory arr4 = new string[](3);

        arr4[0] = "hello";
        arr4[1] = "world";
        return arr4;
    }

    function foo2() public {
        // 动态数组可使用push/pop方法
        arr2.push();
        arr2.push(4);
        arr2.pop();
    }

    function foo3() public view returns (uint256[] memory) {
        return arr2;
    }
}

contract StructTypes {
    struct Student {
        string id;
        uint8 score;
    }

    Student student;

    constructor() {
        student = Student("0", 100);
        student = Student({id: "3", score: 99});
    }

    function initStudent1() public {
        Student storage _student = student;
        _student.id = "1";
        _student.score = 90;
    }

    function initStudent2() public {
        student.id = "2";
        student.score = 80;
    }
}
