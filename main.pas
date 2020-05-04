unit Main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  uplaysound;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Label1: TLabel;
    PlayStart: Tplaysound;
    PlayStop: Tplaysound;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure UpdateTime();
    procedure SuccessfulFinish();
  private
    DurationMinutes: integer;
    DurationSeconds: integer;
    Completed: integer;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.UpdateTime();
begin
  Label1.caption := Format('%.2d:%.2d', [DurationMinutes, DurationSeconds]);
end;

procedure TForm1.SuccessfulFinish();
begin
  Completed += 1;
  case Completed of
    1 : Image1.Visible := True;
    2 : Image2.Visible := True;
    3 : Image3.Visible := True;
    4 : Image4.Visible := True;
    5 : Image5.Visible := True;
    6 : Image6.Visible := True;
    7 : Image7.Visible := True;
    8 : Image8.Visible := True;
    9 : Image9.Visible := True;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if Button1.tag = 0 then
  begin
    Button1.tag := 1;
    Button1.caption := 'Stop';
    DurationMinutes := 25;
    DurationSeconds := 0;
    UpdateTime();
    Timer1.Enabled := True;
    PlayStart.Execute;
  end else
  begin
    Button1.tag := 0;
    Button1.caption := 'Start';
    DurationMinutes := 0;
    DurationSeconds := 0;
    UpdateTime();
    Timer1.Enabled := False;
    PlayStop.Execute;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Completed := 0;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  if (DurationMinutes = 0) and (DurationSeconds = 0) then
  begin
    Button1Click(Sender);
    SuccessfulFinish();
  end else if DurationSeconds > 0 then
  begin
    DurationSeconds -= 1;
  end else
  begin
    DurationMinutes -= 1;
    DurationSeconds := 59;
  end;
  UpdateTime();
end;

end.

