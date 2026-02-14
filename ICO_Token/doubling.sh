source .env
echo "Doubling() was called" #must be called once a week (604_000 seconds based on contract)
cast send $CA "Doubling()()" --rpc-url=$ETH_HOODI2 --private-key=$PriTestDeply
