//func_SuspSAY
private["_Susp","_this","_WhatToSay"];
_Susp = _this select 0;
_WhatToSay = _this select 1;


if!(vehicle _Susp isKindOf "Man" )exitwith{};

switch (_WhatToSay) do 
{
	case "DontSee": 
	{ 
		_Susp call func_SuspSay_DontSee;
	};
	case "GiveUp": 
	{
		_Susp call func_SuspSay_GiveUp;
	};	
	case "Help": 
	{
		_Susp call func_SuspSay_Help;
	};	
	case "Hostage_Repl": 
	{
		_Susp call func_SuspSay_Hostage_Repl;
	};	
	case "Hostage_Target": 
	{
		_Susp call func_SuspSay_Hostage_Target;
	};	
	case "KillCop": 
	{
		_Susp call func_SuspSay_KillCop;
	};	
	case "No": 
	{
		_Susp call func_SuspSay_No;
	};	
	case "ReactBang": 
	{
		_Susp call func_SuspSay_ReactBang;
	};	
	case "ReactGas": 
	{
		_Susp call func_SuspSay_ReactGas;
	};	
	case "ReactRubber": 
	{
		_Susp call func_SuspSay_ReactRubber;
	};	
	case "Stunned": 
	{
		_Susp call func_SuspSay_Stunned;
	};	
	
	default { hint "func_SuspSAY default" };
};