function ocultarPaneles() {
    if (Page_ClientValidate()) {

        document.getElementById("panelFracaso").style.display = 'none';
    } else {

        document.getElementById("panelExito").style.display = 'none';
    }
}
