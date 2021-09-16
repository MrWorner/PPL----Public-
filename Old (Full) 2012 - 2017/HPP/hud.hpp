#define hud_MAIN_ID 3600
#define hud_Dynamic_ID 3601
#define hud_Dynamic2_ID 3602
#define hud_Dynamic3_ID 3603
#define hud_Dynamic4_ID 3604
#define hud_Dynamic5_ID 3605

class NewHud {
	idd = -1;
        fadeout=0;
        fadein=0;
	duration = 20;
	name= "NewHud";
	onLoad = "uiNamespace setVariable ['NewHud', _this select 0]";
	
	class controlsBackground {
		class NewHud_main:w_RscText
		{
			idc = hud_Dynamic_ID;
			type = CT_STRUCTURED_TEXT;
			size = 0.040;
			x = safeZoneX + (safeZoneW * (1 - (0.42 / SafeZoneW)));
            y = safeZoneY + (safeZoneH * (1 - (0.58 / SafeZoneH)));
			w = 0.4; h = 0.65;
			colorText[] = {1,1,1,1};
			lineSpacing = 3;
			colorBackground[] = {0,0,0,0};
			//text = "";
			shadow = 2;
			class Attributes {
				align = "right";
			};
		};
		
		class NewHud_main2:w_RscText
		{
			idc = hud_Dynamic2_ID;
			type = CT_STRUCTURED_TEXT;
			size = 0.040;
			x = safeZoneX + (safeZoneW * (1 - (0.42 / SafeZoneW)));
                        y = safeZoneY + (safeZoneH * (1 - (0.30 / SafeZoneH)));
			w = 0.4; h = 0.65;
			colorText[] = {1,1,1,1};
			lineSpacing = 3;
			colorBackground[] = {0,0,0,0};
			//text = "";
			shadow = 2;
			class Attributes {
				align = "right";
			};
		};
		
		
		class NewHud_main3:w_RscText  //Канистра
		{
			idc = hud_Dynamic3_ID;
			type = CT_STRUCTURED_TEXT;
			size = 0.040;
			x = safeZoneX + (safeZoneW * (1 - (0.99 / SafeZoneW)));
            y = safeZoneY + (safeZoneH * (1 - (0 / SafeZoneH)));
			w = 0.4; h = 0.65;
			colorText[] = {1,1,1,1};
			lineSpacing = 3;
			colorBackground[] = {0,0,0,0};
			//text = "";
			shadow = 2;
			class Attributes {
				align = "right";
			};
		};
		
		
			class NewHud_main4:w_RscText  //Аптечка
		{
			idc = hud_Dynamic4_ID;
			type = CT_STRUCTURED_TEXT;
			size = 0.040;
			x = safeZoneX;// + (safeZoneW * (1 - (0.42 / SafeZoneW)));
            y = safeZoneY;// + (safeZoneH * (1 - (0.30 / SafeZoneH)));
			w = 0.4; h = 0.65;
			colorText[] = {1,1,1,1};
			lineSpacing = 3;
			colorBackground[] = {0,0,0,0.0};
			//text = "";
			shadow = 2;
			class Attributes {
				align = "right";
			};
		};
		
		
				class NewHud_main5:w_RscText  //Отмычка
		{
			idc = hud_Dynamic5_ID;
			type = CT_STRUCTURED_TEXT;
			size = 0.040;
			x = safeZoneX;// + (safeZoneW * (1 - (0.42 / SafeZoneW)));
            y = safeZoneY;// + (safeZoneH * (1 - (0.30 / SafeZoneH)));
			w = 0.4; h = 0.65;
			colorText[] = {1,1,1,1};
			lineSpacing = 3;
			colorBackground[] = {0,0,0,0.0};
			//text = "";
			shadow = 2;
			class Attributes {
				align = "right";
			};
		};
		
		
		
		
		
		
		class NewHud_Status:w_RscText
		{
			idc = hud_MAIN_ID;
			type = CT_STRUCTURED_TEXT;
			size = 0.040;
			x = safeZoneX + (safeZoneW * (1 - (0.16 / SafeZoneW)));
                        y = safeZoneY + (safeZoneH * (1 - (0.45 / SafeZoneH)));
			w = 0.14; h = 0.40;
			colorText[] = {1,1,1,1};
			lineSpacing = 3;
			colorBackground[] = {0,0,0,0};
			//text = "100 <img size='1.3' image='icons\hunger.paa'/><br/>100 <img size='1.3' image='icons\wanted.paa'/><br/>100 <img size='1.3' image='icons\Money.paa'/>";
			shadow = 2;
			class Attributes {
				align = "right";
			};
		};
		

		
		

	};
};
