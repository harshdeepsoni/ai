pragma solidity ^0.8.0;

contract AIVotingAdvisor {
    address public owner;
    string public advisoryMessage;
    
    enum VoteRecommendation { Neutral, Approve, Reject }
    VoteRecommendation public recommendation;
    
    event AdvisoryUpdated(string newMessage, VoteRecommendation newRecommendation);
    
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can update advisory");
        _;
    }
    
    function setAdvisory(string memory _message, VoteRecommendation _recommendation) public onlyOwner {
        advisoryMessage = _message;
        recommendation = _recommendation;
        emit AdvisoryUpdated(_message, _recommendation);
    }
    
    function getAdvisory() public view returns (string memory, VoteRecommendation) {
        return (advisoryMessage, recommendation);
    }
}
