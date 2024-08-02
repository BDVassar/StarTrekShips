<template>
  <div>
    <h1>Ships</h1>
    <ul>
      <li v-for="ship in ships" :key="ship.id">
        {{ ship.name }}
      </li>
    </ul>
  </div>
</template>

<script>
import ShipService from '../services/ShipService.js';

export default {
  data() {
    return {
      ships: [],
    };
  },
  async created() {
    try {
      const ships = await ShipService.getAllShips();
      this.ships = ships;
    } catch (error) {
      console.error('Error fetching ships:', error);
    }
  },
};
</script>

<style scoped lang="scss">
.home {
  display: grid;
  height: 80vh;
  place-content: center;
  text-align: center;
  user-select: none;

  .home-card {
    width: 50vw;

    >img {
      height: 200px;
      max-width: 200px;
      width: 100%;
      object-fit: contain;
      object-position: center;
    }
  }
}
</style>
