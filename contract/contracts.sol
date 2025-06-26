// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract ResumeAnalyzer {
    struct Resume {
        string candidateName;
        string ipfsHash; // Resume stored on IPFS or similar
        uint256 timestamp;
        uint8 score;  // Resume quality score (0-100)
    }

    address public owner;
    mapping(address => Resume[]) private resumes;

    event ResumeSubmitted(address indexed candidate, uint256 index, uint8 score);
    event ResumeDeleted(address indexed candidate, uint256 index);

    constructor() {
        owner = msg.sender;
    }

    // Submit a new resume with score after analysis off-chain
    function submitResume(string calldata candidateName, string calldata ipfsHash, uint8 score) external {
        require(score <= 100, "Invalid score");
        resumes[msg.sender].push(Resume(candidateName, ipfsHash, block.timestamp, score));
        emit ResumeSubmitted(msg.sender, resumes[msg.sender].length - 1, score);
    }

    // Get number of resumes submitted by an address
    function getResumeCount(address candidate) external view returns (uint256) {
        return resumes[candidate].length;
    }

    // Retrieve a specific resume for a candidate
    function getResume(address candidate, uint256 index) external view returns (Resume memory) {
        require(index < resumes[candidate].length, "Invalid index");
        return resumes[candidate][index];
    }

    // Delete a resume (only owner or resume owner can delete)
    function deleteResume(address candidate, uint256 index) external {
        require(msg.sender == owner || msg.sender == candidate, "Not authorized");
        require(index < resumes[candidate].length, "Invalid index");

        // Move last resume to the index and pop last element
        resumes[candidate][index] = resumes[candidate][resumes[candidate].length - 1];
        resumes[candidate].pop();

        emit ResumeDeleted(candidate, index);
    }
}
