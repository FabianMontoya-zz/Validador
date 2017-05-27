<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Index.aspx.vb" Inherits="Validador.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="JS/jquery-3.1.1.min.js" type="text/javascript"></script>

    <%-- DatePicker --%>
    <link rel="stylesheet" href="JS/Datepicker/jquery-ui.css" />
    <link rel="stylesheet" href="JS/Datepicker/Style.css" />
    <script src="JS/Datepicker/jquery-1.12.4.js"></script>
    <script src="JS/Datepicker/jquery-ui.js"></script>

    <link rel="icon" type="image/png" href="http://i.imgur.com/lTRpY5I.png" />
    <title id="title_text">Personal Information</title>

    <%-- Librerias del MDL, URL o descargadas --%>
    <%-- El Meta Viewport --%>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="mdl/material.min.css" />
    <script defer src="mdl/material.min.js"></script>
    <link rel="stylesheet" href="mdl/material-icons/Material-Icons.css" />
    <%--<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css" />
    <script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />--%>

    <%--Librerias para el Select getmdl-select--%>
    <link rel="stylesheet" href="mdl/select/selectfield.min.css" />
    <script defer src="mdl/select/selectfield.min.js"></script>
    <%--<link rel="stylesheet" href="https://rawgit.com/MEYVN-digital/mdl-selectfield/master/mdl-selectfield.min.css" />
    <script defer src="https://rawgit.com/MEYVN-digital/mdl-selectfield/master/mdl-selectfield.min.js"></script>--%>
    <link rel="stylesheet" href="CSS/Generales.css" />
    <script src="JS/JSFunciones.js" type="text/javascript"></script>

</head>

