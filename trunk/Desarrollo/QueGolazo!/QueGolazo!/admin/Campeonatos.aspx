<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Campeonatos.aspx.cs" Inherits="QueGolazo_.Campeonatos" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>QueGolazo! | Ver Campeonatos</title>
    <meta name="viewport" content="width=device-width">
    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootswatch/3.0.0/slate/bootstrap.min.css">
    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.0/css/font-awesome.css">
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
    <script src="../js/desarrollo/panels.js"></script>
 </head>

 <body style="background-color: #282828; margin: 25px">
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-md-2">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4>Menú</h4>
                            <h4></h4>
                        </div>
                        <div class="panel-body">
                            <a href="RegistrarCampeonato.aspx">Crear Campeonato</a>
                        </div>
                        <div class="panel-footer">
                            <a href="RegistrarEquipo.aspx">Registrar Equipo</a>
                        </div>
                        <div class="panel-footer">
                            <a href="Campeonatos.aspx">Ver mis Campeonatos</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-7">
                    <div class="panel panel-default">  
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-md-2 col-xs-3 col-sm-2">
                                    <img class="thumbnail" style="background-color: #255e13" src="images/secciones/campeonato.png" />
                                </div>
                                <div class="col-md-10 col-xs-9">
                                    <h2>CAMPEONATOS</h2>
                                </div>
                            </div>
                        </div>
                        <div class="panel-body">

                             <div class="row">
                                        <asp:Repeater ID="repiter_campeonatos" runat="server"
                                            OnItemCommand="repiter_campeonatos_ItemCommand" OnItemDataBound="repiter_campeonatos_ItemDataBound">
                                            <ItemTemplate>
                                                <div class="col-md-12">
                                                    <div class="well well-sm">
                                                        <div class="row">
                                                            <div class="col-md-3">                       
                                                                <img class="thumbnail" style="height: 85px; width: 100px;"  alt='<%# Eval("nombre") %>' src="<%# Eval("urlLogo")%>" /></td>
                                                            </div>
                                                            <div class="col-md-6">
                                                                  <strong><%# Eval("nombre") %> </strong><br />
                                                                  <small><%# Eval("descripcion")%></small><br />
                                                                <small>Tamaño de Cancha: <%# Eval("tamañoCancha.nombre")%></small><br />
                                                                <small>Tipo de Superficie: <%# Eval("superficieDeCancha.nombre")%></small><br />
                                                                <small>Tipo de Fixture: <%# Eval("tipoFixture.nombre")%></small><br />
                                                                 <small>Sistema de Puntuación: <%# Eval("sistemaPuntuacion")%></small><br />
                                                              <%--  <asp:LinkButton ID="lnkFixture" runat="server" CommandName="VerFixture" CommandArgument='<%# Eval("idCampeonato") %>'>Ver Fixture</asp:LinkButton>--%>
                                                                    </div>
                                                           <div class="col-md-3">
                                                                        <asp:Button runat="server" ID="btnGenerarFixture" Text="Generar Fixture" CommandName="GenerarFixture" CommandArgument='<%# Eval("idCampeonato") %>' CssClass="btn btn-primary btn-sm" CausesValidation="False" Width="130px" />
                                                                <asp:Button runat="server" ID="btnVerFixture" Text="Ver Fixture" CommandName="VerFixture" CommandArgument='<%# Eval("idCampeonato") %>' CssClass="btn btn-primary btn-sm" CausesValidation="False" Width="130px"/>
                                                                <asp:Button runat="server" ID="btnCargarResultados" Text="Cargar Resultados" CommandName="CargarResultados" CommandArgument='<%# Eval("idCampeonato") %>' Width="130px" CssClass="btn btn-primary btn-sm" CausesValidation="False" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <br />
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                           </div>
                </div>

        </div>
    </form>
</body>
</html>