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
  public ActionResult<List<Ship>> Get()
  {
    try
    {
      return _shipsService.Get();
    }
    catch (Exception e)
    {
      return BadRequest(e.Message);
    }
  }
}