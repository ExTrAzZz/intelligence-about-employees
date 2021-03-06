unit EmployeeEdit;

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
   MaskEdit, EditBtn, Spin, ExtDlgs,
// Подключаем модули проекта
Data;

type
  
  { TForm2 }

  TForm2 = class(TForm)
    BtnOk: TButton;
    BtnCancel: TButton;
    EDivision: TComboBox;
    EPost: TComboBox;
    ComDate: TDateEdit;
    EEmployee: TEdit;
    ESalary: TEdit;
    EPrize: TEdit;
    EExperience: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Panel1: TPanel;
    procedure ComDateChange(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    // Метод-функция для получения данных из компонент ввода
    function GetEmployee: TEmployeeRec;
    // Метод-процедура для записи данных в компоненты ввода
    procedure SetEmployee(const AEmployee: TEmployeeRec);
    // Метод-функция для проверки заполнения обязательных полей
    function DataIsAll:boolean;
  public
    // Свойство-структура для представления записи о сотрудниках
    property EmployeeRec: TEmployeeRec read GetEmployee write SetEmployee;
  end;

  // Функция для обращения к форме из главной формы
  function ShowEmployeeEdit(const InitialEmployee: TEmployeeRec; var OutEmployee: TEmployeeRec):byte;

var
  Form2: TForm2;

implementation

{$R *.lfm}

// Функция для обращения к форме из главной формы
function ShowEmployeeEdit(const InitialEmployee: TEmployeeRec; var OutEmployee: TEmployeeRec):byte;
begin
  // Создание экземпляра формы
  Form2:= TForm2.Create(Application);
  with Form2 do
       try
         // Установка начального значения
         EmployeeRec:= InitialEmployee;

         // Вывод формы на экран в модальном режиме
         ShowModal;

         // Проверка способа закрытия формы
         if ModalResult = mrOk then
            // Если форма закрыта нажатием BtnOk, т.е изменения подтверждены
            begin
              OutEmployee:= EmployeeRec;  // Возвращаем измененное значение
              result:= mrOK;           // и признак подтверждения (OK)
            end
         else
             // Если форма закрыта любым другим способом, т.е изменения отменены
             begin
               OutEmployee:= InitialEmployee; // Возвращает первоначальное значение
               result:= mrCancel;           // и признак отмены (Cansel)
             end;
       finally
         Free; // Уничтожение экземпляра формы и освобождение ресурсов
       end;
end;

// Метод-функция для проверки заполнения обязательных полей
function TForm2.DataIsAll:boolean;
begin
  if (EEmployee.Text <> '') // Сотрудник
     then result:= true
     else result:= false;
end;

// Обработчик изменения данных в компонентах ввода
procedure TForm2.ComDateChange(Sender: TObject);
begin
  // Установка доступности кнопки подтверждения
  BtnOk.Enabled:=DataIsAll;
end;

// Обработчки события показа формы
procedure TForm2.FormShow(Sender: TObject);
begin
  // Формирование загаловка формы и кнопки BtnOk
  if EmployeeRec.Owner = '' then
     // Форма в режиме добавления
     begin
       // Текст заголовка формы
       Caption:= 'Добавить сотрудника';
       // Иконка формы
       Icon.LoadFromFile(ExtractFilePath(Application.ExeName)+'\addphone.ico');

       // Кнопка OK
       BtnOk.Caption:='Добавить';
       BtnOk.Hint:='Добавить сотрудника в список';
     end
  else
      // Форма в режиме редактирования
      begin
        // Текс заголовка формы
        Caption:= 'Редактирование пользователя';
        // Иконка формы
        Icon.LoadFromFile(ExtractFilePath(Application.ExeName)+'\editphone.ico');

        // Кнопка OK
        BtnOK.Caption:='Изменить';
        BtnOK.Hint:='Изменить данные сотрудника';
      end;

      // Кнопка подтверждения недоступна, будет доступна после редактирования
      // и заполнения всех обязательных полей
      BtnOK.Enabled:= False;
end;

// Метод-функции для получения данных из компонент ввода
function TForm2.GetEmployee: TEmployeeRec;
var
  EmRec: TEmployeeRec;
begin
  with EmRec do
       begin
         Owner:= EEmployee.Text;
         Division:= EDivision.Text;
         Post:= EPost.Text;
         BirthDay:= ComDate.Date;
         Experience:= StrToInt(EExperience.Text);
         Salary:= StrToFloat(ESalary.Text);
         Prize:= StrToFloat(EPrize.Text);
       end;
  result:= EmRec;
end;

// Метод-процедура для записи данных в компоненты ввода
procedure TForm2.SetEmployee(const AEmployee: TEmployeeRec);
begin
  with AEmployee do
       begin
         EEmployee.Text:= Owner;
         EDivision.Text:= Division;
         EPost.Text:= Post;
         ComDate.Date:= BirthDay;
         EExperience.Text:= IntToStr(Experience);
         ESalary.Text:=FloatToStr(Salary);
         EPrize.Text:=FloatToStr(Prize);
       end;
end;

end.

