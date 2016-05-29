unit uDMPRINCIPAL;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.SqlExpr,System.IniFiles,IWSystem,
  Data.DBXFirebird,vcl.Dialogs, Data.FMTBcd, Datasnap.DBClient,
  Datasnap.Provider;

type
  TDMPRINCIPAL = class(TDataModule)
    Conexao: TSQLConnection;
    dtsProdutos: TSQLDataSet;
    dtsProdutosID: TIntegerField;
    dtspProdutos: TDataSetProvider;
    cdsProdutos: TClientDataSet;
    cdsProdutosID: TIntegerField;
    dtsCadProdutos: TSQLDataSet;
    dtspCadProdutos: TDataSetProvider;
    cdsCadProdutos: TClientDataSet;
    SPCadProd_ID: TSQLStoredProc;
    dtsCadProdutosID: TIntegerField;
    dtsCadProdutosDESCRICAO: TStringField;
    dtsCadProdutosCOD_BARRA: TStringField;
    dtsCadProdutosPRECO_CUSTO: TFMTBCDField;
    dtsCadProdutosESTOQUE_MINIMO: TIntegerField;
    dtsCadProdutosPOSICAO_ESTOQUE: TIntegerField;
    dtsCadProdutosOBSERVACOES: TStringField;
    cdsCadProdutosID: TIntegerField;
    cdsCadProdutosDESCRICAO: TStringField;
    cdsCadProdutosCOD_BARRA: TStringField;
    cdsCadProdutosPRECO_CUSTO: TFMTBCDField;
    cdsCadProdutosESTOQUE_MINIMO: TIntegerField;
    cdsCadProdutosPOSICAO_ESTOQUE: TIntegerField;
    cdsCadProdutosOBSERVACOES: TStringField;
    dtsProdutosDESCRICAO: TStringField;
    dtsProdutosCOD_BARRA: TStringField;
    dtsProdutosESTOQUE_MINIMO: TIntegerField;
    dtsProdutosPOSICAO_ESTOQUE: TIntegerField;
    cdsProdutosDESCRICAO: TStringField;
    cdsProdutosCOD_BARRA: TStringField;
    cdsProdutosESTOQUE_MINIMO: TIntegerField;
    cdsProdutosPOSICAO_ESTOQUE: TIntegerField;
    dtsCadProdutosDATA_INCLUSAO: TSQLTimeStampField;
    cdsCadProdutosDATA_INCLUSAO: TSQLTimeStampField;
    dtsProdutosPRECO_VENDA: TFMTBCDField;
    cdsProdutosPRECO_VENDA: TFMTBCDField;
    dtsCadProdutosPRECO_VENDA: TFMTBCDField;
    cdsCadProdutosPRECO_VENDA: TFMTBCDField;
    dtsCadProdutosNCM: TStringField;
    cdsCadProdutosNCM: TStringField;
    dtsCadProdutosCFOP: TSmallintField;
    dtsCadProdutosSITUACAOTRIBUTARIA: TStringField;
    cdsCadProdutosCFOP: TSmallintField;
    cdsCadProdutosSITUACAOTRIBUTARIA: TStringField;
    dtCFOP: TSQLDataSet;
    dtsCFOP: TDataSetProvider;
    cdsCFOP: TClientDataSet;
    dtCFOPCODIGO: TSmallintField;
    dtCFOPDESCRICAO: TStringField;
    dtCFOPCODIGODESCRICAO: TStringField;
    cdsCFOPCODIGO: TSmallintField;
    cdsCFOPDESCRICAO: TStringField;
    cdsCFOPCODIGODESCRICAO: TStringField;
    dtSituacaoTributaria: TSQLDataSet;
    dtspSituacaoTributaria: TDataSetProvider;
    cdsSituacaoTributaria: TClientDataSet;
    dtSituacaoTributariaCODIGO: TStringField;
    dtSituacaoTributariaDESCRICAO: TStringField;
    dtSituacaoTributariaCODIGODESCRICAO: TStringField;
    cdsSituacaoTributariaCODIGO: TStringField;
    cdsSituacaoTributariaDESCRICAO: TStringField;
    cdsSituacaoTributariaCODIGODESCRICAO: TStringField;
    procedure ConexaoBeforeConnect(Sender: TObject);
    procedure cdsCadProdutosNewRecord(DataSet: TDataSet);
    procedure dtspCadProdutosBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMPRINCIPAL: TDMPRINCIPAL;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDMPRINCIPAL.cdsCadProdutosNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('ID').AsInteger:=-1;
end;

procedure TDMPRINCIPAL.ConexaoBeforeConnect(Sender: TObject);
var
Arquivo: TIniFile{uses IniFiles};
begin
  Try
    Arquivo:= TIniFile.Create(gsAppPath +'CONFIG.ini');
    with Conexao do
    begin
      Params.Values['DATABASE'] := Arquivo.ReadString('CONFIG','DATABASE','');
      Params.Values['USERNAME'] := Arquivo.ReadString('CONFIG','USERNAME','');
      Params.Values['PASSWORD'] := Arquivo.ReadString('CONFIG','PASSWORD','');
      Arquivo.Free
    end;
  except
    on E : Exception do
      ShowMessage(E.ClassName+' Erro ao conectar com o banco de dados. : '+E.Message);
  end;
end;
procedure TDMPRINCIPAL.dtspCadProdutosBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
  if SourceDS = dtsCadProdutos then
  if UpdateKind = ukInsert then
  begin
    SPCadProd_ID.ExecProc;
    DeltaDS.FieldByName('ID').NewValue := SPCadProd_ID.Params[0].AsInteger;
    SPCadProd_ID.Close;
  end;
end;
end.
