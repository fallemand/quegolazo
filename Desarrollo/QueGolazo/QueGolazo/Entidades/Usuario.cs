using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Usuario
    {
        public int idUsuario { get; set; }
        public string email { get; set; }
        public string contrasenia { get; set; }
        public TipoUsuario rol { get; set; }
        public Estado estado { get; set; }
    }
}
