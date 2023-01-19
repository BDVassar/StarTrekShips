
namespace StarTrekShips.Models;

public class Ship
{
  public string name { get; set; }
  public string quadrant { get; set; }
  public int crewComplement { get; set; }
  public bool phasers { get; set; }
  public bool torpedos { get; set; }
  public bool shields { get; set; }
  public string shipPrefix { get; set; }
  public string alliance { get; set; }
  public int shuttles { get; set; }
  public string classification { get; set; }
  public Account Creator { get; set; }
}
