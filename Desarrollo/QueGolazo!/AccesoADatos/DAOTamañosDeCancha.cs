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
   public class DAOTamañosDeCancha
    {

       private string cadenaDeConexion = System.Configuration.ConfigurationManager.ConnectionStrings["localhost"].ConnectionString;
     
        public DAOTamañosDeCancha()
        {
        }
        
        /// <summary>
        /// Obtiene un objeto Datatable con los tamaños de cancha registrados en la tabla TamañosDeCancha.
        /// </summary>
        public DataTable obtenerTodos()
        {
            SqlConnection con = new SqlConnection(cadenaDeConexion);
            SqlCommand cmd = new SqlCommand();
            try
            {
                OperacionesAccesoADatos.conectar(con, cmd);
                string sql = @"SELECT idTamañoCancha, nombre, cantidadDeJugadores
                               FROM TamañosCancha";
                cmd.Parameters.Clear();
                cmd.CommandText = sql;
                SqlDataReader dr = cmd.ExecuteReader();
                DataTable tabla = new DataTable();
                tabla.Load(dr);
                con.Close();
                return tabla;
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
        /// Obtiene un objeto TamañoCancha con el id que se pasa por parametro, si no lo encuentra devuelve null
        /// </summary>
        /// <param name="id">El id del tamaño de cancha que se desea buscar</param>
        /// <returns></returns>
        public TamañoCancha obtenerTamañoPorId(int id)
        {
            SqlConnection con = new SqlConnection(cadenaDeConexion);
            SqlCommand cmd = new SqlCommand();
            TamañoCancha respuesta = null;
            try
            {
                OperacionesAccesoADatos.conectar(con, cmd);
                string sql = @"SELECT idTamañoCancha, nombre, cantidadDeJugadores
                                FROM TamañosCancha
                                WHERE idTamañoCancha = @idTamañoCancha";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@idTamañoCancha", id);
                cmd.CommandText = sql;

                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    respuesta = new TamañoCancha()
                    {

                        idTamañoCancha = int.Parse(dr["idTamañoCancha"].ToString()),
                        nombre = dr["nombre"].ToString(),
                        cantidadDeJugadores = int.Parse(dr["cantidadDeJugadores"].ToString())
                    };
                }

            }
            catch (Exception ex)
            {
                throw new Exception("Error al intentar recuperar el tamaño de cancha: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
            return respuesta;

        }

    }
}
