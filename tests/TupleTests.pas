unit TupleTests;

interface

procedure RunTests;

implementation

uses Commons, DelphiExt, System.SysUtils;

function GetTupleOf2_1: Tuple<String, Integer>;
begin
  Result := ['Hello World', 42]; //not checked at compile time
end;

function GetTupleOf2_2: Tuple<String, Boolean>;
begin
  Result := [1234, True]; //not checked at compile time
end;

function GetTupleOf2_3: Tuple<String, TDateTime>;
begin
  // compile time checked
  Result := Tuple<String, TDateTime>.MakeTuple('mystring', EncodeDate(2021, 9, 15));
end;

function GetTupleOf3_1: Tuple<String, Integer, TDate>;
begin
  Result := ['Hello World', 42, EncodeDate(2021, 9, 15)]; //not checked at compile time
end;

function GetTupleOf3_2: Tuple<String, Boolean, Extended>;
begin
  Result := [1234, True, 1234.5678]; //not checked at compile time
end;

function GetTupleOf3_3: Tuple<String, TDateTime, Boolean>;
begin
  // compile time checked
  Result := Tuple<String, TDateTime, Boolean>
    .MakeTuple('mystring', EncodeDate(2021, 9, 15), True);
end;


procedure TestInitFromArray_Int_Int;
begin
  var t: Tuple<Integer, Integer> := [1, 2];
  Assert(t.First = 1);
  Assert(t.Second = 2);
  var t1: Tuple<Int8, UInt8> := [1, 2];
  Assert(t.First = 1);
  Assert(t.Second = 2);
  var t2: Tuple<Int16, UInt16> := [1, 2];
  Assert(t.First = 1);
  Assert(t.Second = 2);
  var t3: Tuple<Int32, UInt32> := [1, 2];
  Assert(t.First = 1);
  Assert(t.Second = 2);
  var t4: Tuple<Int64, UInt64> := [1, 2];
  Assert(t.First = 1);
  Assert(t.Second = 2);
end;

procedure TestInitFromArray_String_Boolean;
begin
  var t: Tuple<String, Boolean> := ['test', True];
  Assert(t.First = 'test');
  Assert(t.Second);

  var t1: Tuple<String, Boolean> := ['test', false];
  Assert(t1.First = 'test');
  Assert(not t1.Second);
end;

procedure RunTests;
begin
  WriteLn(StringOfChar('~', 5) + ' TupleTests '.PadRight(30, '~'));
  Run('TestInitFromArray_Int_Int', TestInitFromArray_Int_Int);
  Run('TestInitFromArray_String_Boolean', TestInitFromArray_String_Boolean);
end;

end.
