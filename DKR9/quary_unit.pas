unit quary_unit;

{$mode ObjFPC}{$H+}

interface

uses
Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Grids;

type

{ TQuaryForm }

TQuaryForm = class(TForm)
QuaryTable: TStringGrid;
private

public

end;

var
QuaryForm: TQuaryForm;

implementation

{$R *.lfm}

end.

