object DMPRINCIPAL: TDMPRINCIPAL
  OldCreateOrder = False
  Height = 276
  Width = 445
  object Conexao: TSQLConnection
    DriverName = 'Firebird'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXFirebird'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver230.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=23.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXFirebirdMetaDataCommandFactory,DbxFire' +
        'birdDriver230.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXFirebirdMetaDataCommandF' +
        'actory,Borland.Data.DbxFirebirdDriver,Version=23.0.0.0,Culture=n' +
        'eutral,PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverINTERBASE'
      'LibraryName=dbxfb.dll'
      'LibraryNameOsx=libsqlfb.dylib'
      'VendorLib=fbclient.dll'
      'VendorLibWin64=fbclient.dll'
      'VendorLibOsx=/Library/Frameworks/Firebird.framework/Firebird'
      'User_Name=sysdba'
      'Password=masterkey'
      'Role=RoleName'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'IsolationLevel=ReadCommitted'
      'SQLDialect=3'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'TrimChar=False'
      'BlobSize=-1'
      'ErrorResourceFile='
      'RoleName=RoleName'
      'ServerCharSet='
      'Trim Char=False'
      'Database=D:\Areco\BANCO\ARECO.FDB')
    BeforeConnect = ConexaoBeforeConnect
    Connected = True
    Left = 48
    Top = 16
  end
  object dtsProdutos: TSQLDataSet
    CommandText = 
      'SELECT ID, DESCRICAO, COD_BARRA, PRECO_VENDA,'#13#10'ESTOQUE_MINIMO, P' +
      'OSICAO_ESTOQUE'#13#10'FROM PRODUTOS'#13#10'ORDER BY ID ASC'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 48
    Top = 64
    object dtsProdutosID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object dtsProdutosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 120
    end
    object dtsProdutosCOD_BARRA: TStringField
      FieldName = 'COD_BARRA'
      ProviderFlags = [pfInUpdate]
      Size = 13
    end
    object dtsProdutosESTOQUE_MINIMO: TIntegerField
      FieldName = 'ESTOQUE_MINIMO'
      ProviderFlags = [pfInUpdate]
    end
    object dtsProdutosPRECO_VENDA: TFMTBCDField
      FieldName = 'PRECO_VENDA'
      Precision = 9
      Size = 2
    end
    object dtsProdutosPOSICAO_ESTOQUE: TIntegerField
      FieldName = 'POSICAO_ESTOQUE'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dtspProdutos: TDataSetProvider
    DataSet = dtsProdutos
    Left = 80
    Top = 64
  end
  object cdsProdutos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dtspProdutos'
    Left = 112
    Top = 64
    object cdsProdutosID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsProdutosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 120
    end
    object cdsProdutosCOD_BARRA: TStringField
      FieldName = 'COD_BARRA'
      Size = 13
    end
    object cdsProdutosPRECO_VENDA: TFMTBCDField
      FieldName = 'PRECO_VENDA'
      DisplayFormat = '0.00'
      Precision = 9
      Size = 2
    end
    object cdsProdutosESTOQUE_MINIMO: TIntegerField
      FieldName = 'ESTOQUE_MINIMO'
    end
    object cdsProdutosPOSICAO_ESTOQUE: TIntegerField
      FieldName = 'POSICAO_ESTOQUE'
    end
  end
  object dtsCadProdutos: TSQLDataSet
    CommandText = 
      'SELECT ID,DESCRICAO,COD_BARRA,PRECO_CUSTO,PRECO_VENDA,'#13#10'ESTOQUE_' +
      'MINIMO,POSICAO_ESTOQUE,DATA_INCLUSAO,OBSERVACOES,'#13#10'CFOP,SITUACAO' +
      'TRIBUTARIA,NCM'#13#10'FROM PRODUTOS'#13#10'WHERE ID = :IDPROD'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'IDPROD'
        ParamType = ptInput
      end>
    SQLConnection = Conexao
    Left = 48
    Top = 112
    object dtsCadProdutosID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dtsCadProdutosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 120
    end
    object dtsCadProdutosCOD_BARRA: TStringField
      FieldName = 'COD_BARRA'
      ProviderFlags = [pfInUpdate]
      Size = 13
    end
    object dtsCadProdutosPRECO_CUSTO: TFMTBCDField
      FieldName = 'PRECO_CUSTO'
      ProviderFlags = [pfInUpdate]
      Precision = 9
      Size = 2
    end
    object dtsCadProdutosPRECO_VENDA: TFMTBCDField
      FieldName = 'PRECO_VENDA'
      Precision = 9
      Size = 2
    end
    object dtsCadProdutosESTOQUE_MINIMO: TIntegerField
      FieldName = 'ESTOQUE_MINIMO'
      ProviderFlags = [pfInUpdate]
    end
    object dtsCadProdutosPOSICAO_ESTOQUE: TIntegerField
      FieldName = 'POSICAO_ESTOQUE'
      ProviderFlags = [pfInUpdate]
    end
    object dtsCadProdutosCFOP: TSmallintField
      FieldName = 'CFOP'
    end
    object dtsCadProdutosSITUACAOTRIBUTARIA: TStringField
      FieldName = 'SITUACAOTRIBUTARIA'
      Size = 3
    end
    object dtsCadProdutosNCM: TStringField
      FieldName = 'NCM'
      FixedChar = True
      Size = 8
    end
    object dtsCadProdutosDATA_INCLUSAO: TSQLTimeStampField
      FieldName = 'DATA_INCLUSAO'
      ProviderFlags = [pfInUpdate]
    end
    object dtsCadProdutosOBSERVACOES: TStringField
      FieldName = 'OBSERVACOES'
      ProviderFlags = [pfInUpdate]
      Size = 300
    end
  end
  object dtspCadProdutos: TDataSetProvider
    DataSet = dtsCadProdutos
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dtspCadProdutosBeforeUpdateRecord
    Left = 80
    Top = 112
  end
  object cdsCadProdutos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'IDPROD'
        ParamType = ptInput
      end>
    ProviderName = 'dtspCadProdutos'
    OnNewRecord = cdsCadProdutosNewRecord
    Left = 112
    Top = 112
    object cdsCadProdutosID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCadProdutosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 120
    end
    object cdsCadProdutosCOD_BARRA: TStringField
      FieldName = 'COD_BARRA'
      ProviderFlags = [pfInUpdate]
      Size = 13
    end
    object cdsCadProdutosPRECO_CUSTO: TFMTBCDField
      FieldName = 'PRECO_CUSTO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00'
      Precision = 9
      Size = 2
    end
    object cdsCadProdutosPRECO_VENDA: TFMTBCDField
      FieldName = 'PRECO_VENDA'
      DisplayFormat = '0.00'
      Precision = 9
      Size = 2
    end
    object cdsCadProdutosESTOQUE_MINIMO: TIntegerField
      FieldName = 'ESTOQUE_MINIMO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCadProdutosPOSICAO_ESTOQUE: TIntegerField
      FieldName = 'POSICAO_ESTOQUE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCadProdutosDATA_INCLUSAO: TSQLTimeStampField
      FieldName = 'DATA_INCLUSAO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCadProdutosCFOP: TSmallintField
      FieldName = 'CFOP'
    end
    object cdsCadProdutosSITUACAOTRIBUTARIA: TStringField
      FieldName = 'SITUACAOTRIBUTARIA'
      Size = 3
    end
    object cdsCadProdutosNCM: TStringField
      FieldName = 'NCM'
      FixedChar = True
      Size = 8
    end
    object cdsCadProdutosOBSERVACOES: TStringField
      FieldName = 'OBSERVACOES'
      ProviderFlags = [pfInUpdate]
      Size = 300
    end
  end
  object SPCadProd_ID: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Precision = 4
        Name = 'ID'
        ParamType = ptOutput
        Size = 4
      end>
    SQLConnection = Conexao
    StoredProcName = 'SP_GEN_PRODUTOS_ID'
    Left = 144
    Top = 112
  end
  object dtCFOP: TSQLDataSet
    CommandText = 'SELECT CODIGO, DESCRICAO, CODIGODESCRICAO FROM CFOP'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 48
    Top = 168
    object dtCFOPCODIGO: TSmallintField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dtCFOPDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 255
    end
    object dtCFOPCODIGODESCRICAO: TStringField
      FieldName = 'CODIGODESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 266
    end
  end
  object dtsCFOP: TDataSetProvider
    DataSet = dtCFOP
    Options = [poIncFieldProps, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 80
    Top = 168
  end
  object cdsCFOP: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dtsCFOP'
    Left = 112
    Top = 168
    object cdsCFOPCODIGO: TSmallintField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCFOPDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 255
    end
    object cdsCFOPCODIGODESCRICAO: TStringField
      FieldName = 'CODIGODESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 266
    end
  end
  object dtSituacaoTributaria: TSQLDataSet
    CommandText = 
      'SELECT CODIGO, DESCRICAO,'#13#10'CODIGODESCRICAO FROM SITUACAOTRIBUTAR' +
      'IA'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 48
    Top = 216
    object dtSituacaoTributariaCODIGO: TStringField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object dtSituacaoTributariaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 255
    end
    object dtSituacaoTributariaCODIGODESCRICAO: TStringField
      FieldName = 'CODIGODESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 259
    end
  end
  object dtspSituacaoTributaria: TDataSetProvider
    DataSet = dtSituacaoTributaria
    Left = 80
    Top = 216
  end
  object cdsSituacaoTributaria: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dtspSituacaoTributaria'
    Left = 112
    Top = 216
    object cdsSituacaoTributariaCODIGO: TStringField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object cdsSituacaoTributariaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 255
    end
    object cdsSituacaoTributariaCODIGODESCRICAO: TStringField
      FieldName = 'CODIGODESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 259
    end
  end
end
