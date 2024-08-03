using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace StarTrekShips.Models;

public class CrewMember
{
  public int CrewMemberID { get; set; }

  public string Name { get; set; }

  public string Rank { get; set; }

  public string Position { get; set; }

  public int SpeciesID { get; set; }

  public int Age { get; set; }

  public string Gender { get; set; }

  public Species Species { get; set; }
}

