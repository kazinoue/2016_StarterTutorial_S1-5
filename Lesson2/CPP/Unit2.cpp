//---------------------------------------------------------------------------

#include <fmx.h>
#pragma hdrstop

#include "Unit2.h"
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
void __fastcall TForm2::Memo1KeyDown(TObject *Sender, WORD &Key, System::WideChar &KeyChar,
          TShiftState Shift)
{
	Edit1->Text = KeyChar;

	// Key �� WORD�^ = �����^�Ȃ̂ŁAEdit2 �ŕ\�����邽�߂ɂ�
	// ������^�ɕϊ����˂΂Ȃ�Ȃ��B
	Edit2->Text = IntToStr(Key);
}
//---------------------------------------------------------------------------

