unit Main_unit;

{$mode objfpc}{$H+}

interface

uses
Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, Grids,
StdCtrls, Buttons, Menus, ExtCtrls, edit_unit, ack_unit, quary_unit;

type

{ TMainForm }

TMainForm = class(TForm)
AddButton: TBitBtn;
AddTypeButton: TButton;
CodeFieldCB: TCheckBox;
CodeParameterCB: TComboBox;
NameParameterCB: TComboBox;
TypeParameterCB: TComboBox;
CountParameterCB: TComboBox;
PriceParameterCB: TComboBox;
AckParameterCB: TComboBox;
CodeParameterEdit: TEdit;
NameParameterEdit: TEdit;
TypeParameterEdit: TEdit;
CountParameterEdit: TEdit;
PriceParameterEdit: TEdit;
NameFieldCB: TCheckBox;
TypeFieldCB: TCheckBox;
CountFieldCB: TCheckBox;
PriceFieldCB: TCheckBox;
AckFieldCB: TCheckBox;
FieladLebel: TLabel;
ParametersLabel: TLabel;
QuaryButton: TButton;
ColorButton: TButton;
ColorDialog: TColorDialog;
FomtChangeButton: TButton;
DellTypeButton: TButton;
CodeNumberCB: TCheckBox;
EditButton: TBitBtn;
DelButton: TBitBtn;
FontDialog: TFontDialog;
AboutProgramMenuElement: TMenuItem;
QuaryParametersGB: TGroupBox;
Posibilitis: TMenuItem;
Develop: TMenuItem;
VisualSettingsGB: TGroupBox;
PossibleTypeEdit: TLabeledEdit;
TableSettingsGB: TGroupBox;
MainMenu: TMainMenu;
FileMenuElement: TMenuItem;
NewElement: TMenuItem;
SaveElement: TMenuItem;
OpenDialog: TOpenDialog;
OpenMenuElement: TMenuItem;
ExitMenuElement: TMenuItem;
SaveDialog: TSaveDialog;
SortButton: TBitBtn;
SortFieldCB: TComboBox;
Sort_GB: TGroupBox;
Record_GB: TGroupBox;
MainControlPage: TPageControl;
Table: TStringGrid;
TablePage: TTabSheet;
QuaryPage: TTabSheet;
SttingsPage: TTabSheet;


 type
    ElementRecord = record
      ECode : string[20];
      EName : string[100];
      EType : string[100];
      ECount : integer;
      EPrice : double;
      EAck : boolean;
  end;


 procedure AckFieldCBChange(Sender: TObject);
procedure AddButtonClick(Sender: TObject);
procedure AddTypeButtonClick(Sender: TObject);
procedure CodeFieldCBChange(Sender: TObject);
procedure CodeNumberCBChange(Sender: TObject);
procedure ColorButtonClick(Sender: TObject);
procedure CountFieldCBChange(Sender: TObject);
procedure DelButtonClick(Sender: TObject);
procedure DellTypeButtonClick(Sender: TObject);
procedure DevelopClick(Sender: TObject);
procedure EditButtonClick(Sender: TObject);
procedure ExitMenuElementClick(Sender: TObject);
procedure FomtChangeButtonClick(Sender: TObject);
procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
procedure NameFieldCBChange(Sender: TObject);
procedure NewElementClick(Sender: TObject);
procedure OpenMenuElementClick(Sender: TObject);
procedure PosibilitisClick(Sender: TObject);
procedure PriceFieldCBChange(Sender: TObject);
procedure QuaryButtonClick(Sender: TObject);
procedure SaveElementClick(Sender: TObject);
procedure SortButtonClick(Sender: TObject);
procedure TypeFieldCBChange(Sender: TObject);

private

public

end;



var
MainForm: TMainForm;
FilePath: string;
PrimaryKeyArray: array of string;

implementation

{$R *.lfm}

{ TMainForm }

