unit About;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons;

type

  { TForm3 }

  TForm3 = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
  private

  public


  end;
  // Функция для обращения к форме из главной формы
  procedure ShowAbout;
var
  Form3: TForm3;

implementation

{$R *.lfm}
procedure ShowAbout;
begin
  // Создание экземпляра формы
  Form3:= TForm3.Create(Application);
  with Form3 do
    try
      // Вывод формы на экран в модальном режиме
      ShowModal;
    finally
      Free; // Уничтожение экземпляра формы и освобождение ресурсов
    end;
end;
end.

