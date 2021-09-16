class DIALOG_ModuleTaxi_Map
{
	idd = 50000;
	objects[] = {};
	controlsBackground[] = {};
	 class Controls 
	{
			class Picture: RscPicture
		{
			text = "PoliceState_Resources\module_Taxi\paa\MapTaxi.paa";
			x = 0.1; y =  0.019;
			w = 0.755; h = 1;
		};
		
		class FonD : RscText {colorBackground[] = {0.909,0.729,0.270,0.0};x = -1;y = -1;w = 3;h = 3;text = "";};
		class Mp : MapControl_2017 
		{
		x = 0.15; y =  0.15;
		w = 0.640; h = 0.640;
		};
		
		class cancel : RscButton
		{
		  // colorBackground[] = {0.2, 0.1, 0.2, 0.1};
			x = 0.68; y = 0.8;
			w = 0.08; h = 0.06;
			//font = FontM;
			text = "Cancel";
			action = "closedialog 50000;";
		};

		class submit : RscButton
		{
		  // colorBackground[] = {0.2, 0.1, 0.2, 0.1};
			idc = 2;
			x = 0.18; y = 0.8;
			w = 0.08; h = 0.06;
			//font = FontM;
			text = "Accept";
			action = "closedialog 50000; [] spawn func_Taxi_MoveToDestinaion;"; 
		};
		
	
	};
};