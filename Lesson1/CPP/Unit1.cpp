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

// �V���O���N���b�N�̃C�x���g�n���h���ҏW�́A�ȉ��̂����ꂩ�Ŏ��s�ł��܂��B
// �E[�I�u�W�F�N�g�C���X�y�N�^]����[�C�x���g]�^�u��[OnClick]�E�����_�u���N���b�N����B
// �E�t�H�[�����̃{�^���i�ΏۃI�u�W�F�N�g�j���_�u���N���b�N����B
void __fastcall TForm2::Button1Click(TObject *Sender)
{
	// ��������L�q����Ƃ��� L"" �ƕ\�����܂��B
	// Delphi �̏ꍇ�Ƃ͈���� -> ��p���Ă���_�ɂ����ӂ��������B
	Memo1->Lines->Insert(0,L"�V���O���N���b�N");
}
//---------------------------------------------------------------------------

void __fastcall TForm2::Button1DblClick(TObject *Sender)
{
	Memo1->Lines->Insert(0,L"�_�u���N���b�N");
}
//---------------------------------------------------------------------------

void __fastcall TForm2::Button1MouseDown(TObject *Sender, TMouseButton Button, TShiftState Shift,
		  float X, float Y)
{
	Memo1->Lines->Insert(0,L"�{�^�������������Ă��܂�");
}
//---------------------------------------------------------------------------

void __fastcall TForm2::Button1MouseUp(TObject *Sender, TMouseButton Button, TShiftState Shift,
		  float X, float Y)
{
	Memo1->Lines->Insert(0,L"�{�^���𗣂��܂���");
}
//---------------------------------------------------------------------------

void __fastcall TForm2::Button2Click(TObject *Sender)
{
	Memo1->Lines->Clear();
}
//---------------------------------------------------------------------------

