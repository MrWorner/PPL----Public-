

class w_RscText {

	idc = -1;
	type = CT_STATIC;
	style = ST_LEFT;
	colorBackground[] = { 1 , 1 , 1 , 0 };
	colorText[] = { 1 , 1 , 1 , 1 };
	font = FontM;
	sizeEx = 0.025;
	h = 0.05;
	text = "";
};

class w_RscBackground
{

    colorBackground[] = {0.14, 0.18, 0.13, 0.8};
    text              = "";
    type              = CT_STATIC;
    idc               = -1;
    style             = ST_LEFT;
    colorText[]       = {1, 1, 1, 1};
    font              = FontM;
    sizeEx            = 0.04;
};

class w_RscEdit
{
    idc = -1;
    type = CT_EDIT;
    style = ST_LEFT;
    x = 0;
    y = 0;
    w = .2;
    h = .4;
    sizeEx = .02;
    font = FontM;

    text = "";
    colorText[] = {1,1,1,1};

    autocomplete = false;
    colorSelection[] = {0,0,0,1};
};

class w_Rsclist
{
        type = CT_LISTBOX;
        style = 69;
        idc = -1;
        text = "";
        w = 0.275;
        h = 0.04;
        colorSelect[] = {1, 1, 1, 1};
        colorText[] = {1, 1, 1, 1};
        colorBackground[] = {1,1,1,1};
        colorSelectBackground[] = {0.40, 0.43, 0.28, 0.5};
        colorScrollbar[] = {0.2, 0.2, 0.2, 1};
        arrowEmpty = "\ca\ui\data\ui_arrow_combo_ca.paa";
        arrowFull = "\ca\ui\data\ui_arrow_combo_active_ca.paa";
        wholeHeight = 0.45;
        rowHeight = 0.04;
        color[] = {0.7, 0.7, 0.7, 1};
        colorActive[] = {0,0,0,1};
        colorDisabled[] = {0,0,0,0.3};
        font = "Zeppelin32";
        sizeEx = 0.023;
        soundSelect[] = {"",0.1,1};
        soundExpand[] = {"",0.1,1};
        soundCollapse[] = {"",0.1,1};
        maxHistoryDelay = 1;
        autoScrollSpeed = -1;
        autoScrollDelay = 5;
        autoScrollRewind = 0;

        class ScrollBar
        {
                color[] = {1, 1, 1, 1};
                colorActive[] = {1, 1, 1, 1};
                colorDisabled[] = {1, 1, 1, 1};
                thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
                arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
                arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
                border = "\ca\ui\data\ui_border_scroll_ca.paa";
        };
};

class w_RscPicture 
{

	idc = -1; 
	type = CT_STATIC;
	style = ST_PICTURE;
	
	font = FontM;
	sizeEx = 0.023;
	
	colorBackground[] = {};
	colorText[] = {};
	
	x = 0.0; y = 0.2;
	w = 0.2; h = 0.2;
	
	text = "";
	
}; 

class w_RscButtonBase {

	idc = -1;
	type = 16;
	style = 0;
	
	w = 0.183825;
	h = 0.104575;
	
	color[] = {0.95, 0.95, 0.95, 1};
	color2[] = {1, 1, 1, 0.4};
	colorBackground[] = {1, 1, 1, 1};
	colorbackground2[] = {1, 1, 1, 0.4};
	colorDisabled[] = {1, 1, 1, 0.25};
	
	periodFocus = 1.2;
	periodOver = 0.8;
	
	class HitZone {
	
		left = 0.004;
		top = 0.029;
		right = 0.004;
		bottom = 0.029;
		
	};
	
	class ShortcutPos {
	
		left = 0.004;
		top = 0.026;
		w = 0.0392157;
		h = 0.0522876;
		
	};
	
	class TextPos {
	
		left = 0.05;
		top = 0.034;
		right = 0.005;
		bottom = 0.005;
		
	};
	
