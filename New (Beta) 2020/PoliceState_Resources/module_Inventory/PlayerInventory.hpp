
class DIALOG_PlayerInventory
{
	idd = 51600;
	movingEnable = true;											
	class Controls
    {


		class DLG_BACK1: RscBackground
		{
			x = 0.173372 * safezoneW + safezoneX;
			y = 0.17 * safezoneH + safezoneY;
			w = 0.536563 * safezoneW;
			h = 0.708705 * safezoneH;
		};
		
		class RscFrame_123: RscFrame
		{
			idc = 51699;
			x = 0.173372 * safezoneW + safezoneX;
			y = 0.17 * safezoneH + safezoneY;
			w = 0.536563 * safezoneW;
			h = 0.708705 * safezoneH;
		};

		
		class ListboxLeft: RscListbox
		{
			idc = 51601;
			x = 0.18418 * safezoneW + safezoneX;
			y = 0.4175 * safezoneH + safezoneY;
			w = 0.244531 * safezoneW;
			h = 0.353565 * safezoneH;
			colorSelectBackground[] = {0.7, 0.7, 0.7, 0};
			colorSelect[]           = {1, 1, 1, 1};
		};
		class PicLeft1: RscPicture
		{
			idc = 51602;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.187499 * safezoneW + safezoneX;
			y = 0.25 * safezoneH + safezoneY;
			w = 0.0902084 * safezoneW;
			h = 0.13926 * safezoneH;
		};

		class EditLeft1: RscEdit
		{
			idc = 51603;
			text = "1";
			sizeEx = 0.047;
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.78875 * safezoneH + safezoneY;
			w = 0.0350001 * safezoneW;
			h = 0.0337037 * safezoneH;
		};
		class RscButton_1600: RscButton
		{
			idc = 51604;
			text = "-";
			x = 0.365104 * safezoneW + safezoneX;
			y = 0.791667 * safezoneH + safezoneY;
			w = 0.0240625 * safezoneW;
			h = 0.0290741 * safezoneH;
			action = "call func_GunStore_Minus;";
		};
		class RscButton_1601: RscButton
		{
			idc = 51605;
			text = "<-----";
			x = 0.342187 * safezoneW + safezoneX;
			y = 0.837037 * safezoneH + safezoneY;
			w = 0.0641667 * safezoneW;
			h = 0.0272222 * safezoneH;
		};
		
		
		
		
		class RscCombo_2100: RscCombo
		{
			idc = 51606;
			x = 0.190104 * safezoneW + safezoneX;
			y = 0.190741 * safezoneH + safezoneY;
			w = 0.0860417 * safezoneW;
			h = 0.0235185 * safezoneH;
			onLBSelChanged="call func_ValueChanged_BoxTypeWep;";
		};
		class RscPicture_1201: RscPicture
		{
			idc = 51607;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.389063 * safezoneW + safezoneX;
			y = 0.18426 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class RscText_1100: RscText
		{
			idc = 51608;
			text = "Total 1";
			x = 0.291146 * safezoneW + safezoneX;
			y = 0.250926 * safezoneH + safezoneY;
			w = 0.139688 * safezoneW;
			h = 0.137407 * safezoneH;
		};
		class RscListbox_1501: RscListbox
		{
			idc = 51609;
			x = 0.450521 * safezoneW + safezoneX;
			y = 0.419445 * safezoneH + safezoneY;
			w = 0.244531 * safezoneW;
			h = 0.353565 * safezoneH;
			colorSelectBackground[] = {0.7, 0.7, 0.7, 0};
			colorSelect[]           = {1, 1, 1, 1};
		};
		class RscText_1101: RscText
		{
			idc = 51610;
			text = "Total 2";
			x = 0.44948 * safezoneW + safezoneX;
			y = 0.250926 * safezoneH + safezoneY;
			w = 0.139688 * safezoneW;
			h = 0.137407 * safezoneH;
		};
		class RscPicture_1202: RscPicture
		{
			idc = 51611;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.451041 * safezoneW + safezoneX;
			y = 0.183333 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class RscPicture_1203: RscPicture
		{
			idc = 51612;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.603124 * safezoneW + safezoneX;
			y = 0.250926 * safezoneH + safezoneY;
			w = 0.0902084 * safezoneW;
			h = 0.13926 * safezoneH;
		};
		class RscCombo_2101: RscCombo
		{
			idc = 51613;
			x = 0.604167 * safezoneW + safezoneX;
			y = 0.196296 * safezoneH + safezoneY;
			w = 0.0860417 * safezoneW;
			h = 0.0235185 * safezoneH;
			onLBSelChanged="call func_ValueChanged_BoxTypeWep;";
		};
		class RscButton_1602: RscButton
		{
			idc = 51614;
			text = "+";
			x = 0.44375 * safezoneW + safezoneX;
			y = 0.791667 * safezoneH + safezoneY;
			w = 0.0240625 * safezoneW;
			h = 0.0290741 * safezoneH;
			action = "call func_GunStore_Plus;";
		};
		class RscButton_1603: RscButton
		{
			idc = 51615;
			text = "----->";
			x = 0.422916 * safezoneW + safezoneX;
			y = 0.837037 * safezoneH + safezoneY;
			w = 0.0641667 * safezoneW;
			h = 0.0272222 * safezoneH;
		};
		
		
		
	};
};

