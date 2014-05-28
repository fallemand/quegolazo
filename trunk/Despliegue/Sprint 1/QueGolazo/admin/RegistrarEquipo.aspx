<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrarEquipo.aspx.cs" Inherits="QueGolazo_.admin.RegistrarEquipo" MaintainScrollPositionOnPostback="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>QueGolazo! | Registrar Equipo</title>
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
                            <a href="RegistrarCampeonato.aspx">Registrar Campeonato</a>
                        </div>
                        <div class="panel-footer">
                            <a href="RegistrarEquipo.aspx">Registrar Equipo</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-7">
                    <div class="panel panel-default">  
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-md-2 col-xs-3 col-sm-2">
                                    <img class="thumbnail" style="background-color: #d68a3a" src="https://lh4.googleusercontent.com/-3LETF6JDT3c/UvjthkAF9TI/AAAAAAAAAhs/h44rXFt0njM/w512-h512/multiple_acounts.png" />
                                </div>
                                <div class="col-md-10 col-xs-9">
                                    <h2>REGISTRAR EQUIPO</h2>
                                </div>
                            </div>
                        </div>
                        <div class="panel-body">
                                     <div class="input-group input-group-lg">
                                    <span class="input-group-addon"><i class="fa fa-list"></i></span>
                                    <asp:DropDownList ID="ddlCampeonatos" CssClass="form-control"  runat="server"></asp:DropDownList>
                                          </div>
                            <br />
                                <div class="input-group input-group-lg">
                                    <span class="input-group-addon"><i class="fa fa-font"></i></span>
                                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" placeholder="Nombre del Equipo" MaxLength="30"></asp:TextBox>
                                </div>
                             <asp:RequiredFieldValidator
                              ID="rfvNombre" runat="server" ErrorMessage="Debe ingresar el nombre del Equipo!" ControlToValidate="txtNombre" Display="None" SetFocusOnError="True" ></asp:RequiredFieldValidator>
                                <br />
                                <div class="input-group input-group-lg">
                                    <span class="input-group-addon"><i class="fa fa-picture-o"></i></span>
                                    <asp:TextBox ID="txtUrlLogo" runat="server" CssClass="form-control" placeholder="Url Imagen Logo" TextMode="Url" MaxLength="300"></asp:TextBox>
                                </div>
                            
                                <br />
                                <div class="input-group input-group-lg">
                                    <span class="input-group-addon"><i class="fa fa-resize-full"></i></span>
                                    <asp:DropDownList ID="ddlColorCamisetaPrimario" runat="server" CssClass="form-control">
                                        <asp:ListItem>Color Camiseta Primaria</asp:ListItem>                  
                                        <asp:ListItem>Azul</asp:ListItem>
                                        <asp:ListItem>Rojo</asp:ListItem>
                                        <asp:ListItem>Verde</asp:ListItem>
                                         <asp:ListItem>Amarillo</asp:ListItem>
                                         <asp:ListItem>Violeta</asp:ListItem>
                                         <asp:ListItem>Celeste</asp:ListItem>
                                         <asp:ListItem>Rosa</asp:ListItem>
                                        <asp:ListItem>Blanco</asp:ListItem>
                                        <asp:ListItem>Negro</asp:ListItem>
                                        <asp:ListItem>Gris</asp:ListItem>
                                         <asp:ListItem>S/Definir</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <br />
                                <div class="input-group input-group-lg">
                                    <span class="input-group-addon"><i class="fa fa-eraser"></i></span>
                                    <asp:DropDownList ID="ddlColorCamisetaSecundario" runat="server" CssClass="form-control">
                                       <asp:ListItem>Color Camiseta Secundario</asp:ListItem>
                                        <asp:ListItem>Azul</asp:ListItem>
                                        <asp:ListItem>Rojo</asp:ListItem>
                                        <asp:ListItem>Verde</asp:ListItem>
                                         <asp:ListItem>Amarillo</asp:ListItem>
                                         <asp:ListItem>Violeta</asp:ListItem>
                                         <asp:ListItem>Celeste</asp:ListItem>
                                         <asp:ListItem>Rosa</asp:ListItem>
                                        <asp:ListItem>Blanco</asp:ListItem>
                                        <asp:ListItem>Negro</asp:ListItem>
                                        <asp:ListItem>Gris</asp:ListItem>
                                        <asp:ListItem>S/Definir</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <br />
                                <div class="input-group input-group-lg">
                                    <span class="input-group-addon"><i class="fa fa-list"></i></span>
                                    <asp:TextBox ID="txtDirectorTecnico" CssClass="form-control" runat="server" placeholder="Director Técnico" MaxLength="50"></asp:TextBox>
                                </div>
                                
                        </div>

                         <div class="panel-body">

                             <h3>Registrar Delegado</h3>
                             <br />
                              <div class="input-group input-group-lg">
                                    <span class="input-group-addon"><i class="fa fa-font"></i></span>
                                    <asp:TextBox ID="txtNombreDelegado" runat="server" CssClass="form-control" placeholder="Nombre y Apellido" MaxLength="60"></asp:TextBox>
                                </div>
                             <asp:RequiredFieldValidator
                              ID="rfv_txtDelegado" runat="server" ErrorMessage="Debe ingresar el nombre del delegado!" ControlToValidate="txtNombreDelegado" Display="None" SetFocusOnError="True" ></asp:RequiredFieldValidator>
                             <asp:RegularExpressionValidator ID="rev_nombreDelegado" runat="server" ControlToValidate="txtNombreDelegado" ValidationExpression="^[a-zA-Z_áéíóúñ\s]*$" Display="None" ErrorMessage="El nombre del delegado no puede  contener números"></asp:RegularExpressionValidator>  
                             <br />
                                <div class="input-group input-group-lg">
                                    <span class="input-group-addon"><i class=" fa fa-home"></i></span>
                                    <asp:TextBox ID="txtDomicilio" runat="server" CssClass="form-control" placeholder="Domicilio" MaxLength="120"></asp:TextBox>
                                </div>
                             <br />
                              <div class="input-group input-group-lg">
                                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Email" TextMode="Email" MaxLength="90"></asp:TextBox>
                                </div>
                             <br />
                             <div class="input-group input-group-lg">
                                    <span class="input-group-addon"><i class="fa fa-mobile"></i></span>
                                    <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" placeholder="Teléfono de contacto" TextMode="Phone" MaxLength="15"></asp:TextBox>
                                 <asp:RequiredFieldValidator
                              ID="rfv_Telefono" runat="server" ErrorMessage="Debe ingresar un teléfono de contacto!" ControlToValidate="txtTelefono" Display="None" SetFocusOnError="True" ></asp:RequiredFieldValidator>
                                 <asp:RegularExpressionValidator ID="rev_telefono" runat="server" ErrorMessage="El formato del número de teléfono es inválido" ValidationExpression="^[0-9]{7,13}$" Display="None" ControlToValidate="txtTelefono"></asp:RegularExpressionValidator>
                                  </div>
                             <br />


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
                                    <small><asp:ValidationSummary ID="vsSumario" runat="server" CssClass="well-sm alert-danger"  /></small>
                                </div>
                                <div class="col-md-3">
                                    <asp:Button ID="btnRegistrar" CssClass="btn btn-primary btn-lg" runat="server" Text="Registrar"  OnClick="btnRegistrar_Click" OnClientClick="ocultarPaneles()"/>
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
