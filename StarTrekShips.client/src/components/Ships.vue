<template>
  <div>
    <h1 class="text-center mb-4">Star Trek Ships</h1>
    <!-- Use v-if to check if ships data is available -->
    <div v-if="ships && ships.length > 0">
      <h2 class="text-center mb-4">Ships Information</h2>
      <div class="row">
        <div v-for="(ship, index) in paginatedShips" :key="index" class="col-md-6 mb-4">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">{{ ship.shipPrefix }} {{ ship.name }}</h5>
              <h6 class="card-subtitle mb-2 text-muted">Classification: {{ ship.classification }}</h6>
              <p class="card-text">Alliance: {{ ship.alliance }}</p>
              <p class="card-text">Location: {{ ship.quadrant }}</p>
              <p class="card-text">Crew Complement: {{ ship.crewComplement }}</p>
              <p class="card-text">Shuttles: {{ ship.shuttles }}</p>
              <!-- Add other ship properties as card details -->
            </div>
          </div>
        </div>
      </div>
      <!-- Pagination -->
      <pagination :page-count="pageCount" :current-page="currentPage" @pagination-change-page="changePage"
        :container-class="'pagination'"></pagination>
    </div>
    <p v-else>No ships found.</p>
  </div>
</template>

<script>
import ShipService from '../services/ShipService.js';

export default {
  components: {

  },
  data() {
    return {
      ships: null,
      currentPage: 1,
      perPage: 2, // Set the number of ships per page
    };
  },
  computed: {
    pageCount() {
      return Math.ceil(this.ships.length / this.perPage);
    },
    paginatedShips() {
      const start = (this.currentPage - 1) * this.perPage;
      const end = start + this.perPage;
      return this.ships.slice(start, end);
    },
  },
  mounted() {
    this.fetchShips();
  },
  methods: {
    async fetchShips() {
      try {
        const response = await ShipService.getAllShips();
        this.ships = response;
      } catch (error) {
        console.error('Error fetching ships: ', error);
      }
    },
    changePage(page) {
      this.currentPage = page;
    },
  },
};
</script>

<style>
/* Custom styles for the cards and pagination */
.card {
  width: 100%;
  max-width: 300px;
  margin: 0 auto;
  padding: 1rem;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
}

.pagination {
  display: flex;
  justify-content: center;
  align-items: center;
  margin-top: 1rem;
}

.pagination li {
  margin: 0 5px;
}

.pagination li a {
  padding: 0.5rem 1rem;
  background-color: #ddd;
  color: #333;
  border-radius: 5px;
  text-decoration: none;
}

.pagination li.active a {
  background-color: #333;
  color: #fff;
}
</style>