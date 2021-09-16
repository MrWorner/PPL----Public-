


#define CT_STATIC 0 
#define CT_BUTTON 1 
#define CT_EDIT 2 
#define CT_SLIDER 3 
#define CT_COMBO 4 
#define CT_LISTBOX 5 
#define CT_TOOLBOX 6 
#define CT_CHECKBOXES 7 
#define CT_PROGRESS 8 
#define CT_HTML 9 
#define CT_STATIC_SKEW 10 
#define CT_ACTIVETEXT 11 
#define CT_TREE 12 
#define CT_STRUCTURED_TEXT 13 
#define CT_CONTEXT_MENU 14 
#define CT_CONTROLS_GROUP 15 
#define CT_SHORTCUT_BUTTON 16 // Arma 2 - textured button 
#define CT_XKEYDESC 40 
#define CT_XBUTTON 41 
#define CT_XLISTBOX 42 
#define CT_XSLIDER 43 
#define CT_XCOMBO 44 
#define CT_ANIMATED_TEXTURE 45 
#define CT_OBJECT 80 
#define CT_OBJECT_ZOOM 81 
#define CT_OBJECT_CONTAINER 82 
#define CT_OBJECT_CONT_ANIM 83 
#define CT_LINEBREAK 98 
#define CT_USER 99 
#define CT_MAP 100 
#define CT_MAP_MAIN 101 
#define CT_List_N_Box 102 // Arma 2 - N columns list box 

// Static styles 
#define ST_POS 0x0F 
#define ST_HPOS 0x03 
#define ST_VPOS 0x0C 
#define ST_LEFT 0x00 
#define ST_RIGHT 0x01 
#define ST_CENTER 0x02 
#define ST_DOWN 0x04 
#define ST_UP 0x08 
#define ST_VCENTER 0x0c 
#define ST_TYPE 0xF0 
#define ST_SINGLE 0 
#define ST_MULTI 16 
#define ST_TITLE_BAR 32 
#define ST_PICTURE 48 
#define ST_FRAME 64 
#define ST_BACKGROUND 80 
#define ST_GROUP_BOX 96 
#define ST_GROUP_BOX2 112 
#define ST_HUD_BACKGROUND 128 
#define ST_TILE_PICTURE 144 
#define ST_WITH_RECT 160 
#define ST_LINE 176 
#define ST_SHADOW 0x100 
#define ST_NO_RECT 0x200 
#define ST_KEEP_ASPECT_RATIO 0x800 
#define ST_TITLE ST_TITLE_BAR + ST_CENTER 

// Slider styles 
#define SL_DIR 0x400 
#define SL_VERT 0 
#define SL_HORZ 0x400 
#define SL_TEXTURES 0x10 

// Listbox styles 
#define LB_TEXTURES 0x10 
#define LB_MULTI 0x20 
#define FontM "Zeppelin32"

#define true 1
#define false 1







#define FontM 			"TahomaB"

#define FontHTML 		"TahomaB"
	
#define CT_STATIC 		0

#define CT_BUTTON		1

#define CT_EDIT			2

#define CT_SLIDER		3

#define CT_COMBO		4

#define CT_LISTBOX		5

#define CT_TOOLBOX 		6

#define CT_CHECKBOXES 		7

#define CT_PROGRESS 		8

#define CT_HTML 		9

#define CT_STATIC_SKEW 		10

#define CT_ACTIVETEXT		11

#define CT_TREE 		12

#define CT_STRUCTURED_TEXT 	13

#define CT_CONTEXT_MENU 	14

#define CT_CONTROLS_GROUP 	15

#define CT_XKEYDESC 		40

#define CT_XBUTTON 		41

#define CT_XLISTBOX 		42

#define CT_XSLIDER 		43

#define CT_XCOMBO 		44

#define CT_ANIMATED_TEXTURE	45

#define CT_OBJECT 		80

#define CT_OBJECT_ZOOM 		81

#define CT_OBJECT_CONTAINER	82

#define CT_OBJECT_CONT_ANIM	83

#define CT_LINEBREAK		98

#define CT_USER			99

#define CT_MAP 			100

#define CT_MAP_MAIN		101

#define ST_LEFT			0

#define ST_RIGHT		1

#define ST_CENTER		2

#define ST_MULTI		16

#define ST_PICTURE		48

#define ST_FRAME		64

#define ST_SHADOW		256

#define ST_NO_RECT		512   

//=====================================================================================    



