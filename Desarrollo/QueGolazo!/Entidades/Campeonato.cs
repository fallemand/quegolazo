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
        public string descripcion { get; set; }
        public string urlLogo { get; set; }
        public int idTamañoCancha { get; set; }
        public int idSuperficieDeCancha { get; set; }
        public int idEstado { get; set; }
        public int idTipoFixture { get; set; }
        /// <summary>
        /// La cantidad maxima de jugadores que permite el campeonato para cada equipo
        /// </summary>
        public int cantidaMaximaJugadores { get; set; }
        public List<Fecha> fixture { get; set; }
        public List<Equipo> equipos { get; set; }
        public TamañoCancha tamañoCancha { get; set; }
        public SuperficieDeCancha superficieDeCancha { get; set; }
        public TipoFixture tipoFixture { get; set; }
    }


}
