
//$[1.03,[[0,0,1,1],0.03125,0.05],[1800,"PhoneFrame",[1,"Phone",["0.429102 * safezoneW + safezoneX","0.29375 * safezoneH + safezoneY","0.121459 * safezoneW","0.288139 * safezoneH"],[1,1,1,1],[1,0,0,1],[0,1,0,1],""],[]],[1600,"PhoneButton_1",[1,"Firefighters",["0.448438 * safezoneW + safezoneX","0.335 * safezoneH + safezoneY","0.0834375 * safezoneW","0.0253704 * safezoneH"],[1,1,1,1],[0,0,0,1],[1,0,1,1],""],[]],[1601,"PhoneButton_2",[1,"Ambulance",["0.448438 * safezoneW + safezoneX","0.39 * safezoneH + safezoneY","0.0834375 * safezoneW","0.0253704 * safezoneH"],[1,1,1,1],[0,0,0,1],[1,0,1,1],""],[]],[1602,"PhoneButton_3",[1,"Police",["0.448438 * safezoneW + safezoneX","0.445 * safezoneH + safezoneY","0.0834375 * safezoneW","0.0253704 * safezoneH"],[1,1,1,1],[0,0,0,1],[1,0,1,1],""],[]],[1603,"PhoneButton_4",[1,"Taxi service",["0.448438 * safezoneW + safezoneX","0.5 * safezoneH + safezoneY","0.0834375 * safezoneW","0.0253704 * safezoneH"],[1,1,1,1],[0,0,0,1],[1,0,1,1],""],[]]]
class DIALOG_PhoneOld
{
    idd = 50100;
    movingenable = true;
	objects[] = {};
	controlsBackground[] = {};
	
    class Controls
    {	
		 class AlphaWindow_BOX: RscBackground
         {
			idc = 50101;
			x = 0.429102 * safezoneW + safezoneX;
			y = 0.29375 * safezoneH + safezoneY;
			w = 0.121459 * safezoneW;
			h = 0.288139 * safezoneH;

		 };
		class PhoneFrame: RscFrame
		{
			idc = 50102;
			text = "Phone";
			x = 0.429102 * safezoneW + safezoneX;
			y = 0.29375 * safezoneH + safezoneY;
			w = 0.121459 * safezoneW;
			h = 0.288139 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {1,1,1,1};
		};
		class PhoneButton_1: RscButton
		{
			idc = 50103;
			text = "Firefighters";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.0834375 * safezoneW;
			h = 0.0253704 * safezoneH;
			action = "closeDialog 0; [] call func_CallFireFighter;";
		};
		class PhoneButton_2: RscButton
		{
			idc = 50104;
			text = "Ambulance";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.0834375 * safezoneW;
			h = 0.0253704 * safezoneH;
			action = "closeDialog 0; [] call func_CallMedic;";
		};
		class PhoneButton_3: RscButton
		{
			idc = 50105;
			text = "Police";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.0834375 * safezoneW;
			h = 0.0253704 * safezoneH;
			action = "closeDialog 0; [] call func_CallPolice;";
		};
		class PhoneButton_4: RscButton
		{
			idc = 50106;	
			text = "Taxi service";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0834375 * safezoneW;
			h = 0.0253704 * safezoneH;
			action = "closeDialog 0; [] call func_CallTaxi;";
		};
    };
};
