namespace StarTrekShips.Controllers;

[ApiController]
[Route("api/[controller]")]
public class ShipsController : ControllerBase
{

  private readonly ShipsService _shipsService;
  private readonly Auth0Provider _auth0provider;

  public ShipsController(ShipsService shipsService, Auth0Provider auth0provider)
  {
    _shipsService = shipsService;
    _auth0provider = auth0provider;
  }

  [HttpGet]
  public async Task<ActionResult<List<Ship>>> Get()
  {
    try
    {
      Account userInfo = await _auth0provider.GetUserInfoAsync<Account>(HttpContext);
      List<Ship> ships = _shipsService.Get(userInfo?.Id);
      return Ok(ships);
    }
    catch (Exception e)
    {
      return BadRequest(e.Message);
    }
  }
}