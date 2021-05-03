MODULE HelloWorld;

IMPORT Hello;

BEGIN Hello.HelloWorld();
END HelloWorld.

obnc -o HelloWorld HelloWorld.Mod
./HelloWorld
