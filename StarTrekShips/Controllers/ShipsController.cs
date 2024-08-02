namespace StarTrekShips.Controllers;

[ApiController]
[Route("api/[controller]")]
public class ShipsController : ControllerBase
{

  private readonly ShipsService _shipsService;

  public ShipsController(ShipsService shipsService, Auth0Provider auth0provider)
  {
    _shipsService = shipsService;
  }

  [HttpGet]
  public async Task<ActionResult<List<Ship>>> Get()
  {
    try
    {
      List<Ship> ships = _shipsService.Get();
      return Ok(ships);
    }
    catch (Exception e)
    {
      return BadRequest(e.Message);
    }
  }
}