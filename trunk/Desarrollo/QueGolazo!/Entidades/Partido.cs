using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Partido
    {
       
        public int idPartido { get; set; }
        public int idFecha { get; set; }
        public int idCampeonato { get; set; }
        public Equipo equipoLocal { get; set; }
        public Equipo equipoVisitante { get; set; }
       
    }
}
