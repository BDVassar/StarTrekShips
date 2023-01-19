namespace StarTrekShips.Repositories;

public class ShipsRepository
{

  private readonly IDbConnection _db;

  public ShipsRepository(IDbConnection db)
  {
    _db = db;
  }

  internal List<Ship> Get()
  {
    string sql = @"
    SELECT
    ships.*,
    ac.*
    FROM ships
    JOIN accounts ac ON ac.id = ships.creatorId;
    ";
    List<Ship> ships = _db.Query<Ship, Account, Ship>(sql, (ship, account) =>
    {
      ship.Creator = account;
      return ship;
    }).ToList();

    return ships;
  }
}
