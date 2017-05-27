Public Class ClassCiudades
#Region "Clases"
    Private _ID_Departamento As Long
    Private _ID_Ciudad As Long
    Private _Departamento As String
    Private _Ciudad As String
#End Region

#Region "Propiedades"
    Public Property ID_Departamento() As Long
        Get
            Return Me._ID_Departamento
        End Get
        Set(ByVal Value As Long)
            Me._ID_Departamento = Value
        End Set
    End Property
    Public Property ID_Ciudad() As Long
        Get
            Return Me._ID_Ciudad
        End Get
        Set(ByVal Value As Long)
            Me._ID_Ciudad = Value
        End Set
    End Property
    Public Property Departamento() As String
        Get
            Return Me._Departamento
        End Get
        Set(ByVal Value As String)
            Me._Departamento = Value
        End Set
    End Property
    Public Property Ciudad() As String
        Get
            Return Me._Ciudad
        End Get
        Set(ByVal Value As String)
            Me._Ciudad = Value
        End Set
    End Property

#End Region


End Class
