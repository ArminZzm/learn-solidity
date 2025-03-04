// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

// 在Solidity中的继承分为：
// 1.简单继承
// 2.多重继承
// 3.修饰器继承
// 4.构造函数继承

// 简单继承
contract Yeye {
    event Log(string msg);

    function hip() public virtual {
        emit Log("Yeye");
    }

    function pop() public virtual {
        emit Log("Yeye");
    }

    function yeye() public virtual {
        emit Log("Yeye");
    }
}

contract Baba is Yeye {
    function hip() public virtual override {
        emit Log("Baba");
    }

    function pop() public virtual override {
        emit Log("Baba");
    }

    function baba() public virtual {
        emit Log("Baba");
    }
}

// 多重继承
contract Erzi is Yeye, Baba {
    function hip() public override(Yeye, Baba) {
        emit Log("Erzi");
    }

    function pop() public override(Yeye, Baba) {
        emit Log("Erzi");
    }
}

// 修饰器继承
contract A {
    modifier checkNumber(uint256 number) virtual {
        require(number > 100);
        _;
    }
}

contract B is A {
    function foo(
        uint256 number
    ) public pure checkNumber(number) returns (uint256) {
        return number;
    }
}

contract C is A {
    modifier checkNumber(uint256 number) override {
        require(number < 100);
        _;
    }
}

// 构造函数继承
contract AA {
    uint256 public a;

    constructor(uint256 _a) {
        a = _a;
    }
}

// 方式一：在继承时，声明父合约的构造函数的参数
contract BB is AA(100) {

}

// 方式二：在子合约的构造函数中声明父合约构造函数的参数
contract CC is AA {
    uint256 public c;

    constructor(uint256 _c) AA(200) {
        c = _c;
    }
}

// 菱形继承：指一个派生类同时有两个或两个以上的基类
