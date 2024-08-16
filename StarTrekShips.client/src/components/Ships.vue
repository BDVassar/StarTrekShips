<template>
  <div>
    <h1 class="text-center mb-4">Star Trek Ships</h1>
    <!-- Add button to toggle the form -->
    <button @click="toggleForm" class="btn btn-primary mb-4">
      Add/Edit Ship
    </button>

    <!-- Dropdown Form -->
    <div v-if="showForm" class="dropdown" style="position: relative;">
      <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown"
        aria-haspopup="true" aria-expanded="false">
        Dropdown button
      </button>
      <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
        <form @submit.prevent="submitForm">
          <div class="form-group">
            <label for="name">Name:</label>
            <input v-model="shipForm.name" type="text" class="form-control" id="name" placeholder="Ship Name">
          </div>
          <!-- Add form inputs for all properties of the Ship.cs model -->
          <div class="form-group">
            <label for="quadrant">Quadrant:</label>
            <input v-model="shipForm.quadrant" type="text" class="form-control" id="quadrant" placeholder="Quadrant">
          </div>
          <!-- Add input fields for the remaining properties of Ship.cs -->
          <!-- ... -->
          <div class="form-group">
            <button type="submit" class="btn btn-primary">Submit</button>
          </div>
        </form>
      </div>
    </div>
    <div v-if="ships && ships.length > 0">
      <h2 class="text-center mb-4">Ships Information</h2>
      <div class="row">
        <div v-for="(ship, index) in ships" :key="index" class="col-md-6 mb-4">
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
      showForm: false, // To toggle the display of the form
      shipForm: { // Data object to store form data
        name: '',
        quadrant: '',
        // Add remaining properties of Ship.cs model
        // ...
        alliance: '',
        shuttles: '',
        classification: '',
        capacity: '',
      },
      editShipIndex: null, // To track the index of the ship being edited (null for add)
    };
  },
  computed: {
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
    toggleForm() {
      this.showForm = !this.showForm;
      // Reset the form and index when form is hidden
      this.shipForm = {
        name: '',
        quadrant: '',
        // Add remaining properties...
        alliance: '',
        shuttles: '',
        classification: '',
        capacity: '',
      };
      this.editShipIndex = null;
    },
    submitForm() {
      const formData = { ...this.shipForm };
      let action = 'Adding';

      if (this.editShipIndex !== null) {
        // Edit existing ship
        const editedShip = { ...this.ships[this.editShipIndex], ...formData };
        this.ships.splice(this.editShipIndex, 1, editedShip);
        action = 'Editing';
      } else {
        // Add a new ship
        this.ships.push(formData);
      }
      this.$emit('ship-updated', action, formData);
      this.toggleForm();
    },
    editShip(index) {
      // Populate the form with ship data and set editShipIndex
      this.showForm = true;
      this.shipForm = { ...this.ships[index] };
      this.editShipIndex = index;
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
</style>