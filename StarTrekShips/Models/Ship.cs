
namespace StarTrekShips.Models;

public class Ship
{
  public string name { get; set; }
  public string quadrant { get; set; }
  public string captain { get; set; }
  public int crewComplement { get; set; }
  public int passengerCapcity { get; set; }
  public int speed { get; set; }
  public bool phasers { get; set; }
  public bool torpedos { get; set; }
  public bool shields { get; set; }
  public bool sensors { get; set; }
  public bool dockingBay { get; set; }
  public bool sickBay { get; set; }
  public bool cloakingDevice { get; set; }
  public bool tractorBeam { get; set; }
  public bool transporter { get; set; }
  public string shipPrefix { get; set; }
  public string alliance { get; set; }
  public int shuttles { get; set; }
  public string classification { get; set; }
  public int capacity { get; set; }
}
