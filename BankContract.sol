pragma solidity ^0.8.0;

contract TheLoneliestContract {
    uint public myUint =1;

    function sub(uint amount) public returns(uint){
        myUint -= amount;
        return myUint;
    }

}
contract Name {
    string public massage;

    constructor (string memory message) {
        massage = message;

    }
}

contract Bank{

    mapping(address=>uint) public account_balance;

    function transfer (uint amount, address acctToTransferTo) external{
        require(account_balance[msg.sender]>=amount);
        account_balance[msg.sender] -= amount;
        account_balance[acctToTransferTo] += amount;
    }

    function bankBalance() external view returns(uint){return address(this).balance;}

    function withdrawl(uint amount) external {
        require (account_balance[msg.sender]>=amount);

        account_balance[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }
    receive () external payable {
        account_balance[msg.sender] += msg.value;
    }

}
