using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using Entidades;
using Utils;
using AccesoADatos;

namespace Logica
{
    public class GestorFixture
    {
                 
        /// Genera un fixture para un campeonato, utilizando el algoritmo de TODOS contra TODOS 
        /// </summary>
        /// <param name="equiposParticipantes">La lista de equipos para generar el fixture.</param>
        /// <param name="cantidadRondas">La cantidad de rondas a disputar</param>
        /// <returns>Una lista de fechas para un campeonato</returns>
        public List<Fecha> generarFixtureTodosContraTodos(List<Equipo> equiposParticipantes, int cantidadRondas)
        {
            prepararListaDeEquipos(ref equiposParticipantes);
            int cantidadFechas = (equiposParticipantes.Count - 1) * cantidadRondas;
            int cantidadPartidos = equiposParticipantes.Count / 2;
            Equipo equipoPivot = (Equipo)equiposParticipantes[0].Clone();
            List<Fecha> fechas = new List<Fecha>();

            for (int i = 0; i < cantidadFechas; i++)
            {
                Fecha fechaNueva = new Fecha() { numeroDeFecha = i + 1 };
                for (int j = 0, k = equiposParticipantes.Count - 1; j < cantidadPartidos && j < k; j++, k--)
                {
                    Partido partidoNuevo = new Partido()
                    {
                        equipoLocal = equiposParticipantes[j],
                        equipoVisitante = equiposParticipantes[k],
                        estado = new Estado() { ambito = Estado.enumAmbito.PARTIDO, nombre = Estado.enumNombre.NO_JUGADO }
                    };
                    fechaNueva.partidos.Add(partidoNuevo);
                }
                fechas.Add(fechaNueva);
                intercambiarPosiciones(ref equiposParticipantes);
            }
            if (cantidadRondas == 2) //si tiene 2 rondas (ida y vuelta)
                reordenarLocalias(ref fechas);
            return fechas;
        }

        /// <summary>
        /// Intercambia los equipos locales y visitantes para la segunda ronda de un campeonato
        /// </summary>
        /// <param name="fechas">Las fechas a reordenar</param>
        private void reordenarLocalias(ref List<Fecha> fechas)
        {
            int mitad = fechas.Count / 2;
            for (int i = mitad; i < fechas.Count; i++)
            {
                for (int j = 0; j < fechas[i].partidos.Count; j++)
                {
                   Equipo copia = (Equipo)fechas[i].partidos[j].equipoLocal.Clone();
                   fechas[i].partidos[j].equipoLocal = (Equipo)fechas[i].partidos[j].equipoVisitante.Clone();
                   fechas[i].partidos[j].equipoVisitante = copia;
                }
            }
          
        }

        /// <summary>
        /// Prepara la lista de equipos agregando un equipo "LIBRE" si la cantidad original de equipos participantes es impar. Tambien desordena aleatoriamente dicha lista.
        /// </summary>
        /// <param name="equiposParticipantes">Lista de equipos original</param>
        private void prepararListaDeEquipos(ref List<Equipo> equiposParticipantes)
        {
            if (equiposParticipantes.Count % 2 != 0)
            {
                Equipo libre = new Equipo() { nombre = "LIBRE" };
                equiposParticipantes.Add(libre);
            }
            //TODO esta linea genera el conflicto de la lista vacia, porque antes estaba comentada porque yo lo probe sin desordenar para poder tener repetibilidad
            equiposParticipantes = GestorColecciones.desordenarLista(equiposParticipantes);
        }

        /// <summary>
        /// Intercambia la posicion de los equipos, pasando el ultimo equipo al segundo lugar, y adelantando los demas desde el segundo lugar (Round Robin).
        /// </summary>
        /// <param name="equipos">La lista de equipos para cambiar de posicion</param>
        private void intercambiarPosiciones(ref List<Equipo> equipos)
        {
            Equipo cambio = (Equipo)equipos[equipos.Count - 1].Clone();
            for (int i = equipos.Count - 1; i > 1; i--)
            {
                equipos[i] = equipos[i - 1];
            }
            equipos[1] = cambio;
        }       
    }
}
