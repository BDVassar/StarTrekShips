import { api } from './AxiosService'

class CrewService {
  getCrewMemberById(crewMemberId) {
    throw new Error("Method not implemented.");
  }
  async addCrewMember(newCrewMember) {
    try {
      const response = await api.post("api/crews", newCrewMember);
      return response.data
    } catch (error) {
      console.log('Error creating Crew Member', error);
    }
  }
  updateCrewMember(selectedCrewMember) {
    throw new Error("Method not implemented.");
  }
  async getAllCrewMembers() {
    try {
      const response = await api.get("api/crews");
      return response.data;
    } catch (error) {
      console.error('Error fetching Crew Members:', error);
      return [];
    }
  }
}

export default new CrewService();