object frmCadProdutos: TfrmCadProdutos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Cadastro de Produtos'
  ClientHeight = 459
  ClientWidth = 396
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 414
    Width = 396
    Height = 45
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 330
    ExplicitWidth = 449
    object btnSalvar: TButton
      Left = 2
      Top = 2
      Width = 81
      Height = 42
      Caption = '&Salvar'
      ImageIndex = 2
      Images = frmProdutos.ImgListProdutos
      TabOrder = 0
      OnClick = btnSalvarClick
    end
    object btnCancelar: TButton
      Left = 89
      Top = 2
      Width = 88
      Height = 42
      Caption = '&Cancelar'
      ImageIndex = 5
      Images = frmProdutos.ImgListProdutos
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 396
    Height = 414
    ActivePage = TabSheet1
    Align = alClient
    MultiLine = True
    TabOrder = 1
    ExplicitWidth = 449
    ExplicitHeight = 330
    object TabSheet1: TTabSheet
      Caption = '&Dados Principais'
      ExplicitLeft = 2
      ExplicitWidth = 441
      ExplicitHeight = 405
      object Label1: TLabel
        Left = 3
        Top = 24
        Width = 102
        Height = 13
        Caption = 'Descri'#231#227'o do produto'
      end
      object Label2: TLabel
        Left = 3
        Top = 68
        Width = 82
        Height = 13
        Caption = 'C'#243'digo de barras'
      end
      object Label3: TLabel
        Left = 3
        Top = 107
        Width = 71
        Height = 13
        Caption = 'Pre'#231'o de custo'
      end
      object Label4: TLabel
        Left = 111
        Top = 107
        Width = 75
        Height = 13
        Caption = 'Pre'#231'o de venda'
      end
      object Label5: TLabel
        Left = 3
        Top = 152
        Width = 74
        Height = 13
        Caption = 'Estoque M'#237'nimo'
      end
      object Label6: TLabel
        Left = 3
        Top = 314
        Width = 63
        Height = 13
        Caption = 'Observa'#231#245'es'
      end
      object Label7: TLabel
        Left = 111
        Top = 152
        Width = 67
        Height = 13
        Caption = 'Estoque Atual'
      end
      object Label8: TLabel
        Left = 3
        Top = 277
        Width = 22
        Height = 13
        Caption = 'NCM'
      end
      object Label9: TLabel
        Left = 3
        Top = 194
        Width = 23
        Height = 13
        Caption = 'Cfop'
      end
      object Label10: TLabel
        Left = 3
        Top = 237
        Width = 88
        Height = 13
        Caption = 'Situa'#231#227'o tribut'#225'ria'
      end
      object dbedtDescricao: TDBEdit
        Left = 3
        Top = 40
        Width = 342
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = dtsCadProduto
        TabOrder = 0
      end
      object dbedtCodBarras: TDBEdit
        Left = 3
        Top = 82
        Width = 198
        Height = 21
        DataField = 'COD_BARRA'
        DataSource = dtsCadProduto
        TabOrder = 1
        OnKeyPress = dbedtCodBarrasKeyPress
      end
      object dbedtPrecoCusto: TDBEdit
        Left = 3
        Top = 123
        Width = 102
        Height = 21
        DataField = 'PRECO_CUSTO'
        DataSource = dtsCadProduto
        TabOrder = 2
      end
      object dbedtPrecoVenda: TDBEdit
        Left = 111
        Top = 123
        Width = 90
        Height = 21
        DataField = 'PRECO_VENDA'
        DataSource = dtsCadProduto
        TabOrder = 3
      end
      object dbedtEstoqueMin: TDBEdit
        Left = 3
        Top = 168
        Width = 102
        Height = 21
        DataField = 'ESTOQUE_MINIMO'
        DataSource = dtsCadProduto
        TabOrder = 4
        OnKeyPress = dbedtEstoqueMinKeyPress
      end
      object dbmObservacoes: TDBMemo
        Left = 3
        Top = 333
        Width = 342
        Height = 46
        DataField = 'OBSERVACOES'
        DataSource = dtsCadProduto
        TabOrder = 9
      end
      object dbedtEstoqueAtual: TDBEdit
        Left = 111
        Top = 168
        Width = 90
        Height = 21
        DataField = 'POSICAO_ESTOQUE'
        DataSource = dtsCadProduto
        TabOrder = 5
      end
      object dbedtNCM: TDBEdit
        Left = 3
        Top = 291
        Width = 121
        Height = 21
        DataField = 'NCM'
        DataSource = dtsCadProduto
        TabOrder = 8
        OnKeyPress = dbedtNCMKeyPress
      end
      object dblcmbCfop: TDBLookupComboBox
        Left = 3
        Top = 210
        Width = 342
        Height = 21
        Cursor = crHandPoint
        DataField = 'CFOP'
        DataSource = dtsCadProduto
        KeyField = 'CODIGO'
        ListField = 'CODIGODESCRICAO'
        ListSource = dtsCFOP
        TabOrder = 6
      end
      object dblcmbSituacaoTributaria: TDBLookupComboBox
        Left = 3
        Top = 251
        Width = 342
        Height = 21
        Cursor = crHandPoint
        DataField = 'SITUACAOTRIBUTARIA'
        DataSource = dtsCadProduto
        KeyField = 'CODIGO'
        ListField = 'CODIGODESCRICAO'
        ListSource = dtsSituacaoTributaria
        TabOrder = 7
      end
    end
  end
  object dtsCadProduto: TDataSource
    DataSet = DMPRINCIPAL.cdsCadProdutos
    Left = 372
    Top = 48
  end
  object dtsCFOP: TDataSource
    DataSet = DMPRINCIPAL.cdsCFOP
    Left = 372
    Top = 104
  end
  object dtsSituacaoTributaria: TDataSource
    DataSet = DMPRINCIPAL.cdsSituacaoTributaria
    Left = 372
    Top = 152
  end
end
