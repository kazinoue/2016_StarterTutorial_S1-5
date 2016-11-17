//---------------------------------------------------------------------------

#include <fmx.h>
#pragma hdrstop

#include "Unit1.h"
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

// シングルクリックのイベントハンドラ編集は、以下のいずれかで実行できます。
// ・[オブジェクトインスペクタ]から[イベント]タブの[OnClick]右側をダブルクリックする。
// ・フォーム内のボタン（対象オブジェクト）をダブルクリックする。
void __fastcall TForm2::Button1Click(TObject *Sender)
{
	// 文字列を記述するときは L"" と表現します。
	// Delphi では Memo1.Lines.Insert と記述しましたが、
	// C++ の場合は . のかわりに -> を用いている点にご注意ください。

	// Lines->Insert は指定の場所に行を差し込む処理です。
	// 0 は 0 行目に差し込む = 先頭行に差し込むことを意味します。
	Memo1->Lines->Insert(0,L"シングルクリック");
}
//---------------------------------------------------------------------------

void __fastcall TForm2::Button1DblClick(TObject *Sender)
{
	Memo1->Lines->Insert(0,L"ダブルクリック");
}
//---------------------------------------------------------------------------

void __fastcall TForm2::Button1MouseDown(TObject *Sender, TMouseButton Button, TShiftState Shift,
		  float X, float Y)
{
	Memo1->Lines->Insert(0,L"ボタンを押し下げています");
}
//---------------------------------------------------------------------------

void __fastcall TForm2::Button1MouseUp(TObject *Sender, TMouseButton Button, TShiftState Shift,
		  float X, float Y)
{
	Memo1->Lines->Insert(0,L"ボタンを離しました");
}
//---------------------------------------------------------------------------

void __fastcall TForm2::Button2Click(TObject *Sender)
{
	// 行をすべて消したいので Lines->Clear(); を実行しています。
	Memo1->Lines->Clear();
}
//---------------------------------------------------------------------------