	animTextureNormal = "\ca\ui\data\ui_button_normal_ca.paa";
	animTextureDisabled = "\ca\ui\data\ui_button_disabled_ca.paa";
	animTextureOver = "\ca\ui\data\ui_button_over_ca.paa";
	animTextureFocused = "\ca\ui\data\ui_button_focus_ca.01.paa";
	animTexturePressed = "\ca\ui\data\ui_button_down_ca.paa";
	animTextureDefault = "\ca\ui\data\ui_button_default_ca.paa";
	textureNoShortcut = "";
	
	period = 0.4;
	font = "Zeppelin32";
	size = 0.023;
	sizeEx = 0.023;
	text = "";
	
	soundEnter[] = {"\ca\ui\data\sound\mouse2", 0.09, 1};
	soundPush[] = {"\ca\ui\data\sound\new1", 0.09, 1};
	soundClick[] = {"\ca\ui\data\sound\mouse3", 0.07, 1};
	soundEscape[] = {"\ca\ui\data\sound\mouse1", 0.09, 1};
	
	action = "";
	
	class Attributes {
	
		font = "Zeppelin32";
		color = "#E5E5E5";
		align = "left";
		shadow = "true";
		
	};
	
	class AttributesImage {
	
		font = "Zeppelin32";
		color = "#E5E5E5";
		align = "left";
		
	};
};

class w_RscButton : w_RscButtonBase {

	w = 0.183825;
	h = 0.0522876;
	
	style = 2;
	
	color[] = {1, 1, 1, 1};
	color2[] = {1, 1, 1, 0.85};
	colorBackground[] = {1, 1, 1, 1};
	colorbackground2[] = {1, 1, 1, 0.85};
	colorDisabled[] = {1, 1, 1, 0.4};
	
	class HitZone {
	
		left = 0.002;
		top = 0.003;
		right = 0.002;
		bottom = 0.016;
		
	};
	
	class ShortcutPos {
	
		left = -0.006;
		top = -0.007;
		w = 0.0392157;
		h = 0.0522876;
		
	};
	
	class TextPos {
	
		left = 0.002;
		top = 0.008;
		right = 0.002;
		bottom = 0.016;
		
	};
	
	animTextureNormal = "\ca\ui\data\igui_button_normal_ca.paa";
	animTextureDisabled = "\ca\ui\data\igui_button_disabled_ca.paa";
	animTextureOver = "\ca\ui\data\igui_button_over_ca.paa";
	animTextureFocused = "\ca\ui\data\igui_button_focus_ca.paa";
	animTexturePressed = "\ca\ui\data\igui_button_down_ca.paa";
	animTextureDefault = "\ca\ui\data\igui_button_normal_ca.paa";
	animTextureNoShortcut = "\ca\ui\data\igui_button_normal_ca.paa";
	
	class Attributes {
	
		font = "Zeppelin32";
		color = "#E5E5E5";
		align = "center";
		shadow = "true";
		
	};
};

class RscButton
{

    type                      = CT_BUTTON;
    idc                       = -1;
    style                     = ST_CENTER;
    colorText[]               = {1, 1, 1, 1};
    font                      = "Zeppelin32";
    sizeEx                    = 0.025;
    soundPush[]               = {"", 0.2, 1};
    soundClick[]              = {"ui\ui_ok", 0.2, 1};
    soundEscape[]             = {"ui\ui_cc", 0.2, 1};
    default                   = false;
    text                      = "";
    action                    = "";
    colorActive[]             = {0, 0, 0, 0};
    colorDisabled[]           = {0, 0, 0, 0.1};
    colorBackground[]         = {0.8,0.8,0.8,0.3};
    colorBackgroundActive[]   = {0.7,0.7,0.7,1};
    colorBackgroundDisabled[] = {1,1,1,0.5};
    colorFocused[]            = {0.84,1,0.55,1};
    colorShadow[]             = {0, 0, 0, 0.1};
    colorBorder[]             = {1, 1, 1, 0.1};
    offsetX                   = 0;
    offsetY                   = 0;
    offsetPressedX            = 0;
    offsetPressedY            = 0;
    borderSize                = 0;
    soundEnter[]              = {"", 0.15, 1};

};



