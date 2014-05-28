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
   public class DAOEquipos
    {
        private string cadenaDeConexion = System.Configuration.ConfigurationManager.ConnectionStrings[System.Environment.MachineName].ConnectionString;


        /// <summary>
        /// Inserta un objeto Equipo en la base de datos, junto con su Delegado.
        /// </summary>
        public void registrarEquipo(Equipo equipo, Delegado delegado)
        {
            SqlConnection con = new SqlConnection(cadenaDeConexion);
            SqlCommand cmd = new SqlCommand();
            SqlTransaction trans = null;
            try
            {
                conectar(con, cmd);
                trans = con.BeginTransaction();
                cmd.Transaction = trans;


                string sql = @"INSERT INTO Equipos (idCampeonato, nombre, urlLogo, colorDeCamisetaPrimario, colorDeCamisetaSecundario, directorTecnico)
                                VALUES (@idCampeonato,@nombre,@urlLogo,@colorDeCamisetaPrimario,@colorDeCamisetaSecundario,@directorTecnico)";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@idCampeonato", equipo.idCampeonato);
                cmd.Parameters.AddWithValue("@nombre", equipo.nombre);
                cmd.Parameters.AddWithValue("@urlLogo", equipo.urlLogo);
                cmd.Parameters.AddWithValue("@colorDeCamisetaPrimario", equipo.colorDeCamisetaPrimario);
                cmd.Parameters.AddWithValue("@colorDeCamisetaSecundario", equipo.colorDeCamisetaSecundario);
                cmd.Parameters.AddWithValue("@directorTecnico", equipo.directorTecnico);
                cmd.CommandText = sql;
                cmd.ExecuteNonQuery();


                sql = @"INSERT INTO Delegados (nombre,email,telefono,domicilio,idEquipo) 
                        VALUES (@nombreDelegado, @email, @telefono, @domicilio,IDENT_CURRENT( 'Equipos') )";
                cmd.Parameters.AddWithValue("@nombreDelegado", delegado.nombre);
                cmd.Parameters.AddWithValue("@email", delegado.email);
                cmd.Parameters.AddWithValue("@telefono", delegado.telefono);
                cmd.Parameters.AddWithValue("@domicilio", delegado.domicilio);
                cmd.CommandText = sql;
                cmd.ExecuteNonQuery();

                trans.Commit();
            }
            catch (Exception ex)
            {
                trans.Rollback();
                throw new Exception("No se pudo registrar el equipo: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
        }

        /// <summary>
        /// Realiza la conexion a la base de datos, solo si esta se encuentra en estado "Closed", seteando ademas la conexion al objeto SqlCommand. 
        /// </summary>
        private void conectar(SqlConnection con, SqlCommand cmd)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
                cmd.Connection = con;
            }
        }


        /// <summary>
        /// Verifica si existe un equipo con ese nombre en el mismo campeonato. 
        /// Retorna true si existe, y false si no existe.
        /// </summary>
        public bool validarSiExisteEnCampeonato(string nombreEquipo, int idCampeonato)
        {
            SqlConnection con = new SqlConnection(cadenaDeConexion);
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            try
            {
                conectar(con, cmd);
                string sql = @"SELECT 1 
                                FROM Equipos
                                WHERE  nombre = @nombre and idCampeonato=@idCampeonato";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@nombre", nombreEquipo);
                cmd.Parameters.AddWithValue("@idCampeonato", idCampeonato);
                cmd.CommandText = sql;

                dr = cmd.ExecuteReader();

                if (dr.HasRows)
                    return true;
                else
                    return false;
            }
            catch (Exception ex)
            {
                throw ex;
            }

            finally
            {

                con.Close();
            }
        }

    }
}
