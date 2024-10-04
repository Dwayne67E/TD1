// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "node_modules/@openzeppelin/contracts/access/Ownable.sol";

contract ExerciseSolutionToken is ERC20, Ownable {
    address public exerciseSolutionContract;

    // Constructor to set the token name and symbol
    constructor() ERC20("ExerciseSolutionToken", "EST") {
        // The deployer will initially own the contract
    }

    // Function to set the ExerciseSolution contract, allowing only the owner to call it
    function setExerciseSolutionContract(address _exerciseSolutionContract) external onlyOwner {
        exerciseSolutionContract = _exerciseSolutionContract;
    }

    // Mint function that only the ExerciseSolution contract can call
    function mint(address to, uint256 amount) external {
        require(msg.sender == exerciseSolutionContract, "Only ExerciseSolution can mint");
        _mint(to, amount);
    }
}
