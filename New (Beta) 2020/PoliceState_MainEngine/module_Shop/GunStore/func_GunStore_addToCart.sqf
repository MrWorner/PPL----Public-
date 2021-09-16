//func_GunStore_addToCart
private["_client","_ValueFromEdit","_ValueFromListBox","_searchFound","_i","_TotalPrice","_index"];

 _searchFound = false;
 _ValueFromEdit = parseNumber (ctrlText 51406); 
 if(_ValueFromEdit < 1)then
 {
	 _ValueFromEdit = 1;  
	 ctrlSetText [51406, "1"];
 };
_ValueFromListBox = (lbCurSel 51404);//INDEX 	| (lbData [51404, (lbCurSel 51404)]);
_TotalPrice = 0;

	
//if (!(_slider call ISSE_str_isInteger)) then {_slider = 0;};
//_slider = _slider call ISSE_str_StrToInt; 	

 //**Check if old item added to basket, just change amount
for [{_i=0}, {_i< (count Shop_ArrayItemChosen)}, {_i=_i+1}] do
{
   // player globalChat format["_i = %1",_i];
	if( (Shop_ArrayItem select _ValueFromListBox) == (Shop_ArrayItemChosen select _i) )then
	{
		Shop_ArrayItemAmountChosen set [_i,_ValueFromEdit + (Shop_ArrayItemAmountChosen select _i)];
		_searchFound = true;
		// player globalChat format["ITEM CHANGED: %1", _ValueFromEdit];
	};	
	_TotalPrice = _TotalPrice + ( (Shop_ArrayPricesChosen select _i) * (Shop_ArrayItemAmountChosen select _i) );
	
	

};
  //**Check if old item added to basket, just change amount END
  
//Shop_ArrayItem = [];
//Shop_ArrayPrices = [];
//Shop_ArrayTypeItem = [];
  
 //**New item added to basket
if(!_searchFound)then
{ 	
	//player globalChat format["ADDED!: %1",_ValueFromListBox];
	Shop_ArrayItemChosen = Shop_ArrayItemChosen + [Shop_ArrayItem select _ValueFromListBox];
	Shop_ArrayPricesChosen = Shop_ArrayPricesChosen + [Shop_ArrayPrices select _ValueFromListBox];
	Shop_ArrayTypeItemChosen = Shop_ArrayTypeItemChosen + [Shop_ArrayTypeItem select _ValueFromListBox];	
	Shop_ArrayItemAmountChosen = Shop_ArrayItemAmountChosen + [_ValueFromEdit];	
	_TotalPrice = _TotalPrice + ( (Shop_ArrayPrices select _ValueFromListBox) * (_ValueFromEdit) );

};
 //**New item added to basket END
 
 

//**FILL LISTBOX BASKET
lbClear 51414;
for [{_i=0}, {_i< (count Shop_ArrayItemChosen)}, {_i=_i+1}] do
{
	_index = lbAdd [51414,format ["%1x %2",Shop_ArrayItemAmountChosen select _i,  (getText(configFile >> (Shop_ArrayTypeItemChosen select _i) >> (Shop_ArrayItemChosen select _i) >> "displayName"))]];		
	lbSetData [51414, _index, (_i)];
};
//**FILL LISTBOX BASKET END



Shop_TotalPriceToPay = _TotalPrice;
 ctrlSetText [51417, format ["Total: $%1", _TotalPrice]]; //Set text
 
