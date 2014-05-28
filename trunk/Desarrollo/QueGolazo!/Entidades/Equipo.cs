using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
   public  class Equipo : ICloneable    
    {
       public int idEquipo { get; set; }
       public int idCampeonato { get; set; }
       public string nombre { get; set; }
       public string urlLogo { get; set; }
       public string colorDeCamisetaPrimario { get; set; }
       public string colorDeCamisetaSecundario { get; set; }
       public string directorTecnico { get; set; }

       public Equipo()
       {

       }
       public object Clone()
       {
           return (Equipo)this.MemberwiseClone();
       }
    }
}