class RscButtonPhone
{

    type                      = CT_BUTTON;
    idc                       = -1;
    style                     = ST_CENTER;
    colorText[]               = {1, 1, 1, 1};
    font                      = "Zeppelin32";
    sizeEx                    = 0.025;
    soundPush[]               = {"", 0.2, 1};
    soundClick[]              = {"ui\ui_ok", 0.2, 1};
    soundEscape[]             = {"ui\ui_cc", 0.2, 1};
    default                   = false;
    text                      = "";
    action                    = "";
    colorActive[]             = {0, 0, 0, 0};
    colorDisabled[]           = {0, 0, 0, 0.1};
    colorBackground[]         = {0.8,0.8,0.8,0.0};
    colorBackgroundActive[]   = {0.0,1.0,0,0.5};
    colorBackgroundDisabled[] = {1,1,1,0.0};
    colorFocused[]            = {0.84,1,0.55,1};
    colorShadow[]             = {0, 0, 0, 0.1};
    colorBorder[]             = {1, 1, 1, 0.1};
    offsetX                   = 0;
    offsetY                   = 0;
    offsetPressedX            = 0;
    offsetPressedY            = 0;
    borderSize                = 0;
    soundEnter[]              = {"", 0.15, 1};

};


class w_RscCombo {

	idc = -1;
	type = 4;
	style = 0;
	x = "0.0 + 0.365";
	y = "0.0 + 0.038";
	w = 0.301000;
	h = 0.030000;
	font = "TahomaB";
	sizeEx = 0.025000;
	rowHeight = 0.025000;
	wholeHeight = "4 * 0.2";
	color[] = {
			1, 1, 1, 1
	};
	colorText[] = {
			0, 0, 0, 1
	};
	colorBackground[] = {
			1, 1, 1, 1
	};
	colorSelect[] = {
			1, 0, 0, 1
	};
	colorSelectBackground[] = {
			0, 1, 0, 1
	};
	soundSelect[] = {
			"", 0.000000, 1
	};
	soundExpand[] = {
			"", 0.000000, 1
	};
	soundCollapse[] = {
			"", 0.000000, 1
	};
	maxHistoryDelay = 10;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	colorScrollbar[] = {
			0.950000, 0.950000, 0.950000, 1
	};
	period = 1;
	thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
	arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
	arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
	border = "\ca\ui\data\ui_border_scroll_ca.paa";

		class ScrollBar
		{
			color[] = {1, 1, 1, 1};
			colorActive[] = {1, 1, 1, 1};
			colorDisabled[] = {1, 1, 1, 1};
			thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
			arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
			arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
			border = "\ca\ui\data\ui_border_scroll_ca.paa";
		};
	
};

class w_RscHTML
{
	type = CT_HTML;
	idc = -1;
	style = 0;
	filename = "";
	colorBackground[] = {0, 0, 0, 0};
	colorText[] = {1, 1, 1, 1};
	colorBold[] = {0, 0, 0, 1};
	colorLink[] = {0.05, 0.20, 0.05, 1};
	colorLinkActive[] = {0, 0, 0.20, 1};
	colorPicture[] = {1, 1, 1, 1};
	colorPictureLink[] = {1, 1, 1, 1};
	colorPictureSelected[] = {1, 1, 1, 1};
	colorPictureBorder[] = {0, 0, 0, 0};
	tooltipColorText[] = {0, 0, 0, 1};
	tooltipColorBox[] = {0, 0, 0, 0.50};
	tooltipColorShade[] = {1, 1, 0.70, 1};
	align="left";

