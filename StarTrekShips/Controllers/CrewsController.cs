using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace StarTrekShips.Controllers;
[Route("api/[controller]")]
[ApiController]
public class CrewsController : ControllerBase
{
  private readonly CrewsService _crewsService;

  public CrewsController(CrewsService crewsService)
  {
    _crewsService = crewsService;
  }

  // GET: api/crewmembers
  [HttpGet]
  public ActionResult<List<CrewMember>> GetAllCrewMembers()
  {
    return _crewsService.GetAllCrewMembers();
  }

  // GET: api/crewmembers/5
  [HttpGet("{id}")]
  public ActionResult<CrewMember> GetCrewMemberById(int id)
  {
    var crewMember = _crewsService.GetCrewMemberById(id);
    if (crewMember == null)
    {
      return NotFound();
    }
    return crewMember;
  }

  // POST: api/crewmembers
  [HttpPost]
  public ActionResult<CrewMember> AddCrewMember(CrewMember crewMember)
  {
    _crewsService.AddCrewMember(crewMember);
    return CreatedAtAction(nameof(GetCrewMemberById), new { id = crewMember.CrewMemberID }, crewMember);
  }

  // PUT: api/crewmembers/5
  [HttpPut("{id}")]
  public IActionResult UpdateCrewMember(int id, CrewMember crewMember)
  {
    if (id != crewMember.CrewMemberID)
    {
      return BadRequest();
    }
    _crewsService.UpdateCrewMember(crewMember);
    return NoContent();
  }

  // DELETE: api/crewmembers/5
  [HttpDelete("{id}")]
  public IActionResult DeleteCrewMember(int id)
  {
    _crewsService.DeleteCrewMember(id);
    return NoContent();
  }
}
