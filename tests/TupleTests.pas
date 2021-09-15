unit TupleTests;

interface

procedure RunTests;

implementation

uses Commons, DelphiExt, System.SysUtils;

procedure TestInitFromArray_Int_Int;
begin
  var t: Tuple<Integer, Integer> := [1,2];
  Assert(t.First = 1);
  Assert(t.Second = 2);
  var t1: Tuple<Int8, UInt8> := [1,2];
  Assert(t.First = 1);
  Assert(t.Second = 2);
  var t2: Tuple<Int16, UInt16> := [1,2];
  Assert(t.First = 1);
  Assert(t.Second = 2);
  var t3: Tuple<Int32, UInt32> := [1,2];
  Assert(t.First = 1);
  Assert(t.Second = 2);
  var t4: Tuple<Int64, UInt64> := [1,2];
  Assert(t.First = 1);
  Assert(t.Second = 2);
end;

procedure TestInitFromArray_String_Boolean;
begin
  var t: Tuple<String, Boolean> := ['test',true];
  Assert(t.First = 'test');
  Assert(t.Second);

  var t1: Tuple<String, Boolean> := ['test',false];
  Assert(t1.First = 'test');
  Assert(not t1.Second);
end;


procedure RunTests;
begin
  WriteLn(StringOfChar('~', 5) + ' TupleTests '.PadRight(30,'~'));
  Run('TestInitFromArray_Int_Int', TestInitFromArray_Int_Int);
  Run('TestInitFromArray_String_Boolean', TestInitFromArray_String_Boolean);
end;

end.
