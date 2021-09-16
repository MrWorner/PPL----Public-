//FUNC_GunShop_SET_WeaponsToSell_RANDOM
private["_this","_Dealer","_chance","_Added"];

_Dealer = _this;
_chance = 60;
_Added = 0;


_Dealer setVariable ["ShopItems_Motorcycles",[],true]; //Car STORE
_Dealer setVariable ["ShopItems_Cars",[],true]; //Car STORE
_Dealer setVariable ["ShopItems_Vans",[],true]; //Car STORE
_Dealer setVariable ["ShopItems_OffRoads",[],true]; //Car STORE
_Dealer setVariable ["ShopItems_Trucks",[],true]; //Car STORE
_Dealer setVariable ["ShopItems_Buses",[],true]; //Car STORE
//_Dealer setVariable ["ShopItems_APC",[],true]; //Car STORE
//_Dealer setVariable ["ShopItems_Heli",[],true]; //Car STORE
//_Dealer setVariable ["ShopItems_Plane",[],true]; //Car STORE

if(random 100 > 50)then
{
	{
		if(_chance > random 100)then
		{
			_Dealer setVariable ["ShopItems_Motorcycles",((_Dealer getVariable "ShopItems_Motorcycles") + [_x]),true];
			_Added = _Added + 1;
		};
	
	}foreach CarShop_Motorcycles_ALL;
};


if(random 100 > 50)then
{
	{
		if(_chance > random 100)then
		{
			_Dealer setVariable ["ShopItems_Vans",((_Dealer getVariable "ShopItems_Vans") + [_x]),true];
			_Added = _Added + 1;
		};
	
	}foreach CarShop_Vans_ALL;
};

if(random 100 > 50)then
{
	{
		if(_chance > random 100)then
		{
			_Dealer setVariable ["ShopItems_OffRoads",((_Dealer getVariable "ShopItems_OffRoads") + [_x]),true];
			_Added = _Added + 1;
		};
	
	}foreach CarShop_OffRoads_ALL;
};
if(random 100 > 50)then
{
	{
		if(_chance > random 100)then
		{
			_Dealer setVariable ["ShopItems_Trucks",((_Dealer getVariable "ShopItems_Trucks") + [_x]),true];
			_Added = _Added + 1;
		};
	
	}foreach CarShop_Trucks_ALL;
};


if(random 100 > 50)then
{
	{
		if(_chance > random 100)then
		{
			_Dealer setVariable ["ShopItems_Buses",((_Dealer getVariable "ShopItems_Buses") + [_x]),true];
			_Added = _Added + 1;
		};
	
	}foreach CarShop_Buses_ALL;
};


if(random 100 > 25 or _Added == 0)then
{
	{
		if(_chance > random 100)then
		{
			_Dealer setVariable ["ShopItems_Cars",((_Dealer getVariable "ShopItems_Cars") + [_x]),true];
		};
	
	}foreach CarShop_Cars_ALL;
	
};

