//---------------------------------------------------------------------------

#include <fmx.h>
#pragma hdrstop

#include <DateUtils.hpp>
#include "uAnalogClock.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.fmx"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Timer1Timer(TObject *Sender)
{
	TDateTime timestamp;
	Double Hour;	// 時
	Double Minutes;	// 分
	Double Second;	// 秒

	// 時・分・秒の処理につかうための文字列型変数
	UnicodeString tmpString;

	// 現在の日時を取得します。
	timestamp = Now();


	// 秒を取得する処理
	Second = SecondOf(timestamp);

	// 秒針の角度を変える。
	// 1秒の角度は 360 / 60 = 6 なので、
	// それを用いてコンポーネントの表示角度を変えている。
	// なお、回転の中心位置は予め RotationCenter のプロパティで設定済み。
	RoundRectSecond->RotationAngle = Second * 6;


	// 分を取得する処理
	Minutes = MinuteOf(timestamp);

	// 分針の角度を変える。
	// 1分の角度は 360 / 60 = 6 だが、これだけでは１分ごとにしか針が動かないので、
	// 使用する分の値に小数点以下で秒の値を混ぜ込むことでスムースに動かすようにする。
	RoundRectMinute->RotationAngle = ( (Minutes + (Second/60) ) * 6);


	// 時を取得する処理
	Hour = HourOf(timestamp);

	// 時針の角度を変える。
	// 1時間の角度は 360 / 12 = 30 である。
	// これに対して分単位の値を小数点以下に混ぜ込んで使う。
	RoundRectHour->RotationAngle = ( Hour + (Minutes/60) ) * 30;

	// 秒単位の動きにも正確に追従させたいならこちらの計算式を使う。
	// RoundRectHour->RotationAngle = ( Hour + ( (Minutes+(Second/60)) /60) ) * 30;

	// 現在時刻のデジタル表示を TMemo に出力する。
	Edit1->Text = timestamp.FormatString(L"hh:nn:ss");

}
//---------------------------------------------------------------------------
