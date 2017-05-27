Imports System.Data
Imports System.Configuration
Imports MySql.Data.MySqlClient
Imports Validador.SaldosServiceReference
Public Class SQLClass

    Public Function ConsultarDepartamentos()


        Dim ListObj As New List(Of ClassCiudades)

        Dim constr As String = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString

        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("SELECT ID_Departamento, Nombre_Departamento FROM departamento ORDER BY Nombre_Departamento ASC")
                Using sda As New MySqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Dim reader As MySqlDataReader
                    con.Open()
                    reader = cmd.ExecuteReader

                    While reader.Read
                        Dim OBJ As New ClassCiudades()
                        OBJ.ID_Departamento = reader.GetValue(0)
                        OBJ.Departamento = reader.GetValue(1)
                        ListObj.Add(OBJ)
                    End While
                    con.Close()
                End Using
            End Using
        End Using

        Return ListObj
    End Function

    Public Function ConsultarCiudades(ByVal OBJ As ClassCiudades)

        Dim ListObj As New List(Of ClassCiudades)

        Dim constr As String = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString

        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("SELECT ID_Ciudad, Nombre_Ciudad FROM ciudad WHERE ID_Departamento = " & OBJ.ID_Departamento & " ORDER BY Nombre_Ciudad ASC")
                Using sda As New MySqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Dim reader As MySqlDataReader
                    con.Open()
                    reader = cmd.ExecuteReader

                    While reader.Read
                        Dim OBJClass As New ClassCiudades()
                        OBJClass.ID_Ciudad = reader.GetValue(0)
                        OBJClass.Ciudad = reader.GetValue(1)
                        ListObj.Add(OBJClass)
                    End While
                    con.Close()
                End Using
            End Using
        End Using

        Return ListObj
    End Function

    Public Function ConsultarSaldo(ByVal saldo As Double)
        Dim sueldo As New SaldosServiceReference.ConsultaSueldo
        Dim jws As New SaldosServiceReference.SueldosIServiceClient
        Dim lista As New List(Of String)
        Try
            sueldo = jws.BuscarSueldo(saldo)

            If sueldo.S_Sueldo <> Nothing Then
                lista.Add(sueldo.S_Sueldo.ToString)
                lista.Add(sueldo.S_Prima.ToString)
                lista.Add(sueldo.S_Subsidio.ToString)
            Else
                lista.Add(sueldo.ErrorMessage)
            End If
        Catch ex As Exception
            Dim Excepcion As String = "Ocurrió un error al utilizar el Servicio Web: " & ex.Message
            lista.Clear()
            lista.Add(Excepcion)
        End Try



        Return lista
    End Function
End Class
