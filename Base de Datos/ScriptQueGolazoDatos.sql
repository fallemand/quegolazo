USE [ProyectoQueGolazo]
GO
SET IDENTITY_INSERT [dbo].[TiposUsuario] ON 

INSERT [dbo].[TiposUsuario] ([idTipoUsuario], [nombre]) VALUES (1, N'Cliente')
SET IDENTITY_INSERT [dbo].[TiposUsuario] OFF
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([idUsuario], [nombre], [apellido], [email], [contrasenia], [esActivo], [idTipoUsuario], [codigo], [codigoRecuperacion], [emailNuevo]) VALUES (6, N'Antonio', N'Herrera', N'antonioherrera990@gmail.com', N'YgBhAG4AYQBuAGEAeQBlAG4AYwBoAHUAZgBlAA==', 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Usuarios] ([idUsuario], [nombre], [apellido], [email], [contrasenia], [esActivo], [idTipoUsuario], [codigo], [codigoRecuperacion], [emailNuevo]) VALUES (11, N'Florencia', N'Rojas', N'flor.rojas91@hotmail.com', N'MQAyADMANAA1ADYA', 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Usuarios] ([idUsuario], [nombre], [apellido], [email], [contrasenia], [esActivo], [idTipoUsuario], [codigo], [codigoRecuperacion], [emailNuevo]) VALUES (13, N'Paulita', N'Pedrosa', N'paulita2070@hotmail.com', N'YgBhAG4AYQBuAGEAeQBlAG4AYwBoAHUAZgBlAA==', 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Usuarios] ([idUsuario], [nombre], [apellido], [email], [contrasenia], [esActivo], [idTipoUsuario], [codigo], [codigoRecuperacion], [emailNuevo]) VALUES (14, N'Facundo', N'Allemand', N'facualle@hotmail.com', N'YgBvAGQAZQBnAGEAcwA=', 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Usuarios] ([idUsuario], [nombre], [apellido], [email], [contrasenia], [esActivo], [idTipoUsuario], [codigo], [codigoRecuperacion], [emailNuevo]) VALUES (15, N'Administrador', N'Administrador', N'administrador@gmail.com', N'YQBkAG0AaQBuAGkAcwB0AHIAYQBkAG8AcgA=', 1, 1, N'KbjZ!Rfqe@4qAi!kDd5mT$CFfxkpEq$xYfBJGExwWu2qDjrWaPr!tdG4MSTM', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
SET IDENTITY_INSERT [dbo].[Torneos] ON 

INSERT [dbo].[Torneos] ([idTorneo], [nombre], [nick], [idUsuario], [descripcion]) VALUES (87, N'Torneo Jockey Club', N'jockeyClub', 15, N'Torneo de la Provincia de Córdoba')
INSERT [dbo].[Torneos] ([idTorneo], [nombre], [nick], [idUsuario], [descripcion]) VALUES (88, N'Torneo Barrio Parque ', N'barrioParque', 15, N'Torneo de la Provincia de Córdoba')
INSERT [dbo].[Torneos] ([idTorneo], [nombre], [nick], [idUsuario], [descripcion]) VALUES (89, N'Torneo Universitario', N'universitario', 15, N'Torneo de la Provincia de Córdoba')
INSERT [dbo].[Torneos] ([idTorneo], [nombre], [nick], [idUsuario], [descripcion]) VALUES (98, N'Torneo Liga Juvenil', N'ligaJuvenil', 15, N'Torneo de la Provincia de Córdoba')
SET IDENTITY_INSERT [dbo].[Torneos] OFF
SET IDENTITY_INSERT [dbo].[Canchas] ON 

INSERT [dbo].[Canchas] ([idCancha], [nombre], [domicilio], [telefono], [idTorneo]) VALUES (1, N'Complejo Barrio Parque', N'La Entente 2522', N'3512015399', 87)
INSERT [dbo].[Canchas] ([idCancha], [nombre], [domicilio], [telefono], [idTorneo]) VALUES (2, N'Complejo Don Bosco', N'La Entente 2522', N'3512015399', 87)
INSERT [dbo].[Canchas] ([idCancha], [nombre], [domicilio], [telefono], [idTorneo]) VALUES (3, N'Complejo El Águila', N'La Entente 2522', N'3512015399', 87)
INSERT [dbo].[Canchas] ([idCancha], [nombre], [domicilio], [telefono], [idTorneo]) VALUES (4, N'Complejo Don Tino', N'La Entente 2522', N'3512015399', 87)
INSERT [dbo].[Canchas] ([idCancha], [nombre], [domicilio], [telefono], [idTorneo]) VALUES (1025, N'Complejo El Potrero', N'La Entente 2522', N'3512015399', 87)
INSERT [dbo].[Canchas] ([idCancha], [nombre], [domicilio], [telefono], [idTorneo]) VALUES (1026, N'Complejo Universitario', N'La Entente 2522', N'3512015399', 87)
INSERT [dbo].[Canchas] ([idCancha], [nombre], [domicilio], [telefono], [idTorneo]) VALUES (1027, N'Complejo Sol de Mayo', N'La Entente 2522', N'3512015399', 87)
INSERT [dbo].[Canchas] ([idCancha], [nombre], [domicilio], [telefono], [idTorneo]) VALUES (2028, N'Complejo El Único Héroe', N'La Entente 2522', N'3512015399', 87)
SET IDENTITY_INSERT [dbo].[Canchas] OFF
SET IDENTITY_INSERT [dbo].[Estados] ON 

INSERT [dbo].[Estados] ([idEstado], [idAmbito], [nombre]) VALUES (1, 1, N'Registrado')
INSERT [dbo].[Estados] ([idEstado], [idAmbito], [nombre]) VALUES (2, 2, N'Registrada')
INSERT [dbo].[Estados] ([idEstado], [idAmbito], [nombre]) VALUES (8, 3, N'Completa')
INSERT [dbo].[Estados] ([idEstado], [idAmbito], [nombre]) VALUES (7, 3, N'Diagramada')
INSERT [dbo].[Estados] ([idEstado], [idAmbito], [nombre]) VALUES (9, 3, N'Incompleta')
INSERT [dbo].[Estados] ([idEstado], [idAmbito], [nombre]) VALUES (12, 4, N'Cancelado')
INSERT [dbo].[Estados] ([idEstado], [idAmbito], [nombre]) VALUES (10, 4, N'Diagramado')
INSERT [dbo].[Estados] ([idEstado], [idAmbito], [nombre]) VALUES (13, 4, N'Jugado')
INSERT [dbo].[Estados] ([idEstado], [idAmbito], [nombre]) VALUES (11, 4, N'Programado')
INSERT [dbo].[Estados] ([idEstado], [idAmbito], [nombre]) VALUES (6, 5, N'Cerrada')
INSERT [dbo].[Estados] ([idEstado], [idAmbito], [nombre]) VALUES (4, 5, N'Diagramada')
INSERT [dbo].[Estados] ([idEstado], [idAmbito], [nombre]) VALUES (5, 5, N'En Juego')
INSERT [dbo].[Estados] ([idEstado], [idAmbito], [nombre]) VALUES (3, 5, N'Registrada')
SET IDENTITY_INSERT [dbo].[Estados] OFF
SET IDENTITY_INSERT [dbo].[GenerosEdicion] ON 

INSERT [dbo].[GenerosEdicion] ([idGeneroEdicion], [nombre]) VALUES (1, N'Masculino')
INSERT [dbo].[GenerosEdicion] ([idGeneroEdicion], [nombre]) VALUES (2, N'Femenino')
INSERT [dbo].[GenerosEdicion] ([idGeneroEdicion], [nombre]) VALUES (3, N'Mixto')
SET IDENTITY_INSERT [dbo].[GenerosEdicion] OFF
SET IDENTITY_INSERT [dbo].[TamaniosCancha] ON 

INSERT [dbo].[TamaniosCancha] ([idTamanioCancha], [nombre], [cantidadJugadores]) VALUES (1, N'Fútbol 5', 5)
INSERT [dbo].[TamaniosCancha] ([idTamanioCancha], [nombre], [cantidadJugadores]) VALUES (2, N'Fútbol 6', 6)
INSERT [dbo].[TamaniosCancha] ([idTamanioCancha], [nombre], [cantidadJugadores]) VALUES (4, N'Fútbol 7', 7)
INSERT [dbo].[TamaniosCancha] ([idTamanioCancha], [nombre], [cantidadJugadores]) VALUES (6, N'Fútbol 8', 8)
INSERT [dbo].[TamaniosCancha] ([idTamanioCancha], [nombre], [cantidadJugadores]) VALUES (7, N'Fútbol 9', 9)
INSERT [dbo].[TamaniosCancha] ([idTamanioCancha], [nombre], [cantidadJugadores]) VALUES (8, N'Fútbol 10', 10)
INSERT [dbo].[TamaniosCancha] ([idTamanioCancha], [nombre], [cantidadJugadores]) VALUES (9, N'Fútbol 11', 11)
SET IDENTITY_INSERT [dbo].[TamaniosCancha] OFF
SET IDENTITY_INSERT [dbo].[TiposSuperficie] ON 

INSERT [dbo].[TiposSuperficie] ([idTipoSuperficie], [nombre]) VALUES (1, N'Césped Natural')
INSERT [dbo].[TiposSuperficie] ([idTipoSuperficie], [nombre]) VALUES (2, N'Césped Sintético')
INSERT [dbo].[TiposSuperficie] ([idTipoSuperficie], [nombre]) VALUES (3, N'Tierra')
INSERT [dbo].[TiposSuperficie] ([idTipoSuperficie], [nombre]) VALUES (4, N'Futsal')
SET IDENTITY_INSERT [dbo].[TiposSuperficie] OFF
SET IDENTITY_INSERT [dbo].[Ediciones] ON 

INSERT [dbo].[Ediciones] ([idEdicion], [nombre], [idTamanioCancha], [idTipoSuperficie], [idEstado], [idTorneo], [puntosGanado], [puntosPerdido], [puntosEmpatado], [idGeneroEdicion]) VALUES (14, N'Jockey 2014', 1, 1, 2, 87, 3, 0, 1, 2)
INSERT [dbo].[Ediciones] ([idEdicion], [nombre], [idTamanioCancha], [idTipoSuperficie], [idEstado], [idTorneo], [puntosGanado], [puntosPerdido], [puntosEmpatado], [idGeneroEdicion]) VALUES (15, N'Jockey 2013', 1, 1, 2, 87, 3, 0, 1, 1)
INSERT [dbo].[Ediciones] ([idEdicion], [nombre], [idTamanioCancha], [idTipoSuperficie], [idEstado], [idTorneo], [puntosGanado], [puntosPerdido], [puntosEmpatado], [idGeneroEdicion]) VALUES (19, N'Barrio Parque 2014', 1, 1, 2, 88, 3, 0, 1, 2)
INSERT [dbo].[Ediciones] ([idEdicion], [nombre], [idTamanioCancha], [idTipoSuperficie], [idEstado], [idTorneo], [puntosGanado], [puntosPerdido], [puntosEmpatado], [idGeneroEdicion]) VALUES (20, N'Barrio Parque 2013', 1, 1, 2, 88, 3, 0, 1, 1)
INSERT [dbo].[Ediciones] ([idEdicion], [nombre], [idTamanioCancha], [idTipoSuperficie], [idEstado], [idTorneo], [puntosGanado], [puntosPerdido], [puntosEmpatado], [idGeneroEdicion]) VALUES (23, N'Universitario 2014', 1, 1, 2, 89, 3, 0, 1, 3)
INSERT [dbo].[Ediciones] ([idEdicion], [nombre], [idTamanioCancha], [idTipoSuperficie], [idEstado], [idTorneo], [puntosGanado], [puntosPerdido], [puntosEmpatado], [idGeneroEdicion]) VALUES (24, N'Universitario 2013', 9, 1, 2, 89, 3, 0, 1, 1)
INSERT [dbo].[Ediciones] ([idEdicion], [nombre], [idTamanioCancha], [idTipoSuperficie], [idEstado], [idTorneo], [puntosGanado], [puntosPerdido], [puntosEmpatado], [idGeneroEdicion]) VALUES (25, N'Liga Juvenil 2014', 1, 1, 2, 98, 3, 0, 1, 1)
INSERT [dbo].[Ediciones] ([idEdicion], [nombre], [idTamanioCancha], [idTipoSuperficie], [idEstado], [idTorneo], [puntosGanado], [puntosPerdido], [puntosEmpatado], [idGeneroEdicion]) VALUES (26, N'Liga Juvenil 2013', 1, 1, 2, 98, 3, 0, 1, 1)
SET IDENTITY_INSERT [dbo].[Ediciones] OFF
SET IDENTITY_INSERT [dbo].[Delegados] ON 

INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (49, N'Florencia Rojas', N'facu@gmail.com', N'3512015399', NULL)
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (50, N'Facundo Allemand', N'facu@gmail.com', N'3512015399', NULL)
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (51, N'Paula Pedrosa', N'facu@gmail.com', N'3512015399', NULL)
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (52, N'Facundo Allemand', N'facu@gmail.com', N'3512015399', NULL)
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (53, N'Paula Pedrosa', N'facu@gmail.com', N'3512015399', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (54, N'Antonio Herrera', N'facu@gmail.com', N'3512015399', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (55, N'Facundo Allemand', N'facu@gmail.com', N'3512015399', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (56, N'Florencia Rojas', N'facu@gmail.com', N'3512015399', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (57, N'Antonio Herrera', N'facu@gmail.com', N'3512015399', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (58, N'Facundo Allemand', N'facu@gmail.com', N'3512015399', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (59, N'Florencia Rojas', N'facu@gmail.com', N'3512015399', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (60, N'Paula Pedrosa', N'facu@gmail.com', N'3512015399', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (61, N'Antonio Herrera', N'facu@gmail.com', N'3512015399', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (62, N'Facundo Allemand', N'facu@gmail.com', N'3512015399', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (63, N'Florencia Rojas', N'facu@gmail.com', N'3512015399', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (64, N'Paula Pedrosa', N'facu@gmail.com', N'3512015399', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (65, N'Antonio Herrera', N'facu@gmail.com', N'3512015399', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (66, N'Facundo Allemand', N'facu@gmail.com', N'3512015399', N'')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (67, N'Paula Pedrosa', N'paula@gmail.com', N'3512015399', N'La Entente 2522')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (68, N'Antonio Herrera', N'antonio@gmail.com', N'3512015399', N'La Entente 2522')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (69, N'Facundo Allemand', N'facu@gmail.com', N'3512015399', N'La Entente 2522')
INSERT [dbo].[Delegados] ([idDelegado], [nombre], [email], [telefono], [domicilio]) VALUES (70, N'Florencia Rojas', N'florencia@gmail.com', N'3512015399', N'La Entente 2522')
SET IDENTITY_INSERT [dbo].[Delegados] OFF
SET IDENTITY_INSERT [dbo].[Equipos] ON 

INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (1, N'Almirante Brown', N'#3f3f3f', N'#31859b', N'Ramón Oliva', 69, NULL, 87)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (2, N'General Paz Junior', N'#1f497d', N'#fbd75b', N'Ramón Oliva', 68, NULL, 87)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (3, N'Unión', N'#e36c09', N'#5484ed', N'Ramón Oliva', 67, NULL, 87)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (4, N'Belgrano', N'#dc2127', N'#e1e1e1', N'Ramón Oliva', 70, NULL, 87)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (5, N'Talleres', N'#5484ed', N'#fbd75b', N'Ramón Oliva', 66, NULL, 87)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (7, N'Defensores Unidos', N'#5484ed', N'#5484ed', N'Ramón Oliva', 65, NULL, 87)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (8, N'All Boys', N'#5484ed', N'#5484ed', N'Ramón Oliva', 64, NULL, 87)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (9, N'Avellaneda', N'#5484ed', N'#5484ed', N'Ramón Oliva', 63, NULL, 87)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (10, N'Bella Vista', N'#5484ed', N'#5484ed', N'Ramón Oliva', 62, NULL, 87)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (11, N'San Vicente', N'#5484ed', N'#5484ed', N'Ramón Oliva', 61, NULL, 87)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (12, N'Carlos Paz', N'#5484ed', N'#5484ed', N'Ramón Oliva', 60, NULL, 87)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (13, N'Racing', N'#5484ed', N'#5484ed', N'Ramón Oliva', 59, NULL, 87)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (14, N'Independiente', N'#5484ed', N'#5484ed', N'Ramón Oliva', 58, NULL, 87)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (15, N'Peñarol', N'#5484ed', N'#5484ed', N'Ramón Oliva', 57, NULL, 87)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (17, N'Atlético Tucumán', N'#5484ed', N'#5484ed', N'Ramón Oliva', 56, NULL, 87)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (18, N'Juventud Antoniana', N'#5484ed', N'#5484ed', N'Ramón Oliva', 55, NULL, 87)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (19, N'Independiente Rivadavia', N'#5484ed', N'#5484ed', N'Ramón Oliva', 54, NULL, 87)
INSERT [dbo].[Equipos] ([idEquipo], [nombre], [colorCamisetaPrimario], [colorCamisetaSecundario], [directorTecnico], [idDelegadoPrincipal], [idDelegadoOpcional], [idTorneo]) VALUES (21, N'Aldosivi', N'#5484ed', N'#5484ed', N'Ramón Oliva', 53, NULL, 87)
SET IDENTITY_INSERT [dbo].[Equipos] OFF
SET IDENTITY_INSERT [dbo].[Jugadores] ON 

INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono]) VALUES (1, N'Javier Mascherano', N'362334651', CAST(0x0000839B00000000 AS DateTime), N'javier@gmail.com', N'Javier Mascherano', N'Masculino', 1, 1, N'3512015399')
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono]) VALUES (2, N'Angel Di María', N'362334652', CAST(0x0000839B00000000 AS DateTime), N'angel@gmail.com', N'Angel Di María', N'Masculino', 1, 1, N'3512015399')
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono]) VALUES (1002, N'Lionel Messi', N'362334653', CAST(0x0000839B00000000 AS DateTime), N'lionel@gmail.com', N'Lionel Messi', N'Masculino', 1, 2, N'3512015399')
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono]) VALUES (1009, N'Sergio Aguero', N'362334654', CAST(0x0000839B00000000 AS DateTime), N'sergio@gmail.com', N'Sergio Aguero', N'Masculino', 1, 2, N'3512015399')
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono]) VALUES (1015, N'Fernando Gago', N'362334655', CAST(0x0000839B00000000 AS DateTime), N'fernando@gmail.com', N'Fernando Gago', N'Masculino', 1, 3, N'3512015399')
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono]) VALUES (1016, N'Martín Demichellis', N'362334656', CAST(0x0000839B00000000 AS DateTime), N'martin@gmail.com', N'Martín Demichellis', N'Masculino', 1, 3, N'3512015399')
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono]) VALUES (1018, N'Marcos Rojo', N'362334657', CAST(0x0000839B00000000 AS DateTime), N'marcos@gmail.com', N'Marcos Rojo', N'Masculino', 1, 4, N'3512015399')
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono]) VALUES (1019, N'Ezequiel Lavezzi', N'362334658', CAST(0x0000839B00000000 AS DateTime), N'ezequiel@gmail.com', N'Ezequiel Lavezzi', N'Masculino', 0, 4, N'3512015399')
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono]) VALUES (2016, N'Lucas Biglia', N'362334659', CAST(0x0000839B00000000 AS DateTime), N'lucas@gmail.com', N'Lucas Biglia', N'Masculino', 1, 5, N'3512015399')
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono]) VALUES (2017, N'Gonzalo Higuaín', N'362334650', CAST(0x0000839B00000000 AS DateTime), N'gonzalo@gmail.com', N'Gonzalo Higuaín', N'Masculino', 1, 5, N'3512015399')
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono]) VALUES (2018, N'Enzo Perez', N'362334691', CAST(0x0000839B00000000 AS DateTime), N'enzo@gmail.com', N'Enzo Perez', N'Masculino', 0, 7, N'3512015399')
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono]) VALUES (2019, N'José Basanta', N'362334692', CAST(0x0000839B00000000 AS DateTime), N'jose@gmail.com', N'José Basanta', N'Masculino', 0, 7, N'3512015399')
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono]) VALUES (2027, N'Mariano Andújar', N'362334621', CAST(0x0000839B00000000 AS DateTime), N'mariano@gmail.com', N'Mariano Andújar', N'Masculino', 1, 8, N'3512015399')
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono]) VALUES (2029, N'Augusto Fernández', N'362331234', CAST(0x0000839B00000000 AS DateTime), N'augusto@gmail.com', N'Augusto Fernández', N'Masculino', 1, 8, N'3512015399')
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono]) VALUES (2030, N'Pablo Zabaleta', N'362334578', CAST(0x0000839B00000000 AS DateTime), N'pablo@gmail.com', N'Pablo Zabaleta', N'Masculino', 1, 9, N'3512015399')
INSERT [dbo].[Jugadores] ([idJugador], [nombre], [dni], [fechaNacimiento], [email], [facebook], [sexo], [tieneFichaMedica], [idEquipo], [telefono]) VALUES (2032, N'Sergio Romero', N'362312458', CAST(0x0000839B00000000 AS DateTime), N'sergio@gmail.com', N'Sergio Romero', N'Masculino', 1, 9, NULL)
SET IDENTITY_INSERT [dbo].[Jugadores] OFF
SET IDENTITY_INSERT [dbo].[Arbitros] ON 

