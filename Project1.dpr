program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'W10 Update Disabler';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