//________________________________________________________________Методы работы с объектом MainMenu_____________________________________________________________________________

procedure TMainForm.NewElementClick(Sender: TObject);   // Обработка события создания нового файла пользователем
var
    OutPutFile : file of ElementRecord;
    OutPutElement: ElementRecord;
    i: integer;
    NewPath: string;
begin
    // Считываем новый файл через диалог
    try
        if SaveDialog.Execute = True then
            NewPath := SaveDialog.FileName;
    except
    end;
    // Проверяем необходимые условия, что данный файл не текущий, и что пользователь действительно его выбрал, иначе метод завершиться
    if not((FilePath = NewPath) or (NewPath = '')) then
    begin
        // Проверяем, открыт ли какой либо файл, для сохранения в него перед очисткой таблицы
        if FilePath <> '' then
        begin
            AssignFile(OutPutFile, FilePath);
            Rewrite(OutPutFile);
            for i:= 1 to Table.RowCount - 1 do
                begin
                OutPutElement.ECode := Table.Cells[0, i];
                OutPutElement.EName := Table.Cells[1, i];
                OutPutElement.EType := Table.Cells[2, i];
                OutPutElement.ECount := strtoint(Table.Cells[3, i]);
                OutPutElement.EPrice := strtofloat(Table.Cells[4, i]);
                if Table.Cells[5, i] = 'Да' then
                    OutPutElement.EAck := True
                else
                    OutPutElement.EAck := False;
                Write(OutPutFile, OutPutElement);
            end;
            CloseFile(OutPutFile);
        end;
        // Изменяем атрибут адреса файла и очищаем таблицу
        FilePath := NewPath;
        Table.RowCount := 1;
        MainForm.Caption:= 'База данных ТопШоп \' + FilePath;
    end;
end;



procedure TMainForm.OpenMenuElementClick(Sender: TObject); // Самое сложное событие открытия нового файла
var
    InputFile: file of ElementRecord;
    OutPutFile: file of ElementRecord;
    OutPutElement: ElementRecord;
    ReadElement: ElementRecord;
    i: integer;
    NewPath: string;
begin
    // Проверяем наличие адреса сохраненного файла, если его нет - запрашиваем у пользователя
    if FilePath = '' then
    begin
        ack_unit.DialogForm.InfoLabel.Caption := 'Сохранить текущую таблицу?';
        ack_unit.DialogForm.ShowModal;
        if ack_unit.DialogForm.ModalResult = 1 then
            try
                 if SaveDialog.Execute = True then
                    FilePath := SaveDialog.FileName;
            except
            end;
    end;


    // Через диалог получаем адрес файла
    try
       if OpenDialog.Execute = True then
            NewPath := OpenDialog.FileName;
    except
    end;
    // Проверяем, не равен ли этот адрес предыдущему, и то, что пользователь выбрал адрес, а  не просто закрыл окно
    if not((FilePath = NewPath) or (NewPath = '')) then
    begin
        // Сохраняем все данные в текущий открытый файл, если таковой имеется
        if FilePath <> '' then
        begin
            AssignFile(OutPutFile, FilePath);
            Rewrite(OutPutFile);
            for i:= 1 to Table.RowCount - 1 do
            begin
               OutPutElement.ECode := Table.Cells[0, i];
               OutPutElement.EName := Table.Cells[1, i];
               OutPutElement.EType := Table.Cells[2, i];
               OutPutElement.ECount := strtoint(Table.Cells[3, i]);
               OutPutElement.EPrice := strtofloat(Table.Cells[4, i]);
               if Table.Cells[5, i] = 'Да' then
                   OutPutElement.EAck := True
               else
                   OutPutElement.EAck := False;
               Write(OutPutFile, OutPutElement);
               SetLength(PrimaryKeyArray, 0);
           end;
            CloseFile(OutPutFile);
        end;

        // Очищаем таблицу и изменяем адрес текущего файла на введенный
        FilePath := NewPath;
        Table.RowCount := 1;
        MainForm.Caption := 'База данных ТопШоп \' + FilePath;
        // Считываем таблицу из введенного файла
        AssignFile(InputFile, FilePath);
        Reset(InputFile);
        while not EOf(InputFile) do
        begin
            Read(InputFile, ReadElement);
            Table.RowCount := Table.RowCount + 1;
            Table.Cells[0, Table.RowCount - 1] := ReadElement.ECode;
            Table.Cells[1, Table.RowCount - 1] := ReadElement.EName;
            Table.Cells[2, Table.RowCount - 1] := ReadElement.EType;
            Table.Cells[3, Table.RowCount - 1] := inttostr(ReadElement.ECount);
            Table.Cells[4, Table.RowCount - 1] := floattostr(ReadElement.EPrice);
            if ReadElement.EAck = True then
                Table.Cells[5, Table.RowCount - 1] := 'Да'
            else
                Table.Cells[5, Table.RowCount - 1] := 'Нет'
        end;
        CloseFile(InputFile);

    end;
