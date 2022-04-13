Requirements
- Remote State
- Variables
- Environments

Output:
- SSH Access Key of VM, use provider to get the public and private key


Create:
    - RG
    - VNET
        - Subnet
    - Public IP
    - Network Security Group
        - Open port 22 (Inbound from Internet -> Virtual Network)
    - SSH Key Pair
    - Virtual Machine

## Outputs
Ip Public
Private Key
User