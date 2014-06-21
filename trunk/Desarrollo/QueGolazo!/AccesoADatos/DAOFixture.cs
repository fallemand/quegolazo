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
    public class DAOFixture
    {
        private string cadenaDeConexion = System.Configuration.ConfigurationManager.ConnectionStrings["localhost"].ConnectionString;
      
        /// <summary>
        /// Graba en la base de datos los partidos correspondientes a un fixture generado para un campeonato
        /// </summary>
        /// <param name="campeonatoConFixtureConfirmado">Un objeto Campeonato que tiene el fixture generado previamente.</param>
        public void registrarFixtureParaUnCampeonato(Campeonato campeonatoConFixtureConfirmado)
        {
            SqlConnection con = new SqlConnection(cadenaDeConexion);
            SqlCommand cmd = new SqlCommand();
            SqlTransaction trans = null;

            try
            {

                OperacionesAccesoADatos.conectar(con, cmd);
                trans = con.BeginTransaction();
                cmd.Transaction = trans;
                DAOPartido daoPartido = new DAOPartido();
                foreach (Fecha fechaDeUnCampeoanto in campeonatoConFixtureConfirmado.fixture)
                {
                    registrarFechaDeUnCampeonato(fechaDeUnCampeoanto, campeonatoConFixtureConfirmado.idCampeonato, ref con, ref cmd);
                    daoPartido.registrarPartidosDeUnaFecha(fechaDeUnCampeoanto, campeonatoConFixtureConfirmado.idCampeonato, ref con, ref cmd);
                }
                trans.Commit();
            }
            catch (Exception ex)
            {
                trans.Rollback();
                throw new Exception("No se pudo registrar el campeonato: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
        }

        /// <summary>
        ///  Graba en la base de datos una fecha correspondiente a un campeonato registrado
        /// </summary>
        /// <param name="fechaDeUnCampeoanto">La fecha que se desea grabar</param>
        /// <param name="con">El objeto SqlConnection que viene del metodo regitrarFixtureParaUnCampeonato</param>
        /// <param name="cmd">El objeto SqlCommand que viene del metodo registrarFixtureParaUnCampeonato</param>
        private void registrarFechaDeUnCampeonato(Fecha fechaDeUnCampeoanto, int idCampeonato, ref SqlConnection conexion, ref SqlCommand cmd)
        {

            try
            {

                string sql = @"INSERT INTO Fechas (idFecha,idCampeonato) 
                                            VALUES (@idFecha,@idCampeonato)";

                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@idFecha", fechaDeUnCampeoanto.numeroDeFecha);
                cmd.Parameters.AddWithValue("@idCampeonato", idCampeonato);
                cmd.CommandText = sql;
                cmd.ExecuteNonQuery();

            }
            catch (Exception ex)
            {

                throw new Exception("No se pudo registrar la fecha del campeonato: " + ex.Message);
            }

        }
        
        /// <summary>
        /// Actualiza una Fecha: actualiza su estado a está completa.
        /// Fecha Completa: todos sus partidos están jugados.
        /// </summary>
        /// <param name="idFechaAActualizar">idFecha a actualizar </param>
        /// <param name="idCampeonato">id del Campeonato de esa fecha</param>
        /// <returns>true o false</returns>
        public bool actualizarFecha(int idFechaAActualizar, int idCampeonato, int estadoFecha)
        {
            bool b = false;
            SqlConnection con = new SqlConnection(cadenaDeConexion);
            SqlCommand cmd = new SqlCommand();
            try
            {
                OperacionesAccesoADatos.conectar(con, cmd);
                string sql = @"UPDATE Fechas SET estaCompleta = @estaCompleta WHERE idFecha = @idFecha
                               AND idCampeonato = @idCampeonato";
                cmd.Parameters.Clear();
                cmd.Parameters.Add(new SqlParameter("@estaCompleta", estadoFecha));
                cmd.Parameters.Add(new SqlParameter("@idFecha", idFechaAActualizar));
                cmd.Parameters.Add(new SqlParameter("@idCampeonato", idCampeonato));

                
                cmd.CommandText = sql;

                int filasAfectadas = cmd.ExecuteNonQuery();

                if (filasAfectadas > 0)
                    b = true;

                return b;
                    

            }
            catch (Exception ex)
            {
                throw new Exception("Ocurrió un problema al actualizar los datos: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
        }

        /// <summary>
        /// Devuelve una lista de fechas incompletas
        /// </summary>
        /// <param name="idCampeonato">El id del campeonato </param>
        /// <returns>Una lista generica con objetos Fecha</returns>
        public List<Fecha> obtenerFechasIncompletas(int idCampeonato)
        {
            SqlConnection con = new SqlConnection(cadenaDeConexion);
            SqlCommand cmd = new SqlCommand();
            try
            {
                List<Fecha> respuesta = new List<Fecha>();

                OperacionesAccesoADatos.conectar(con, cmd);
                string sql = @"SELECT * FROM Fechas WHERE estaCompleta = 0
                               AND idCampeonato = @idCampeonato";
                cmd.Parameters.Clear();
                cmd.Parameters.Add(new SqlParameter("@idCampeonato", idCampeonato));

                cmd.CommandText = sql;

                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    Fecha f = new Fecha();
                    DAOPartido daoPartido = new DAOPartido();
                    f.numeroDeFecha = Int32.Parse(dr["idFecha"].ToString());

                    f.estaCompleta = Int32.Parse(dr["estaCompleta"].ToString());
                
                    
                    f.partidos = daoPartido.obtenerPartidosDeUnaFecha(idCampeonato, f.numeroDeFecha);

                    if(f.estaCompleta == 0)
                        respuesta.Add(f);
 
                }
                                   
                
                return respuesta;
            }
            catch (Exception ex)
            {
                throw new Exception("Error al intentar recuperar los datos: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
        }
               
        

        /// <summary>
        /// Devuelve el fixture de un campeonato registrado y diagramado
        /// </summary>
        /// <param name="idCampeonato">El id del campeonato registrado.</param>
        /// <returns>Una lista generica con objetos Fecha</returns>
        public List<Fecha> obtenerFixtureDeUnCampeonato(int idCampeonato)
        {
            SqlConnection con = new SqlConnection(cadenaDeConexion);
            SqlCommand cmd = new SqlCommand();
            try
            {                
                List<Fecha> respuesta = new List<Fecha>();
                int cantidadDeFechas = obtenerCantidadDeFechasDeUnCampeonato(idCampeonato);
                DAOPartido daoPartido = new DAOPartido();
                for (int i = 0; i < cantidadDeFechas; i++)
                {
                    Fecha nuevaFecha = new Fecha()
                    {
                        numeroDeFecha = i + 1,
                        partidos = daoPartido.obtenerPartidosDeUnaFecha(idCampeonato, i + 1)
                    };
                        respuesta.Add(nuevaFecha);
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
               
        /// <summary>
        /// Obtiene un objeto Datatable con los tipos de fixture registrados en la tabla TiposFixture
        /// </summary>
        public DataTable obtenerTiposDeFixture()
        {
            SqlConnection con = new SqlConnection(cadenaDeConexion);
            SqlDataReader dr;
            SqlCommand cmd = new SqlCommand();
            try
            {
                OperacionesAccesoADatos.conectar(con, cmd);
                string sql = "SELECT idTipoFixture, nombre FROM TiposFixture ORDER BY nombre ASC";
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
        /// Devuelve el Tipo de Fixture para un campeonato
        /// </summary>
        /// <param name="idtipoFixtureC">El id del tipo de fixture</param>
        /// <returns>Objeto TipoFixture</returns>
        public TipoFixture obtenerTipoFixturePorId(int idTipoFixtureC)
        {
            SqlConnection con = new SqlConnection(cadenaDeConexion);
            SqlCommand cmd = new SqlCommand();

            try
            {
                TipoFixture tipoFixture = null;
                OperacionesAccesoADatos.conectar(con, cmd);
                string sql = @"SELECT *
                                FROM TiposFixture
                                WHERE idTipoFixture = @idTipoFixture";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@idTipoFixture", idTipoFixtureC);
                cmd.CommandText = sql;

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    tipoFixture = new TipoFixture()
                    {
                        idTipoFixture = idTipoFixtureC,
                        nombre = dr["nombre"].ToString(),
                    }
                     ;
                }
                return tipoFixture;
            }


            catch (Exception ex)
            {
                throw new Exception("Error al intentar recuperar el tipo de fixture: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
        }

        /// <summary>
        /// Obtiene la cantidad de fechas que se generaron para un campeonato determinado
        /// </summary>
        /// <param name="idCampeonato">El id del campeonato.</param>
        /// <returns>El número de fechas que se generaron para ese campeonato</returns>
        public int obtenerCantidadDeFechasDeUnCampeonato(int idCampeonato)
        {
            SqlConnection con = new SqlConnection(cadenaDeConexion);
            SqlCommand cmd = new SqlCommand();
            try
            {
                OperacionesAccesoADatos.conectar(con, cmd);
                //Obtengo la cantidad de fechas que se diagramaron para este campeonato
                string sql = @"SELECT max(idFecha)
                               FROM Partidos
                               WHERE idCampeonato = @idCampeonato";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@idCampeonato", idCampeonato);
                cmd.CommandText = sql;
                return (int)cmd.ExecuteScalar();
            }
            catch (InvalidCastException ex)
            {//si la consulta no devuelve filas entonces el valor es cero
                return 0;
            }
            catch (Exception ex)
            {
                throw new Exception("Error al intentar recuperar datos del campeonato: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
        }

    }
}
