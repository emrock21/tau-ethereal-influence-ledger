# Tau Ethereal Influence Ledger

An on-chain ledger documenting subtle political actions, hidden intentions, and strategic manipulations performed by the Tau Ethereals toward allied worlds and integrated species.  
Users record each influence event and vote whether it is **aligned with the Greater Good** or **questionable in intent**.

Fully text-based, permissionless, and designed for creative Warhammer 40K world-building on Base.

---

## Contract

Deployed on Base:  
`0x047e5f8e4eac653b989427dcc012c530f9c115cb`  
https://basescan.org/address/0x047e5f8e4eac653b989427dcc012c530f9c115cb#code

Main file: `contracts/TauEtherealInfluenceLedger.sol`

---

## How it works

Each influence entry stores:

- `world` – World or species being influenced  
- `method` – Diplomatic, doctrinal, economic, or cultural method used  
- `intention` – The true underlying motive  
- `effect` – Result on the population or leadership  
- `remark` – Short contextual note  
- `aligned` / `questionable` – Community votes  

Entry **0** is a built-in example.

---

## Example

```solidity
recordInfluence(
  "Pecha (Kroot Homeworld)",
  "Selective trade incentives",
  "Secure long-term auxiliary troops loyal to Tau command",
  "Kroot clans became economically dependent on Tau supply lines",
  "Presented as mutual benefit"
);

Vote:
voteInfluence(1, true);   // Aligned with the Greater Good


Closing Note
A discreet archive of Ethereal strategy —
a chronicle of persuasion, doctrine, and subtle control.
Every entry reveals another layer of the Greater Good.
