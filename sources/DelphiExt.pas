unit DelphiExt;

interface

uses
  System.SysUtils;

type
  EDelphiExtensions = class(Exception)

  end;

  EInvalidType = class(EDelphiExtensions)

  end;

  Tuple<T1, T2> = packed record
  private
  type
    PT1 = ^T1;
    PT2 = ^T2;
  public
    First: T1;
    Second: T2;
    function AssignAndGet1(out BindFirst: T1; out BindSecond: T2): T1;
    function AssignAndGet2(out BindFirst: T1; out BindSecond: T2): T2;
    procedure SetValues(const pFirst: T1; const pSecond: T2);
    constructor Create(const pFirst: T1; const pSecond: T2);
    class operator Implicit(Args: array of const): Tuple<T1, T2>;
  end;

implementation

function Tuple<T1, T2>.AssignAndGet1(out BindFirst: T1; out BindSecond: T2): T1;
begin
  BindFirst := First;
  BindSecond := Second;
  Result := BindFirst;
end;

function Tuple<T1, T2>.AssignAndGet2(out BindFirst: T1; out BindSecond: T2): T2;
begin
  BindFirst := First;
  BindSecond := Second;
  Result := BindSecond;
end;

constructor Tuple<T1, T2>.Create(const pFirst: T1; const pSecond: T2);
begin
  First := First;
  Second := Second;
end;

class operator Tuple<T1, T2>.Implicit(Args: array of const): Tuple<T1, T2>;
var
  lT1: PT1;
  lT2: PT2;
begin
  case Args[0].VType of
    vtInteger:
      lT1 := PT1(Pointer(Addr(Args[0].VInteger)));
    vtInt64:
      lT1 := PT1(Pointer(Args[0].VInt64));
    vtUnicodeString:
      lT1 := PT1(Pointer(Addr(Args[0].VUnicodeString)));
    vtString:
      lT1 := PT1(Args[0].VString);
    vtBoolean:
      lT1 := PT1(Addr(Args[0].VBoolean));
    vtExtended:
      lT1 := PT1(Args[0].VExtended);
    vtCurrency:
      lT1 := PT1(Args[0].VCurrency);
    vtInterface:
      lT1 := PT1(Args[0].VInterface);
    vtAnsiString:
      lT1 := PT1(Args[0].VAnsiString);
    vtVariant:
      lT1 := PT1(Args[0].VVariant);
    vtObject:
      lT1 := PT1(Args[0].VObject);
  else
    raise EInvalidType.Create('Unsupported type at index 0');
  end;

  case Args[1].VType of
    vtInteger:
      lT2 := PT2(Pointer(Addr(Args[1].VInteger)));
    vtInt64:
      lT2 := PT2(Pointer(Args[1].VInt64));
    vtUnicodeString:
      lT2 := PT2(Pointer(Addr(Args[1].VUnicodeString)));
    vtString:
      lT2 := PT2(Args[1].VString);
    vtBoolean:
      lT2 := PT2(Addr(Args[1].VBoolean));
    vtExtended:
      lT2 := PT2(Args[1].VExtended);
    vtCurrency:
      lT2 := PT2(Args[1].VCurrency);
    vtInterface:
      lT2 := PT2(Args[1].VInterface);
    vtAnsiString:
      lT2 := PT2(Args[1].VAnsiString);
    vtVariant:
      lT2 := PT2(Args[1].VVariant);
    vtObject:
      lT2 := PT2(Args[1].VObject);
  else
    raise EInvalidType.Create('Unsupported type at index 1');
  end;

  {
  vtChar          = 2;
  vtPointer       = 5;
  vtPChar         = 6;
  vtObject        = 7;
  vtClass         = 8;
  vtWideChar      = 9;
  vtPWideChar     = 10;
  vtAnsiString    = 11;
  vtCurrency      = 12;
  vtVariant       = 13;
  vtInterface     = 14;
  vtWideString    = 15;
  vtInt64         = 16;
  vtUnicodeString = 17;

  }
  Result.First := lT1^;
  Result.Second := lT2^;
end;

procedure Tuple<T1, T2>.SetValues(const pFirst: T1; const pSecond: T2);
begin
  First := pFirst;
  Second := pSecond;
end;

end.
