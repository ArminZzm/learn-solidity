// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

// ABI编码：
// 1.abi.encode
// 2.abi.encodPacked
// 3.abi.encodeWithSignature
// 4.abi.encodeWithSelector
// ABI解码：
// 1.abi.decode
contract Abi {
    uint256 x = 10;
    address addr = 0x7A58c0Be72BE218B41C608b7Fe7C5bB630736C71;
    string name = "0xAA";
    uint256[2] array = [5, 6];

    // abi.encode
    function encode() public view returns (bytes memory) {
        return abi.encode(x, addr, name, array);
    }

    // abi.encodePacked
    function encodepacked() public view returns (bytes memory) {
        return abi.encodePacked(x, addr, name, array);
    }

    // abi.encodeWithSignature
    function encodeWithSignature() public view returns (bytes memory) {
        return
            abi.encodeWithSignature(
                "foo(uint256,address,string,uint256[2])",
                x,
                addr,
                name,
                array
            );
    }

    // abi.encodeWithSelector
    function encodeWithSelector() public view returns (bytes memory) {
        return
            abi.encodeWithSelector(
                bytes4(keccak256("foo(uint256,address,string,uint256[2])")),
                x,
                addr,
                name,
                array
            );
    }

    // abi.decode
    function decode(
        bytes calldata data
    ) public pure returns (uint256, address, string memory, uint256[2] memory) {
        (
            uint256 _x,
            address _addr,
            string memory _name,
            uint256[2] memory _array
        ) = abi.decode(data, (uint256, address, string, uint256[2]));

        return (_x, _addr, _name, _array);
    }

    // ABI的使用场景
    // 1.在合约开发中，ABI常配合call来实现对合约的底层调用
    // 2.ethers.js中常用ABI实现合约的导入和函数调用
    // 3.对不开源合约进行反编译后，某些函数无法查到函数签名，可以通过ABI进行调用
}
