unit edit_unit;

{$mode ObjFPC}{$H+}

interface

uses
Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,
ExtCtrls;

type

{ TEditForm }

TEditForm = class(TForm)
AckCB: TCheckBox;
TypeCB: TComboBox;
TypeLabel: TLabel;
CodeEdit: TLabeledEdit;
NameEdit: TLabeledEdit;
CountEdit: TLabeledEdit;
PriceEdit: TLabeledEdit;
OKButton: TBitBtn;
CancelButton: TBitBtn;
ElementAdd_GB: TGroupBox;

private

public

end;

var
EditForm: TEditForm;

implementation

{$R *.lfm}

{ TEditForm }


end.

