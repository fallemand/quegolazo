﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Logica;

namespace QueGolazo
{
    public partial class admin_registrar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

        }

        protected void btnRegistrarse_Click(object sender, EventArgs e)
        {
            btnRegistrarse.Enabled = false;
            panFracaso.Visible = false;
            panExito.Visible = false;
            System.Threading.Thread.Sleep(5000);
            //Hacer aca todo el registro
            //...
            //...
            try{
            GestorUsuario gestor = new GestorUsuario();
            gestor.registrarUsuario(apellido.Value,nombre.Value,email.Value,clave.Value);


            panExito.Visible = true;

            }
            catch(Exception ex)
            {
                panFracaso.Visible = true;
                btnRegistrarse.Enabled = true;
            }


            //Si salio todo bien
            bool registroExitoso = true;
            if (registroExitoso)
            {
                panExito.Visible = true;

            }
            else
            {
                panFracaso.Visible = true;
                btnRegistrarse.Enabled = true;
            }
        } 
    }
}