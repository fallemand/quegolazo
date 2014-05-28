<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrarCampeonato.aspx.cs" Inherits="QueGolazo_.admin.RegistrarCampeonato" MaintainScrollPositionOnPostback="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>QueGolazo! | Registrar Campeonato</title>
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
                            <h4>Menu</h4>
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
                                    <h2>CREAR CAMPEONATO</h2>
                                    </div>
                            </div>
                        </div>
                        <div class="panel-body">
                            <h5>Los campos indicados con (*) son obligatorios</h5>
                            <br />
                                <div class="input-group input-group-lg">
                                    <span class="input-group-addon"><i class="fa fa-font"></i></span>
                                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" placeholder="Nombre del Campeonato (*)" MaxLength="50"></asp:TextBox>
                                </div>
                             <asp:RequiredFieldValidator
                              ID="rfvNombre" runat="server" ErrorMessage="Debe ingresar el nombre!" ControlToValidate="txtNombre" Display="None" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                <br />
                            <h4>Tamaño de cancha (*)</h4>
                               <div class="input-group input-group-lg" title="Tamaño de la cancha">
                                    <span class="input-group-addon"><i class="fa fa-resize-full" ></i></span>
                                    <asp:DropDownList ID="ddlTamañoCancha" runat="server" CssClass="form-control">
                                    </asp:DropDownList>
                                </div>
                                
                              <br />  
                            <div class="input-group input-group-lg" title="Cantidad Maxima de jugadores">
                            <span class="input-group-addon"><i class="fa fa-list"></i></span>
                            <asp:TextBox ID="txtCantidadMaximaJugadores" runat="server" CssClass="form-control" placeholder="Cantidad máxima de jugadores. Ingrese 0 si es sin limite (*) " MaxLength="3"></asp:TextBox>
                            <asp:RangeValidator ID="rvCantidadMaximaJugadores" runat="server" ControlToValidate="txtCantidadMaximaJugadores" MaximumValue="100" MinimumValue="0" ErrorMessage="La cantidad maxima de jugadores debe ser un numero comprendido entre 0 y 100" Type="Integer" Display="None"  SetFocusOnError="true"></asp:RangeValidator>
                            <asp:RequiredFieldValidator ID="rfvCantidadMaximaJugadores" runat="server" ControlToValidate="txtCantidadMaximaJugadores" ErrorMessage="Debe ingresar la cantidad maxima de jugadores" Display="None" SetFocusOnError="true"></asp:RequiredFieldValidator>
                              </div>
                            <br />
                             
                                <div class="input-group input-group-lg">
                                    <span class="input-group-addon"><i class="fa fa-picture-o"></i></span>
                                    <asp:TextBox ID="txtUrlLogo" runat="server" CssClass="form-control" placeholder="Url Imagen Logo" TextMode="Url" MaxLength="500"></asp:TextBox>
                                </div>
                      
                                <br />
                                 <h4>Superficie de cancha (*)</h4>
                                <div class="input-group input-group-lg" title="Superficie de la cancha">
                                    <span class="input-group-addon"><i class="fa fa-eraser" ></i></span>
                                    <asp:DropDownList ID="ddlSuperficieDeCancha" runat="server" CssClass="form-control">
                                    </asp:DropDownList>
                                </div>
                                 <br />
                            <h4>Tipo de fixture (solo ida o ida y vuelta) (*)</h4>
                                <div class="input-group input-group-lg" title="Tipo de fixture">
                                    <span class="input-group-addon"><i class="fa fa-check-circle" ></i></span>
                                    
                                    <asp:CheckBox ID="cbIdaYVuelta" Text="Ida y Vuelta" CssClass="form-control" runat="server" />
                                </div>
                                <br />
                                <div class="input-group input-group-lg">
                                    <span class="input-group-addon"><i class="fa fa-list"></i></span>
                                    <asp:TextBox ID="txtDescripcion" CssClass="form-control" runat="server" placeholder="Descripción" MaxLength="300" Wrap="False" Rows="4"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1"  ValidationExpression="^([\S\s]{0,300})$" runat="server" ControlToValidate="txtDescripcion" ErrorMessage="Como máximo puede ingresar 300 caracteres en la descripción." Display="None" SetFocusOnError="true"></asp:RegularExpressionValidator>
                                </div>
                                
                        </div>
                        <div class="panel-footer">
                            <div class="row">
                                <div class="col-md-9">
                                     <asp:Panel ID="panelExito" runat="server" CssClass="well-sm alert-success" 
                                        Visible="False"><small>
                                        <asp:Literal ID="litExito" runat="server"></asp:Literal></small>
                                    </asp:Panel>
                                    <asp:Panel ID="panelFracaso" runat="server" CssClass="well-sm alert-danger" 
                                        Visible="False">
                                        <small><asp:Literal ID="litError" runat="server"></asp:Literal></small>
                                    </asp:Panel>
                                    <small><asp:ValidationSummary ID="vsSumario" runat="server" CssClass="well-sm alert-danger" /></small>
                                </div>
                                <div class="col-md-3">
                                    <asp:Button ID="btnRegistrar" CssClass="btn btn-primary btn-lg" runat="server" Text="Registrar" OnClientClick="ocultarPaneles();focus()" OnClick="btnRegistrar_Click" />
                                </div>
                            </div>
                            <br />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