end;



procedure TMainForm.SaveElementClick(Sender: TObject);
var
    OutPutFile: file of ElementRecord;
    OutPutElement: ElementRecord;
    i : integer;
begin
    // Проверяяем есть ли открытый файл базы, если его нет, предлагаем пользователю создать его
    if FilePath = '' then
         try
            ack_unit.DialogForm.InfoLabel.Caption := 'Создать новый файл для сохранения?';
            ack_unit.DialogForm.ShowModal;
            if ack_unit.DialogForm.ModalResult = 1 then
                if SaveDialog.Execute = True then
                    FilePath := SaveDialog.FileName;
         except
         end;
    // Если файл был изначально, или его создал пользователь, необходимо сохранить информацию в него
    if FilePath <> '' then
    begin
        AssignFile(OutPutFile, FilePath);
        Rewrite(OutPutFile);
        for i:= 1 to Table.RowCount - 1 do
        begin
            OutPutElement.ECode := Table.Cells[0, i];
            OutPutElement.EName := Table.Cells[1, i];
            OutPutElement.EType := Table.Cells[2, i];
            OutPutElement.ECount := strtoint(Table.Cells[3, i]);
            OutPutElement.EPrice := strtofloat(Table.Cells[4, i]);
            if Table.Cells[5, i] = 'Да' then
                OutPutElement.EAck := True
            else
                OutPutElement.EAck := False;
            Write(OutPutFile, OutPutElement);
        end;
        CloseFile(OutPutFile);
    end;
 end;



procedure TMainForm.ExitMenuElementClick(Sender: TObject);
begin
    MainForm.Close;
end;



procedure TMainForm.FormClose(Sender: TObject; var CloseAction: TCloseAction); // СобытияЮ отслвеживающее закрытие приложения для сохранения файла
var
    OutPutFile: file of ElementRecord;
    OutPutElement: ElementRecord;
    i : integer;
begin
    if FilePath = '' then // Если файл не открыт, необходимо предложить пользователю создать его
        try
           ack_unit.DialogForm.InfoLabel.Caption := 'Создать новый файл для сохранения?';
           ack_unit.DialogForm.ShowModal;
           if ack_unit.DialogForm.ModalResult = 1 then
                if SaveDialog.Execute = True then
                    FilePath := SaveDialog.FileName;
        except
        end;

    if FilePath <> '' then  // Если файл был изначально, или его создал пользователь, необходимо сохранить данные таблицы в него
    begin
        AssignFile(OutPutFile, FilePath);
        Rewrite(OutPutFile);
        for i:= 1 to Table.RowCount - 1 do
        begin
            OutPutElement.ECode := Table.Cells[0, i];
            OutPutElement.EName := Table.Cells[1, i];
            OutPutElement.EType := Table.Cells[2, i];
            OutPutElement.ECount := strtoint(Table.Cells[3, i]);
            OutPutElement.EPrice := strtofloat(Table.Cells[4, i]);
            if Table.Cells[5, i] = 'Да' then
                OutPutElement.EAck := True
            else
                OutPutElement.EAck := False;
            Write(OutPutFile, OutPutElement);
        end;
        CloseFile(OutPutFile);
    end;
