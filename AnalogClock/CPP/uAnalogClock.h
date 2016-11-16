//---------------------------------------------------------------------------

#ifndef uAnalogClockH
#define uAnalogClockH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <FMX.Controls.hpp>
#include <FMX.Forms.hpp>
#include <FMX.Controls.Presentation.hpp>
#include <FMX.Edit.hpp>
#include <FMX.Objects.hpp>
#include <FMX.Types.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE �ŊǗ������R���|�[�l���g
	TCircle *Circle1;
	TEdit *Edit1;
	TRoundRect *RoundRectHour;
	TRoundRect *RoundRectMinute;
	TRoundRect *RoundRectSecond;
	TTimer *Timer1;
	void __fastcall Timer1Timer(TObject *Sender);
private:	// ���[�U�[�錾
public:		// ���[�U�[�錾
	__fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
