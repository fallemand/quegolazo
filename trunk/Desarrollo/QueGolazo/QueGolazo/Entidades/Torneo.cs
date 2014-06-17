using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Torneo
    {
        public int idCampeonato { get; set; }
        public string nombre { get; set; }
        public string nick { get; set; }
        public List<Equipo> equipos { get; set; }
        public List<Edicion> ediciones { get; set; }
    }
}
