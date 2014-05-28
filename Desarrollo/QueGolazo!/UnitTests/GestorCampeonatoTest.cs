using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Entidades;
using Logica;
using System.Collections.Generic;

namespace UnitTests
{
    [TestClass]
    public class GestorCampeonatoTest
    {
        /// <summary>
        /// Verifica que la cantidad de fechas generadas para un fixture sea la correcta
        /// </summary>
        [TestMethod]
        public void verificarCantidadCorrectaDeFechas()
        {
            GestorFixture gestor = new GestorFixture();          
            List<Fecha> fixture = gestor.generarFixtureTodosContraTodos(generarListaDeEquipos(16), 1);
            Assert.AreEqual(15, fixture.Count);
        }

        /// <summary>
        /// Verifica que cada fecha tenga el numero correcto de partidos generados.
        /// </summary>
        [TestMethod]
        public void verificarCantidadDePartidosPorFecha()
        {
            List<Equipo> equiposParaProbar = generarListaDeEquipos(10);
            int cantidadPartidos = equiposParaProbar.Count / 2;
            GestorFixture gestor = new GestorFixture();
            List<Fecha> fixture = gestor.generarFixtureTodosContraTodos(equiposParaProbar, 1);
            foreach (Fecha item in fixture)
            {
                Assert.AreEqual(cantidadPartidos, item.partidos.Count);   
            }
          
         
        }



        /// <summary>
        /// Genera una lista de n equipos para probar el metodo de generacion de fixtures.
        /// </summary>
        /// <param name="cantidad">La cantidad de equipos que se va a generar</param>
        /// <returns>Una lista de equipos cuyos nombre son numeros del 1 al 11</returns>
        private List<Equipo> generarListaDeEquipos( int cantidad)
        {
            List<Equipo> equiposGenerados = new List<Equipo>();
            for (int i = 0; i < cantidad; i++)
            {
                Equipo nuevoEquipo = new Equipo() { nombre = (i + 1).ToString() };
                equiposGenerados.Add(nuevoEquipo);
            }
            return equiposGenerados;
        }
    }
}
