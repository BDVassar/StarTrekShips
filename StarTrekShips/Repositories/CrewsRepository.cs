namespace StarTrekShips.Repositories
{
  public class CrewsRepository
  {
    private readonly IDbConnection _db;

    public CrewsRepository(IDbConnection db)
    {
      _db = db;
    }

    public List<CrewMember> GetAllCrewMembers()
    {
      const string sql = "SELECT * FROM CrewMember";
      return _db.Query<CrewMember>(sql).ToList();
    }

    public CrewMember GetCrewMemberById(int id)
    {
      const string sql = "SELECT * FROM CrewMembers WHERE Id = @Id";
      return _db.QueryFirstOrDefault<CrewMember>(sql, new { Id = id });
    }
    public void AddCrewMember(CrewMember crewMember)
    {
      const string sql = "INSERT INTO CrewMembers (Name, Rank, Age, Species) VALUES (@Name, @Rank, @Age, @Species)";
      _db.Execute(sql, crewMember);
    }
    public void UpdateCrewMember(CrewMember crewMember)
    {
      const string sql = "UPDATE CrewMembers SET Name = @Name, Rank = @Rank, Age = @Age, Species = @Species WHERE Id = @Id";
      _db.Execute(sql, crewMember);
    }
    public void DeleteCrewMember(int id)
    {
      const string sql = "DELETE FROM CrewMembers WHERE Id = @Id";
      _db.Execute(sql, new { Id = id });
    }
  }
}