using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AccesoADatos;

namespace Logica
{
     public class GestorCampeonato
    {
         public DAOCampeonato campeonato{get; set;}

         public GestorCampeonato()
         {
             campeonato = new DAOCampeonato();
         }

    }
}
