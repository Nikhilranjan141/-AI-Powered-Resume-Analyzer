
# ResumeAnalyzer Smart Contract

A decentralized smart contract for storing and analyzing resumes on the Ethereum blockchain with IPFS integration.

## Overview

The ResumeAnalyzer contract allows users to submit their resumes with associated quality scores, store them securely on-chain with IPFS references, and manage their resume portfolio in a decentralized manner.

## Features

- 📄 **Resume Storage**: Store resume metadata on-chain with IPFS hash references
- 🔍 **Quality Scoring**: Assign quality scores (0-100) to resumes based on off-chain analysis
- 🔐 **Access Control**: Only resume owners or contract owner can delete resumes
- 📊 **Portfolio Management**: Track multiple resumes per candidate
- 🌐 **IPFS Integration**: Decentralized storage for actual resume files
- ⚡ **Gas Efficient**: Optimized storage and retrieval operations

## Contract Structure

### Resume Struct
```solidity
struct Resume {
    string candidateName;
    string ipfsHash;      // Resume stored on IPFS
    uint256 timestamp;    // Submission timestamp
    uint8 score;          // Quality score (0-100)
}
```

### Key Functions

- `submitResume(string candidateName, string ipfsHash, uint8 score)`: Submit a new resume
- `getResumeCount(address candidate)`: Get total resumes for a candidate
- `getResume(address candidate, uint256 index)`: Retrieve a specific resume
- `deleteResume(address candidate, uint256 index)`: Delete a resume (authorized users only)

## Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/resume-analyzer-contract.git
cd resume-analyzer-contract
```

2. Install dependencies:
```bash
npm install
```

3. Create a `.env` file in the root directory:
```bash
PRIVATE_KEY=your_private_key_here
INFURA_API_KEY=your_infura_api_key
ETHERSCAN_API_KEY=your_etherscan_api_key
```

## Usage

### Compilation
```bash
npm run compile
```

### Testing
```bash
npm run test
```

### Deployment

#### Local Network
```bash
# Start local Hardhat node
npm run node

# Deploy to local network
npm run deploy:localhost
```

#### Testnet (Sepolia)
```bash
npm run deploy:sepolia
```

#### Mainnet
```bash
npm run deploy:mainnet
```

### Verification
```bash
npm run verify -- --network sepolia <CONTRACT_ADDRESS> <CONSTRUCTOR_ARGS>
```

## Smart Contract Details

### Events
- `ResumeSubmitted(address indexed candidate, uint256 index, uint8 score)`
- `ResumeDeleted(address indexed candidate, uint256 index)`

### Security Features
- Input validation for scores (0-100 range)
- Access control for deletion operations
- Safe array manipulation with bounds checking
- Gas-efficient resume deletion using swap-and-pop

## IPFS Integration

The contract stores IPFS hashes pointing to actual resume files. To integrate with IPFS:

1. Upload resume files to IPFS
2. Get the IPFS hash
3. Submit the hash along with candidate information to the contract

Example IPFS hash format: `QmXoypizjW3WknFiJnKLwHCnL72vedxjQkDDP1mXWo6uco`

## Development

### Project Structure
```
├── contracts/
│   └── ResumeAnalyzer.sol
├── scripts/
│   └── deploy.js
├── test/
│   └── ResumeAnalyzer.test.js
├── hardhat.config.js
├── package.json
└── README.md
```

### Testing
The contract includes comprehensive tests covering:
- Resume submission and retrieval
- Score validation
- Access control
- Edge cases and error handling

### Gas Optimization
- Efficient storage patterns
- Minimal on-chain data storage
- Optimized deletion mechanism

## Use Cases

1. **Job Applications**: Candidates can submit scored resumes for transparent evaluation
2. **Portfolio Management**: Track resume improvements over time
3. **Recruitment Platforms**: Decentralized hiring with verifiable resume quality
4. **Academic Credentials**: Store and verify educational achievements

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## Security Considerations

- Always validate IPFS hashes before submission
- Consider implementing additional access controls for production use
- Monitor gas costs for large-scale deployments
- Regular security audits recommended for mainnet deployment

## Support

For questions and support, please open an issue in the GitHub repository.

## Changelog

### Version 1.0.0
- Initial release with basic resume storage and scoring functionality
- IPFS integration for decentralized file storage
- Access control and security features

- ![WhatsApp Image 2025-07-11 at 10 57 45_efaa9af1](https://github.com/user-attachments/assets/43d308d1-7a1f-4795-90e4-e798524acc28)

