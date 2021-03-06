unit Unit2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Edit1: TEdit;
    Edit2: TEdit;
    procedure Memo1KeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
  private
    { private 宣言 }
  public
    { public 宣言 }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Memo1KeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
begin
  Edit1.Text := KeyChar;

	// Key は Word型 = 数字型なので、Edit2 で表示するためには
	// 文字列型に変換せねばならない。
  Edit2.Text := Key.toString;
end;

end.
