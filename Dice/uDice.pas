unit uDice;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ScrollBox,
  FMX.Memo, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TForm1 = class(TForm)
    ButtonThrowDice: TButton;
    Memo1: TMemo;
    ButtonWhileLoop: TButton;
    ButtonUntilLoop: TButton;
    procedure ButtonThrowDiceClick(Sender: TObject);
    procedure ButtonWhileLoopClick(Sender: TObject);
    procedure ButtonUntilLoopClick(Sender: TObject);
  private
    { private �錾 }
  public
    { public �錾 }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.ButtonThrowDiceClick(Sender: TObject);
var
  // �ϐ� DiceValue �̒�`
  //
  // �����ł͎��Ƃœ��͂��Ă������A
  // IDE �̓��͎x���@�\���g���Ύ��Ƃœ��͂���K�v�͂Ȃ��B
  // ���̕ϐ������o�ꂵ���ӏ��� [ctrl] ���ۂɂ� begin - end �̊Ԃ�
  // Ctrl + Shift + V �����������Ŏ����I�ɕϐ���`���ǉ��ł���B
  DiceValue: Integer;

begin

  // Random(6) �� 0, 1, 2, 3, 4, 5 �̒l���Ƃ�̂ŁA
  // ��������Ƃ��Ďg�����߂� + 1 ����B
  DiceValue := Random(6) + 1;

  // Memo1 �̐擪�ɂ�������̒l���������ށB
  // DiceValue �͐��l�^�iInteger) �����ǁA
  // �\���̍ۂ͕�����^�ɂ���K�v������̂� toString ���w�肷��B
  Memo1.Lines.Insert(0, DiceValue.toString );

  // if���ɂ���������
  if (DiceValue = 1) then
    Memo1.Lines.Insert(0, DiceValue.toString + '���o�܂���');

end;

procedure TForm1.ButtonUntilLoopClick(Sender: TObject);
var
  DiceValue: Integer;
begin
  Memo1.Lines.Insert(0,'');

  repeat
    // ���������U��B
    DiceValue := Random(6) + 1;

    // DiceValue �̌��ʂ� OK ���ǂ����́A���̎��_�ł͔��f�ł��Ȃ��̂�
    // �P�ɒl������\�����Ă���B

    // while ���[�v�̃T���v���Ɠ��l�� '�͂���' �̕������o�������ꍇ��
    // ������ if ����p���Ĕ�����s���΂悢�B
    Memo1.Lines.Insert(0, DiceValue.toString);

    // until �ŏ����ꍇ�́A���[�v�̌p��������f���ɏ����΂悢�B
    // �܂�u6 ���o��܂ŌJ��Ԃ��v�ꍇ��
    // DiceValue = 6 �� until ���[�v�̏I�������ƂȂ�B
  until (DiceValue = 6);

  // ���̏����� while �̌�ɂ���̂ŁA
  // ����̎����ł� while �̏������s�����ƂȂ������
  // ���Ȃ炸���s����鏈���ƂȂ�B
  Memo1.Lines.Insert(0, DiceValue.toString + ' �L�^�[' );
end;

procedure TForm1.ButtonWhileLoopClick(Sender: TObject);
var
  DiceValue: Integer;
begin
  Memo1.Lines.Insert(0, '');

  // ���������U��B
  DiceValue := Random(6) + 1;

  // while ���[�v�́A�����𖞂����Ԃ͏��������s����B
  // �u1���o��܂ŌJ��Ԃ��v�Ƃ��������́u�P���o�Ȃ��Ԃ͌J��Ԃ��v��
  // �\�����邱�Ƃ��ł���B
  // �Ȃ��Awhile���[�v�͍ŏ��Ɍp�������̔�����s�����߁A
  // while �̑O�ɒl���ݒ肳��Ă��邱�Ƃ��K�v�B
  while (DiceValue <> 1) do
  begin
    Memo1.Lines.Insert(0, DiceValue.toString + ' �͂���' );

    // ���������U��B
    DiceValue := Random(6) + 1;
  end;

  // ���̏����� while �̌�ɂ���̂ŁA
  // ����̎����ł� while �̏������s�����ƂȂ������
  // ���Ȃ炸���s����鏈���ƂȂ�B
  Memo1.Lines.Insert(0, DiceValue.toString + ' �L�^�[' );
end;

end.
