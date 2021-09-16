//FUNC_GunShop_SET_WeaponsToSell_RANDOM
private["_this","_Dealer","_chance","_Added"];

_Dealer = _this;
_chance = 60;
_Added = 0;


_Dealer setVariable ["ShopItems_HandGuns",[],true]; //GUN STORE
_Dealer setVariable ["ShopItems_ShotGuns",[],true]; //GUN STORE
_Dealer setVariable ["ShopItems_SMGs",[],true]; //GUN STORE
_Dealer setVariable ["ShopItems_AssaultRifles",[],true]; //GUN STORE
_Dealer setVariable ["ShopItems_SniperRifles",[],true]; //GUN STORE
_Dealer setVariable ["ShopItems_MachineGuns",[],true]; //GUN STORE


if(random 100 > 50)then
{
	{
		if(_chance > random 100)then
		{
			_Dealer setVariable ["ShopItems_ShotGuns",((_Dealer getVariable "ShopItems_ShotGuns") + [_x]),true];
			_Added = _Added + 1;
		};
	
	}foreach GunStore_ShotGuns_ALL;
};

if(random 100 > 50)then
{
	{
		if(_chance > random 100)then
		{
			_Dealer setVariable ["ShopItems_SMGs",((_Dealer getVariable "ShopItems_SMGs") + [_x]),true];
			_Added = _Added + 1;
		};
	
	}foreach GunStore_SMGs_ALL;
};

if(random 100 > 75)then
{
	{
		if(_chance > random 100)then
		{
			_Dealer setVariable ["ShopItems_AssaultRifles",((_Dealer getVariable "ShopItems_AssaultRifles") + [_x]),true];
			_Added = _Added + 1;
		};
	
	}foreach GunStore_AssaultRifles_ALL;
};

if(random 100 > 85)then
{
	{
		if(_chance > random 100)then
		{
			_Dealer setVariable ["ShopItems_SniperRifles",((_Dealer getVariable "ShopItems_SniperRifles") + [_x]),true];
			_Added = _Added + 1;
		};
	
	}foreach GunStore_SniperRifles_ALL;
};

if(random 100 > 85)then
{
	{
		if(_chance > random 100)then
		{
			_Dealer setVariable ["ShopItems_MachineGuns",((_Dealer getVariable "ShopItems_MachineGuns") + [_x]),true];
			_Added = _Added + 1;
		};
	
	}foreach GunStore_MachineGuns_ALL;
};


if(random 100 > 25 or _Added == 0)then
{
	{
		if(_chance > random 100)then
		{
			_Dealer setVariable ["ShopItems_HandGuns",((_Dealer getVariable "ShopItems_HandGuns") + [_x]),true];
		};
	
	}foreach GunStore_HandGuns_ALL;
	
};


//DEL
if(TRUE)then
{
	{
		if(_chance > random 100)then
		{
			_Dealer setVariable ["ShopItems_HandGuns",((_Dealer getVariable "ShopItems_HandGuns") + [_x]),true];
		};
	
	}foreach GunStore_HandGuns_ALL;
	
};
