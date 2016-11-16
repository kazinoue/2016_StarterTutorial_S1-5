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

	// Key ‚Í WORDŒ^ = ”ŽšŒ^‚È‚Ì‚ÅAEdit2 ‚Å•\Ž¦‚·‚é‚½‚ß‚É‚Í
	// •¶Žš—ñŒ^‚É•ÏŠ·‚¹‚Ë‚Î‚È‚ç‚È‚¢B
	Edit2->Text = IntToStr(Key);
}
//---------------------------------------------------------------------------

