MODULE Fibonacci;

VAR first, second, out : INTEGER;

PROCEDURE Init*();
BEGIN
  first := 0;
  second := 1;
  out := first + second;
END Init;

PROCEDURE Fibonacci*() : INTEGER;
BEGIN
  out := first + second; first := second; second := out;
  RETURN out
END Fibonacci;

BEGIN Init();
END Fibonacci.

This is a test module. It should be "portable" between POSIX
and Oberon System.

