unit Commons;

interface

type
  TTestProc = procedure;

procedure Run(const Desc: String; const TestProc: TTestProc);

implementation

uses
  System.SysUtils;

procedure Run(const Desc: String; const TestProc: TTestProc);
begin
  Write(Desc.PadRight(50, '.'));
  try
    TestProc();
    WriteLn('OK');
  except
    on E: Exception do
    begin
      WriteLn('FAILED');
      WriteLn(E.Message);
    end;
  end;
end;

end.
