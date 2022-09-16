unit exercicio09;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, TAGraph,
  TASeries;

type

  { TForm1 }

  TForm1 = class(TForm)
    bCalcular: TButton;
    bLimpar: TButton;
    bSair: TButton;
    Chart1: TChart;
    Fline: TLineSeries;
    FlineB: TLineSeries;
    Epopia: TEdit;
    Epopib: TEdit;
    Etaxaa: TEdit;
    Etaxab: TEdit;
    Etempo: TEdit;
    Epopa: TEdit;
    Epopb: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure bCalcularClick(Sender: TObject);
    procedure bLimparClick(Sender: TObject);
    procedure bSairClick(Sender: TObject);
    procedure InitLine;
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.bCalcularClick(Sender: TObject);
var
  popiA, popiB, popA, popB, taxaA, taxaB: double;
  tempo: integer;
begin

  FreeAndNil(Fline);
  FreeAndNil(FlineB);
  InitLine ;
  // entrada
  popiA:= StrToFloat(Epopia.Text);
  popiB:= StrToFloat(Epopib.Text);
  taxaA:= StrToFloat(Etaxaa.Text);
  taxaB:= StrToFloat(Etaxab.Text);

  //processamento
  taxaA:=taxaA/100+1;
  taxaB:=taxaB/100+1;
  tempo:= 0;
  popA:=popiA;
  popB:=popiB;

  while (popA<=popB) do
  begin
    Fline.AddXY(tempo,popa,'',clGreen);
    FlineB.AddXY(tempo,popb,'',clGreen);

    popA:=popA * taxaA;
    popB:=popB * taxaB;
    tempo:= tempo + 1;
  end;

  tempografico := Round(tempo*1.4);

  //saida
  Etempo.Text:=IntToStr(tempo);
  Epopa.Text:=FloatToStr(popA);
  Epopb.Text:=FloatToStr(popB);

  while (tempo<=tempografia) do
  begin
       Inc(tempo);
       popfa := popfa *taxaa;
       popfb := popfb*taxab;
       Fline.AddXY(tempo,popfa,'',clGreen);
       Fline.AddXY(tempo,popfb,'',clGreen);
  end;

end;



procedure TForm1.bLimparClick(Sender: TObject);
begin
  Epopia.Text:='0';
  Epopib.Text:='0';
  Etaxaa.Text:='0';
  Etaxab.Text:='0';
  Etempo.Text:='0';
  Epopa.Text:='0';
  Epopb.Text:='0';
end;

procedure TForm1.bSairClick(Sender: TObject);
begin
  close;
end;

procedure TForm1.InitLine;
begin
  Fline := TlineSeries.Create(Chart1);
  Fline.ShowLines := true;
  Fline.ShowPoints := False;
  Fline.Pointer.Brush.Color := clBlue;
  Fline.Title := 'Pop. A';
  Fline.SeriesColor:=clRed;
  Chart1.AddSeries(Fline);

  FlineB := TlineSeries.Create(Chart1);
  FlineB.ShowLines := true;
  FlineB.ShowPoints := False;
  FlineB.Pointer.Brush.Color := clGreen;
  FlineB.Title := 'Pop. B';
  FlineB.SeriesColor:=clRed;
  Chart1.AddSeries(FlineB);

  Chart1.Legend.Visible := True;
end;


end.





















