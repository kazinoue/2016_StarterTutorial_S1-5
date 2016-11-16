unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ScrollBox,
  FMX.Memo, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button1DblClick(Sender: TObject);
    procedure Button1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure Button1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure Button2Click(Sender: TObject);
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
// シングルクリックのイベントハンドラ編集は、以下のいずれかで実行できます。
// ・[オブジェクトインスペクタ]から[イベント]タブの[OnClick]右側をダブルクリックする。
// ・フォーム内のボタン（対象オブジェクト）をダブルクリックする。
begin
  Memo1.Lines.Insert(0,'シングルクリック');
end;

procedure TForm1.Button1DblClick(Sender: TObject);
begin
  Memo1.Lines.Insert(0,'ダブルクリック');
end;

procedure TForm1.Button1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  Memo1.Lines.Insert(0,'ボタンを押し下げています');
end;

procedure TForm1.Button1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  Memo1.Lines.Insert(0,'ボタンから手を放しました');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Memo1.Lines.Clear;
end;

end.
