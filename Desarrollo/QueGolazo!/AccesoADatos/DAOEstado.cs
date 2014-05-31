using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using Entidades;
using Utils;


namespace AccesoADatos
{
    public class DAOEstado
    {
       private string cadenaDeConexion = System.Configuration.ConfigurationManager.ConnectionStrings[System.Environment.MachineName].ConnectionString;

       /// <summary>
       /// Obtiene todos los registros de la base de datos y los materializa en objetos de tipo Estado
       /// </summary>
       public List<Estado> obtenerTodos()
       {
           SqlConnection con = new SqlConnection(cadenaDeConexion);
           SqlCommand cmd = new SqlCommand();
           SqlDataReader dr;
           try
           {
               OperacionesAccesoADatos.conectar(con, cmd);
               string sql = @"SELECT idEstado, nombre, ambito 
                             FROM Estados";
               cmd.Parameters.Clear();
               cmd.CommandText = sql;
               dr = cmd.ExecuteReader();
               List<Estado> respuesta = new List<Estado>();
               while (dr.Read())
               {
                   Estado nuevoEstado = new Estado() { 
                   idEstado = Int32.Parse(dr["idEstado"].ToString()),
                   ambito = obtenerAmbito(dr["ambito"].ToString()),
                   nombre= obtenerNombre(dr["nombre"].ToString())
                   };                   
                 respuesta.Add(nuevoEstado);
               }

               return respuesta;
           }
           catch (Exception ex)
           {
               throw new Exception("Ocurrió un problema al cargar los datos: " + ex.Message);
           }
           finally
           {
               con.Close();
           }
       }

        /// <summary>
        /// Obtiene un estado de la base de datos
        /// </summary>
        /// <param name="idEstado">El id del estado</param>
        /// <returns>Un objeto de tipo Estado</returns>
       public Estado obtenerUnEstadoPorId(int idEstado)
       {
           SqlConnection con = new SqlConnection(cadenaDeConexion);
           SqlCommand cmd = new SqlCommand();
           SqlDataReader dr;
           try
           {
               OperacionesAccesoADatos.conectar(con, cmd);
               string sql = @"SELECT idEstado, nombre, ambito 
                             FROM Estados
                             WHERE idEstado = @idEstado";
               cmd.Parameters.Clear();
               cmd.Parameters.AddWithValue("@idEstado", idEstado);
               cmd.CommandText = sql;
               dr = cmd.ExecuteReader();
               Estado respuesta = null;
               while (dr.Read())
               {
                   Estado nuevoEstado = new Estado() { 
                   idEstado = Int32.Parse(dr["idEstado"].ToString()),
                   ambito = obtenerAmbito(dr["ambito"].ToString()),
                   nombre= obtenerNombre(dr["nombre"].ToString())
                   };   
                   respuesta = nuevoEstado;
               }

               return respuesta;
           }
           catch (Exception ex)
           {
               throw new Exception("Ocurrió un problema al cargar los datos: " + ex.Message);
           }
           finally
           {
               con.Close();
           }
       }

        /// <summary>
        /// Devuelve el enumerado correspondiente al ambito del estado
        /// </summary>
        /// <param name="ambito">El ambito del estado guardado en la base de datos</param>
        /// <returns>un objeto tipo Enum con el nombre del ambito</returns>
       private Estado.enumAmbito obtenerAmbito(string ambito)
       {
           //seteamos la respuesta con cualquier valor
           Estado.enumAmbito respuesta = Estado.enumAmbito.CAMPEONATO;
           foreach (Estado.enumAmbito nombreDelEnumerado in Enum.GetValues(typeof(Estado.enumAmbito)))
           {
               if (ambito.Equals(nombreDelEnumerado.ToString()))
               {
                   //seteamos la respuesta con el valor que corresponde
                   respuesta = nombreDelEnumerado;
                   break;
               }
           }
           return respuesta;
       }

       /// <summary>
       /// Devuelve el enumerado correspondiente al nombre del estado
       /// </summary>
       /// <param name="nombre">El ambito del estado guardado en la base de datos</param>
       /// <returns>un objeto tipo Estado.enumNombre con el nombre del estado</returns>
       private Estado.enumNombre obtenerNombre(string nombre)
       { 
           //seteamos la respuesta con cualquier valor
           Estado.enumNombre respuesta = Estado.enumNombre.REGISTRADO;
           foreach (Estado.enumNombre nombreDelEnumerado in Enum.GetValues(typeof(Estado.enumNombre)))
           {
               if (nombre.Equals(nombreDelEnumerado.ToString()))
               {
                   //seteamos la respuesta con el valor que corresponde
                   respuesta = nombreDelEnumerado;
                   break;
               }
           }
           return respuesta;
       }
       
 

    }
}