	class H1
	{
		font = "Zeppelin32";
		fontBold = "Zeppelin33";
		sizeEx = 0.024740;
	};
	class H2
	{
		font = "Zeppelin32";
		fontBold = "Zeppelin33";
		sizeEx = 0.028646;
	};
	class H3
	{
		font = "Zeppelin32";
		fontBold = "Zeppelin33";
		sizeEx = 0.028646;
	};
	class H4
	{
		font = "Zeppelin33Italic";
		fontBold = "Zeppelin33";
		sizeEx = 0.020833;
	};
	class H5
	{
		font = "Zeppelin32";
		fontBold = "Zeppelin33";
		sizeEx = 0.020833;
	};
	class H6
	{
		font = "Zeppelin32";
		fontBold = "Zeppelin33";
		sizeEx = 0.020833;
	};
	class P
	{
		font = "Zeppelin32";
		fontBold = "Zeppelin33";
		sizeEx = 0.020833;
	};
	prevPage = "\ca\ui\data\arrow_left_ca.paa";
	nextPage = "\ca\ui\data\arrow_right_ca.paa";
};





class RscMapControl  {
	idc = -1;
	type = 101;
	style = 48;
	moveOnEdges = 1;
	x = "SafeZoneX";
	y = "SafeZoneY";
	w = "SafeZoneW";
	h = "SafeZoneH";
	ptsPerSquareSea = 8;
	ptsPerSquareTxt = 10;
	ptsPerSquareCLn = 10;
	ptsPerSquareExp = 10;
	ptsPerSquareCost = 10;
	ptsPerSquareFor = "6.0f";
	ptsPerSquareForEdge = "15.0f";
	ptsPerSquareRoad = "3f";
	ptsPerSquareObj = 15;
	showCountourInterval = "false";
	maxSatelliteAlpha = 0.750000;
	alphaFadeStartScale = 0.150000;
	alphaFadeEndScale = 0.290000;
	colorLevels[] = {0.650000,0.600000,0.450000,1 };
	colorSea[] = {0.460000,0.650000,0.740000,0.500000 };
	colorForest[] = {0.450000,0.640000,0.330000,0.500000 };
	colorRocks[] = {0,0,0,0.300000 };
	colorCountlines[] = {0.850000,0.800000,0.650000,1 };
	colorMainCountlines[] = {0.450000,0.400000,0.250000,1 };
	colorCountlinesWater[] = {0.250000,0.400000,0.500000,0.300000 };
	colorMainCountlinesWater[] = {0.250000,0.400000,0.500000,0.900000 };
	colorPowerLines[] = {0.100000,0.100000,0.100000,1 };
	colorRailWay[] = {0.800000,0.200000,0,1 };
	colorForestBorder[] = {0,0,0,0 };
	colorRocksBorder[] = {0,0,0,0 };
	colorNames[] = {0.100000,0.100000,0.100000,0.900000 };
	colorInactive[] = {1,1,1,0.500000 };
	colorOutside[] = {0,0,0,1 };
	colorBackground[] = {0.188200,0.258800,0.149000,10000 }; //	colorBackground[] = {0.188200,0.258800,0.149000,0.160000 };
	colorText[] = {0.543000,0.574200,0.410200,1.000000 };
	font = "Zeppelin32";
	SizeEx = 0.040000;
	fontLabel = "Zeppelin32";
	sizeExLabel = 0.034000;
	fontGrid = "Zeppelin32";
	sizeExGrid = 0.030000;
	fontUnits = "Zeppelin32";
	sizeExUnits = 0.034000;
	fontNames = "Zeppelin32";
	sizeExNames = 0.056000;
	fontInfo = "Zeppelin32";
	sizeExInfo = 0.034000;
	fontLevel = "Zeppelin32";
	sizeExLevel = 0.024000;
	text = "\ca\ui\data\map_background2_co.paa";

	class Task  {
		icon = "\ca\ui\data\ui_taskstate_current_CA.paa";
		iconCreated = "\ca\ui\data\ui_taskstate_new_CA.paa";
		iconCanceled = "#(argb,8,8,3)color(0,0,0,0)";
		iconDone = "\ca\ui\data\ui_taskstate_done_CA.paa";
		iconFailed = "\ca\ui\data\ui_taskstate_failed_CA.paa";
		color[] = {0.863000,0.584000,0.000000,1 };
		colorCreated[] = {0.950000,0.950000,0.950000,1 };
		colorCanceled[] = {0.606000,0.606000,0.606000,1 };
		colorDone[] = {0.424000,0.651000,0.247000,1 };
		colorFailed[] = {0.706000,0.074500,0.019600,1 };
		size = 27;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
	};
	class ActiveMarker  {
		color[] = {0.300000,0.100000,0.900000,1 };
		size = 50;
	};

