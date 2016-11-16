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
	Double Hour;	// ��
	Double Minutes;	// ��
	Double Second;	// �b

	// ���E���E�b�̏����ɂ������߂̕�����^�ϐ�
	UnicodeString tmpString;

	// ���݂̓������擾���܂��B
	timestamp = Now();


	// �b���擾���鏈��
	Second = SecondOf(timestamp);

	// �b�j�̊p�x��ς���B
	// 1�b�̊p�x�� 360 / 60 = 6 �Ȃ̂ŁA
	// �����p���ăR���|�[�l���g�̕\���p�x��ς��Ă���B
	// �Ȃ��A��]�̒��S�ʒu�͗\�� RotationCenter �̃v���p�e�B�Őݒ�ς݁B
	RoundRectSecond->RotationAngle = Second * 6;


	// �����擾���鏈��
	Minutes = MinuteOf(timestamp);

	// ���j�̊p�x��ς���B
	// 1���̊p�x�� 360 / 60 = 6 �����A���ꂾ���ł͂P�����Ƃɂ����j�������Ȃ��̂ŁA
	// �g�p���镪�̒l�ɏ����_�ȉ��ŕb�̒l���������ނ��ƂŃX���[�X�ɓ������悤�ɂ���B
	RoundRectMinute->RotationAngle = ( (Minutes + (Second/60) ) * 6);


	// �����擾���鏈��
	Hour = HourOf(timestamp);

	// ���j�̊p�x��ς���B
	// 1���Ԃ̊p�x�� 360 / 12 = 30 �ł���B
	// ����ɑ΂��ĕ��P�ʂ̒l�������_�ȉ��ɍ�������Ŏg���B
	RoundRectHour->RotationAngle = ( Hour + (Minutes/60) ) * 30;

	// �b�P�ʂ̓����ɂ����m�ɒǏ]���������Ȃ炱����̌v�Z�����g���B
	// RoundRectHour->RotationAngle = ( Hour + ( (Minutes+(Second/60)) /60) ) * 30;

	// ���ݎ����̃f�W�^���\���� TMemo �ɏo�͂���B
	Edit1->Text = timestamp.FormatString(L"hh:nn:ss");

}
//---------------------------------------------------------------------------
