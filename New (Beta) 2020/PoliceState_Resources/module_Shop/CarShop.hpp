
//$[1.03,[[0,0,1,1],0.03125,0.05],[1800,"",[1,"Car shop",["0.295833 * safezoneW + safezoneX","0.230556 * safezoneH + safezoneY","0.412084 * safezoneW","0.550371 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[2100,"BoxTypeCAR",[1,"",["0.307292 * safezoneW + safezoneX","0.256482 * safezoneH + safezoneY","0.16625 * safezoneW","0.0225926 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1500,"ListCarChoose",[1,"",["0.309375 * safezoneW + safezoneX","0.310185 * safezoneH + safezoneY","0.163125 * safezoneW","0.353148 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1200,"Pic1",[1,"#(argb,8,8,3)color(1,1,1,1)",["0.514584 * safezoneW + safezoneX","0.255556 * safezoneH + safezoneY","0.154792 * safezoneW","0.131852 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1604,"Buy_button",[1,"Buy",["0.308334 * safezoneW + safezoneX","0.719445 * safezoneH + safezoneY","0.0615625 * safezoneW","0.0244445 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1605,"cancel_button",[1,"Cancel",["0.629167 * safezoneW + safezoneX","0.722222 * safezoneH + safezoneY","0.0615625 * safezoneW","0.0244445 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1000,"Text1",[1,"Total:",["0.307293 * safezoneW + safezoneX","0.669445 * safezoneH + safezoneY","0.166249 * safezoneW","0.0207408 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1001,"JustText1",[1,"Information",["0.561978 * safezoneW + safezoneX","0.403704 * safezoneH + safezoneY","0.0579166 * safezoneW","0.0290741 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1501,"ListInformation",[1,"",["0.490105 * safezoneW + safezoneX","0.449074 * safezoneH + safezoneY","0.201146 * safezoneW","0.242037 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]]]



class DIALOG_CarShop
{
	idd = 51500;
	movingEnable = true;											
	class Controls
    {	
		class RscBackground_1800: RscBackground
		{
			idc = 51501;
			x = 0.295833 * safezoneW + safezoneX;
			y = 0.230556 * safezoneH + safezoneY;
			w = 0.412084 * safezoneW;
			h = 0.550371 * safezoneH;
		};
		class RscFrame_1800: RscFrame
		{
			idc = 51502;
			text = "Car shop";
			x = 0.295833 * safezoneW + safezoneX;
			y = 0.230556 * safezoneH + safezoneY;
			w = 0.412084 * safezoneW;
			h = 0.550371 * safezoneH;
		};
		class BoxTypeCAR: RscCombo
		{
			idc = 51503;
			x = 0.307292 * safezoneW + safezoneX;
			y = 0.256482 * safezoneH + safezoneY;
			w = 0.16625 * safezoneW;
			h = 0.0225926 * safezoneH;
			onLBSelChanged="call func_ValueChanged_BoxTypeCar;";
		};
		class ListCarChoose: RscListbox
		{
			idc = 51504;
			x = 0.309375 * safezoneW + safezoneX;
			y = 0.310185 * safezoneH + safezoneY;
			w = 0.163125 * safezoneW;
			h = 0.353148 * safezoneH;
			onLBSelChanged="call func_ValueChanged_ListCarChosen;";
		};
		class Pic1: RscPicture
		{
			idc = 51505;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.514584 * safezoneW + safezoneX;
			y = 0.255556 * safezoneH + safezoneY;
			w = 0.154792 * safezoneW;
			h = 0.131852 * safezoneH;
		};
		class Buy_button: RscButton
		{
			idc = 51506;
			text = "Buy";
			x = 0.308334 * safezoneW + safezoneX;
			y = 0.719445 * safezoneH + safezoneY;
			w = 0.0615625 * safezoneW;
			h = 0.0244445 * safezoneH;
			action = "call func_CarShop_BUY;";
		};
		class cancel_button: RscButton
		{
			idc = 51507;
			text = "Cancel";
			x = 0.629167 * safezoneW + safezoneX;
			y = 0.722222 * safezoneH + safezoneY;
			w = 0.0615625 * safezoneW;
			h = 0.0244445 * safezoneH;
			action = "closedialog 51500;";
		};
		class Text1: RscText
		{
			idc = 51508;
			text = "Total:";
			x = 0.307293 * safezoneW + safezoneX;
			y = 0.669445 * safezoneH + safezoneY;
			w = 0.166249 * safezoneW;
			h = 0.0207408 * safezoneH;
		};
		class JustText1: RscText
		{
			idc = 51509;
			text = "Information";
			x = 0.561978 * safezoneW + safezoneX;
			y = 0.403704 * safezoneH + safezoneY;
			w = 0.0579166 * safezoneW;
			h = 0.0290741 * safezoneH;
		};
		class ListInformation: RscListbox
		{
			idc = 51510;
			x = 0.490105 * safezoneW + safezoneX;
			y = 0.449074 * safezoneH + safezoneY;
			w = 0.201146 * safezoneW;
			h = 0.242037 * safezoneH;
			colorSelectBackground[] = {0.7, 0.7, 0.7, 0};
			colorSelect[]           = {1, 1, 1, 1};
		};

		
		
	};


};