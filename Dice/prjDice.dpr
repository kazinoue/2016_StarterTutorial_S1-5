program prjDice;

uses
  System.StartUpCopy,
  FMX.Forms,
  uDice in 'uDice.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
