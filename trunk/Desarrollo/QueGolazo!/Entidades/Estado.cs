using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
   public class Estado
    {
        public int idEstado { get; set; }
        public enumAmbito ambito { get; set; }
        public enumNombre nombre { get; set; }

        public enum enumNombre
        {
            REGISTRADO, 
            DIAGRAMADO,
            PROGRAMADA,
            INCOMPLETA,
            COMPLETA,
            JUGADO,
            NO_JUGADO
        }
        public enum enumAmbito
        {
            CAMPEONATO,
            FECHA,
            PARTIDO
        }
    }
}
