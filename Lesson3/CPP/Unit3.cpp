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
	Memo1->Lines->Insert(0,L"�C���^�[�o���� 500 �ɕύX���܂�");
	Timer1->Interval = 500;
}
//---------------------------------------------------------------------------
void __fastcall TForm2::Button1Click(TObject *Sender)
{
	Memo1->Lines->Insert(0,L"�C���^�[�o���� 1000 �ɕύX���܂�");
	Timer1->Interval = 1000;
}
//---------------------------------------------------------------------------
void __fastcall TForm2::Button2Click(TObject *Sender)
{
	Memo1->Lines->Insert(0,L"�C���^�[�o���� 2000 �ɕύX���܂�");
	Timer1->Interval = 2000;
}
//---------------------------------------------------------------------------

void __fastcall TForm2::Timer1Timer(TObject *Sender)
{
	// ���݂̓��t������ Now() �Ŏ擾�ł��܂��B
	// �擾�����l�� TDateTime �^�ł���A����͂��̂܂ܕ\���ł��Ȃ����߁A
	// DateTimetoStr() �Ƃ����֐��ŕ�����^�ɕϊ����Ă��܂��B
	Memo1->Lines->Insert(0,DateTimeToStr(Now()));
}
//---------------------------------------------------------------------------

