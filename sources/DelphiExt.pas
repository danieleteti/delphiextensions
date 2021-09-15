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
  private type
    PT1 = ^T1;
    PT2 = ^T2;
  public
    First: T1;
    Second: T2;
    function AssignAndGet1(out BindFirst: T1; out BindSecond: T2): T1;
    function AssignAndGet2(out BindFirst: T1; out BindSecond: T2): T2;
    procedure SetTuple(const pFirst: T1; const pSecond: T2);
    constructor MakeTuple(const pFirst: T1; const pSecond: T2);
    class operator Implicit(Args: array of const): Tuple<T1, T2>;
  end;

  Tuple<T1, T2, T3> = packed record
  private type
    PT1 = ^T1;
    PT2 = ^T2;
    PT3 = ^T3;
  public
    First: T1;
    Second: T2;
    Third: T3;
    function AssignAndGet1(out BindFirst: T1; out BindSecond: T2;
      BindThird: T3): T1;
    function AssignAndGet2(out BindFirst: T1; out BindSecond: T2;
      BindThird: T3): T2;
    function AssignAndGet3(out BindFirst: T1; out BindSecond: T2;
      BindThird: T3): T3;
    procedure SetTuple(const pFirst: T1; const pSecond: T2; const pThird: T3);
    constructor MakeTuple(const pFirst: T1; const pSecond: T2;
      const pThird: T3);
    class operator Implicit(Args: array of const): Tuple<T1, T2, T3>;
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

constructor Tuple<T1, T2>.MakeTuple(const pFirst: T1; const pSecond: T2);
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

procedure Tuple<T1, T2>.SetTuple(const pFirst: T1; const pSecond: T2);
begin
  First := pFirst;
  Second := pSecond;
end;

{ Tuple<T1, T2, T3> }

function Tuple<T1, T2, T3>.AssignAndGet1(out BindFirst: T1; out BindSecond: T2;
  BindThird: T3): T1;
begin
  BindFirst := First;
  BindSecond := Second;
  BindThird := Third;
  Result := BindFirst;
end;

function Tuple<T1, T2, T3>.AssignAndGet2(out BindFirst: T1; out BindSecond: T2;
  BindThird: T3): T2;
begin
  BindFirst := First;
  BindSecond := Second;
  BindThird := Third;
  Result := BindSecond;
end;

function Tuple<T1, T2, T3>.AssignAndGet3(out BindFirst: T1; out BindSecond: T2;
  BindThird: T3): T3;
begin
  BindFirst := First;
  BindSecond := Second;
  BindThird := Third;
  Result := BindThird;
end;

class operator Tuple<T1, T2, T3>.Implicit(Args: array of const)
  : Tuple<T1, T2, T3>;
var
  lT1: PT1;
  lT2: PT2;
  lT3: PT3;
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

  case Args[2].VType of
    vtInteger:
      lT3 := PT3(Pointer(Addr(Args[2].VInteger)));
    vtInt64:
      lT3 := PT3(Pointer(Args[2].VInt64));
    vtUnicodeString:
      lT3 := PT3(Pointer(Addr(Args[2].VUnicodeString)));
    vtString:
      lT3 := PT3(Args[2].VString);
    vtBoolean:
      lT3 := PT3(Addr(Args[2].VBoolean));
    vtExtended:
      lT3 := PT3(Args[2].VExtended);
    vtCurrency:
      lT3 := PT3(Args[2].VCurrency);
    vtInterface:
      lT3 := PT3(Args[2].VInterface);
    vtAnsiString:
      lT3 := PT3(Args[2].VAnsiString);
    vtVariant:
      lT3 := PT3(Args[2].VVariant);
    vtObject:
      lT3 := PT3(Args[2].VObject);
  else
    raise EInvalidType.Create('Unsupported type at index 2');
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
  Result.Third := lT3^;

end;

constructor Tuple<T1, T2, T3>.MakeTuple(const pFirst: T1; const pSecond: T2;
  const pThird: T3);
begin
  First := pFirst;
  Second := pSecond;
  Third := pThird;
end;

procedure Tuple<T1, T2, T3>.SetTuple(const pFirst: T1; const pSecond: T2;
  const pThird: T3);
begin
  First := pFirst;
  Second := pSecond;
  Third := pThird;
end;

end.
