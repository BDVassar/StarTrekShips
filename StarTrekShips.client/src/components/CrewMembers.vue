<template>
  <div>
    <h1>Crew Members</h1>
    <div v-if="crewMembers.length > 0">
      <div>
        <select v-model="selectedCrewMember" @change="showSelectedCrewMember">
          <option v-for="crewMember in crewMembers" :key="crewMember.id" :value="crewMember">
            {{ crewMember.Name }}
          </option>
        </select>
      </div>
      <div v-if="selectedCrewMember">
        <h2>{{ selectedCrewMember.Name }}</h2>
        <ul>
          <li>Rank: {{ selectedCrewMember.Rank }}</li>
          <li>Position: {{ selectedCrewMember.Position }}</li>
          <li>Age: {{ selectedCrewMember.Age }}</li>
          <li>Gender: {{ selectedCrewMember.Gender }}</li>
          <li>Species: {{ selectedCrewMember.Species.name }}</li>
        </ul>
      </div>
    </div>
    <div v-else>
      <p>No crew members found.</p>
    </div>
    <hr />
    <h2>Add New Crew Member</h2>
    <form @submit.prevent="addCrewMember">
      <div>
        <label for="name">Name:</label>
        <input v-model="newCrewMember.Name" type="text" id="name" required />
      </div>
      <div>
        <label for="rank">Rank:</label>
        <input v-model="newCrewMember.Rank" type="text" id="rank" required />
      </div>
      <div>
        <label for="position">Position:</label>
        <input v-model="newCrewMember.Position" type="text" id="position" required />
      </div>
      <!-- Add input fields for Age, Gender, and Species -->
      <div>
        <label for="age">Age:</label>
        <input v-model.number="newCrewMember.Age" type="number" id="age" required />
      </div>
      <div>
        <label for="gender">Gender:</label>
        <input v-model="newCrewMember.Gender" type="text" id="gender" required />
      </div>
      <div>
        <label for="species">Species:</label>
        <input v-model="newCrewMember.Species.name" type="text" id="species" required />
      </div>
      <button type="submit">Add Crew Member</button>
    </form>
  </div>
</template>

<script>
import CrewService from '../services/CrewService.js';

export default {
  data() {
    return {
      crewMembers: [],
      selectedCrewMember: null,
      newCrewMember: {
        Name: '',
        Rank: '',
        Position: '',
        Age: '',
        Gender: '',
        Species: { name: '' },
      },
    };
  },
  async created() {
    this.crewMembers = await CrewService.getAllCrewMembers();
  },
  methods: {
    async showSelectedCrewMember() {
      // CrewService needs a method getCrewMemberById(id)
      const crewMemberId = this.selectedCrewMember.CrewMemberID; // Assuming CrewMember has id property
      this.selectedCrewMember = await CrewService.getCrewMemberById(crewMemberId);
    },
    async addCrewMember() {
      await CrewService.addCrewMember(this.newCrewMember);
      this.crewMembers.push(this.newCrewMember);
      this.newCrewMember = {
        Name: '',
        Rank: '',
        Position: '',
        Age: '',
        Gender: '',
        Species: { name: '' },
      };
    },
  },
};
</script>