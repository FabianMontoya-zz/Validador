Imports Newtonsoft.Json
Public Class TransaccionAjax
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim action As String = Request.Form("status")
        Select Case action
            Case "Departamentos"
                CargaDepartamentos()

            Case "Ciudades"
                CargaCiudades()

            Case "Sueldo"
                ConsultSueldo()
        End Select
    End Sub


    Public Sub CargaDepartamentos()
        Dim ListClass As New List(Of ClassCiudades)
        Dim SQL As New SQLClass
        ListClass = SQL.ConsultarDepartamentos()

        Response.Write(JsonConvert.SerializeObject(ListClass.ToArray()))
    End Sub

    Public Sub CargaCiudades()
        Dim OBJ As New ClassCiudades
        Dim ListClass As New List(Of ClassCiudades)
        Dim SQL As New SQLClass

        OBJ.ID_Departamento = Request.Form("ID_Departamento")

        ListClass = SQL.ConsultarCiudades(OBJ)

        Response.Write(JsonConvert.SerializeObject(ListClass.ToArray()))
    End Sub

    Public Sub ConsultSueldo()
        Dim ListClass As New List(Of String)
        Dim SQL As New SQLClass
        Dim sueldo As Double = Request.Form("Sueldo")

        ListClass = SQL.ConsultarSaldo(sueldo)

        Response.Write(JsonConvert.SerializeObject(ListClass.ToArray()))
    End Sub
End Class