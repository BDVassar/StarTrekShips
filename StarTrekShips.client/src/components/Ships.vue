<template>
  <div>
    <h1 class="text-center mb-4">Star Trek Ships</h1>
    <table class="table table-striped" v-if="ships.length > 0">
      <thead>
        <tr>
          <th>Name</th>
          <th>Type</th>
          <th>Quadrant</th>
          <!-- List other ship properties as table headers -->
        </tr>
      </thead>
      <tbody>
        <tr v-for="(ship, index) in ships" :key="index">
          <td>{{ ship.name }}</td>
          <td>{{ ship.type }}</td>
          <td>{{ ship.quadrant }}</td>
          <!-- Add other ship properties to display in table rows -->
        </tr>
      </tbody>
    </table>
    <p v-else>No ships found.</p>
  </div>
</template>

<script>
import ShipService from '../services/ShipService.js'
export default {
  data() {
    return {
      ships: [],
    };
  },
  mounted() {
    this.fetchShips();
  },
  methods: {
    async fetchShips() {
      try {
        const response = await ShipService.getAllShips();
        this.ships = response.data;
      } catch (error) {
        console.error('Error fetching ships: ', error);
      }
    },
  },
};
</script>

<style>
/* Custom styles if needed */
</style>