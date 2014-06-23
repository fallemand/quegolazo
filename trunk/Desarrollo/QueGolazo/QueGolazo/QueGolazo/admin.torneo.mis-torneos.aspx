﻿<%@ Page Title="" Language="C#" MasterPageFile="~/admin.torneo.master" AutoEventWireup="true" CodeBehind="admin.torneo.mis-torneos.aspx.cs" Inherits="QueGolazo.admin_torneo_mis_torneos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <!-- Contenido -->
    <div class="wrapper">
      <div class="container">
        <div class="row">
          <div class="container">
            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#registrarTorneo">Crear un Nuevo Torneo</button>
            <div class="modal fade" id="registrarTorneo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">Registrar Nuevo Torneo</h4>
                  </div>
                  <div class="modal-body">
                    <form id="registrar">
                      <p>Por favor ingrese los datos del campeonato</p>
                      <div class="margin-top"></div>
                      <div class="form-group">
                        <div class="input-group">
                          <span class="input-group-addon"><i class="flaticon-trophy4"></i></span>
                          <input type="text" class="form-control" name="nombre" placeholder="Nombre del Torneo">
                        </div>
                      </div>
                      <div class="form-group">
                        <div class="input-group">
                          <span class="input-group-addon"><i class="glyphicon glyphicon-cloud"></i></span>
                          <input type="text" class="form-control" name="nick" placeholder="Nick del Torneo">
                        </div>
                        <span class="help-block">Nombre de la url del torneo. No podrá cambiarlo. www.quegolazo.com/<b>nick-del-torneo</b></span>
                      </div>
                      <div class="form-group">
                        <div class="input-group">
                          <span class="input-group-addon"><i class="glyphicon glyphicon-align-justify"></i></span>
                          <textarea type="text" class="form-control" name="descripcion" rows="3" onfocus="javascript:if(this.value=='Ingresa una pequeña descripción de tu Torneo') {this.value='';}" onblur="javascript:if(this.value=='') {this.value='Ingresa una pequeña descripción de tu Torneo'}">Ingresa una pequeña descripción de tu Torneo</textarea>
                        </div>
                      </div>
                      <div class="form-group">
                        <div class="input-group">
                          <input type="file" id="exampleInputFile">
                          <p class="help-block">Seleccionar logo del Torneo.</p>
                        </div>
                      </div>
                    </form>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    <button type="button" class="btn btn-success">Registrar</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="row margin-top">
          <div class="container">
              <div class="col-md-3">
                <div class="panel panel-default">
                  <div class="panel-heading">
                    Torneo Cuna Potero
                  </div>
                  <div class="panel-body">
                    <div class="thumbnail">
                      <img src="http://www.micampeonato.com/images/campeonatos/8341614052275_244_logo_torneol.jpg" alt="logo" />
                    </div>
                  </div>
                  <ul class="list-group text-center">
                      <li class="list-group-item"><a href="" >www.quegolazo.com/<strong>cuna-potreto</strong></a></li>
                      <li class="list-group-item"><strong>Ediciones:</strong> 3</li>
                      <li class="list-group-item"><strong>Equipos:</strong> 30</li>
                      <li class="list-group-item"><strong>Fechas:</strong> 12</li>
                      <li class="list-group-item"><button type="button" class="btn btn-default btn-sm">Panel de Administración</button></li>
                  </ul>
                </div>
              </div>
              <div class="col-md-3">
                <div class="panel panel-default">
                  <div class="panel-heading">
                    Torneo Cuna Potero
                  </div>
                  <div class="panel-body">
                    <div class="thumbnail">
                      <img src="http://www.futbolcol.com/wp-content/uploads/2010/11/torneo_postobon13.jpg" alt="logo" />
                    </div>
                  </div>
                  <ul class="list-group text-center">
                    <li class="list-group-item"><a href="" >www.quegolazo.com/<strong>cuna-potreto</strong></a></li>
                    <li class="list-group-item"><strong>Ediciones:</strong> 3</li>
                    <li class="list-group-item"><strong>Equipos:</strong> 30</li>
                    <li class="list-group-item"><strong>Fechas:</strong> 12</li>
                    <li class="list-group-item"><button type="button" class="btn btn-default btn-sm">Panel de Administración</button></li>
                  </ul>
                </div>
              </div>
              <div class="col-md-3">
                <div class="panel panel-default">
                  <div class="panel-heading">
                    Torneo Cuna Potero
                  </div>
                  <div class="panel-body">
                    <div class="thumbnail">
                      <img src="http://www.diarioelinformante.com.ar/imagenes/noticias/789_Logo_Torneo_Argentino_A.jpg" alt="logo" />
                    </div>
                  </div>
                <ul class="list-group text-center">
                    <li class="list-group-item"><a href="" >www.quegolazo.com/<strong>cuna-potreto</strong></a></li>
                    <li class="list-group-item"><strong>Ediciones:</strong> 3</li>
                    <li class="list-group-item"><strong>Equipos:</strong> 30</li>
                    <li class="list-group-item"><strong>Fechas:</strong> 12</li>
                    <li class="list-group-item"><button type="button" class="btn btn-default btn-sm">Panel de Administración</button></li>
                  </ul>
                </div>
              </div>
              <div class="col-md-3">
                <div class="panel panel-default">
                  <div class="panel-heading">
                    Torneo Cuna Potero
                  </div>
                  <div class="panel-body">
                    <div class="thumbnail">
                      <img src="http://2.bp.blogspot.com/-mV0jk-jFVMc/TaQjRwwkstI/AAAAAAAAJ9Q/suWR5E_At4E/s1600/Logo-CArgentino-2011.jpg" alt="logo" />
                    </div>
                  </div>
                  <ul class="list-group text-center">
                    <li class="list-group-item"><a href="" >www.quegolazo.com/<strong>cuna-potreto</strong></a></li>
                    <li class="list-group-item"><strong>Ediciones:</strong> 3</li>
                    <li class="list-group-item"><strong>Equipos:</strong> 30</li>
                    <li class="list-group-item"><strong>Fechas:</strong> 12</li>
                    <li class="list-group-item"><button type="button" class="btn btn-default btn-sm">Panel de Administración</button></li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
      <div class="push"></div>
    </div>
    <!-- Contenido -->
</asp:Content>