end;



procedure TMainForm.PosibilitisClick(Sender: TObject);
begin
    showmessage('Программа ТопШоп предоставляет базовые возможности работы с базой данных, включая настройку и редактирование табличной базы и составление алиментарных запросов.');
end;

procedure TMainForm.DevelopClick(Sender: TObject);
begin
    showmessage('Программа ТопШоп разработана в рамках курса МДК 05.02 "Разработка кода ИС" и является свободно распространяемым программным обеспечением.');
end;


//_________________________________________________________________Методы работы с главным табличным окном__________________________________________________________________________

procedure TMainForm.AddButtonClick(Sender: TObject);
var
    price_for_checking_correct_input: double;
    row:integer;
begin
    // Очищаем окно редактирования
    edit_unit.EditForm.CodeEdit.Clear;
    edit_unit.EditForm.NameEdit.Clear;
    edit_unit.EditForm.CountEdit.Clear;
    edit_unit.EditForm.PriceEdit.Clear;
    edit_unit.EditForm.TypeCB.Text := 'Нет';
    edit_unit.EditForm.AckCB.Checked:=False;


    // Открываем и обрабатываем события пользователя в окне редактирования
    edit_unit.EditForm.ShowModal;

    if edit_unit.EditForm.ModalResult = 2 then
        exit()
    else if edit_unit.EditForm.CodeEdit.Text = '' then
        showmessage('Пропущено ключевое поле "Код товара"!')
    else
    begin
        for row:= 1 to Table.RowCount - 1 do
            if (edit_unit.EditForm.CodeEdit.Text = Table.Cells[0, row]) then
            begin
                showmessage('Данный ключ уже присутствует в таблице!');
                exit();
            end;
        try
           price_for_checking_correct_input :=  strtofloat(edit_unit.EditForm.PriceEdit.text);
        except
           showmessage('Неверно введена цена!');
           exit();
        end;

        Table.RowCount:= Table.RowCount + 1;
        Table.Cells[0, Table.RowCount - 1] := edit_unit.EditForm.CodeEdit.Text;
        Table.Cells[1, Table.RowCount - 1] := edit_unit.EditForm.NameEdit.Text;
        Table.Cells[2, Table.RowCount - 1] := edit_unit.EditForm.TypeCB.Text;
        Table.Cells[3, Table.RowCount - 1] := edit_unit.EditForm.CountEdit.Text;
        Table.Cells[4, Table.RowCount - 1] := floattostr(price_for_checking_correct_input);
        if edit_unit.EditForm.AckCB.Checked = True then
           Table.Cells[5, Table.RowCount - 1] := 'Да'
        else
           Table.Cells[5, Table.RowCount - 1] := 'Нет';
    end;
end;



procedure TMainForm.DelButtonClick(Sender: TObject);
begin
    if Table.Row < 1 then
        exit();
    ack_unit.DialogForm.InfoLabel.Caption := 'Подтвердить удаление записи №' + inttostr(Table.Row) + '?';
    ack_unit.DialogForm.ShowModal;
    if  ack_unit.DialogForm.ModalResult = 1 then
        Table.DeleteRow(Table.Row);
end;



procedure TMainForm.EditButtonClick(Sender: TObject);
var
    price_for_checking_correct_input: double;
    row: integer;
