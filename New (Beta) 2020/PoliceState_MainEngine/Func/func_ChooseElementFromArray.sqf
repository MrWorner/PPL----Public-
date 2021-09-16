//func_ChooseElementFromArray
private ["_Array", "_ChosenElement","_this","_randomChance"];

_Array = _this;


if(count _Array == 0)exitwith{hintc format ["func_ChooseElementFromArray: Dear, %1,  _Array has 0 elements!", name player]};

if(count _Array == 1)then
{
	_ChosenElement = _Array select 0;
}
else
{
	_ChosenElement = _Array select round random ((count _Array) - 1);
};

_ChosenElement
