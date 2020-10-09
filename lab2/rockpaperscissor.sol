pragma solidity ^0.5.11;

contract rps
{ 
    mapping (string=>mapping(string=>int)) result;
	address payable public player1;
	address payable public player2;
	string public p1choice;
	string public p2choice;
	
	modifier unregistered() 
	{
	    if (msg.sender == player1 || msg.sender == player2)
	         revert();
	    else
	        _;
	}
	
	modifier bidding(uint amount) 
	{
	    if (msg.value == amount)
	         revert();
	    else
	        _;
	}
	
	constructor() public payable 
	{
	    result["rock"]["rock"] = 0;
        result["rock"]["paper"] = 2;
        result["rock"]["scissors"] = 1;
        result["paper"]["rock"] = 1;   
        result["paper"]["paper"] = 0;
        result["paper"]["scissors"] = 2;
        result["scissors"]["rock"] = 2;
        result["scissors"]["paper"] = 1;
        result["scissors"]["scissors"] = 0;
	}
	
	function getWinner() view external returns (int X) 
	{
	    return result[p1choice][p2choice];
	}
	
	function play(string memory choice) public payable returns (int w) 
	{
	    if (msg.sender == player1)
	        p1choice = choice;
	    else if (msg.sender == player2)
	        p2choice = choice;
	        if (bytes(p1choice).length != 0 && bytes(p2choice).length != 0)
	        {
	            int winner = result[p1choice][p2choice];
	            if (winner == 1)
	                player1.transfer(address(this).balance); //p1wins
	            else if (winner == 2)
	                player2.transfer(address(this).balance); //p1wins
	            else
	            {
	                player1.transfer(address(this).balance/2);
	                player2.transfer(address(this).balance);
	            }
	            
	            return winner;
	        }
	        else
	            return -1;
	}
	
	function getBalance() public returns (uint x) 
	{
	    return msg.sender.balance;
	   
	}
	
	function prizepool() public returns (uint x) 
	{
	    return address(this).balance;
	   
	}
	
	function register() public payable bidding(5) unregistered() 
	{
	    if (uint(player1) == 0)
	        player1 = msg.sender;
	    else if (uint(player2) == 0)
	        player2 = msg.sender;
	}
}