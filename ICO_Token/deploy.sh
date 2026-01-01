source .env
forge build
echo 'Pending...'
address=$(forge create ./src/ERC20.sol:ERC20 --private-key=$PriTestDeply --rpc-url=$ETH_HOODI2 --etherscan-api-key=$etherscan_API --json --broadcast --constructor-args shxt SHXT 1000000000000000  0.0001ether |jq '.deployedTo'|cat)
echo 'Deployed to' $address