begin
    // Проверяем выбранное поле
    if Table.Row < 1 then
        exit();

    // Загружаем данные в окно редактирования
    edit_unit.EditForm.CodeEdit.Text := Table.Cells[0, Table.Row];
    edit_unit.EditForm.NameEdit.Text := Table.Cells[1, Table.Row];
    edit_unit.EditForm.TypeCB.Text := Table.Cells[2, Table.Row];
    edit_unit.EditForm.CountEdit.Text := Table.Cells[3, Table.Row];
    edit_unit.EditForm.PriceEdit.text := Table.Cells[4, Table.Row];
    if Table.Cells[5, Table.Row] = 'Да' then
        edit_unit.EditForm.AckCB.Checked := True
    else
        edit_unit.EditForm.AckCB.Checked := False;

     // Открываем и обрабатываем ввод в окно редактирования
    edit_unit.EditForm.ShowModal;

    if edit_unit.EditForm.ModalResult = 2 then
        exit()
    else if edit_unit.EditForm.CodeEdit.Text = '' then
        showmessage('Пропущено ключевое поле "Код товара"!')
    else
    begin
        for row:= 1 to Table.RowCount - 1 do
            if (edit_unit.EditForm.CodeEdit.Text = Table.Cells[0, row]) and (row <> Table.Row) then
            begin
                showmessage('Данный ключ уже присутствует в таблице!');
                exit();
            end;
        try
           price_for_checking_correct_input :=  strtofloat(edit_unit.EditForm.PriceEdit.text);
        except
           showmessage('Неверно введена цена!');
           exit();
        end;

        Table.Cells[0, Table.Row] := edit_unit.EditForm.CodeEdit.Text;
        Table.Cells[1, Table.Row] := edit_unit.EditForm.NameEdit.Text;
        Table.Cells[2, Table.Row] := edit_unit.EditForm.TypeCB.Text;
        Table.Cells[3, Table.Row] := edit_unit.EditForm.CountEdit.Text;
        Table.Cells[4, Table.Row] := floattostr(price_for_checking_correct_input);
        if edit_unit.EditForm.AckCB.Checked = True then
           Table.Cells[5, Table.Row] := 'Да'
        else
           Table.Cells[5, Table.Row] := 'Нет';

    end;
end;


procedure TMainForm.SortButtonClick(Sender: TObject);
begin
    case SortFieldCB.ItemIndex of
        0:  Table.SortColRow(True, 1);
        1:  Table.SortColRow(True, 2);
        2:  Table.SortColRow(True, 5);
    end;
end;


//______________________________________________________________________________Методы для работы окна настроек____________________________________________________________________

procedure TMainForm.CodeNumberCBChange(Sender: TObject);
begin
     edit_unit.EditForm.CodeEdit.NumbersOnly:= CodeNumberCb.Checked;
end;


procedure TMainForm.AddTypeButtonClick(Sender: TObject);
var
    types: integer;
    UserType:string;
begin
    UserType :=  PossibleTypeEdit.Text;
    PossibleTypeEdit.Clear;

    if UserType <> '' then
    begin
       for types:= 0 to edit_unit.EditForm.TypeCB.Items.Count - 1 do
           if  edit_unit.EditForm.TypeCB.Items.Strings[types] = UserType then
           begin
               showmessage('Данный тип уже присутствует!');
               exit();
           end;
           edit_unit.EditForm.TypeCB.Items.Add(UserType);
           showmessage('Тип успешно добавлен!');
    end;


end;


procedure TMainForm.DellTypeButtonClick(Sender: TObject);
var
   types: integer;
   UserType:string;
begin
    UserType := PossibleTypeEdit.Text;
    PossibleTypeEdit.Clear;

    if (UserType <> '') and (UserType <> 'Нет') then
    begin
       for types:= 0 to edit_unit.EditForm.TypeCB.Items.Count - 1 do
           if  edit_unit.EditForm.TypeCB.Items.Strings[types] = UserType then
           begin
               edit_unit.EditForm.TypeCB.Items.Delete(types);
               showmessage('Тип успешно удален!');
               exit();
           end;
           showmessage('Данный тип отсутствует!');
    end;

