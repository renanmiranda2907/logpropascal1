unit exemplo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    bPotencia: TButton;
    bSair: TButton;
    eVazao: TEdit;
    eAltura: TEdit;
    eDiamentro: TEdit;
    eRendimento: TEdit;
    ePotencia: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    rgTipo: TRadioGroup;
    procedure bPotenciaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Label1Click(Sender: TObject);
begin

end;

procedure TForm1.bPotenciaClick(Sender: TObject);
var
   tg: integer;
   Q, Qa, hg, Pg, Pgm, Ds, Area, Pot, rv:double;
   a,b:array [0..3]of double;
begin
  //inicializador vetor
  a[0] := 0.772;
  a[1] := 0.772;
  a[2] := 0.772;
  a[3] := 0.772;

  b[0] := 0.197;
  b[1] := 0.512;
  b[2] := 0.302;
  b[3] := 0.164;

  //entrada de dados

  Q := StrToFloat(eVazao.Text);
  hg:= StrToFloat(eAltura.Text);
  Ds:= StrToFloat(eDiamentro.Text);
  rv:= StrToFloat(eRendimento.Text);
  tg := rgTipo.ItemIndex;

  //processamento

  Area := pi*sqr(Ds)/4*hg;

  Qa := Q/Area;

  Pgm := (sqr(Qa)*a[tg])/(Ln(1+b[tg]*Qa));

  Pg :=Pgm *hg;

  pot:= (Q*1.2*Pg)/rv;

  // saida

  ePotencia.Text:= FloatToStr(Pot);





end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

end.

