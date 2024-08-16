<template>
  <div>
    <h1>Crew Members</h1>
    <div v-if="crewMembers && crewMembers.length > 0">
      <div class="card-container">
        <div v-for="(crewMember, index) in crewMembers" :key="index" class="card">
          <!-- Crew member image -->
          <img :src="crewMember.crewImg" :alt="crewMember.name" class="card-image" />
          <!-- Crew member details -->
          <div class="card-body">
            <h3>{{ crewMember.name }}</h3>
            <p>Rank: {{ crewMember.rating }}</p>
            <p>Position: {{ crewMember.position }}</p>
            <p>Age: {{ crewMember.age }}</p>
            <p>Gender: {{ crewMember.gender }}</p>
          </div>
        </div>
      </div>
    </div>
    <div v-else>
      <p>No crew members found.</p>
    </div>
  </div>
</template>

<script>
import CrewService from '../services/CrewService.js';

export default {
  data() {
    return {
      crewMembers: null,
      newCrewMember: {
        Name: '',
        Rating: '',
        Position: '',
        Age: '',
        Gender: '',
        crewImg: '',
      },
    };
  },
  async created() {
    this.fetchCrewMembers();
  },
  methods: {
    async fetchCrewMembers() {
      try {
        const response = await CrewService.getAllCrewMembers();
        this.crewMembers = response;
        console.log(response)
      } catch (error) {
        console.error('Error fetching crew members: ', error);
      }
    },
  },
};
</script>
<style>
/* Add these styles */
.card-container {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-around;
  margin-top: 20px;
}

.card {
  background-color: #fff;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
  padding: 1rem;
  margin: 10px;
  border-radius: 5px;
}

.card-image {
  width: 100%;
  height: 150px;
  /* Adjust the height as per your design */
  border-radius: 5px;
  object-fit: cover;
}
</style>
These styles will make the