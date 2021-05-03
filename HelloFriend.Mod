MODULE HelloFriend;

IMPORT Hello;

BEGIN Hello.HelloFriend();
END HelloFriend.

obnc -o HelloFriend HelloFriend.Mod
./HelloFriend
