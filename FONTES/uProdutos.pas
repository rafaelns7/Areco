﻿unit uProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, System.ImageList, Vcl.ImgList,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,uDMPRINCIPAL;

type
  TfrmProdutos = class(TForm)
    Panel1: TPanel;
    DBGridProdutos: TDBGrid;
    btnNovo: TButton;
    ImgListProdutos: TImageList;
    btnExcluir: TButton;
    btnSair: TButton;
    Label1: TLabel;
    lblTipoPesquisa: TLabel;
    dtProdutos: TDataSource;
    BalloonHint: TBalloonHint;
    Button1: TButton;
    Label2: TLabel;
    cmbPesquisa: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure DBGridProdutosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnSairClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure DBGridProdutosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGridProdutosDblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGridProdutosTitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure cmbPesquisaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    //Guarda a descrição do titulo do grid
    gSelecaoColunagrid : String;

    procedure IncluiProdutos;
    procedure EditarProduto;
    procedure ExcluirProduto;

  end;

var
  frmProdutos: TfrmProdutos;

implementation

{$R *.dfm}

uses uCadProdutos;


procedure TfrmProdutos.btnExcluirClick(Sender: TObject);
begin
  ExcluirProduto;
end;

procedure TfrmProdutos.btnNovoClick(Sender: TObject);
begin
  IncluiProdutos;
end;
procedure TfrmProdutos.btnSairClick(Sender: TObject);
begin
  Close;
end;
procedure TfrmProdutos.Button1Click(Sender: TObject);
begin
 EditarProduto;
end;
procedure TfrmProdutos.cmbPesquisaChange(Sender: TObject);
begin
  if CMBPesquisa.Text <> '' then
    if( gSelecaoColunagrid = 'ID' ) or ( gSelecaoColunagrid = 'COD_BARRA' ) or
      ( gSelecaoColunagrid = 'DESCRICAO' ) then
       DMPRINCIPAL.cdsProdutos.Locate(gSelecaoColunagrid, CMBPesquisa.Text, [loCaseInsensitive, loPartialKey]);
end;

procedure TfrmProdutos.DBGridProdutosDblClick(Sender: TObject);
begin
  EditarProduto;
end;

procedure TfrmProdutos.DBGridProdutosDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TDbGrid(Sender).Canvas.font.Color:= clBlack;
  if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color := $00CCF2D5;
      FillRect(Rect);
    end;
  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);
end;

procedure TfrmProdutos.DBGridProdutosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_DELETE Then
   ExcluirProduto;
end;
procedure TfrmProdutos.DBGridProdutosTitleClick(Column: TColumn);
begin
  if 'a' + Column.FieldName = DMPRINCIPAL.cdsProdutos.IndexName then
  begin
    DMPRINCIPAL.cdsProdutos.IndexName := 'd' + column.FieldName;
    DBGridProdutos.Columns[0].Title.Caption:= 'Cod. produto ↑';
    DBGridProdutos.Columns[1].Title.Caption:= 'Cod. barras ↑';
    DBGridProdutos.Columns[2].Title.Caption:= 'Descrição do produto ↑';
  end
  else
  begin
    DMPRINCIPAL.cdsProdutos.IndexName := 'a' + column.FieldName;
    DBGridProdutos.Columns[0].Title.Caption:= 'Cod. produto ↓';
    DBGridProdutos.Columns[1].Title.Caption:= 'Cod. barras ↓';
    DBGridProdutos.Columns[2].Title.Caption:= 'Descrição do produto ↓';
  end;

  gSelecaoColunagrid:= Column.FieldName;
  if( gSelecaoColunagrid = 'ID' ) or ( gSelecaoColunagrid = 'COD_BARRA' ) or
    ( gSelecaoColunagrid = 'DESCRICAO' )  then
      lblTipoPesquisa.Caption:= Copy( Column.Title.Caption,0,length( Column.Title.Caption )-1 );

  DMPRINCIPAL.cdsProdutos.DisableControls;
  DMPRINCIPAL.cdsProdutos.First;
  cmbPesquisa.Clear;

  if gSelecaoColunagrid = 'ID' then
   begin
     while not DMPRINCIPAL.cdsProdutos.Eof do
     begin
       cmbPesquisa.Items.Add( DMPRINCIPAL.cdsProdutosID.AsString );
       DMPRINCIPAL.cdsProdutos.Next;
     end;
   end;
   if gSelecaoColunagrid = 'COD_BARRA' then
   begin
     while not DMPRINCIPAL.cdsProdutos.Eof do
     begin
       cmbPesquisa.Items.Add( DMPRINCIPAL.cdsProdutosCOD_BARRA.AsString );
       DMPRINCIPAL.cdsProdutos.Next;
     end;
   end;
   if gSelecaoColunagrid = 'DESCRICAO' then
   begin
     while not DMPRINCIPAL.cdsProdutos.Eof do
     begin
       cmbPesquisa.Items.Add( DMPRINCIPAL.cdsProdutosDESCRICAO.AsString );
       DMPRINCIPAL.cdsProdutos.Next;
     end;
   end;
   DMPRINCIPAL.cdsProdutos.EnableControls;
   cmbPesquisa.SetFocus;
