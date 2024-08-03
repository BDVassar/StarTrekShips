using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;


namespace StarTrekShips.Services;

public class CrewsService
{
    private readonly CrewsRepository _crewsRepository;

        public CrewsService(CrewsRepository crewsRepository)
        {
            _crewsRepository = crewsRepository;
        }

        public List<CrewMember> GetAllCrewMembers()
        {
            return _crewsRepository.GetAllCrewMembers();
        }

        public CrewMember GetCrewMemberById(int id)
        {
            return _crewsRepository.GetCrewMemberById(id);
        }

        public void AddCrewMember(CrewMember crewMember)
        {
            _crewsRepository.AddCrewMember(crewMember);
        }

        public void UpdateCrewMember(CrewMember crewMember)
        {
            _crewsRepository.UpdateCrewMember(crewMember);
        }

        public void DeleteCrewMember(int id)
        {
            _crewsRepository.DeleteCrewMember(id);
        }
}
