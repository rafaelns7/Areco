program Cadastro_Produtos;

uses
  Vcl.Forms,
  uProdutos in '..\FONTES\uProdutos.pas' {frmProdutos},
  uDMPRINCIPAL in '..\FONTES\uDMPRINCIPAL.pas' {DMPRINCIPAL: TDataModule},
  uCadProdutos in '..\FONTES\uCadProdutos.pas' {frmCadProdutos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDMPRINCIPAL, DMPRINCIPAL);
  Application.CreateForm(TfrmProdutos, frmProdutos);
  Application.Run;
end.
