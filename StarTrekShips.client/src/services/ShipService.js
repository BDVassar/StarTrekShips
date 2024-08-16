import { api } from './AxiosService'

class ShipService {
  async getAllShips() {
    try {
      const response = await api.get("api/ships");
      return response.data;
    } catch (error) {
      console.error('Error fetching ships:', error);
      return [];
    }
  }
}

export default new ShipService();