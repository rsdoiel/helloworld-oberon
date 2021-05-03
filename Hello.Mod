MODULE Hello;

IMPORT Out, Env := extEnv, Fibonacci;

PROCEDURE HelloWorld*();
BEGIN
  Out.String("Hello World!");Out.Ln();
END HelloWorld;

PROCEDURE HelloFriend*();
VAR friend : ARRAY 128 OF CHAR; res : INTEGER;
BEGIN
  Env.Get("USER", friend, res);
  Out.String("Hello ");Out.String(friend); Out.Ln();
END HelloFriend;

PROCEDURE HiFibo*();
VAR i : INTEGER;
BEGIN
  Out.String("Hi, I'm Fibonacci, I count");Out.Ln();
  FOR i := 0 TO 12 DO
    Out.Int(Fibonacci.Fibonacci(), 1);Out.Ln();
  END;
END HiFibo;

END Hello.


END Hello.
