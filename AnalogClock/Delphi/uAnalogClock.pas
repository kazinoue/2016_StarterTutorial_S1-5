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
  // 日付時刻型です。現在の日時を取り扱います。
  timestamp: TDateTime;

	// 時、分、秒は小数点が扱える数値型にします。
	// これは後述する角度の計算で小数点を含む計算が必要となるからです。
  Hour:    Double;
  Minutes: Double;
  Second:  Double;

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
	// 1分の角度は 360 / 60 = 6 なので、Minutes * 6 で一応は角度が計算できる。
	// しかし1分の動きが6度ということは10秒で1度動くわけで、この動きを無視することはできない。
	// よって使用する分の値に小数点以下で秒の値を混ぜ込むようことで滑らかに動かすようにする。
  RoundRectMinute.RotationAngle := ( (Minutes + (Second/60) ) * 6);


  // 時を取得する処理
  Hour := HourOf(timestamp);

	// 時針の角度を変える。
	// 1時間の角度は 360 / 12 = 30 だから Hour * 12 でもよいのだが、
	// これでは時針の動きが雑すぎるので分単位の動きは必須。
	// だから分単位の値を小数点以下に混ぜ込んで使う。
	// ただし秒単位の処理は省略してよい。なぜなら時針は2分間で1度しか動かないのに
	// 秒単位の動きを正確に再現しても認識できないから。
  RoundRectHour.RotationAngle := ( Hour + (Minutes/60) ) * 30;

	// しかし、どうしても秒単位の動きにも正確に追従させたいならこちらの計算式を使う。
  // RoundRectHour.RotationAngle := ( Hour + ( (Minutes+(Second/60)) /60) ) * 30;

  // 現在時刻のデジタル表示を TMemo に出力する。
  Edit1.Text := TimeToStr(timestamp);
end;

end.
