using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Fecha
    {
        
        public int numeroDeFecha { get; set; }
        public List<Partido> partidos { get; set; }
        public int? estaCompleta { get; set; }
        public Fecha()
        {
            partidos = new List<Partido>();
        }
    }
}
