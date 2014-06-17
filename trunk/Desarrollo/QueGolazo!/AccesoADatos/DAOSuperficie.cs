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
    public class DAOSuperficie
    {
       
        private string cadenaDeConexion = System.Configuration.ConfigurationManager.ConnectionStrings["localhost"].ConnectionString; 
        /// <summary>
        /// Obtiene un objeto Datatable con las superficies de cancha registrados en la tabla SuperficiesDeCancha.
        /// </summary>
        public DataTable obtenerTodos()
        {
            SqlConnection con = new SqlConnection(cadenaDeConexion);
            SqlDataReader dr;
            SqlCommand cmd = new SqlCommand();

            try
            {
                OperacionesAccesoADatos.conectar(con, cmd);
                string sql = @"SELECT idSuperficieDeCancha, nombre 
                               FROM SuperficiesDeCancha 
                               ORDER BY nombre ASC";
                cmd.Parameters.Clear();
                cmd.CommandText = sql;
                dr = cmd.ExecuteReader();
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
        /// Devuelve el Tamaño de Cancha para un campeonato
        /// </summary>
        /// <param name="idSupercifieCanchaC">El id de la superficie de canccha del campeonato.</param>
        /// <returns>Objeto SuperficieCancha</returns>
        public SuperficieDeCancha buscarSuperficiePorId(int idSuperficieDeCanchaC)
        {
            SqlConnection con = new SqlConnection(cadenaDeConexion);
            SqlCommand cmd = new SqlCommand();

            try
            {
                SuperficieDeCancha superficieCancha = null;
                OperacionesAccesoADatos.conectar(con, cmd);
                string sql = @"SELECT *
                                FROM SuperficiesDeCancha
                                WHERE idSuperficieDeCancha = @idSuperficieDeCancha";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@idSuperficieDeCancha", idSuperficieDeCanchaC);
                cmd.CommandText = sql;

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    superficieCancha = new SuperficieDeCancha()
                    {
                        idSuperficieDeCancha = idSuperficieDeCanchaC,
                        nombre = dr["nombre"].ToString(),
                    }
                    ;
                }
                return superficieCancha;
            }


            catch (Exception ex)
            {
                throw new Exception("Error al intentar recuperar el tipo de superficie de la cancha: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
        }

    }
}
