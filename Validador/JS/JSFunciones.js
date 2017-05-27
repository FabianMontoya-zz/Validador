var dialog;
var showDialogButton;
var closeDialogButton;

var MatrizDepartamentos = [];
var MatrizCiudades = [];

var MatrizResult = [];

var Sueldo = 0;
var DiasPagos = 0;
var Prima = false;
var Subsidio = false;
var TotalPagar = 0;

//USAR VALIDACIÓN DE CAJA BLANCA Y CAJA NEGRA

//CREAR UN OBJETO QUE RECIBA TRES PARAMETROS EJ: UN CLASS QUE RECIBA CEDULA-SUELDO-DIAS Y DE UNA TABLA DE SALDOS VERIFICAR SI ESE SUELDO  GANA PRIMA (10%) Y/O SUBSIDIO ($83.140)
//VALIDAR QUE EL SUELDO EXISTA, COMO SE LIQUIDA MENSUAL NO DEBE SER SUPERIOR A 30 DÍAS Y HACER LOS CÁLCULOS, DEVOLVER EL VALOR TOTAL DEL SUELDO
//SEGÚN LA CANTIDAD DE DÍAS QUE TRABAJÓ

//--------------

//WEB SERVICE

//Diseño-Desarrollo
//Publicación
//Consumo

//Tarea 24/04/2017
// Capitulos 19, 20 21
$(document).ready(function () {
    TransaccionDepartamentos('Departamentos');

    $("#Date_Born").datepicker({ dateFormat: 'dd/mm/yy', changeMonth: true, changeYear: true, yearRange: '1890:+0', maxDate: '-1' });
    Change_Select_City();
    Change_Select_Departament();
    dialog = document.querySelector('dialog');
    showDialogButton = document.querySelector('#BTN_Enviar');
    closeDialogButton = document.querySelector('#BTN_Aceptar');

    showDialogButton.addEventListener('click', function () {
        dialog.showModal();
    });

    closeDialogButton.addEventListener('click', function () {
        dialog.close();
    });

});

function soloLetras(e) {
    key = e.keyCode || e.which;
    tecla = String.fromCharCode(key).toLowerCase();
    letras = " abcdefghijklmnopqrstuvwxyz";
    especiales = "8-37-39-46";

    tecla_especial = false
    for (var i in especiales) {
        if (key == especiales[i]) {
            tecla_especial = true;
            break;
        }
    }

    if (letras.indexOf(tecla) == -1 && !tecla_especial) {
        return false;
    }
}

function onlyNumbers(e) {
    tecla = (document.all) ? e.keyCode : e.which;

    //Tecla de retroceso para borrar, siempre la permite
    if (tecla == 8) {
        return true;
    }

    // Patrón de entrada, en este caso solo acepta numeros
    patron = /[0-9]/;
    tecla_final = String.fromCharCode(tecla);
    return patron.test(tecla_final);
}