	class CustomMark  {
		icon = "\ca\ui\data\map_waypoint_ca.paa";
		color[] = {0.647100,0.670600,0.623500,1.000000 };
		size = 18;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
	};

	class Legend  {
		x = "SafeZoneX";
		y = "SafeZoneY";
		w = 0.340000;
		h = 0.152000;
		font = "Zeppelin32";
		sizeEx = 0.039210;
		colorBackground[] = {0.906000,0.901000,0.880000,0 };
		color[] = {0,0,0,1 };
	};

	class Bunker  {
		icon = "\ca\ui\data\map_bunker_ca.paa";
		color[] = {0.450000,0.640000,0.330000,0.400000 };
		size = 14;
		importance = "1.5 * 14 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};

	class Bush  {
		icon = "\ca\ui\data\map_bush_ca.paa";
		color[] = {0.450000,0.640000,0.330000,0.400000 };
		size = 14;
		importance = "0.2 * 14 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};

	class BusStop  {
		icon = "\ca\ui\data\map_busstop_ca.paa";
		color[] = {0.150000,0.260000,0.870000,1 };
		size = 12;
		importance = "1 * 10 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};

	class Command  {
		icon = "\ca\ui\data\map_waypoint_ca.paa";
		color[] = {0,0.900000,0,1 };
		size = 18;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
	};

	class Cross  {
		icon = "\ca\ui\data\map_cross_ca.paa";
		size = 16;
		color[] = {0,0.900000,0,1 };
		importance = "0.7 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};

	class Fortress  {
		icon = "\ca\ui\data\map_bunker_ca.paa";
		size = 16;
		color[] = {0,0.900000,0,1 };
		importance = "2 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};

	class Fuelstation  {
		icon = "\ca\ui\data\map_fuelstation_ca.paa";
		size = 16;
		color[] = {0,0.900000,0,1 };
		importance = "2 * 16 * 0.05";
		coefMin = 0.750000;
		coefMax = 4;
	};

	class Fountain  {
		icon = "\ca\ui\data\map_fountain_ca.paa";
		color[] = {0.200000,0.450000,0.700000,1 };
		size = 11;
		importance = "1 * 12 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};

	class Hospital  {
		icon = "\ca\ui\data\map_hospital_ca.paa";
		color[] = {0.780000,0,0.050000,1 };
		size = 16;
		importance = "2 * 16 * 0.05";
		coefMin = 0.500000;
		coefMax = 4;
	};

	class Chapel  {
		icon = "\ca\ui\data\map_chapel_ca.paa";
		color[] = {0.450000,0.640000,0.330000,0.400000 };
		size = 16;
		importance = "1 * 16 * 0.05";
		coefMin = 0.900000;
		coefMax = 4;
	};

	class Church  {
		icon = "\ca\ui\data\map_church_ca.paa";
		size = 16;
		color[] = {0,0.900000,0,1 };
		importance = "2 * 16 * 0.05";
		coefMin = 0.900000;
		coefMax = 4;
	};

	class Lighthouse  {
		icon = "\ca\ui\data\map_lighthouse_ca.paa";
		size = 14;
		color[] = {0,0.900000,0,1 };
		importance = "3 * 16 * 0.05";
		coefMin = 0.900000;
		coefMax = 4;
	};

	class Quay  {
		icon = "\ca\ui\data\map_quay_ca.paa";
		size = 16;
		color[] = {0,0.900000,0,1 };
		importance = "2 * 16 * 0.05";
		coefMin = 0.500000;
		coefMax = 4;
	};

	class Rock  {
		icon = "\ca\ui\data\map_rock_ca.paa";
		color[] = {0.100000,0.100000,0.100000,0.800000 };
		size = 12;
		importance = "0.5 * 12 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};

