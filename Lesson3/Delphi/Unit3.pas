unit Unit3;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Controls.Presentation, FMX.Edit, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Components, FMX.ScrollBox, FMX.Memo;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    Layout1: TLayout;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Memo1: TMemo;
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { private 宣言 }
  public
    { public 宣言 }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Memo1.Lines.Insert(0,'インターバルを 1000 に変更します');
  Timer1.interval := 1000;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Memo1.Lines.Insert(0,'インターバルを 2000 に変更します');
  Timer1.interval := 2000;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Memo1.Lines.Insert(0,'インターバルを 500 に変更します');
  Timer1.interval := 500;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Memo1.Lines.Insert(0,DateTimetoStr(Now()));
end;

end.
