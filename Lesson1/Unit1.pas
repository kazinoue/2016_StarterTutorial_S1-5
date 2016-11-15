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
    { private �錾 }
  public
    { public �錾 }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
// �V���O���N���b�N�̃C�x���g�n���h���ҏW�́A�ȉ��̂����ꂩ�Ŏ��s�ł��܂��B
// �E[�I�u�W�F�N�g�C���X�y�N�^]����[�C�x���g]�^�u��[OnClick]�E�����_�u���N���b�N����B
// �E�t�H�[�����̃{�^���i�ΏۃI�u�W�F�N�g�j���_�u���N���b�N����B
begin
  Memo1.Lines.Insert(0,'�V���O���N���b�N');
end;

procedure TForm1.Button1DblClick(Sender: TObject);
begin
  Memo1.Lines.Insert(0,'�_�u���N���b�N');
end;

procedure TForm1.Button1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  Memo1.Lines.Insert(0,'�{�^�������������Ă��܂�');
end;

procedure TForm1.Button1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  Memo1.Lines.Insert(0,'�{�^������������܂���');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Memo1.Lines.Clear;
end;

end.