	class Ruin  {
		icon = "\ca\ui\data\map_ruin_ca.paa";
		size = 16;
		color[] = {0,0.900000,0,1 };
		importance = "1.2 * 16 * 0.05";
		coefMin = 1;
		coefMax = 4;
	};

	class SmallTree  {
		icon = "\ca\ui\data\map_smalltree_ca.paa";
		color[] = {0.450000,0.640000,0.330000,0.400000 };
		size = 12;
		importance = "0.6 * 12 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};

	class Stack  {
		icon = "\ca\ui\data\map_stack_ca.paa";
		size = 20;
		color[] = {0,0.900000,0,1 };
		importance = "2 * 16 * 0.05";
		coefMin = 0.900000;
		coefMax = 4;
	};

	class Tree  {
		icon = "\ca\ui\data\map_tree_ca.paa";
		color[] = {0.450000,0.640000,0.330000,0.400000 };
		size = 12;
		importance = "0.9 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};

	class Tourism  {
		icon = "\ca\ui\data\map_tourism_ca.paa";
		color[] = {0.450000,0.640000,0.330000,0.400000 };
		size = 16;
		importance = "1 * 16 * 0.05";
		coefMin = 0.700000;
		coefMax = 4;
	};

	class Transmitter  {
		icon = "\ca\ui\data\map_transmitter_ca.paa";
		color[] = {0,0.900000,0,1 };
		size = 20;
		importance = "2 * 16 * 0.05";
		coefMin = 0.900000;
		coefMax = 4;
	};

	class ViewTower  {
		icon = "\ca\ui\data\map_viewtower_ca.paa";
		color[] = {0,0.900000,0,1 };
		size = 16;
		importance = "2.5 * 16 * 0.05";
		coefMin = 0.500000;
		coefMax = 4;
	};

	class Watertower  {
		icon = "\ca\ui\data\map_watertower_ca.paa";
		color[] = {0.200000,0.450000,0.700000,1 };
		size = 20;
		importance = "1.2 * 16 * 0.05";
		coefMin = 0.900000;
		coefMax = 4;
	};

	class Waypoint  {
		icon = "\ca\ui\data\map_waypoint_ca.paa";
		color[] = {0.0000,0.0000,0.0000,0.400000 };
		size = 16;
		importance = "2.5 * 16 * 0.05";
		coefMin = 0.500000;
		coefMax = 4;
	};