function Validar() {
    var typedocument = $("#Select_TypeDocument").val();
    var document = $("#Document").val();
    var Name = $("#Name").val();
    var Date = $("#Date_Born").val();
    var Departament = $("#Select_Departament").val();
    var City = $("#Select_City").val();

    if (typedocument.length > 0 && document.length > 6 && Name.length > 4 && Date.length > 0 && Departament.length > 0 && City.length > 0) {
        var Type = "";
        if (typedocument == "CC") {
            Type = "Cédula de Ciudadania";
        } else if (typedocument == "TI") {
            Type = "Tarjeta de Identidad";
        } else if (typedocument == "RC") {
            Type = "Registro Civil";
        }

        for (var i in MatrizDepartamentos) {
            if (MatrizDepartamentos[i].ID_Departamento == Departament) {
                Departament = MatrizDepartamentos[i].ID_Departamento + " - " + MatrizDepartamentos[i].Departamento;
                break;
            }
        }

        for (var j in MatrizCiudades) {
            if (MatrizCiudades[j].ID_Ciudad == City) {
                City = MatrizCiudades[j].ID_Ciudad + " - " + MatrizCiudades[j].Ciudad;
                break;
            }
        }

        var cuerpo = "<b>Datos Identificación</b><br>• Tipo Documento: " + typedocument + " - " + Type + "<br>• Número Documento: " + document + "<br>";
        cuerpo = cuerpo + "• Nombre: " + Name.toUpperCase() + " <br><br><b>Datos Nacimiento</b><br>• Fecha: " + Date + "<br>• Departamento: " + Departament + "<br>• Ciudad/Municipio: " + City;
        $("#Title_Dialog").html("Información Diligenciada");
        $("#Text_Dialog").html(cuerpo);
    } else {
        var Errores = "";
        if (typedocument.length <= 0) {
            Errores = Errores + "► Tipo de Documento<br>";
        }
        if (document.length <= 6) {
            Errores = Errores + "► Documento de Identificación<br>";
        }
        if (Name.length <= 6) {
            Errores = Errores + "► Nombres y Apellidos<br>";
        }
        if (Date.length <= 0) {
            Errores = Errores + "► Fecha de Nacimiento<br>";
        }
        if (Departament.length <= 0) {
            Errores = Errores + "► Departamento Nacimiento<br>";
        }
        if (City.length <= 0) {
            Errores = Errores + "► Ciudad/Municipio Nacimiento<br>";
        }
        var cuerpo = "No se ha completado la información solicitada o se ha llenado incorrectamente.<br><br>Favor verificar los siguientes campos:<br><br>" + Errores;
        $("#Title_Dialog").html("Campos Incompletos");
        $("#Text_Dialog").html(cuerpo);
    }


    if (!dialog.showModal) {
        dialogPolyfill.registerDialog(dialog);
        dialog.showModal();
    }
}

function Cerrar() {
    dialog.close();
}

function CargarDepartamentos() {
    $('#Select_Departament option').remove();
    $('#Select_Departament').append('<option value="" selected="selected"></option>');
    for (var i in MatrizDepartamentos) {
        $('#Select_Departament').append('<option value="' + MatrizDepartamentos[i].ID_Departamento + '">' + MatrizDepartamentos[i].ID_Departamento + ' - ' + MatrizDepartamentos[i].Departamento + '</option>');
    }
}

function CargarCiudades() {
    $('#Select_City option').remove();
    $('#Select_City').append('<option value="" selected="selected"></option>');
    for (var i in MatrizCiudades) {
        $('#Select_City').append('<option value="' + MatrizCiudades[i].ID_Ciudad + '">' + MatrizCiudades[i].ID_Ciudad + ' - ' + MatrizCiudades[i].Ciudad + '</option>');
    }
}

function Change_Select_Departament() {
    $("#Select_Departament").change(function () {
        var val = $(this).val();
        if (val.length == 0) {
            $('#Select_City option').remove();
            $('#Select_City').append('<option value="" selected="selected"></option>');
        } else {
            $('#Select_City option').remove();
            TransaccionCiudades('Ciudades', val);
        }
    });
}

function Change_Select_City() {
    $("#Select_City").change(function () {
        var val = $(this).val();
        if (val.length == 0) {

        } else {

        }
    });
}

function ConsultSueldo() {
    Sueldo = $('#TXT_Saldo').val();
    DiasPagos = $('#TXT_Dia').val();
    if (Sueldo.length > 4 && DiasPagos.length > 0) {
        if (parseInt(DiasPagos) <= 30 && parseInt(DiasPagos) >= 1) {
            TransaccionConsultSueldo("Sueldo");
        } else {
            alert("Días no validos: Recuerda que máximo pueden ser 30 días para liquidar y mínimo 1.");
            $("#D_textTotal").html("$0000,00");
            $("#D_Prima").html("--");
            $("#D_Subsidio").html("--");
        }
    } else {
        alert("Campos incompletos: Debe completar los campos de Sueldo y Días a pagar respectivamente para poder consultar.")
        $("#D_textTotal").html("$0000,00");
        $("#D_Prima").html("--");
        $("#D_Subsidio").html("--");
    }
}

