
class DIALOG_GasStation
{
	idd = 50600;
	movingEnable = true;											
	controlsBackground[] = {DLG_BACK1};
	objects[] = { };
	controls[] = {Picture, submit,submit2,submit3, cancel};

	class DLG_BACK1: RscBackground
	{    
		colorBackground[] = {0.2, 0.1, 0.2, 0};
		x = 0.30; y = 0.12;
		w = 0.40; h = 0.65;
	};


	class submit : RscButton
	{
		idc = 50601;
		x = 0.33; y = 0.35;
		w = 0.10; h = 0.05;
		text = "BUY";
		action = "[""FuelCan"",45] execVM ""HarryWorner_s_MainEngine\DialogsAndShops\GasStationSHOP.sqf"";";
	};
	
	
	class submit2 : RscButton
	{
		idc = 50602;
		x = 0.33; y = 0.59;
		w = 0.10; h = 0.05;
		text = "BUY";
			action = "[""Candies"",6,20] call func_BuyFood_Cafe;";
	};
	
	
	class submit3 : RscButton
	{
		idc = 50603;
		x = 0.59; y = 0.29;
		w = 0.15; h = 0.05;
		text = "Start refueling";
		action = "[] call func_GasStationWindow_fill;";
	};
	
	
	class cancel : RscButton
	{
		idc = 50604;
		x = 0.63; y = 0.79;
		w = 0.10; h = 0.05;
		text = "CLOSE";
		action = "closedialog 50600;";
	};


	class Picture: RscPicture
	{
   text = "PoliceState_Resources\Pictures\module_Shop\GasStation.paa";
   x = 0.10; y =  0.03;
   w = 0.70; h = 1.00;
	};
	  
};


class DIALOG_GasStation_Fuel
{
	idd = 50700;		
	movingEnable = true;	
	
	class Controls
    {
		class Bacground1: RscBackground
		{
			idc = 50701;
			colorBackground[] = {0.2, 0.1, 0.2, 0.7};
			x = 0.396354 * safezoneW + safezoneX;
			y = 0.230556 * safezoneH + safezoneY;
			w = 0.217291 * safezoneW;
			h = 0.436482 * safezoneH;
		};
		class RscFrame_1800: RscFrame
		{
			idc = 50702;
			text = "Refuel";
			x = 0.396354 * safezoneW + safezoneX;
			y = 0.230556 * safezoneH + safezoneY;
			w = 0.217291 * safezoneW;
			h = 0.436482 * safezoneH;
		};
		class RscListbox_1500: RscListbox
		{
			idc = 50703;
			x = 0.411458 * safezoneW + safezoneX;
			y = 0.256481 * safezoneH + safezoneY;
			w = 0.189167 * safezoneW;
			h = 0.297593 * safezoneH;
			onLBSelChanged="[] call func_GasStation_PriceListBox;"
		};
		class RscText_1000: RscText
		{
			idc = 50704;
			text = "Price:";
			x = 0.415104 * safezoneW + safezoneX;
			y = 0.569445 * safezoneH + safezoneY;
			w = 0.0636458 * safezoneW;
			h = 0.0207407 * safezoneH;
		};
		class RscButton_1600: RscButton
		{
			idc = 50705;
			text = "Accept";
			x = 0.408854 * safezoneW + safezoneX;
			y = 0.608333 * safezoneH + safezoneY;
			w = 0.0563542 * safezoneW;
			h = 0.0290741 * safezoneH;
			action = "[(lnbCurSelRow  50703)] call func_GasStation_Refuel; closedialog 50700;";
		};
		class RscButton_1601: RscButton
		{
			idc = 50706;
			text = "Back";
			x = 0.545313 * safezoneW + safezoneX;
			y = 0.612037 * safezoneH + safezoneY;
			w = 0.0563542 * safezoneW;
			h = 0.0290741 * safezoneH;
			action = "closedialog 50700;";
		};
	};
};