	class WaypointCompleted  {
		icon = "\ca\ui\data\map_waypoint_completed_ca.paa";
		color[] = {0.0000,0.0000,0.0000,0.400000 };
		size = 16;
		importance = "2.5 * 16 * 0.05";
		coefMin = 0.500000;
		coefMax = 4;
	};
};






class RscFrame
{
    type = CT_STATIC;
    idc = -1;
    style = ST_FRAME;
    shadow = 2;
    colorBackground[] = {1,1,1,1};
    colorText[] = {1,1,1,0.9};
    font = "Bitstream";
    sizeEx = 0.03;
    text = "";
};

class RscText
{

type              = CT_STATIC;
idc               = -1;
style             = ST_LEFT;
colorBackground[] = {0, 0, 0, 0};
colorText[]       = {0, 0, 0, 1};
font              = FontM;
sizeEx            = 0.02;
text              = "";

};

class RscText2

{

type              = CT_STATIC;
idc               = -1;
style             = ST_LEFT;
colorBackground[] = {0, 0, 0, 0};
colorText[]       = {0, 0, 0, 1};
font              = FontM;
sizeEx            = 0.03;
text              = "";

};

class RscBgRahmen

{

type              = CT_STATIC;
idc               = -1;
style             = ST_FRAME;
colorBackground[] = {1.0, 1.0, 1.0, 0.75};
colorText[]       = {0, 0, 0, 1};
font              = FontM;
SizeEX            = 0.025;
text              = "";

};

class RscBackground

{

colorBackground[] = {1.0, 1.0, 1.0, 0.75};
text              = "";
type              = CT_STATIC;
idc               = -1;
style             = ST_LEFT;
colorText[]       = {1, 1, 1, 1};
font              = FontM;
sizeEx            = 0.04;

};

class RscPicture

{

type              = CT_STATIC;
idc               =  -1;
style             = ST_PICTURE;
colorBackground[] = {0, 0, 0, 0};
colorText[]       = {1, 1, 1, 1};
font              = FontM;
sizeEx            = 0.02;
text              = "";

};

class RscBackgroundPicture

{

type              = CT_STATIC;
idc               =  -1;
style             = ST_PICTURE;
colorBackground[] = {0, 0, 0, 0};
colorText[]       = {0, 0, 0, 1};
font              = FontM;
sizeEx            = 0.02;
text              = "dbg.pac";

};

class RscDummy : RscButton

{

x   = -1.0;
y   = -1.0;
idc = -1;
w   = 0.01;
h   = 0.01;
default = true;

};

class RscEdit

{

type = CT_EDIT;
idc = -1;
style = ST_LEFT;
font = FontHTML;
sizeEx = 0.02;
colorText[] = {0, 0, 0, 1};
colorSelection[] = {0.5, 0.5, 0.5, 1};
autocomplete = false;text = "";

};

class RscLB_C

{

style                   = ST_LEFT;
idc                     = -1;
colorSelect[]           = {0, 0, 0, 1.0};
colorSelectBackground[] = {0.7, 0.7, 0.7, 1};
colorText[]             = {0, 0, 0, 1};
colorBackground[]       = {0.8, 0.8, 0.8, 0.3};
colorScrollbar[] 	= {Dlg_Color_White,1};
font                    = FontHTML;
sizeEx                  = 0.025;
rowHeight               = 0.04;
period 			= 1.200000;
maxHistoryDelay 	= 1.000000;
autoScrollSpeed 	= -1;
autoScrollDelay 	= 5;
autoScrollRewind 	= 0;

class ScrollBar {};

};

class RscListBox: RscLB_C

{

soundSelect[] = {"", 0.1, 1};
type          = CT_LISTBOX;

};

class RscCombo: RscLB_C

{

type            = CT_COMBO;
wholeHeight     = 0.3;
soundSelect[]   = {"", 0.15, 1};
soundExpand[]   = {"", 0.15, 1};
soundCollapse[] = {"", 0.15, 1};
arrowEmpty = "\ca\ui\data\ui_arrow_combo_ca.paa";
arrowFull = "\ca\ui\data\ui_arrow_combo_active_ca.paa"; 

};

class RscSliderH

{

access  = ReadandWrite;
type    = CT_SLIDER;
idc     = -1;
sizeEx  = 0.025;
style   = 1024;
color[] = {0.2, 0.2, 0.2, 1};
colorActive[] = {1, 1, 1, 1};

};

class RscSliderV

{

access  = ReadandWrite;
type    = CT_SLIDER;
idc     = -1;
sizeEx  = 0.025;
style   = 0;
color[] = {0.2, 0.2, 0.2, 1};
colorActive[] = {1, 1, 1, 1};

};



class MyRscStructuredText {
  idc = -1; 
  type = CT_STRUCTURED_TEXT;  // defined constant
  style = ST_LEFT;            // defined constant
  colorBackground[] = { 1, 1, 1, 0 }; 
  x = 0.1; 
  y = 0.1; 
  w = 0.3; 
  h = 0.1; 
  size = 0.04;
  text = "";
  class Attributes {
    font = "TahomaB";
   // color = "#000000";
    align = "Left";
    valign = "Left";
    shadow = false;
    shadowColor = "#ff0000";
    size = "1";
  };
};


class MyRscStructuredText2 {
  idc = -1; 
  type = CT_STRUCTURED_TEXT;  // defined constant
  style = ST_LEFT;            // defined constant
  colorBackground[] = { 1, 1, 1, 0 }; 
  x = 0.1; 
  y = 0.1; 
  w = 0.3; 
  h = 0.1; 
  size = 0.03;
  text = "";
  class Attributes {
    font = "TahomaB";
    color = "#111111";
    align = "Left";
    valign = "Left";
    shadow = false;
    shadowColor = "#ff0000";
    size = "1";
  };
};






