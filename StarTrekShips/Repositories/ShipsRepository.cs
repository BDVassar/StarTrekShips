namespace StarTrekShips.Repositories;

public class ShipsRepository
{

  private readonly IDbConnection _db;

  public ShipsRepository(IDbConnection db)
  {
    _db = db;
  }
}
