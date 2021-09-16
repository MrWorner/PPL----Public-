
class DIALOG_CarSeller
{
	idd = 51000;
	movingEnable = true;											
controlsBackground[] = {};
	objects[] = { };
	controls[] = {Picture,  cancel, submit};

	class submit : RscButton
	{
	
	   colorBackground[] = {0.2, 0.1, 0.2, 0.1};
		x = 0.53; y = 0.42;
		w = 0.10; h = 0.05;
		font = FontM;
		colorText[] = {1,0.2,0.2,1};
		text = "CHECK";
		action = "[] call func_CarSellerWindow_fill;";
	};
	
	class cancel : RscButton
	{
	   colorBackground[] = {0.2, 0.1, 0.2, 0.1};
		x = 0.53; y = 0.52;
		w = 0.10; h = 0.05;
		font = FontM;
		text = "CLOSE";
		colorText[] = {0.2,0.2,1,1};
		action = "closedialog 51000;";
	};

		class Picture: RscPicture
  {
   text = "PoliceState_Resources\Pictures\module_Shop\SellCar.paa";
   x = 0.10; y =  0.03;
   w = 0.70; h = 1.00;
  };
 
};


class DIALOG_CarSeller_Sell
{
	idd = 51100;		
	movingEnable = true;	
	
	class Controls
    {
		class Bacground1: RscBackground
		{
			idc = 51101;
			colorBackground[] = {0.2, 0.1, 0.2, 0.7};
			x = 0.396354 * safezoneW + safezoneX;
			y = 0.230556 * safezoneH + safezoneY;
			w = 0.217291 * safezoneW;
			h = 0.436482 * safezoneH;
		};
		class RscFrame_1800: RscFrame
		{
			idc = 51102;
			text = "Car seller";
			x = 0.396354 * safezoneW + safezoneX;
			y = 0.230556 * safezoneH + safezoneY;
			w = 0.217291 * safezoneW;
			h = 0.436482 * safezoneH;
		};
		class RscListbox_1500: RscListbox
		{
			idc = 51103;
			x = 0.411458 * safezoneW + safezoneX;
			y = 0.256481 * safezoneH + safezoneY;
			w = 0.189167 * safezoneW;
			h = 0.297593 * safezoneH;
			onLBSelChanged="[] call func_CarSeller_PriceListBox;"
		};
		class RscText_1000: RscText
		{
			idc = 51104;
			text = "Price:";
			x = 0.415104 * safezoneW + safezoneX;
			y = 0.569445 * safezoneH + safezoneY;
			w = 0.0636458 * safezoneW;
			h = 0.0207407 * safezoneH;
		};
		class RscButton_1600: RscButton
		{
			idc = 51105;
			text = "Sell";
			x = 0.408854 * safezoneW + safezoneX;
			y = 0.608333 * safezoneH + safezoneY;
			w = 0.0563542 * safezoneW;
			h = 0.0290741 * safezoneH;
			action = "[(lnbCurSelRow  51103)] call func_CarSeller_Sell; closedialog 51100;";
		};
		class RscButton_1601: RscButton
		{
			idc = 51106;
			text = "Back";
			x = 0.545313 * safezoneW + safezoneX;
			y = 0.612037 * safezoneH + safezoneY;
			w = 0.0563542 * safezoneW;
			h = 0.0290741 * safezoneH;
			action = "closedialog 51100;";
		};
	};
};