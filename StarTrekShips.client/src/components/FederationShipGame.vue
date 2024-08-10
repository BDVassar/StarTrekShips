<template>
  <div class="star-trek-game">
    <h1 class="title text-white">Star Trek Clicker Game</h1>
    <div class="game-area">
      <div class="hero text-white">
        <img src="http://cdn.shopify.com/s/files/1/1048/8552/products/sttng_ship_grande.png?v=1552933855" alt="Hero" />
        <h2>{{ heroHealth }}</h2>
      </div>
      <div class="enemy text-white">
        <img src="url(https://s3-us-west-1.amazonaws.com/cryptospacecommander/art/Borg_cube_Main_01.png)" alt="Enemy"
          @click="attackEnemy" :style="{ healthBarWidth }" />
        <h2>{{ enemyHealth }}</h2>
      </div>
    </div>
    <button @click="resetGame" class="reset-btn">Reset Game</button>
    <div class="ship-stats text-white">
      <h2>Hero Ship Stats:</h2>
      <ul>
        <li>Health: {{ hero.health }} / {{ hero.maxHealth }}</li>
        <li>Shield Strength: {{ hero.shieldStrength }}</li>
        <li>Phaser Damage: {{ hero.phaserDamage }}</li>
      </ul>
      <h2>Enemy Ship Stats:</h2>
      <ul>
        <li>Health: {{ enemy.health }} / {{ enemy.maxHealth }}</li>
        <li>Shield Strength: {{ enemy.shieldStrength }}</li>
        <!-- Add more enemy stats as display elements -->
      </ul>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      heroHealth: 100,
      enemyHealth: 100,
      enemyHealthMax: 100,

      hero: {
        health: 100,
        maxHealth: 100,
        shieldStrength: 50,
        phaserDamage: 10,
      },
      enemy: {
        health: 100,
        maxHealth: 150,
        shieldStrength: 30,
        // Add more enemy stats as needed
      },
    };
  },
  computed: {
    healthBarWidth() {
      return `width: ${(this.enemyHealth / this.enemyHealthMax) * 100}%`;
    },
  },
  methods: {
    attackEnemy() {
      // Simulate attacking the enemy and decreasing health
      if (this.enemyHealth > 0) {
        this.enemyHealth -= Math.floor(Math.random() * 10) + 5;
      }
    },
    resetGame() {
      this.heroHealth = 100;
      this.enemyHealth = 100;
    },
  },
};
</script>

<style>
/* Add your custom styles here */
.star-trek-game {
  text-align: center;
  margin-top: 50px;
  background-image: url('https://images.unsplash.com/photo-1504333638930-c8787321eee0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80');
  background-size: cover;
  height: 100vh;
  padding: 20px;
}

.game-area {
  display: flex;
  flex-direction: column;
  align-items: center;
}

.hero,
.enemy {
  text-align: center;
  margin-bottom: 20px;
}

.hero img,
.enemy img {
  width: 200px;
  height: 200px;
}

.ship-stats {
  max-width: 400;
  margin: 0 auto;
  text-align: left;
  font-size: 14px;
  color: #fff;
}

.ship-stats h2 {
  color: #fff;
  margin-bottom: 10px;
}

.health-bar {
  height: 20px;
  background-color: red;
  position: absolute;
  top: 130px;
  width: 100%;
}

.reset-btn {
  padding: 10px 20px;
  border-radius: 5px;
  background-color: #333;
  color: #fff;
  font-size: 16px;
  cursor: pointer;
  margin-top: 20px;
}
</style>