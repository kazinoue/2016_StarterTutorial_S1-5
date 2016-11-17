//---------------------------------------------------------------------------

#include <fmx.h>
#pragma hdrstop

#include "Unit3.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.fmx"
TForm2 *Form2;
//---------------------------------------------------------------------------
__fastcall TForm2::TForm2(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm2::Button3Click(TObject *Sender)
{
	Memo1->Lines->Insert(0,L"インターバルを 500 に変更します");
	Timer1->Interval = 500;
}
//---------------------------------------------------------------------------
void __fastcall TForm2::Button1Click(TObject *Sender)
{
	Memo1->Lines->Insert(0,L"インターバルを 1000 に変更します");
	Timer1->Interval = 1000;
}
//---------------------------------------------------------------------------
void __fastcall TForm2::Button2Click(TObject *Sender)
{
	Memo1->Lines->Insert(0,L"インターバルを 2000 に変更します");
	Timer1->Interval = 2000;
}
//---------------------------------------------------------------------------

void __fastcall TForm2::Timer1Timer(TObject *Sender)
{
	// 現在の日付時刻は Now() で取得できます。
	// 取得した値は TDateTime 型であり、これはそのまま表示できないため、
	// DateTimetoStr() という関数で文字列型に変換しています。
	Memo1->Lines->Insert(0,DateTimeToStr(Now()));
}
//---------------------------------------------------------------------------