INSERT [dbo].[Arbitros] ([idArbitro], [nombre], [celular], [email], [matricula], [idTorneo]) VALUES (1, N'Héctor Baldassi', N'3512015399', N'hector@gmail.com', N'ABC', 87)
INSERT [dbo].[Arbitros] ([idArbitro], [nombre], [celular], [email], [matricula], [idTorneo]) VALUES (2, N'Sergio Pezzota', N'3512015399', N'sergio@gmail.com', N'ABC', 87)
INSERT [dbo].[Arbitros] ([idArbitro], [nombre], [celular], [email], [matricula], [idTorneo]) VALUES (3, N'Néstor Pittana', N'3512015399', N'nestor@gmail.com', N'ABC', 87)
INSERT [dbo].[Arbitros] ([idArbitro], [nombre], [celular], [email], [matricula], [idTorneo]) VALUES (6, N'Gustavo Rossi', N'3512015399', N'gustavo@gmail.com', N'ABC', 87)
INSERT [dbo].[Arbitros] ([idArbitro], [nombre], [celular], [email], [matricula], [idTorneo]) VALUES (7, N'Ricardo Casas', N'3512015399', N'ricardo@gmail.com', N'ABC', 87)
INSERT [dbo].[Arbitros] ([idArbitro], [nombre], [celular], [email], [matricula], [idTorneo]) VALUES (8, N'Pablo Díaz', N'3512015399', N'pablo@gmail.com', N'ABC', 87)
INSERT [dbo].[Arbitros] ([idArbitro], [nombre], [celular], [email], [matricula], [idTorneo]) VALUES (9, N'Diego Ceballos', N'3512015399', N'diego@gmail.com', N'ABC', 87)
INSERT [dbo].[Arbitros] ([idArbitro], [nombre], [celular], [email], [matricula], [idTorneo]) VALUES (10, N'Gabriel Favalle', N'3512015399', N'gabriel@gmail.com', N'ABC', 87)
SET IDENTITY_INSERT [dbo].[Arbitros] OFF
SET IDENTITY_INSERT [dbo].[EstadoAmbitos] ON 

INSERT [dbo].[EstadoAmbitos] ([idAmbito], [nombre]) VALUES (2, N'Edicion')
INSERT [dbo].[EstadoAmbitos] ([idAmbito], [nombre]) VALUES (5, N'Fase')
INSERT [dbo].[EstadoAmbitos] ([idAmbito], [nombre]) VALUES (3, N'Fecha')
INSERT [dbo].[EstadoAmbitos] ([idAmbito], [nombre]) VALUES (4, N'Partido')
INSERT [dbo].[EstadoAmbitos] ([idAmbito], [nombre]) VALUES (1, N'Torneo')
SET IDENTITY_INSERT [dbo].[EstadoAmbitos] OFF
