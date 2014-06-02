<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrarResultados.aspx.cs" Inherits="QueGolazo_.admin.RegistrarResultados" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>QueGolazo! | Fixture</title>
    <meta name="viewport" content="width=device-width">
    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootswatch/3.0.0/slate/bootstrap.min.css">
    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.0/css/font-awesome.css">
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
    <script src="../js/desarrollo/panels.js"></script>
  
<style>

    
    #IrArriba {
position: fixed;
bottom: 30px; /* Distancia desde abajo */
right: 30px; /* Distancia desde la derecha */
}

#IrArriba span {
width: 60px; /* Ancho del botón */
height: 60px; /* Alto del botón */
display: block;
background: url(http://lh5.googleusercontent.com/-luDGEoQ_WZE/T1Ak-gta5MI/AAAAAAAACPI/ojfEGiaNmGw/s60/flecha-arriba.png) no-repeat center center;
}
    .auto-style2 {
        width: 118px;
    }
</style> 

    <script type="text/javascript">
        function scrollear() {
            var numFecha = $("#ddlFechas option:selected").val();
            alert("Han cambiado mi valor");
            $(document).scrollTo('#Fecha' + numFecha);
        };//FLOR: Necesito una birra
    </script>
    <script type='text/javascript'>

        jQuery.noConflict();
        jQuery(document).ready(function () {
            jQuery("#IrArriba").hide();
            jQuery(function () {
                jQuery(window).scroll(function () {
                    if (jQuery(this).scrollTop() > 200) {
                        jQuery('#IrArriba').fadeIn();
                    } else {
                        jQuery('#IrArriba').fadeOut();
                    }
                });
                jQuery('#IrArriba a').click(function () {
                    jQuery('body,html').animate({
                        scrollTop: 0
                    }, 800);
                    return false;
                });
            });

        });

</script>
</head>
    

 <body style="background-color: #282828; margin: 25px">
     <div id='IrArriba'>
<a href='#Arriba'><span/></a>
</div>
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
                                    <h2>Fechas - Cargar Resultados</h2>
                                </div>
                            </div>
                        </div>
                        <div class="panel-body">
                            <h3> Fecha: <asp:DropDownList ID="ddlFechas" runat="server" OnSelectedIndexChanged="ddlFechas_SelectedIndexChanged" AutoPostBack="True" Width="50px"></asp:DropDownList></h3>
                                
                                

                              <div class="row">

                                                <div class="col-md-12">
                                                    <div class="well well-sm">
                                                         <div class="row" >
                                                             <div class="col-md-3">
                                                                 </div>
                                                            <div class="col-md-9">
                                           
                                                                <table>                                        
                                                                <asp:Repeater ID="repiter_partidos" runat="server"  >
                                                                 <ItemTemplate >
                                                                    <tr>                                                                       
                                                                           <asp:Label ID="idPartido" runat="server" Text=<%# Eval("idPartido") %> Visible="false"></asp:Label>
                                                                           <td><%# Eval("equipoLocal.nombre") %></td>
                                                                           <td><asp:TextBox ID="txtGolesLocal" Text=<%# Eval("golesLocal") %> runat="server" Width="30px" ></asp:TextBox> </td> <td>&nbsp&nbsp</td>
                                                                           <asp:CompareValidator ID="validadorLocal" runat="server" ValueToCompare ="0" Operator="GreaterThanEqual" ErrorMessage="Ha ingresado datos incorrectos para un resultado." ControlToCompare="txtGolesLocal" ControlToValidate="txtGolesLocal" SetFocusOnError="True" Visible="False" Type="Integer"> </asp:CompareValidator>
                                                                           <td>--</td>
                                                                           <td><asp:TextBox ID="txtGolesVisitante" runat="server"  Text=<%# Eval("golesVisitante") %>  Width="30px"></asp:TextBox> </td> <td>&nbsp&nbsp</td>
                                                                           <asp:CompareValidator ID="validadorVisita" runat="server" ErrorMessage="Ha ingresado datos incorrectos para un resultado." ControlToCompare="txtGolesVisitante" ControlToValidate="txtGolesLocal" SetFocusOnError="True" ValueToCompare ="0" Operator="GreaterThanEqual" Visible="False" Type="Integer"> </asp:CompareValidator>
                                                                           <td><%# Eval("equipoVisitante.nombre")%></td>
                                                                           </tr>
                                                                     <asp:ValidationSummary ID="sumario" runat="server" />
                                                                     </ItemTemplate>
                                                                    </asp:Repeater>
                                                                </table>
                                                        </div>
                                                         </div>
                                                    </div></div>

                      <div class="col-md-3">
                                <asp:Button ID="btnGuardar" CssClass="btn btn-primary btn-lg" CommandArgument="" runat="server" Text="Guardar" OnClientClick="return confirm('¿Estas seguro que deseas guardar los resultados?');ocultarPaneles();focus();" OnClick="btnGuardar_Click" />
                                <asp:Button ID="btnCancelar" CssClass="btn btn-primary btn-lg" CommandArgument="" runat="server" Text="Cancelar" OnClientClick="return confirm('¿Estas seguro que deseas cancelar la operacion?');ocultarPaneles();focus();" OnClick="btnCancelar_Click"  style="margin-top: -73px; margin-left: 112px;"  />
                                        
                           </div>
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
                                
                            </div>
                            <br />
                        </div>
                </div>

        </div></div>
    </form>
</body>
</html>