class RscBackground
{

colorBackground[] = {0.2, 0.1, 0.2, 0.7};
text              = "";
type              = CT_STATIC;
idc               = -1;
style             = ST_LEFT;
colorText[]       = {1, 1, 1, 1};
font              = FontM;
sizeEx            = 0.04;

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

class RscButton
{

    type                      = CT_BUTTON;
    idc                       = -1;
    style                     = ST_CENTER;
	font = FontM;
    sizeEx                    = 0.025;
    soundPush[]               = {"", 0.2, 1};
    soundClick[]              = {"ui\ui_ok", 0.2, 1};
    soundEscape[]             = {"ui\ui_cc", 0.2, 1};
    text                      = "";
    action                    = "";
    colorActive[]             = {0, 1, 0, 1};
    colorDisabled[]           = {1, 0, 0, 0.5};
    colorBackgroundDisabled[] = {0,0,0,1};
    colorShadow[]             = {0, 0, 0, 1};
    colorBorder[]             = {1, 1, 1, 0};
    offsetX                   = 0;
    offsetY                   = 0;
    offsetPressedX            = 0;
    offsetPressedY            = 0;
    borderSize                = 0;
    soundEnter[]              = {"", 0.15, 1};
	
	colorText[] = {1,1,1,1};
	//colorBackground[] = {0.2, 0.5, 0.2, 0.8};	//GREEN
	//colorBackground[] = {0.2, 0.2, 0.5, 0.8};	//BLUE
	colorBackground[] = {0, 0.3, 0.4, 1};	
	colorFocused[] = {0.8, 0.5, 0, 1};
	//colorBackgroundActive[] =  {0.2, 0.1, 1, 1};
	colorBackgroundActive[] =  {0, 0.6, 0, 1};
	default = false;

	
			
			
			
	
};


class RscText

{
	type              = CT_STATIC;
	idc               = -1;
	style             = ST_LEFT;
	colorBackground[] = {0, 0, 0, 0};
	colorText[]       = {1, 1, 1, 1};
	font              = FontM;
	sizeEx            = 0.025;
	text              = "";
};


class RscStructuredText {
  idc = -1; 
  type = CT_STRUCTURED_TEXT;  // defined constant
  style = ST_LEFT;            // defined constant
  colorBackground[] = { 1, 1, 1, 0 }; 
  x = 0.1; 
  y = 0.1; 
  w = 0.3; 
  h = 0.1; 
  size = 0.025;
  text = "";
  class Attributes {
   // font = "TahomaB";
    font = FontM;
   // color = "#000000";
    align = "Left";
    valign = "Left";
    shadow = true;
    shadowColor = "#ff0000";
    size = "1";
  };
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




class RscListbox

{

style                   = ST_LEFT;
idc                     = -1;
colorText[] = {1,1,1,1};
colorScrollbar[] = {1,1,1,1};
colorSelect[] = {1,0,0,1};
colorSelect2[] = {1,1,0,1};
colorSelectBackground[] = {0,0,0,1};
colorSelectBackground2[] = {0,0,0,1};
colorBackground[] = {0,0,0,1};
font                    = FontHTML;
sizeEx                  = 0.025;
rowHeight               = 0.04;
period 			= 1.200000;
maxHistoryDelay 	= 1.000000;
autoScrollSpeed 	= -1;
autoScrollDelay 	= 5;
autoScrollRewind 	= 0;

class ScrollBar {};

soundSelect[] = {"", 0.1, 1};
type          = CT_LISTBOX;

};

class RscCombo
{

style                   = ST_LEFT;
idc                     = -1;
colorSelect[]           = {0.5, 0, 0.5, 1};
colorSelectBackground[] = {1, 1, 1, 1};
colorText[]             = {1, 1, 1, 1};
colorBackground[]       = {0, 0, 0, 1};
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

type            = CT_COMBO;
wholeHeight     = 0.3;
soundSelect[]   = {"", 0.15, 1};
soundExpand[]   = {"", 0.15, 1};
soundCollapse[] = {"", 0.15, 1};
arrowEmpty = "\ca\ui\data\ui_arrow_combo_ca.paa";
arrowFull = "\ca\ui\data\ui_arrow_combo_active_ca.paa"; 

};





class RscEdit

{

type = CT_EDIT;
idc = -1;
style = ST_LEFT;
font = FontHTML;
sizeEx = 0.02;
colorText[] = {1, 1, 1, 1};
colorSelection[] = {0.5, 0.5, 0.5, 1};
colorBackground[] = {0.8, 0.5, 0.8, 1};

autocomplete = false;text = "";

};

class MapControl_2017  {
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
