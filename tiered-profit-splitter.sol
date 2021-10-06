pragma solidity ^0.5.0;

// lvl 2: tiered split
contract TieredProfitSplitter {
    address payable employee_one; // ceo
    address payable employee_two; // cto
    address payable employee_three; // bob

    constructor(address payable _one, address payable _two, address payable _three) public {
        employee_one = _one;
        employee_two = _two;
        employee_three = _three;
    }

    // Should always return 0! Use this to test your `deposit` function's logic
    function balance() public view returns(uint) {
        return address(this).balance;
    }

    function deposit() public payable {
        uint points = msg.value / 100; // Calculates rudimentary percentage by dividing msg.value into 100 units
        uint total;
        uint amount;

        // @TODO: Calculate and transfer the distribution percentage
        // Step 1: Set amount to equal `points` * the number of percentage points for this employee
        amount = points * 60;
        
        // Step 2: Add the `amount` to `total` to keep a running total
        total += amount;
        
        // Step 3: Transfer the `amount` to the employee
        employee_one.transfer(amount);
        
        
        // @TODO: Repeat the previous steps for 
        // `employee_two`
        amount = points * 25;
        total += amount; 
        employee_two.transfer(amount);
        
        //`employee_three`
        amount = points * 15;
        total += amount;
        employee_three.transfer(amount);
        
        employee_one.transfer(msg.value - total); // ceo gets the remaining wei
    }

    function() external payable {
        deposit();
    }
}

// wallet address: 0x8aD5b4E4165647E4666587D8f4b66f268F46F772
// employee_one address: "0x5fd36bCFD82AaB6B752C1263b3AeFedE65F1e0a5"
// employee_two address: "0x4E5CF0733134f572cDd6e9B70cAE6C17AD48F7B4"
// employee_three address: "0xAd4FF43d7C9271Fc0f8D432069320204d04D731c"