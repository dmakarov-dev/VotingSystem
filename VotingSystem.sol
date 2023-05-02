pragma solidity ^0.8.0;

contract Voting {
    // Array to store candidates
    string[] public candidates;
    
    // Mapping to store candidate vote counts
    mapping(string => uint) public votes;
    
    // Event to signal when a vote is cast
    event VoteCast(address voter, string candidate);
    
    // Constructor to initialize candidates
    constructor(string[] memory _candidates) {
        candidates = _candidates;
    }
    
    // Function to cast a vote for a candidate
    function vote(string memory _candidate) public {
        require(validCandidate(_candidate), "Invalid candidate");
        
        // Increment candidate's vote count
        votes[_candidate]++;
        
        // Emit event signaling vote was cast
        emit VoteCast(msg.sender, _candidate);
    }
    
    // Function to check if a candidate is valid
    function validCandidate(string memory _candidate) public view returns (bool) {
        for (uint i = 0; i < candidates.length; i++) {
            if (keccak256(bytes(candidates[i])) == keccak256(bytes(_candidate))) {
                return true;
            }
        }
        return false;
    }
}
