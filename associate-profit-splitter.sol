pragma solidity ^0.5.0;

// lvl 1: equal split
contract AssociateProfitSplitter {
    // @TODO: Create three payable addresses representing `employee_one`, `employee_two` and `employee_three`.
    address payable employee_one; 
    address payable employee_two; 
    address payable employee_three;
    
    
    constructor(address payable _one, address payable _two, address payable _three) public {
        employee_one = _one;
        employee_two = _two;
        employee_three = _three;
    }

    function balance() public view returns(uint) {
        return address(this).balance;
    }

    function deposit() public payable {
        // @TODO: Split `msg.value` into three
        uint amount = msg.value / 3; 

        // @TODO: Transfer the amount to each employee
        employee_one.transfer(amount);
        employee_two.transfer(amount);
        employee_three.transfer(amount);

        // @TODO: take care of a potential remainder by sending back to HR (`msg.sender`)
        msg.sender.transfer(msg.value - amount * 3);
    }

    function() external payable {
        // @TODO: Enforce that the `deposit` function is called in the fallback function!
        deposit();
    }
}

// wallet address: 0x8aD5b4E4165647E4666587D8f4b66f268F46F772
// employee_one address: "0x66C147195f556D3e9973a07Dfe7E8b0742a8D453"
// employee_two address: "0x1c5E3b3aeb989f4dceaa607644b29cc50308C989"
// employee_three address: "0x4d868d4e455f1e76197d9eAff7eCeB96388640F4"