<template>
  <div class="p-6 bg-gray-900 rounded-3xl shadow-xl space-y-4 text-white">
    <h2 class="text-2xl font-fredoka text-green-400 drop-shadow-md">Token Info</h2>

    <div class="flex flex-col space-y-2">
      <div class="flex justify-between">
        <span class="font-semibold">Total Supply:</span>
        <span>{{ formattedTotalSupply }} Tokens</span>
      </div>

      <div class="flex justify-between">
        <span class="font-semibold">Current Price:</span>
        <span>{{ formattedCurrentPrice }} ETH</span>
      </div>

      <div class="flex justify-between">
        <span class="font-semibold">Unlocked Amount:</span>
        <span>{{ formattedUnlockedAmount }} Tokens</span>
      </div>
      <div class="max-w-full break-all">
        <span class="font-semibold block mb-1">Contract Address:</span>

        <a
            :href="Contract_Link"
            target="_blank"
            rel="noopener noreferrer"
            class="text-green-400 hover:text-green-300 transition-colors block break-all"
        >
          {{ CONTRACT_ADDRESS }}
        </a>

      </div>

      <div class="flex justify-between">
        <span class="font-semibold">Chain:</span>Hoodi
      </div>
    </div>
  </div>
</template>

<script setup>
import {computed, ref} from "vue";
import {CONTRACT_ADDRESS} from "../utils/web3.js";

const Contract_Link = `https://hoodi.etherscan.io/address/${CONTRACT_ADDRESS}`;

const props = defineProps({
  state: Boolean,
  totalSupply: Number,
  price: Number,
  decimals: Number,
  totalPhases: Number
});


// unlockedAmount auto-updates with props
const unlockedAmount = computed(() => {
  if (props.totalPhases == 0) {
    return props.totalSupply
  }
  const currentPhase = ref(1);
  const INITIAL_PHASES = 10;
  const remaining = Number(props.totalPhases);
  const phasesCompleted = Math.max(0, INITIAL_PHASES - remaining);
  currentPhase.value = Math.min(
      Math.max(1, phasesCompleted + 1),
      INITIAL_PHASES
  );
  return ((props.totalSupply * 4) / 10) * currentPhase.value / 10;
});

// formatted display
const formattedTotalSupply = computed(() => props.totalSupply.toLocaleString());
const formattedCurrentPrice = computed(() => props.price.toFixed(6));
const formattedUnlockedAmount = computed(() => unlockedAmount.value.toLocaleString());
</script>

