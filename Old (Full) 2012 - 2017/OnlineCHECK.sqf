

_z = 0;
{
player sidechat format ["_x: %1", _x];
player sidechat format ["_z: %1", _z];

if(_x == Player)then
{
_NEW = Trouble2 select _z;
player sidechat format ["_NEW: %1", _NEW];
};
_z = _z + 1;
}foreach Trouble;

sleep 1;
//while{true}do{
sleep 1;
player globalchat format ["(Captive player): %1", (Captive player)];
sleep 0.1;
player sidechat format ["GiveUpChance: %1", GiveUpChance];
sleep 0.1;
player sidechat format ["GaveUp: %1", GaveUp];
sleep 0.1;
player sidechat format ["RestrainedPeople: %1", RestrainedPeople];
sleep 0.1;
//};