end;


procedure TMainForm.FomtChangeButtonClick(Sender: TObject);
var
   UserFont: TFont;
begin
    try
      if FontDialog.Execute = True then
          UserFont := FontDialog.Font;
    except
    end;

    if UserFont <> Nil then
    begin
        MainForm.Font := UserFont;
        edit_unit.EditForm.Font := UserFont;
        ack_unit.DialogForm.Font := UserFont;
        quary_unit.QuaryForm.Font := UserFont;
    end;



end;


procedure TMainForm.ColorButtonClick(Sender: TObject);
var
   UserColor: TColor;
begin
   try
      if ColorDialog.Execute = True then
          UserColor := ColorDialog.Color;
    except
    end;

    MainForm.Color := UserColor;
    edit_unit.EditForm.Color := UserColor;
    ack_unit.DialogForm.Color := UserColor;
    quary_unit.QuaryForm.Color := UserColor;


end;


//____________________________________________________________________________Методы для окна запросов______________________________________________________________________________


procedure TMainForm.CodeFieldCBChange(Sender: TObject);
begin
    CodeParameterCB.Enabled := CodeFieldCB.Checked;
    CodeParameterEdit.Enabled:= CodeFieldCB.Checked;
    if CodeFieldCB.Checked = False then
    begin
        CodeParameterCB.Text:= 'Нет условия';
        CodeParameterEdit.Clear;
    end;
end;

procedure TMainForm.NameFieldCBChange(Sender: TObject);
begin
    NameParameterCB.Enabled := NameFieldCB.Checked;
    NameParameterEdit.Enabled:= NameFieldCB.Checked;
    if NameFieldCB.Checked = False then
    begin
        NameParameterCB.Text:= 'Нет условия';
        NameParameterEdit.Clear;
    end;
end;

procedure TMainForm.TypeFieldCBChange(Sender: TObject);
begin
    TypeParameterCB.Enabled := TypeFieldCB.Checked;
    TypeParameterEdit.Enabled:= TypeFieldCB.Checked;
    if TypeFieldCB.Checked = False then
    begin
        TypeParameterCB.Text:= 'Нет условия';
        TypeParameterEdit.Clear;
    end;
end;

procedure TMainForm.CountFieldCBChange(Sender: TObject);
begin
    CountParameterCB.Enabled := CountFieldCB.Checked;
    CountParameterEdit.Enabled:= CountFieldCB.Checked;
    if CountFieldCB.Checked = False then
    begin
        CountParameterCB.Text:= 'Нет условия';
        CountParameterEdit.Clear;
    end;
end;

procedure TMainForm.PriceFieldCBChange(Sender: TObject);
begin
    PriceParameterCB.Enabled := PriceFieldCB.Checked;
    PriceParameterEdit.Enabled:= PriceFieldCB.Checked;
    if PriceFieldCB.Checked = False then
    begin
        PriceParameterCB.Text:= 'Нет условия';
        PriceParameterEdit.Clear;
    end;
end;

procedure TMainForm.AckFieldCBChange(Sender: TObject);
begin
    AckParameterCB.Enabled := AckFieldCB.Checked;
    if AckFieldCB.Checked = False then
        AckParameterCB.Text:= 'Нет условия';
end;



procedure TMainForm.QuaryButtonClick(Sender: TObject);
var
   FirstParameter, SecondParameter, ThirdParameter, FourthParameter, FifthParameter, SixthParameter: boolean;
   MainTableRow, ColomnQuaryNumber: integer;
