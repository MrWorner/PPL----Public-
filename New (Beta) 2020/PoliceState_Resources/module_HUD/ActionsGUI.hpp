
//$[1.03,[[0,0,1,1],0.03125,0.05],[1800,"PhoneFrame",[1,"Phone",["0.429102 * safezoneW + safezoneX","0.29375 * safezoneH + safezoneY","0.121459 * safezoneW","0.288139 * safezoneH"],[1,1,1,1],[1,0,0,1],[0,1,0,1],""],[]],[1600,"PhoneButton_1",[1,"Firefighters",["0.448438 * safezoneW + safezoneX","0.335 * safezoneH + safezoneY","0.0834375 * safezoneW","0.0253704 * safezoneH"],[1,1,1,1],[0,0,0,1],[1,0,1,1],""],[]],[1601,"PhoneButton_2",[1,"Ambulance",["0.448438 * safezoneW + safezoneX","0.39 * safezoneH + safezoneY","0.0834375 * safezoneW","0.0253704 * safezoneH"],[1,1,1,1],[0,0,0,1],[1,0,1,1],""],[]],[1602,"PhoneButton_3",[1,"Police",["0.448438 * safezoneW + safezoneX","0.445 * safezoneH + safezoneY","0.0834375 * safezoneW","0.0253704 * safezoneH"],[1,1,1,1],[0,0,0,1],[1,0,1,1],""],[]],[1603,"PhoneButton_4",[1,"Taxi service",["0.448438 * safezoneW + safezoneX","0.5 * safezoneH + safezoneY","0.0834375 * safezoneW","0.0253704 * safezoneH"],[1,1,1,1],[0,0,0,1],[1,0,1,1],""],[]]]

//$[1.03,[[0,0,1,1],0.03125,0.05],[1800,"Frame1",[1,"Frame1",["0.36875 * safezoneW + safezoneX","0.224073 * safezoneH + safezoneY","0.25375 * safezoneW","0.554074 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[2100,"ComboBox1",[1,"",["0.381771 * safezoneW + safezoneX","0.256482 * safezoneH + safezoneY","0.232917 * safezoneW","0.0207407 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1200,"Picture1",[1,"#(argb,8,8,3)color(1,1,1,1)",["0.382292 * safezoneW + safezoneX","0.308333 * safezoneH + safezoneY","0.231875 * safezoneW","0.186481 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1600,"Button2",[1,"Close",["0.533333 * safezoneW + safezoneX","0.725001 * safezoneH + safezoneY","0.081875 * safezoneW","0.0253703 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1601,"Button1",[1,"Accept",["0.382812 * safezoneW + safezoneX","0.725927 * safezoneH + safezoneY","0.081875 * safezoneW","0.0253703 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]],[1000,"Text1",[1,"",["0.382812 * safezoneW + safezoneX","0.511112 * safezoneH + safezoneY","0.229271 * safezoneW","0.18463 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],""],[]]]
class DIALOG_ActionsWindow
{
    idd = 50200;
    movingenable = true;

	class Controls
    {	
	
	
		class FrameBackground: RscBackground
		{
			idc = 50201;
			x = 0.368 * safezoneW + safezoneX;
			y = 0.224 * safezoneH + safezoneY;
			w = 0.253 * safezoneW;
			h = 0.554 * safezoneH;
			
		};
		
		class FrameBack: RscFrame
		{
			text = "DIALOG_ActionsWindow";
			idc = 50202;
			x = 0.368 * safezoneW + safezoneX;
			y = 0.224 * safezoneH + safezoneY;
			w = 0.253 * safezoneW;
			h = 0.554 * safezoneH;
		};
		
			class TextHealth: RscText
		{
			sizeEx = 0.025;
			idc = 50209;
			text = "{HEALTHY}";
			colorText[] = {1,0,0,1};
			colorBackground[] = {0, 0, 0, 0.8};
			style = 2;
			x = 0.38 * safezoneW + safezoneX;
			y = 0.25 * safezoneH + safezoneY;
			w = 0.23 * safezoneW;
			h = 0.02 * safezoneH;
		}; 
	
		
			class TextMoney: RscText
		{
			sizeEx = 0.025;
			idc = 50210;
			text = "{$5000}";
			colorText[] = {0,1,0,1};
			colorBackground[] = {0, 0, 0, 0.8};
			style = 2;
			x = 0.38 * safezoneW + safezoneX;
			y = 0.275 * safezoneH + safezoneY;
			w = 0.23 * safezoneW;
			h = 0.02 * safezoneH;
		};
		
			class TextHunger: RscText
		{
			sizeEx = 0.025;
			idc = 50211;
			text = "{NOT HUNGRY}";
			colorText[] = {0,1,1,1};
			colorBackground[] = {0, 0, 0, 0.8};
			style = 2;
			x = 0.38 * safezoneW + safezoneX;
			y = 0.30 * safezoneH + safezoneY;
			w = 0.23 * safezoneW;
			h = 0.02 * safezoneH;
		};
		
		
		class ComboBox1: RscCombo
		{
			idc = 50203;
			x = 0.381771 * safezoneW + safezoneX;
			y = 0.34 * safezoneH + safezoneY;
			w = 0.23 * safezoneW;
			h = 0.020 * safezoneH;
			onLBSelChanged="call func_ValueChanged_DIALOG_ActionsWindow;";
		};
		class Picture1: RscPicture
		{
			idc = 50204;
			//text = "#(argb,8,8,3)color(1,1,1,1)";
			text = "PoliceState_Resources\Pictures\module_HUD\NoAction.paa";
			x = 0.382292 * safezoneW + safezoneX;
			y = 0.38 * safezoneH + safezoneY;
			w = 0.23 * safezoneW;
			h = 0.186 * safezoneH;
		};
		class Button2: RscButton
		{
			idc = 50205;
			text = "Close";
			x = 0.533333 * safezoneW + safezoneX;
			y = 0.73 * safezoneH + safezoneY;
			w = 0.081 * safezoneW;
			h = 0.025 * safezoneH;
			action = "closedialog 50200;";
		};
		class Button1: RscButton
		{
			idc = 50206;
			text = "Accept";
			x = 0.382812 * safezoneW + safezoneX;
			y = 0.73 * safezoneH + safezoneY;
			w = 0.081 * safezoneW;
			h = 0.025 * safezoneH;
			
			action = "call func_DIALOG_ActionsWindow_ButtonPressed;";
		};
		class TextDescription: RscText
		{
			sizeEx = 0.04;
			idc = 50207;
			text = "Description";
			style = 2;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0, 0, 0, 0};
			x = 0.382 * safezoneW + safezoneX;
			y = 0.58 * safezoneH + safezoneY;
			w = 0.23 * safezoneW;
			h = 0.03 * safezoneH;
			
		};	
		class TextFull: RscStructuredText
		{
			sizeEx = 0.025;
			idc = 50208;
			text = "<br/>";
			colorText[] = {1,1,1,1};
			colorBackground[] = {0, 0, 0.1, 0.6};
			x = 0.382812 * safezoneW + safezoneX;
			y = 0.62 * safezoneH + safezoneY;
			w = 0.23 * safezoneW;
			h = 0.095 * safezoneH;
		};	
	
	};
};
