using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace StarTrekShips.Models;

public class Species
{
  public int SpeciesID { get; set; }

  public string Name { get; set; }

  public string Classification { get; set; }

  public int HomePlanetID { get; set; }

  public decimal AverageHeight { get; set; }

  public int AverageLifespan { get; set; }

  public Planet Planet { get; set; }
}
