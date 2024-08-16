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
    const string sql = @"
    SELECT * FROM ships
    ";
    return _db.Query<Ship>(sql).ToList();
  }
}
