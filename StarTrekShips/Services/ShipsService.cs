namespace StarTrekShips.Services;

public class ShipsService
{

  private readonly ShipsRepository _shipsRepository;

  public ShipsService(ShipsRepository shipsRepository)
  {
    _shipsRepository = shipsRepository;
  }

  internal List<Ship> Get(string userId)
  {
    List<Ship> ships = _shipsRepository.Get();
    return ships;
  }
}
