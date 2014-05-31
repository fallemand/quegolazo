﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Fixture.aspx.cs" Inherits="QueGolazo_.Fixture" %>


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
</style> 

    <script type="text/javascript">
        function scrollear() {
            var numFecha = $("#ddlFechas option:selected").val();
            alert("Han cambiado mi valor");
            $(document).scrollTo('#Fecha' + numFecha);
        };
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
                                    <h2>Fechas</h2>
                                </div>
                            </div>
                        </div>
                        <div class="panel-body">
                            <asp:Button ID="btnAceptar" CssClass="btn btn-primary btn-lg" runat="server" Text="Aceptar" OnClientClick="return confirm('¿Estas seguro que deseas guardar este fixture?');ocultarPaneles();focus();" OnClick="btnAceptar_Click" />
                            <asp:Button ID="btnVolverAGenerar" CssClass="btn btn-primary btn-lg" runat="server" Text="Volver a Generar" OnClientClick="return confirmar();ocultarPaneles();focus()" OnClick="btnVolverAGenerar_Click" />
                            <asp:Button ID="btnCancelar" CssClass="btn btn-primary btn-lg" runat="server" Text="Cancelar" OnClientClick="ocultarPaneles();focus()" OnClick="btnCancelar_Click" />
                             <br/>
                              <h3>Ir a la fecha: <asp:DropDownList ID="ddlFechas" runat="server" OnSelectedIndexChanged="ddlFechas_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList></h3>     
                             <div class="row">
                                
                                        <asp:Repeater ID="repiter_fechas" runat="server" OnItemDataBound="repiter_fechas_ItemDataBound">
                                            <ItemTemplate>
                                                <div class="col-md-12">
                                                    <div class="well well-sm">
                                                        <div class="row" id="Fecha<%# Eval("numeroDeFecha") %>">
                                                          <div class="col-md-3"> 
                                                              <strong>Fecha <%# Eval("numeroDeFecha") %> </strong><br />
                                                              </div>
                                                            <div class="col-md-6">
                                                                  
                                                               
                                                        <%--           
                                                           <div class="row">--%>
                                                                <table>
                                                                            
                                                                <asp:Repeater ID="repiter_partidos" runat="server">
                                                                 <ItemTemplate>
                                                                       <tr>
                                                                  
                                                                                <td><%# Eval("equipoLocal.nombre") %></td>
                                                                           <td>-----</td>
                                                                                <td><%# Eval("equipoVisitante.nombre") %></td>
                                                                            </tr>
                                                                      
        
                                                                     </ItemTemplate>
                                                                    </asp:Repeater>
                                                                      </table>
                                                        <%--   </div>--%>
                                                        </div>
                                                         </div>
                                                    </div>
                                                </div>
                                                <br />
                                            </ItemTemplate>
                                        </asp:Repeater>


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

        </div>
    </form>
</body>
</html>