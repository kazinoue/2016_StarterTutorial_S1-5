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
    { private 宣言 }
  public
    { public 宣言 }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.ButtonThrowDiceClick(Sender: TObject);
var
  // 変数 DiceValue の定義
  //
  // 実演では手作業で入力していたが、
  // IDE の入力支援機能を使えば手作業で入力する必要はない。
  // その変数名が登場した箇所で [ctrl] 実際には begin - end の間で
  // Ctrl + Shift + V を押すだけで自動的に変数定義が追加できる。
  DiceValue: Integer;

begin

  // Random(6) は 0, 1, 2, 3, 4, 5 の値をとるので、
  // さいころとして使うために + 1 する。
  DiceValue := Random(6) + 1;

  // Memo1 の先頭にさいころの値を差し込む。
  // DiceValue は数値型（Integer) だけど、
  // 表示の際は文字列型にする必要があるので toString を指定する。
  Memo1.Lines.Insert(0, DiceValue.toString );

  // if文による条件分岐
  if (DiceValue = 1) then
    Memo1.Lines.Insert(0, DiceValue.toString + 'が出ました');

end;

procedure TForm1.ButtonUntilLoopClick(Sender: TObject);
var
  DiceValue: Integer;
begin
  Memo1.Lines.Insert(0,'');

  repeat
    // さいころを振る。
    DiceValue := Random(6) + 1;

    // DiceValue の結果が OK かどうかは、この時点では判断できないので
    // 単に値だけを表示している。

    // while ループのサンプルと同様に 'はずれ' の文字を出したい場合は
    // ここに if 文を用いて判定を行えばよい。
    Memo1.Lines.Insert(0, DiceValue.toString);

    // until で書く場合は、ループの継続条件を素直に書けばよい。
    // つまり「6 が出るまで繰り返す」場合は
    // DiceValue = 6 が until ループの終了条件となる。
  until (DiceValue = 6);

  // この処理は while の後にあるので、
  // 今回の実装では while の条件が不成立となった後に
  // かならず実行される処理となる。
  Memo1.Lines.Insert(0, DiceValue.toString + ' キター' );
end;

procedure TForm1.ButtonWhileLoopClick(Sender: TObject);
var
  DiceValue: Integer;
begin
  Memo1.Lines.Insert(0, '');

  // さいころを振る。
  DiceValue := Random(6) + 1;

  // while ループは、条件を満たす間は処理を実行する。
  // 「1が出るまで繰り返す」という処理は「１が出ない間は繰り返す」と
  // 表現することができる。
  // なお、whileループは最初に継続条件の判定を行うため、
  // while の前に値が設定されていることが必要。
  while (DiceValue <> 1) do
  begin
    Memo1.Lines.Insert(0, DiceValue.toString + ' はずれ' );

    // さいころを振る。
    DiceValue := Random(6) + 1;
  end;

  // この処理は while の後にあるので、
  // 今回の実装では while の条件が不成立となった後に
  // かならず実行される処理となる。
  Memo1.Lines.Insert(0, DiceValue.toString + ' キター' );
end;

end.
