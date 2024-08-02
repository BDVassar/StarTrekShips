<template>
  <main class="container">
    <div class="row justify-content-center align-items-center" id="game-container">
      <div class="col-md-8">
        <div id="background-1"></div>
        <div id="background-2"></div>
        <img class="clickable-image img-fluid" :src="imageUrl" :alt="clickableObject" @click="handleClick" />
      </div>
    </div>
    <div class="row justify-content-center align-items-center">
      <div class="col-md-8">
        <h3>Antimatter: {{ resources }}</h3>
        <div class="btn-group" role="group" aria-label="Basic example">
          <button class="btn btn-secondary" @click="resetGame">Reset Game</button>
          <button class="btn btn-secondary" :disabled="warpCoreUpgradeCost > resources" @click="buyWarpCoreUpgrade">
            Warp Core Upgrade
          </button>
        </div>
        <h4>{{ warpCoreUpgradeStatus }}</h4>
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
      imageUrl:
        "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b1/NGC7293_%282004%29.jpg/290px-NGC7293_%282004%29.jpg",
      clickableObject: "Clickable Object",
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
  },
  computed: {
    warpCoreUpgradeStatus() {
      return `Warp Core Upgrade: Level ${this.warpCoreLevel} |  Multiplier: x${this.warpCoreMultiplier} | Cost: ${this.warpCoreUpgradeCost}`;
    },
  },
};
</script>

<style>
#game-container {
  height: 100vh;
  position: relative;
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