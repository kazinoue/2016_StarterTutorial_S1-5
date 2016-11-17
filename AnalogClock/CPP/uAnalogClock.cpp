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
	// ���t�����^�ł��B���݂̓�������舵���܂��B
	TDateTime timestamp;

	// ���A���A�b�͏����_�������鐔�l�^�ɂ��܂��B
	// ����͌�q����p�x�̌v�Z�ŏ����_���܂ތv�Z���K�v�ƂȂ邩��ł��B
	Double Hour;
	Double Minutes;
	Double Second;


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
	// 1���̊p�x�� 360 / 60 = 6 �Ȃ̂ŁAMinutes * 6 �ňꉞ�͊p�x���v�Z�ł���B
	// ������1���̓�����6�x�Ƃ������Ƃ�10�b��1�x�����킯�ŁA���̓����𖳎����邱�Ƃ͂ł��Ȃ��B
	// ����Ďg�p���镪�̒l�ɏ����_�ȉ��ŕb�̒l���������ނ悤���ƂŊ��炩�ɓ������悤�ɂ���B
	RoundRectMinute->RotationAngle = ( (Minutes + (Second/60) ) * 6);


	// �����擾���鏈��
	Hour = HourOf(timestamp);

	// ���j�̊p�x��ς���B
	// 1���Ԃ̊p�x�� 360 / 12 = 30 ������ Hour * 12 �ł��悢�̂����A
	// ����ł͎��j�̓������G������̂ŕ��P�ʂ̓����͕K�{�B
	// �����番�P�ʂ̒l�������_�ȉ��ɍ�������Ŏg���B
	// �������b�P�ʂ̏����͏ȗ����Ă悢�B�Ȃ��Ȃ玞�j��2���Ԃ�1�x���������Ȃ��̂�
	// �b�P�ʂ̓����𐳊m�ɍČ����Ă��F���ł��Ȃ�����B
	RoundRectHour->RotationAngle = ( Hour + (Minutes/60) ) * 30;

	// �������A�ǂ����Ă��b�P�ʂ̓����ɂ����m�ɒǏ]���������Ȃ炱����̌v�Z�����g���B
	// RoundRectHour->RotationAngle = ( Hour + ( (Minutes+(Second/60)) /60) ) * 30;

	// ���ݎ����̃f�W�^���\���� TMemo �ɏo�͂���B
	Edit1->Text = timestamp.FormatString(L"hh:nn:ss");

}
//---------------------------------------------------------------------------
