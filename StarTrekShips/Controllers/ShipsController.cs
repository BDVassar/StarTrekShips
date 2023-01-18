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
}
