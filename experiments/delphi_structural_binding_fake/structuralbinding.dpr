program structuralbinding;

{$APPTYPE CONSOLE}

{$R *.res}


uses
  System.SysUtils,
  DelphiExt in '..\..\sources\DelphiExt.pas';


function GetMulti: Tuple<Boolean, String>;
begin
  Result := [True, 'Hello World'];
end;

procedure Main;
var
  a: boolean;
  b: String;
  c: integer;
begin
  var t := GetMulti;

  begin
    var tt: Tuple<Integer, String> := [1,'ciao'];
    if tt.AssignAndGet1(c,b) = 1 then
    begin
      WriteLn(b);
    end;
  end;

  begin
    var tt: Tuple<Boolean, String> := [true,'ciao'];
    if tt.AssignAndGet1(a,b) then
    begin
      WriteLn(b);
    end;
  end;

  begin
    var tt: Tuple<Boolean, String> := [true,'ciao'];
    if tt.AssignAndGet1(a,b) then
    begin
      WriteLn(b);
    end;
  end;

  if GetMulti.AssignAndGet1(a,b) then
  begin
    WriteLn(b);
  end;
end;

begin
  try
    Main;
    ReadLn;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

end.
