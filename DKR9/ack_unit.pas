unit ack_unit;

{$mode ObjFPC}{$H+}

interface

uses
Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons;

type

{ TDialogForm }

TDialogForm = class(TForm)
OkButton: TBitBtn;
CancelButton: TBitBtn;
InfoLabel: TLabel;
private

public

end;

var
DialogForm: TDialogForm;

implementation

{$R *.lfm}

end.