function CalcularSueldo() {
    if (MatrizResult[1] == "S") {
        Prima = true;
        $("#D_Prima").html("Si");
    } else {
        Prima = false;
        $("#D_Prima").html("No");
    }
    if (MatrizResult[2] == "S") {
        Subsidio = true;
        $("#D_Subsidio").html("Si");
    } else {
        Subsidio = false;
        $("#D_Subsidio").html("No");
    }

    var aPagar = 0;
    var valorDia = 0;

    valorDia = parseFloat(Sueldo) / 30

    aPagar = parseFloat(valorDia) * parseInt(DiasPagos);

    if (Subsidio == true) {
        aPagar = parseFloat(aPagar) + 83140;
    }

    if (Prima == true) {
        var prima = parseFloat(aPagar) / 2;
        aPagar = parseFloat(aPagar) + parseFloat(prima);
    }
    console.log(aPagar);
    aPagar = aPagar.toString().replace(".", ",");
    $("#D_textTotal").html("$" + aPagar);
}

// TRANSACCIONES AJAX

function TransaccionDepartamentos(action) {
    $.ajax({
        type: "POST",
        url: "TransaccionAjax.aspx",
        data: {
            "status": action
        },
        success: function (result) {
            if (result == "") {
                MatrizDepartamentos = [];
            } else {
                MatrizDepartamentos = JSON.parse(result);
                CargarDepartamentos();
            }
        }
    })
 .done(function (data, textStatus, jqXHR) {
     if (console && console.log) {
         //console.log("La solicitud se ha completado correctamente.");
     }
 })
 .fail(function (jqXHR, textStatus, errorThrown) {
     if (console && console.log) {
         console.log("La solicitud a fallado: " + textStatus);
     }
 });
}

function TransaccionCiudades(action, ID_Dep) {
    MatrizCiudades = [];
    $.ajax({
        type: "POST",
        url: "TransaccionAjax.aspx",
        data: {
            "status": action,
            "ID_Departamento": ID_Dep
        },
        success: function (result) {
            if (result == "") {
                MatrizCiudades = [];
            } else {
                MatrizCiudades = JSON.parse(result);
                CargarCiudades();
            }
        }
    })
 .done(function (data, textStatus, jqXHR) {
     if (console && console.log) {
         //console.log("La solicitud se ha completado correctamente.");
     }
 })
 .fail(function (jqXHR, textStatus, errorThrown) {
     if (console && console.log) {
         console.log("La solicitud a fallado: " + textStatus);
     }
 });
}

function TransaccionConsultSueldo(action) {
    MatrizResult = [];
    $.ajax({
        type: "POST",
        url: "TransaccionAjax.aspx",
        data: {
            "status": action,
            "Sueldo": Sueldo
        },
        success: function (result) {
            if (result == "") {
                MatrizResult = [];
            } else {
                MatrizResult = JSON.parse(result);
                if (MatrizResult.length == 1) {
                    $("#D_textTotal").html("$0000,00");
                    $("#D_Prima").html("--");
                    $("#D_Subsidio").html("--");
                    alert("Lo sentimos: " + MatrizResult[0]);
                } else if (MatrizResult.length > 1) {
                    CalcularSueldo();
                }
            }
        }
    })
 .done(function (data, textStatus, jqXHR) {
     if (console && console.log) {
         //console.log("La solicitud se ha completado correctamente.");
     }
 })
 .fail(function (jqXHR, textStatus, errorThrown) {
     if (console && console.log) {
         console.log("La solicitud a fallado: " + textStatus);
     }
 });
}
