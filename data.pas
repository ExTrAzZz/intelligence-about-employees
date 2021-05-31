unit Data;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  // Тип структуры для представления сведений о пользователе
  TEmployeeRec = record
    Owner: string[64];      // Сотрудник
    Division: string[24];   // Подразделение
    Post: string[32];       // Должность
    BirthDay: TDateTime;    // День рождения
    Experience: integer;    // Опыт
    Salary: real;           // Оклад
    Prize: real;            // Премия
  end;
  var
    IsEditData: boolean;  // Признак редактирования данных в проекте

    FileName:string;

implementation

begin
  IsEditData:= False;

  FileName:='';
end.

