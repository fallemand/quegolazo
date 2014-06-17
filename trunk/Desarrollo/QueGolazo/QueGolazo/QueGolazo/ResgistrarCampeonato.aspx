<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResgistrarCampeonato.aspx.cs" Inherits="QueGolazo.ResgistrarCampeonato" MaintainScrollPositionOnPostback="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label Text="Nombre: " runat="server" />
        <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
        <br/>
        <asp:Label ID="lblUrl" Text="URL personalizada: " AssociatedControlId="fileUploader" runat="server" />
        <asp:TextBox ID="txtNick" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="lblLogo" AssociatedControlId="fileUploader" runat="server" Text="Logo del campeonato:" />
        <asp:FileUpload id="fileUploader" runat="server" />
        <br/>
        
        <br/>
        <asp:Button Text="Crear Campeonato" ID="btnCrearCampeonato" runat="server" OnClick="btnCrearCampeonato_Click" />
       
    </div>
    </form>
</body>
</html>
