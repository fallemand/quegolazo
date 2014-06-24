using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Campeonato
    {
        public int idCampeonato { get; set; }
        public string nombre { get; set; }
        public string nick { get; set; }
        public Usuario usuario { get; set; }

    }
}