<body>
    <div class="mdl-cell mdl-cell--12-col">
        <%-- Card que contiene todo el formulario --%>
        <div id="Div_Card" class="demo-card-wide mdl-card mdl-shadow--2dp">
            <div class="mdl-card__title" id="Title_Card">
                <h2 class="mdl-card__title-text">Formulario Datos Personales</h2>
            </div>
            <div class="mdl-card__supporting-text" id="Text_Card">
                Por favor dilige los campos solicitados en este formulario.<br />
                Los campos marcados con asterisco (*) son obligatorios.
            </div>
            <div class="mdl-card__actions mdl-card--border" id="Body_Card">
                <div class="mdl-grid" id="T_TypeDocument" style="width: 100%;">
                    <div class="mdl-cell mdl-cell--4-col mdl-cell--6-col-tablet">
                        <br />
                        *Tipo de Documento
                    </div>
                    <div class="mdl-cell mdl-cell--8-col mdl-cell--10-col-tablet">
                        <div id="Select_TypeDocument_1" class="mdl-selectfield mdl-js-selectfield mdl-selectfield--floating-label" style="width: 60%">
                            <select id="Select_TypeDocument" name="TypeDocument" class="required mdl-selectfield__select" required="">
                                <option value=""></option>
                                <%-- Debe ir en blanco el value para que no ocurra error--%>
                                <option value="CC">Cédula de Ciudadania</option>
                                <option value="TI">Tarjeta de Identidad</option>
                                <option value="RC">Registro Civil</option>
                            </select>
                            <label for="Select_TypeDocument" class="mdl-selectfield__label">Tipo de Documento</label>
                            <span class="mdl-selectfield__error">Campo Obligatorio</span>
                            <div class="mdl-tooltip" data-mdl-for="Select_TypeDocument_1">Seleccione un elemento de la lista desplegable</div>
                        </div>
                    </div>
                </div>

                <div class="mdl-grid" id="T_Document" style="width: 100%;">
                    <div class="mdl-cell mdl-cell--4-col mdl-cell--6-col-tablet">
                        <br />
                        *Número de Documento
                    </div>
                    <div class="mdl-cell mdl-cell--8-col mdl-cell--10-col-tablet">
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" style="width: 60%">
                            <input class="mdl-textfield__input" name="Document" type="text" title="El campo solo admite números" pattern="[0-9]{7,15}" id="Document" value="" maxlength="15" style="width: 100%;" onkeypress="return onlyNumbers(event);" />
                            <label class="mdl-textfield__label" for="Document">Documento</label>
                            <span class="mdl-textfield__error">Número de documento invalido</span>
                            <div class="mdl-tooltip" data-mdl-for="Document">Digite su número de Documento</div>
                        </div>
                    </div>
                </div>

                <div class="mdl-grid" id="T_Nombre" style="width: 100%;">
                    <div class="mdl-cell mdl-cell--4-col mdl-cell--6-col-tablet">
                        <br />
                        *Nombres y Apellidos
                    </div>
                    <div class="mdl-cell mdl-cell--8-col mdl-cell--10-col-tablet">
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" style="width: 60%">
                            <input class="mdl-textfield__input" name="Document" type="text" title="El campo solo admite letras" pattern="[A-Za-z ]{5,40}" id="Name" value="" maxlength="39" style="width: 100%;" onkeypress="return soloLetras(event);" />
                            <label class="mdl-textfield__label" for="Document">Nombres y Apellidos</label>
                            <span class="mdl-textfield__error">Entrada no valida</span>
                            <div class="mdl-tooltip" data-mdl-for="Name">Digite sus nombres y apellidos</div>
                        </div>

                    </div>
                </div>

                <div class="mdl-grid" id="T_Fecha" style="width: 100%;">
                    <div class="mdl-cell mdl-cell--4-col mdl-cell--6-col-tablet">
                        <br />
                        *Fecha de Nacimiento
                    </div>
                    <div class="mdl-cell mdl-cell--8-col mdl-cell--10-col-tablet">
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" style="width: 40%">
                            <input class="mdl-textfield__input" name="Date_Born" type="text" title="Seleccione su fecha de nacimiento" id="Date_Born" value="" style="width: 100%;" readonly="" />
                            <span class="mdl-textfield__error">Entrada no valida</span>
                            <div class="mdl-tooltip" data-mdl-for="Date_Born">Seleccione su fecha de nacimiento</div>
                        </div>

                    </div>
                </div>
            </div>

            <div class="mdl-card__actions mdl-card--border">
                <div class="mdl-card__supporting-text">
                    Seleccione el departamento y luego la ciudad o municipio en el cual usted fue registrado, es decir, su lugar de nacimiento.
                </div>
            </div>

            <div class="mdl-card__actions mdl-card--border">
                <div class="mdl-grid" id="T_Departament" style="width: 100%;">
                    <div class="mdl-cell mdl-cell--4-col mdl-cell--6-col-tablet">
                        <br />
                        *Departamento
                    </div>
                    <div class="mdl-cell mdl-cell--8-col mdl-cell--10-col-tablet">
                        <div id="Div_Select_Departament" class="mdl-selectfield mdl-js-selectfield mdl-selectfield--floating-label" style="width: 60%">
                            <select id="Select_Departament" name="Departament" class="required mdl-selectfield__select" required="">
                                <option value=""></option>
                                <%-- Debe ir en blanco el value para que no ocurra error--%>
                            </select>
                            <label for="Select_Departament" class="mdl-selectfield__label">Seleccione Departamento</label>
                            <span class="mdl-selectfield__error">Campo Obligatorio</span>
                            <div class="mdl-tooltip" data-mdl-for="Div_Select_Departament">Seleccione un elemento de la lista desplegable</div>
                        </div>
                    </div>
                </div>

                <div class="mdl-grid" id="T_City" style="width: 100%;">
                    <div class="mdl-cell mdl-cell--4-col mdl-cell--6-col-tablet">
                        <br />
                        *Ciudad/Municipio
                    </div>
                    <div class="mdl-cell mdl-cell--8-col mdl-cell--10-col-tablet">
                        <div id="Div_Select_City" class="mdl-selectfield mdl-js-selectfield mdl-selectfield--floating-label" style="width: 60%">
                            <select id="Select_City" name="City" class="required mdl-selectfield__select" required="">
                                <option value=""></option>
                                <%-- Debe ir en blanco el value para que no ocurra error--%>
                            </select>
                            <label for="Select_City" class="mdl-selectfield__label">Seleccione Ciudad</label>
                            <span class="mdl-selectfield__error">Campo Obligatorio</span>
                            <div class="mdl-tooltip" data-mdl-for="Div_Select_City">Seleccione un elemento de la lista desplegable</div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="mdl-card__actions mdl-card--border">
                <div class="mdl-card__supporting-text">
                    Digite el sueldo que se ha de pagar y el número de días a pagar, recuerde que la liquidación es mensual (días)
                </div>
            </div>

            <div class="mdl-card__actions mdl-card--border">
                <div class="mdl-grid" id="T_Sueldo" style="width: 100%;">
                    <div class="mdl-cell mdl-cell--4-col mdl-cell--6-col-tablet">
                        <br />
                        *Salario ($)
                    </div>
                    <div class="mdl-cell mdl-cell--8-col mdl-cell--10-col-tablet">
                        $<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" style="width: 60%">
                            <input class="mdl-textfield__input" name="TXT_Saldo" type="text" title="El campo solo admite números" pattern="[0-9]{5,15}" id="TXT_Saldo" value="" maxlength="9" style="width: 100%;" onkeypress="return onlyNumbers(event);" />
                            <label class="mdl-textfield__label" for="TXT_Saldo">Salario</label>
                            <span class="mdl-textfield__error">El dato ingresado no es valido</span>
                            <div class="mdl-tooltip" data-mdl-for="TXT_Saldo">Digite el saldo a pagar</div>
                        </div>
                    </div>
                </div>

                <div class="mdl-grid" id="T_Dias" style="width: 100%;">
                    <div class="mdl-cell mdl-cell--4-col mdl-cell--6-col-tablet">
                        <br />
                        *Días a pagar
                    </div>
                    <div class="mdl-cell mdl-cell--8-col mdl-cell--10-col-tablet">
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" style="width: 60%">
                            <input class="mdl-textfield__input" name="TXT_Dia" type="text" title="El campo solo admite números" pattern="[0-9]{1,2}" id="TXT_Dia" value="" maxlength="2" style="width: 100%;" onkeypress="return onlyNumbers(event);" />
                            <label class="mdl-textfield__label" for="TXT_Dia">Días</label>
                            <span class="mdl-textfield__error">El dato ingresado no es valido</span>
                            <div class="mdl-tooltip" data-mdl-for="TXT_Dia">Digite los días a pagar</div>
                        </div>
                    </div>
                </div>
                <button class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored" id="BTN_ConsultSueldo" onclick="ConsultSueldo();">
                    <i class="material-icons">&#xE8B6;</i>
                </button>
                 <div class="mdl-tooltip" data-mdl-for="BTN_ConsultSueldo">Consultar Total a Pagar</div>
                <div class="mdl-grid" id="T_Total" style="width: 100%;">
                    <div class="mdl-cell mdl-cell--4-col mdl-cell--6-col-tablet">
                        <br />
                        Total a Pagar
                    </div>
                    <div class="mdl-cell mdl-cell--8-col mdl-cell--10-col-tablet" id="Div_Pago">
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" style="width: 60%" id="D_textTotal">
                            $0000,00
                        </div>
                    </div>
                </div>
                <div class="mdl-grid" id="T_Total_Prima" style="width: 100%;">
                    <div class="mdl-cell mdl-cell--4-col mdl-cell--6-col-tablet">
                        <br />
                        Paga Prima
                    </div>
                    <div class="mdl-cell mdl-cell--8-col mdl-cell--10-col-tablet" id="Div_Pago_Prima">
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" style="width: 60%" id="D_Prima">
                            --
                        </div>
                    </div>
                </div>
                <div class="mdl-grid" id="T_Total_Subsidio" style="width: 100%;">
                    <div class="mdl-cell mdl-cell--4-col mdl-cell--6-col-tablet">
                        <br />
                        Paga Subsidio
                    </div>
                    <div class="mdl-cell mdl-cell--8-col mdl-cell--10-col-tablet" id="Div_Pago_Subsidio">
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" style="width: 60%" id="D_Subsidio">
                            --
                        </div>
                    </div>
                </div>
            </div>

            <div class="mdl-card__actions mdl-card--border" id="End_Card">
                <button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--colored" id="BTN_Enviar" onclick="Validar();">
                    <i class="material-icons">&#xE163;</i> Enviar
                </button>
                <div class="mdl-tooltip" data-mdl-for="BTN_Enviar">Enviar datos diligenciados</div>
            </div>
        </div>
    </div>


    <dialog class="mdl-dialog" style="width: 500px; height: 400px; overflow: auto;">
        <h4 class="mdl-dialog__title" id="Title_Dialog">Información Diligenciada</h4>
        <div class="mdl-dialog__content">
            <p id="Text_Dialog">
                Información Diligenciada.
            </p>
        </div>
        <div class="mdl-dialog__actions">
            <button type="button" class="mdl-button" id="BTN_Aceptar" onclick="Cerrar();">Aceptar</button>
        </div>
    </dialog>
    <%-- <script>
            //var dialog = document.querySelector('dialog');
            //var showDialogButton = document.querySelector('#show-dialog');
            //if (!dialog.showModal) {
            //    dialogPolyfill.registerDialog(dialog);
            //}
            //showDialogButton.addEventListener('click', function () {
            //    dialog.showModal();
            //});
            //dialog.querySelector('.close').addEventListener('click', function () {
            //    dialog.close();
            //});
        </script>--%>

    <%-- Pie de Página o Footer --%>
    <footer class="mdl-mega-footer">
        <div class="mdl-mega-footer__top-section">
            <div class="mdl-mega-footer__left-section">
                Fabian Dario Montoya
            </div>
            <div class="mdl-mega-footer__right-section">
                <a href="#top">
                    <button id="Btn_UP" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect">
                        <i class="material-icons">keyboard_arrow_up</i>
                    </button>
                </a>
                <div class="mdl-tooltip" data-mdl-for="Btn_UP">
                    Ir Arriba
                </div>
            </div>
        </div>
        <div class="mdl-mega-footer__middle-section">
            © 2017 Bogotá D.C. - COL
        </div>
    </footer>

</body>
</html>
