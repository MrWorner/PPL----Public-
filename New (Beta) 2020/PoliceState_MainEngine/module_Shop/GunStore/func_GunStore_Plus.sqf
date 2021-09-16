//func_GunStore_Plus
private["_ValueFromEdit"];
 _ValueFromEdit = parseNumber (ctrlText 51406); 

  if(_ValueFromEdit < 1)then
 {
	 _ValueFromEdit = 1;  
 };
_ValueFromEdit = _ValueFromEdit + 1;

ctrlSetText [51406, format ["%1",_ValueFromEdit]];