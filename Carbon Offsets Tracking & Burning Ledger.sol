// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract CarbonCreditLedger is ERC20 {
    address public minterAdmin;
    
    mapping(address => uint256) public retiredCarbonCredits;

    event CreditsRetired(address indexed corporateEntity, uint256 amountMetricTons);

    constructor() ERC20("GlobalCarbonCredit", "GCC") {
        minterAdmin = msg.sender;
    }

    function mintCredits(address _to, uint256 _amount) external {
        require(msg.sender == minterAdmin, "Unauthorized issuer status configuration");
        _mint(_to, _amount);
    }

    function retireCredits(uint256 _amount) external {
        require(balanceOf(msg.sender) >= _amount, "Insufficient carbon holdings balance");
        _burn(msg.sender, _amount);
        retiredCarbonCredits[msg.sender] += _amount;
        emit CreditsRetired(msg.sender, _amount);
    }
}
