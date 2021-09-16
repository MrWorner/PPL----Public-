//func_GunStore_BUY
private["_client","_box","_boxes","_Money"];
_client = player;

_Money = (player getVariable "Money");

if( Shop_TotalPriceToPay >  _Money)exitwith
{
	player sidechat "You don't have enough money!";
	player sidechat format ["You need to pay $%2. Money have: $%1. Need: $%3",Shop_TotalPriceToPay,_Money,((Shop_TotalPriceToPay - _Money)*(-1))];
};

_Client setVariable ["Money",(_Money - Shop_TotalPriceToPay),true]; 
player sidechat format ["You paid $%2. Money left: $%3",_Money,Shop_TotalPriceToPay,(_Money - Shop_TotalPriceToPay)];
_boxes = nearestObjects [player, ["ReammoBox"], 7]; 

if(count _boxes > 0)then
{
	_box = _boxes select 0;
}
else
{
	_box = "LocalBasicAmmunitionBox" createVehicle position player;
	clearMagazineCargo _box;
	clearWeaponCargo _box;
};

for [{_i=0}, {_i< (count Shop_ArrayItemChosen)}, {_i=_i+1}] do
{
	switch (Shop_ArrayTypeItemChosen select _i) do 
	{
		case "CfgWeapons": 
		{ 
			_box addWeaponCargo [(Shop_ArrayItemChosen select _i), (Shop_ArrayItemAmountChosen select _i)];
		};
		case "CfgMagazines": 
		{ 
			_box addMagazineCargo [(Shop_ArrayItemChosen select _i), (Shop_ArrayItemAmountChosen select _i)];	
		};
		default { hintc "func_GunStore_BUY default" };
	};
};

closedialog 51400;