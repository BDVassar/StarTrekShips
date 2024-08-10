<template>
  <main class="container">
    <div class="row justify-content-center align-items-center" id="game-container">
      <div class="col-md-8">
        <div id="background-1"></div>
        <div id="background-2"></div>
        <img class="clickable-image img-fluid" :src="imageUrl" :alt="clickableObject" @click="handleClick" />
        <!-- Addition of Quantum Generator icon -->
        <img v-if="quantumGeneratorLevel > 0" class="clickable-image img-fluid quantum-generator"
          :src="quantumGeneratorImageUrl" :alt="quantumGeneratorAlt" @click="buyQuantumGeneratorClick" />
      </div>
      <!-- Addition of resource collector components -->
      <div class="resource-collectors col-md-4" v-if="warpCoreLevel > 0">
        <div>
          <img class="collector-image img-fluid" :src="antimatterSynthesizerImageUrl" :alt="antimatterSynthesizerAlt" />
          <h4>Antimatter Synthesizer</h4>
          <h6>+{{ warpCoreMultiplier }} Antimatter per second</h6>
        </div>
        <div>
          <img class="collector-image img-fluid" :src="warpCoreStabilizerImageUrl" :alt="warpCoreStabilizerAlt" />
          <h4>Warp Core Stabilizer</h4>
          <h6>+{{ warpCoreStabilizerAmount }} Antimatter per second</h6>
        </div>
      </div>
    </div>
    <div class="row justify-content-center align-items-center">
      <div class="col-md-8">
        <h3>Antimatter: {{ resources }}</h3>
        <div class="btn-group" role="group" aria-label="Basic example">
          <button class="btn btn-secondary" @click="resetGame">Reset Game</button>
          <button class="btn btn-secondary" :disabled="warpCoreUpgradeCost > resources" @click="buyWarpCoreUpgrade">Warp
            Core Upgrade</button>
          <!-- Addition of Quantum Generator upgrade button -->
          <button class="btn btn-secondary" :disabled="quantumGeneratorUpgradeCost > resources"
            @click="buyQuantumGeneratorUpgrade">Quantum Generator Upgrade</button>
        </div>
        <h4>{{ warpCoreUpgradeStatus }}</h4>
        <!-- Addition of Quantum Generator status -->
        <h4>Quantum Generator: Level {{ quantumGeneratorLevel }} | Cost: {{ quantumGeneratorUpgradeCost }}</h4>
      </div>
    </div>
  </main>
</template>

<script>
export default {
  data() {
    return {
      resources: 0,
      warpCoreUpgradeCost: 100,
      warpCoreLevel: 0,
      warpCoreMultiplier: 1,
      antimatterSynthesizerAmount: 1, // Amount of resources collected per second by the Antimatter Synthesizer
      warpCoreStabilizerAmount: 5, // Amount of resources collected per second by the Warp Core Stabilizer
      quantumGeneratorLevel: 0,
      quantumGeneratorUpgradeCost: 500,
      imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b1/NGC7293_%282004%29.jpg/290px-NGC7293_%282004%29.jpg",
      clickableObject: "Clickable Object",
      quantumGeneratorImageUrl: "https://image.flaticon.com/icons/svg/149/149852.svg", // Replace with your desired image URL
      quantumGeneratorAlt: "Quantum Generator",
      antimatterSynthesizerImageUrl: "https://image.flaticon.com/icons/svg/860/860020.svg", // Replace with your desired image URL
      antimatterSynthesizerAlt: "Antimatter Synthesizer",
      warpCoreStabilizerImageUrl: "https://image.flaticon.com/icons/svg/125/125857.svg", // Replace with your desired image URL
      warpCoreStabilizerAlt: "Warp Core Stabilizer",
    };
  },
  mounted() {
    this.resources = parseInt(localStorage.getItem("resources")) || 0;
    this.warpCoreLevel = parseInt(localStorage.getItem("warpCoreLevel")) || 0;
    this.warpCoreMultiplier = this.warpCoreLevel + 1;
  },
  methods: {
    handleClick() {
      this.resources++;
      localStorage.setItem("resources", this.resources.toLocaleString());
    },
    resetGame() {
      this.resources = 0;
      this.warpCoreLevel = 0;
      this.warpCoreMultiplier = 1;
      localStorage.removeItem("resources");
      localStorage.removeItem("warpCoreLevel");
    },
    buyWarpCoreUpgrade() {
      if (this.resources >= this.warpCoreUpgradeCost) {
        this.resources -= this.warpCoreUpgradeCost;
        this.warpCoreLevel++;
        this.warpCoreMultiplier = this.warpCoreLevel + 1;
        localStorage.setItem("warpCoreLevel", this.warpCoreLevel.toLocaleString());
        this.warpCoreUpgradeCost *= 2;
      }
    },
    buyQuantumGeneratorUpgrade() {
      if (this.resources >= this.quantumGeneratorUpgradeCost) {
        this.resources -= this.quantumGeneratorUpgradeCost;
        this.quantumGeneratorLevel++;
        this.quantumGeneratorUpgradeCost *= 2;
      }
    },
    buyQuantumGeneratorClick() {
      // Handle click event for the Quantum Generator
      // You can add any specific functionality here, such as resource production
    },
  },
  computed: {
    warpCoreUpgradeStatus() {
      return `Warp Core Upgrade: Level ${this.warpCoreLevel} |  Multiplier: x${this.warpCoreMultiplier} | Cost: ${this.warpCoreUpgradeCost}`;
    },
  },
};
</script>

<style>
.resource-collectors {
  position: absolute;
  bottom: 0;
  left: 0;
  display: flex;
  flex-direction: column;
  align-items: center;
  margin-bottom: 20px;
}

.collector-image {
  width: 100px;
  height: 100px;
  margin-bottom: 10px;
}

/* Adjustments to centering */
#game-container {
  height: 80vh;
}

.col-md-8 {
  max-width: 550px;
  /* Adjust this value to fit your design */
}

#background-1 {
  /* New background layer behind the clickable area */
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-image: url('https://images.unsplash.com/photo-1506318137071-a8e063b4bec0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1493&q=80');
  /* Replace with your desired background image URL */
  background-size: cover;
  background-repeat: no-repeat;
  z-index: -2;
}

#background-2 {
  /* Existing background layer over the clickable area */
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-image: url('https://64.media.tumblr.com/8426bbbb8ee25c85eba2ff5c55cb0d99/216214d2ef9bd6f6-66/s1280x1920/86475f2ebb70496d896b04cf5e54e1d62aff44e7.png');
  background-size: cover;
  background-repeat: no-repeat;
  z-index: -1;
}

.clickable-image {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}
</style>