end;

procedure TfrmProdutos.EditarProduto;
begin
  frmCadProdutos := TfrmCadProdutos.Create( Self );
  DMPRINCIPAL.cdsCadProdutos.close;
  DMPRINCIPAL.cdsCadProdutos.Params[0].AsInteger := DMPRINCIPAL.cdsProdutosID.AsInteger;
  DMPRINCIPAL.cdsCadProdutos.Open;
  DMPRINCIPAL.cdsCadProdutos.edit;
  if frmCadProdutos.ShowModal = mrok then
  begin
    DMPRINCIPAL.cdsCadProdutos.FieldByName('DATA_INCLUSAO').AsDateTime:= Now;
    DMPRINCIPAL.cdsCadProdutos.ApplyUpdates(0);
  end
  else
  begin
    DMPRINCIPAL.cdsCadProdutos.CancelUpdates;
  end;
  frmCadProdutos.Close;
  FreeAndNil(frmCadProdutos);
  DMPRINCIPAL.cdsProdutos.Refresh;
end;

procedure TfrmProdutos.ExcluirProduto;
begin
  if  DMPRINCIPAL.cdsProdutos.RecordCount <> 0 then
  begin
    case Application.MessageBox(' Deseja Excluir este produto'#13,
            ' Atenção ', MB_YESNO + MB_ICONINFORMATION) of
      IDYES:
        begin
        try
          DMPRINCIPAL.cdsProdutos.Delete;
          DMPRINCIPAL.cdsProdutos.ApplyUpdates(0);
        except
          on E : Exception do
          ShowMessage(E.ClassName+' Erro ao excluir o produto : '+E.Message);
        end;
      end;
    end;
  end
  else
  ShowMessage('Não existe produtos para excusão');
end;
procedure TfrmProdutos.FormCreate(Sender: TObject);
var
  i:integer;
begin
  for i := 0 to DMPRINCIPAL.cdsProdutos.FieldCount - 1 do
  begin
    DMPRINCIPAL.cdsProdutos.IndexDefs.Add('a' + DMPRINCIPAL.cdsProdutos.Fields[i].FieldName,
    DMPRINCIPAL.cdsProdutos.Fields[i].FieldName, []);
    DMPRINCIPAL.cdsProdutos.IndexDefs.Add('d' + DMPRINCIPAL.cdsProdutos.Fields[i].FieldName,
    DMPRINCIPAL.cdsProdutos.Fields[i].FieldName, [ixDescending])
  end;
end;

procedure TfrmProdutos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
    Close;

  if key = VK_F1 then
    IncluiProdutos;

  if key = VK_F2 then
    EditarProduto;
end;
procedure TfrmProdutos.FormShow(Sender: TObject);
begin
  DMPRINCIPAL.cdsProdutos.Open;
end;
procedure TfrmProdutos.IncluiProdutos;
begin
  frmCadProdutos := TfrmCadProdutos.Create( Self );
  DMPRINCIPAL.cdsCadProdutos.Open;
  DMPRINCIPAL.cdsCadProdutos.Insert;
  if frmCadProdutos.ShowModal = mrok then
  begin
    DMPRINCIPAL.cdsCadProdutos.FieldByName('DATA_INCLUSAO').AsDateTime:= Now;
    DMPRINCIPAL.cdsCadProdutos.ApplyUpdates(0);
  end
  else
  begin
    DMPRINCIPAL.cdsCadProdutos.CancelUpdates;
  end;
  frmCadProdutos.Close;
  FreeAndNil(frmCadProdutos);
  DMPRINCIPAL.cdsProdutos.Refresh;
end;
end.
