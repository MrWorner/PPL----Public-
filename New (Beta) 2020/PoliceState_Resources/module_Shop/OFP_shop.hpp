//$[1.03,[[0,0,1,1],0.03125,0.05],[1800,"",[1,"GUI",["0.210937 * safezoneW + safezoneX","0.153704 * safezoneH + safezoneY","0.579167 * safezoneW","0.691296 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1500,"",[1,"",["0.39375 * safezoneW + safezoneX","0.189815 * safezoneH + safezoneY","0.378125 * safezoneW","0.621852 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1000,"",[1,"{MONEY: $5000}",["0.229687 * safezoneW + safezoneX","0.188889 * safezoneH + safezoneY","0.139062 * safezoneW","0.0292593 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1600,"",[1,"WEAPON",["0.226563 * safezoneW + safezoneX","0.253704 * safezoneH + safezoneY","0.144271 * safezoneW","0.0348148 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1601,"",[1,"ITEM",["0.227604 * safezoneW + safezoneX","0.325 * safezoneH + safezoneY","0.144271 * safezoneW","0.0348148 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1602,"",[1,"VEHICLE",["0.227083 * safezoneW + safezoneX","0.396297 * safezoneH + safezoneY","0.144271 * safezoneW","0.0348148 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1603,"",[1,"MEN",["0.228646 * safezoneW + safezoneX","0.465741 * safezoneH + safezoneY","0.144271 * safezoneW","0.0348148 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1604,"",[1,"SQUAD",["0.228125 * safezoneW + safezoneX","0.535185 * safezoneH + safezoneY","0.144271 * safezoneW","0.0348148 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1605,"",[1,"BUY",["0.227084 * safezoneW + safezoneX","0.710185 * safezoneH + safezoneY","0.144271 * safezoneW","0.0348148 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1606,"",[1,"LEAVE",["0.227083 * safezoneW + safezoneX","0.780556 * safezoneH + safezoneY","0.144271 * safezoneW","0.0348148 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]]]


class DIALOG_OFPshop
{
    idd = 51700;
    movingenable = true;

	class Controls
    {	
	
		class FrameBackground: RscBackground
		{
			idc = 51710;
			x = 0.210937 * safezoneW + safezoneX;
			y = 0.153704 * safezoneH + safezoneY;
			w = 0.579167 * safezoneW;
			h = 0.691296 * safezoneH;
			
		};
	
		class RscFrame_1800: RscFrame
		{
			idc = 51701;
			text = "GUI";
			x = 0.210937 * safezoneW + safezoneX;
			y = 0.153704 * safezoneH + safezoneY;
			w = 0.579167 * safezoneW;
			h = 0.691296 * safezoneH;
		};
		
				class FrameBackground2: RscBackground
		{
			idc = 51712;
			colorBackground[] = {0, 0, 0, 0.5};
			x = 0.39375 * safezoneW + safezoneX;
			y = 0.189815 * safezoneH + safezoneY;
			w = 0.378125 * safezoneW;
			h = 0.621852 * safezoneH;
			
		};
		
		
		
		class RscListbox_1500: RscListbox
		{
			idc = 51702;
			x = 0.39375 * safezoneW + safezoneX;
			y = 0.189815 * safezoneH + safezoneY;
			w = 0.378125 * safezoneW;
			h = 0.621852 * safezoneH;
		};
		

		
		class RscText_1000: RscText
		{
			idc = 51703;
			text = "{MONEY: $5000}";
			x = 0.229687 * safezoneW + safezoneX;
			y = 0.188889 * safezoneH + safezoneY;
			w = 0.139062 * safezoneW;
			h = 0.0292593 * safezoneH;
		};
		class RscButton_1600: RscButton
		{
			idc = 51704;
			text = "WEAPON";
			x = 0.226563 * safezoneW + safezoneX;
			y = 0.253704 * safezoneH + safezoneY;
			w = 0.144271 * safezoneW;
			h = 0.0348148 * safezoneH;
		};
		class RscButton_1601: RscButton
		{
			idc = 51705;
			text = "ITEM";
			x = 0.227604 * safezoneW + safezoneX;
			y = 0.325 * safezoneH + safezoneY;
			w = 0.144271 * safezoneW;
			h = 0.0348148 * safezoneH;
		};
		class RscButton_1602: RscButton
		{
			idc = 51706;
			text = "VEHICLE";
			x = 0.227083 * safezoneW + safezoneX;
			y = 0.396297 * safezoneH + safezoneY;
			w = 0.144271 * safezoneW;
			h = 0.0348148 * safezoneH;
		};
		class RscButton_1603: RscButton
		{
			idc = 51707;
			text = "MEN";
			x = 0.228646 * safezoneW + safezoneX;
			y = 0.465741 * safezoneH + safezoneY;
			w = 0.144271 * safezoneW;
			h = 0.0348148 * safezoneH;
		};
		class RscButton_1604: RscButton
		{
			idc = 51708;
			text = "SQUAD";
			x = 0.228125 * safezoneW + safezoneX;
			y = 0.535185 * safezoneH + safezoneY;
			w = 0.144271 * safezoneW;
			h = 0.0348148 * safezoneH;
		};
		class RscButton_1605: RscButton
		{
			idc = 51709;
			text = "BUY";
			x = 0.227083 * safezoneW + safezoneX;
			y = 0.74 * safezoneH + safezoneY;
			w = 0.144271 * safezoneW;
			h = 0.0348148 * safezoneH;
		};
		class RscButton_1606: RscButton
		{
			idc = 51711;
			text = "LEAVE";
			action = "closedialog 1;";
			x = 0.227083 * safezoneW + safezoneX;
			y = 0.780556 * safezoneH + safezoneY;
			w = 0.144271 * safezoneW;
			h = 0.0348148 * safezoneH;
		};
	};
};
