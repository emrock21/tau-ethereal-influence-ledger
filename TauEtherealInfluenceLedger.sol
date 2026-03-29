// SPDX-License-Identifier: MIT
pragma solidity 0.8.31;

/// @title Tau Ethereal Influence Ledger
/// @notice Record subtle or hidden political actions performed by the Tau Ethereals toward allied worlds or species.
/// @dev Simple, safe, text-only contract.

contract TauEtherealInfluenceLedger {

    struct Influence {
        string world;          // World or species integrated
        string method;         // Method of influence (diplomacy, doctrine, economic leverage, etc.)
        string intention;      // The true underlying intention
        string effect;         // Effect on the population or leadership
        string remark;         // Short contextual note
        address creator;       // Who recorded it
        uint256 aligned;       // Votes marking it aligned with the Greater Good
        uint256 questionable;  // Votes marking it questionable
        uint256 createdAt;     // Timestamp
    }

    Influence[] public logs;

    mapping(uint256 => mapping(address => bool)) public hasVoted;

    event InfluenceRecorded(uint256 indexed id, string world, string method, address indexed creator);
    event InfluenceVoted(uint256 indexed id, bool aligned, uint256 alignedVotes, uint256 questionableVotes);

    constructor() {
        logs.push(
            Influence({
                world: "Example World (Fill your own below)",
                method: "Describe method",
                intention: "Describe hidden intention",
                effect: "Describe effect",
                remark: "Short remark",
                creator: address(0),
                aligned: 0,
                questionable: 0,
                createdAt: block.timestamp
            })
        );
    }

    function recordInfluence(
        string calldata world,
        string calldata method,
        string calldata intention,
        string calldata effect,
        string calldata remark
    ) external {
        require(bytes(world).length > 0, "World required");

        logs.push(
            Influence({
                world: world,
                method: method,
                intention: intention,
                effect: effect,
                remark: remark,
                creator: msg.sender,
                aligned: 0,
                questionable: 0,
                createdAt: block.timestamp
            })
        );

        emit InfluenceRecorded(logs.length - 1, world, method, msg.sender);
    }

    function voteInfluence(uint256 id, bool aligned) external {
        require(id < logs.length, "Invalid ID");
        require(!hasVoted[id][msg.sender], "Already voted");

        hasVoted[id][msg.sender] = true;

        Influence storage inf = logs[id];

        if (aligned) {
            inf.aligned += 1;
        } else {
            inf.questionable += 1;
        }

        emit InfluenceVoted(id, aligned, inf.aligned, inf.questionable);
    }

    function totalInfluences() external view returns (uint256) {
        return logs.length;
    }
}
