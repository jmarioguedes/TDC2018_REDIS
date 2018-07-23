object ServerContainer1: TServerContainer1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 271
  Width = 415
  object DSServer1: TDSServer
    AutoStart = False
    Left = 88
    Top = 11
  end
  object DSHTTPService1: TDSHTTPService
    HttpPort = 8080
    OnHTTPTrace = DSHTTPService1HTTPTrace
    Server = DSServer1
    Filters = <>
    AuthenticationManager = DSAuthenticationManager1
    Left = 96
    Top = 135
  end
  object DSAuthenticationManager1: TDSAuthenticationManager
    OnUserAuthenticate = DSAuthenticationManager1UserAuthenticate
    OnUserAuthorize = DSAuthenticationManager1UserAuthorize
    Roles = <>
    Left = 96
    Top = 197
  end
  object DSServerClass1: TDSServerClass
    OnGetClass = DSServerClass1GetClass
    Server = DSServer1
    LifeCycle = 'Invocation'
    Left = 232
    Top = 27
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'DriverID=PG'
      'ApplicationName=TDC2018'
      'Password=postgres'
      'Server=localhost'
      'User_Name=postgres'
      'Database=TDC2018')
    LoginPrompt = False
    Left = 264
    Top = 168
  end
  object DSServerClass2: TDSServerClass
    OnGetClass = DSServerClass2GetClass
    Server = DSServer1
    Left = 336
    Top = 24
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT SUM("VALOR") '
      'FROM "TB_VENDAS"'
      'WHERE "UF" = :PUF')
    Left = 344
    Top = 168
    ParamData = <
      item
        Name = 'PUF'
        ParamType = ptInput
      end>
  end
end
