
class DIALOG_RepairStation
{
	idd = 50800;
	movingEnable = true;											

	objects[] = { };
	controls[] = {Picture,  cancel, submit};



	class submit : RscButton
	{
	
		x = 0.53; y = 0.53;
		w = 0.10; h = 0.05;
		text = "CHECK";
		action = "[] call func_RepairStationWindow_fill;";
	};
	

	
	class cancel : RscButton
	{
		x = 0.53; y = 0.69;
		w = 0.10; h = 0.05;
		text = "CLOSE";
		action = "closedialog 50800;";
	};

		class Picture: RscPicture
  {
   text = "PoliceState_Resources\Pictures\module_Shop\RepairWindow.paa";
   x = 0.10; y =  0.03;
   w = 0.70; h = 1.00;
  };
  

	
	  
};


class DIALOG_RepairStation_Repair
{
	idd = 50900;		
	movingEnable = true;	
	
	class Controls
    {
		class Bacground1: RscBackground
		{
			idc = 50901;
			colorBackground[] = {0.2, 0.1, 0.2, 0.7};
			x = 0.396354 * safezoneW + safezoneX;
			y = 0.230556 * safezoneH + safezoneY;
			w = 0.217291 * safezoneW;
			h = 0.436482 * safezoneH;
		};
		class RscFrame_1800: RscFrame
		{
			idc = 50902;
			text = "Repair Station";
			x = 0.396354 * safezoneW + safezoneX;
			y = 0.230556 * safezoneH + safezoneY;
			w = 0.217291 * safezoneW;
			h = 0.436482 * safezoneH;
		};
		class RscListbox_1500: RscListbox
		{
			idc = 50903;
			x = 0.411458 * safezoneW + safezoneX;
			y = 0.256481 * safezoneH + safezoneY;
			w = 0.189167 * safezoneW;
			h = 0.297593 * safezoneH;
			onLBSelChanged="[] call func_RepairStation_PriceListBox;"
		};
		class RscText_1000: RscText
		{
			idc = 50904;
			text = "Price:";
			x = 0.415104 * safezoneW + safezoneX;
			y = 0.569445 * safezoneH + safezoneY;
			w = 0.0636458 * safezoneW;
			h = 0.0207407 * safezoneH;
		};
		class RscButton_1600: RscButton
		{
			idc = 50905;
			text = "Pay";
			x = 0.408854 * safezoneW + safezoneX;
			y = 0.608333 * safezoneH + safezoneY;
			w = 0.0563542 * safezoneW;
			h = 0.0290741 * safezoneH;
			action = "[(lnbCurSelRow  50903)] call func_RepairStation_Repair; closedialog 50900;";
		};
		class RscButton_1601: RscButton
		{
			idc = 50906;
			text = "Back";
			x = 0.545313 * safezoneW + safezoneX;
			y = 0.612037 * safezoneH + safezoneY;
			w = 0.0563542 * safezoneW;
			h = 0.0290741 * safezoneH;
			action = "closedialog 50700;";
		};
	};
};