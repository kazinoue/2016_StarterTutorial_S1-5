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
__published:	// IDE で管理されるコンポーネント
	TCircle *Circle1;
	TEdit *Edit1;
	TRoundRect *RoundRectHour;
	TRoundRect *RoundRectMinute;
	TRoundRect *RoundRectSecond;
	TTimer *Timer1;
	void __fastcall Timer1Timer(TObject *Sender);
private:	// ユーザー宣言
public:		// ユーザー宣言
	__fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
