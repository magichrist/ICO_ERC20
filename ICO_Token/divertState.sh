source .env
cast send $CA "divertState()(bool)" --rpc-url=$ETH_HOODI2 --private-key=$PriTestDeply
state=$(cast call $CA "STATE()(bool)" --rpc-url=$ETH_HOODI2)
echo 'Contract State: ' $state
