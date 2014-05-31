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
   public class DAOEquipo
    {
       private string cadenaDeConexion = System.Configuration.ConfigurationManager.ConnectionStrings[System.Environment.MachineName].ConnectionString;
       
        /// <summary>
        ///  Inserta un objeto Equipo en la base de datos, junto con su Delegado
       /// </summary>
       /// <param name="equipo">El equipo a registrar.</param>
       /// <param name="delegado">El delegado a registrar</param>
        public void registrarEquipo(Equipo equipo, Delegado delegado)
        {
            SqlConnection con = new SqlConnection(cadenaDeConexion);
            SqlCommand cmd = new SqlCommand();
            SqlTransaction trans = null;
            try
            {
                OperacionesAccesoADatos.conectar(con, cmd);
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
        ///  Verifica si existe un equipo con ese nombre en el mismo campeonato. 
        /// </summary>
        /// <param name="nombreEquipo">El nombre de equipo que se quiere verificar.</param>
        /// <param name="idCampeonato">El id del campeonato en el cual se validara el nombre del equipo.</param>
        /// <returns>true si existe, y false si no existe.</returns>
        public bool validarSiExisteEnCampeonato(string nombreEquipo, int idCampeonato)
        {
            SqlConnection con = new SqlConnection(cadenaDeConexion);
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            try
            {
               OperacionesAccesoADatos.conectar(con, cmd);
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

        /// <summary>
        /// Devuelve un equipo registrado en la base de datos, o null si no lo encuentra.
        /// </summary>
        /// <param name="idEquipo">El id del equipo donde juega el equipo a obtener.</param>
        /// <returns>Un objeto Equipo</returns>
        public Equipo obtenerUnEquipo(int? idEquipo)
        {
            SqlConnection con = new SqlConnection(cadenaDeConexion);
            SqlCommand cmd = new SqlCommand();
            if (idEquipo != null)
            {
                try
                {
                    OperacionesAccesoADatos.conectar(con, cmd);
                    string sql = @"SELECT idEquipo,idCampeonato, nombre, urlLogo, colorDeCamisetaPrimario, colorDeCamisetaSecundario, directorTecnico
                                FROM Equipos
                                WHERE idEquipo = @idEquipo";
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@idEquipo", idEquipo);
                    cmd.CommandText = sql;

                    SqlDataReader dr = cmd.ExecuteReader();
                    Equipo respuesta = null;
                    while (dr.Read())
                    {
                        string url = "", dirTecnico = "";
                        //verificamos que los campos opcionales no tengan null en su valor
                        if (dr["urlLogo"] != DBNull.Value)
                            url = dr["urlLogo"].ToString();
                        if (dr["directorTecnico"] != DBNull.Value)
                            dirTecnico = dr["directorTecnico"].ToString();
                        //creamos el nuevo equipo 
                        Equipo equipo = new Equipo()
                        {
                            idCampeonato = int.Parse(dr["idCampeonato"].ToString()),
                            nombre = dr["nombre"].ToString(),
                            idEquipo = int.Parse(dr["idEquipo"].ToString()),
                            urlLogo = url,
                            colorDeCamisetaPrimario = dr["colorDeCamisetaPrimario"].ToString(),
                            colorDeCamisetaSecundario = dr["colorDeCamisetaSecundario"].ToString(),
                            directorTecnico = dirTecnico,
                        };
                        respuesta = equipo;
                    }
                    return respuesta;
                }
                catch (Exception ex)
                {
                    throw new Exception("Error al intentar recuperar los equipos del campeonato: " + ex.Message);
                }
                finally
                {
                    con.Close();
                }
            }
            else { //si el id del equipo es null, le toca fecha libre
                return new Equipo() {nombre = "LIBRE" };
            }
           
        }

    }
}
