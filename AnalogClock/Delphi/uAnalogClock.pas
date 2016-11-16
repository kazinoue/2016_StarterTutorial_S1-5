unit uAnalogClock;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo, FMX.StdCtrls, FMX.Objects,
  System.DateUtils, FMX.Edit;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    Circle1: TCircle;
    RoundRectMinute: TRoundRect;
    RoundRectHour: TRoundRect;
    RoundRectSecond: TRoundRect;
    Edit1: TEdit;
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

procedure TForm1.Timer1Timer(Sender: TObject);
var
  timestamp: TDateTime;

  Hour:    Double;  // 時
  Minutes: Double;  // 分
  Second:  Double;  // 秒

  // tmpString: String;  // 時・分・秒の処理につかうための文字列型変数
begin
  timestamp := Now();

  // 秒を取得する処理
  Second := SecondOf(timestamp);

  // 秒針の角度を変える。
  // 1秒の角度は 360 / 60 = 6 なので、
  // それを用いてコンポーネントの表示角度を変えている。
  // なお、回転の中心位置は予め RotationCenter のプロパティで設定済み。
  RoundRectSecond.RotationAngle := Second * 6;


  // 分を取得する処理
  Minutes := MinuteOf(timestamp);

  // 分針の角度を変える。
  // 1分の角度は 360 / 60 = 6 だが、これだけでは１分ごとにしか針が動かないので、
  // 使用する分の値に小数点以下で秒の値を混ぜ込むことでスムースに動かすようにする。
  RoundRectMinute.RotationAngle := ( (Minutes + (Second/60) ) * 6);


  // 時を取得する処理
  Hour := HourOf(timestamp);

  // 時針の角度を変える。
  // 1時間の角度は 360 / 12 = 30 である。
  // これに対して分単位の値を小数点以下に混ぜ込んで使う。
  RoundRectHour.RotationAngle := ( Hour + (Minutes/60) ) * 30;

  // 秒単位の動きにも正確に追従させたいならこちらの計算式を使う。
  // RoundRect2.RotationAngle := ( Hour + ( (Minutes+(Second/60)) /60) ) * 30;

  // 現在時刻のデジタル表示を TMemo に出力する。
  Edit1.Text := TimeToStr(timestamp);
end;

end.
