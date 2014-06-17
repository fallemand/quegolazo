<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="admin.registrar.aspx.cs" Inherits="QueGolazo.admin_registrar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Contenido -->
    <div class="wrapper bg-granulado">
      <div class="container">
        <form id="registrar" class="form-singin">
          <h2>Registro de Usuarios</h2>
          <p>Por favor ingrese sus datos</p>
          <div class="margin-top"></div>
          <div class="form-group">
            <div class="input-group">
              <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
              <input type="text" class="form-control" name="nombre" placeholder="Nombre">
            </div>
          </div>
          <div class="form-group">
            <div class="input-group">
              <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
              <input type="text" class="form-control" name="apellido" placeholder="Apellido">
            </div>
          </div>
          <div class="form-group">
            <div class="input-group">
              <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
              <input type="text" class="form-control" name="email" placeholder="Email">
            </div>
          </div>
          <div class="form-group">
            <div class="input-group">
              <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
              <input type="text" class="form-control" id="clave" name="clave" placeholder="Contraseña">
            </div>
          </div>
          <div class="form-group">
            <div class="input-group">
              <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
              <input type="text" class="form-control" name="repClave" placeholder="Repita Contraseña">
            </div>
          </div>
          <div class="row margin-top">
            <div class="col-md-6 col-md-offset-1">
              <div class="form-group">
              <label class="checkbox nomargin-top">
                <input type="checkbox" id="cbTerminos" name="cbTerminos" value="remember-me">
                    Acuerdo con los <a href="" >Términos y Condiciones</a>
              </label>
                </div>
            </div>
            <div class="col-md-5">
              <button class="btn btn-success pull-right">Registrar</button>
            </div>
          </div>
        </form>
        <div class="center-block margin-top sub-login">
          ¿Ya tenes una cuenta? - <a href="login.html" >Ingresar Aquí</a>
        </div>
      </div>
    </div>
    <!-- Contenido -->

    <!-- Validar Form -->
    <script>
        $('#registrar').validate({
            rules: {
                nombre: {
                    minlength: 3,
                    maxlength: 60,
                    required: true
                },
                apellido: {
                    minlength: 3,
                    maxlength: 60,
                    required: true
                },
                email: {
                    minlength: 5,
                    maxlength: 60,
                    required: true,
                    email: true
                },
                clave: {
                    minlength: 4,
                    maxlength: 20,
                    required: true
                },
                cbTerminos: {
                    required: true
                },
                repClave: {
                    minlength: 4,
                    maxlength: 20,
                    required: true,
                    equalTo: "#clave"
                }
            },
            highlight: function (element) {
                $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
            },
            unhighlight: function (element) {
                $(element).closest('.form-group').removeClass('has-error').addClass('has-success');
            },
            errorElement: 'span',
            errorClass: 'help-block',
            errorPlacement: function (error, element) {
                if (element.parent('.input-group').length) {
                    error.insertAfter(element.parent());
                } else {
                    error.insertAfter(element);
                }
            }
        });
    </script>
    <!-- Validar Form -->

</asp:Content>
