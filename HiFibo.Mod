MODULE HiFibo;

IMPORT Hello;

BEGIN Hello.HiFibo();
END HiFibo.

obnc -o HiFibo HiFibo.Mod
./HiFibo
