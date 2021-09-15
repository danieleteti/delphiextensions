program DelphiExtTest;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  DelphiExt in '..\sources\DelphiExt.pas',
  TupleTests in 'TupleTests.pas',
  Commons in 'Commons.pas';

begin
  try
    TupleTests.RunTests;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
  Write('Press return to continue...');
  ReadLn;
end.