begin
    quary_unit.QuaryForm.QuaryTable.RowCount:= 1;
    quary_unit.QuaryForm.QuaryTable.ColCount:= 0;

    if CodeFieldCB.Checked = True then
    begin
       quary_unit.QuaryForm.QuaryTable.ColCount := quary_unit.QuaryForm.QuaryTable.ColCount + 1;
       quary_unit.QuaryForm.QuaryTable.Cells[quary_unit.QuaryForm.QuaryTable.ColCount - 1, 0] := 'Код товара';
    end;

    if NameFieldCB.Checked = True then
    begin
       quary_unit.QuaryForm.QuaryTable.ColCount := quary_unit.QuaryForm.QuaryTable.ColCount + 1;
       quary_unit.QuaryForm.QuaryTable.Cells[quary_unit.QuaryForm.QuaryTable.ColCount - 1, 0] := 'Наименовение';
    end;

    if TypeFieldCB.Checked = True then
    begin
       quary_unit.QuaryForm.QuaryTable.ColCount := quary_unit.QuaryForm.QuaryTable.ColCount + 1;
       quary_unit.QuaryForm.QuaryTable.Cells[quary_unit.QuaryForm.QuaryTable.ColCount - 1, 0] := 'Тип товара';
    end;

    if CountFieldCB.Checked = True then
    begin
       quary_unit.QuaryForm.QuaryTable.ColCount := quary_unit.QuaryForm.QuaryTable.ColCount + 1;
       quary_unit.QuaryForm.QuaryTable.Cells[quary_unit.QuaryForm.QuaryTable.ColCount - 1, 0] := 'Количество товара на складе';
    end;

    if PriceFieldCB.Checked = True then
    begin
       quary_unit.QuaryForm.QuaryTable.ColCount := quary_unit.QuaryForm.QuaryTable.ColCount + 1;
       quary_unit.QuaryForm.QuaryTable.Cells[quary_unit.QuaryForm.QuaryTable.ColCount - 1, 0] := 'Цена товара';
    end;

    if AckFieldCB.Checked = True then
    begin
       quary_unit.QuaryForm.QuaryTable.ColCount := quary_unit.QuaryForm.QuaryTable.ColCount + 1;
       quary_unit.QuaryForm.QuaryTable.Cells[quary_unit.QuaryForm.QuaryTable.ColCount - 1, 0] := 'Является подакцизным';
    end;

    for MainTableRow:= 1 to Table.RowCount - 1 do
    begin
         if (CodeFieldCB.Checked = False) or (CodeParameterCB.Text = 'Нет условия') or ((CodeParameterCB.Text = 'Равно') and (Table.Cells[0, MainTableRow] = CodeParameterEdit.Text)) or ((CodeParameterCB.Text = 'Содержит') and (Pos(CodeParameterEdit.Text, Table.Cells[0, MainTableRow]) <> 0)) then
            FirstParameter := True
         else
            FirstParameter := False;

         if (NameFieldCB.Checked = False) or (NameParameterCB.Text = 'Нет условия') or ((NameParameterCB.Text = 'Равно') and (Table.Cells[1, MainTableRow] = NameParameterEdit.Text)) or ((NameParameterCB.Text = 'Содержит') and (Pos(NameParameterEdit.Text, Table.Cells[1, MainTableRow]) <> 0)) then
            SecondParameter := True
         else
            SecondParameter := False;

         if (TypeFieldCB.Checked = False) or (TypeParameterCB.Text = 'Нет условия') or ((TypeParameterCB.Text = 'Равно') and (Table.Cells[2, MainTableRow] = TypeParameterEdit.Text)) or ((TypeParameterCB.Text = 'Содержит') and (Pos(TypeParameterEdit.Text, Table.Cells[2, MainTableRow]) <> 0)) then
            ThirdParameter := True
         else
            ThirdParameter := False;

         if (CountFieldCB.Checked = False) or (CountParameterCB.Text = 'Нет условия') or ((CountParameterCB.Text = 'Равно') and (strtoint(Table.Cells[3, MainTableRow]) = strtoint(CountParameterEdit.Text))) or ((CountParameterCB.Text = 'Не равно') and (strtoint(Table.Cells[3, MainTableRow]) <> strtoint(CountParameterEdit.Text))) or ((CountParameterCB.Text = 'Больше') and (strtoint(Table.Cells[3, MainTableRow]) > strtoint(CountParameterEdit.Text))) or ((CountParameterCB.Text = 'Меньше') and (strtoint(Table.Cells[3, MainTableRow]) < strtoint(CountParameterEdit.Text))) then
            FourthParameter := True
         else
            FourthParameter := False;

         if (PriceFieldCB.Checked = False) or (PriceParameterCB.Text = 'Нет условия') or ((PriceParameterCB.Text = 'Равно') and (strtoint(Table.Cells[4, MainTableRow]) = strtoint(PriceParameterEdit.Text))) or ((PriceParameterCB.Text = 'Не равно') and (strtoint(Table.Cells[4, MainTableRow]) <> strtoint(PriceParameterEdit.Text))) or ((PriceParameterCB.Text = 'Больше') and (strtoint(Table.Cells[4, MainTableRow]) > strtoint(PriceParameterEdit.Text))) or ((PriceParameterCB.Text = 'Меньше') and (strtoint(Table.Cells[4, MainTableRow]) < strtoint(PriceParameterEdit.Text))) then
            FifthParameter := True
         else
            FifthParameter := False;

         if (AckFieldCB.Checked = False) or (AckParameterCB.Text = 'Нет условия') or ((AckParameterCB.Text = 'Подакцизный') and (Table.Cells[5, MainTableRow] = 'Да')) or ((AckParameterCB.Text = 'Не подакцизный') and (Table.Cells[5, MainTableRow] = 'Нет')) then
            SixthParameter := True
         else
            SixthParameter := False;

         if FirstParameter and SecondParameter and ThirdParameter and FourthParameter and FifthParameter and SixthParameter then
         begin
            quary_unit.QuaryForm.QuaryTable.RowCount := quary_unit.QuaryForm.QuaryTable.RowCount + 1;
            ColomnQuaryNumber := 0;

            if CodeFieldCB.Checked = True then
            begin
               quary_unit.QuaryForm.QuaryTable.Cells[ColomnQuaryNumber, quary_unit.QuaryForm.QuaryTable.RowCount - 1] := Table.Cells[0, MainTableRow];
               ColomnQuaryNumber += 1;
            end;

            if NameFieldCB.Checked = True then
            begin
               quary_unit.QuaryForm.QuaryTable.Cells[ColomnQuaryNumber, quary_unit.QuaryForm.QuaryTable.RowCount - 1] := Table.Cells[1, MainTableRow];
               ColomnQuaryNumber += 1;
            end;

            if TypeFieldCB.Checked = True then
            begin
               quary_unit.QuaryForm.QuaryTable.Cells[ColomnQuaryNumber, quary_unit.QuaryForm.QuaryTable.RowCount - 1] := Table.Cells[2, MainTableRow];
               ColomnQuaryNumber += 1;
            end;

            if CountFieldCB.Checked = True then
            begin
               quary_unit.QuaryForm.QuaryTable.Cells[ColomnQuaryNumber, quary_unit.QuaryForm.QuaryTable.RowCount - 1] := Table.Cells[3, MainTableRow];
               ColomnQuaryNumber += 1;
            end;

            if PriceFieldCB.Checked = True then
            begin
               quary_unit.QuaryForm.QuaryTable.Cells[ColomnQuaryNumber, quary_unit.QuaryForm.QuaryTable.RowCount - 1] := Table.Cells[4, MainTableRow];
               ColomnQuaryNumber += 1;
            end;

            if AckFieldCB.Checked = True then
            begin
               quary_unit.QuaryForm.QuaryTable.Cells[ColomnQuaryNumber, quary_unit.QuaryForm.QuaryTable.RowCount - 1] := Table.Cells[5, MainTableRow];
               ColomnQuaryNumber += 1;
            end;
         end;
    end;



    quary_unit.QuaryForm.Show;
end;

end.

