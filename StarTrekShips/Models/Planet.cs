using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace StarTrekShips.Models;

public class Planet
{
  public int PlanetID { get; set; }

  public string Name { get; set; }

  public string Type { get; set; }

  public string Atmosphere { get; set; }

  public decimal Gravity { get; set; }

  public long Population { get; set; }

  public ICollection<Species> Species { get; set; }
}
