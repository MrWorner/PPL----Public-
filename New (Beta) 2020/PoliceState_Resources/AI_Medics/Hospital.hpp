
class DIALOG_Hospital
{
	idd = 51200;
	movingEnable = true;											
	controlsBackground[] = {};
	objects[] = { };
	controls[] = {Picture,  cancel, submit};


	class submit : RscButton
	{	
		x = 0.53; y = 0.53;
		w = 0.10; h = 0.05;
		text = "CHECK";
		action = "[] call func_Hospital_check;";
	};
	

	
	class cancel : RscButton
	{
		x = 0.53; y = 0.69;
		w = 0.10; h = 0.05;
		text = "CLOSE";
		action = "closedialog 51200;";
	};

	class Picture: RscPicture
  {
   text = "PoliceState_Resources\Pictures\AI_Medics\HospitalWindow.paa";
   x = 0.10; y =  0.03;
   w = 0.70; h = 1.00;
  };
  
};



class  DIALOG_Hospital_heal
{
	idd = 51300;		
	movingEnable = true;
	controlsBackground[] = {DLG_BACK1};
	objects[] = { };	
	controls[] = {infotext, button1, button2};	
		
	class DLG_BACK1: RscBackground			
	{
	
	   colorBackground[] = {0.2, 0.1, 0.2, 0.7};
		x = 0.40; 
		y = 0.21;		
		w = 0.34;
		h = 0.10;
	};
				
	
	class infotext : RscText
	{			
		text = "Test";		
		idc = 51301;			
		x = 0.40; 
		y = 0.21;		
		w = 0.34;
		h = 0.10;
		colorText[] = {0,1,0,1};
		style = ST_MULTI;
		lineSpacing = 1;	
	};
	
	class button1 : RscButton	
	{
		x = 0.40;
		y = 0.32;
		w = 0.10; 
		h = 0.04;	
		text = "Accept";	
		action = "[] call func_Hospital_heal;closeDialog 51300;";	
	};
	
	class button2 : RscButton	
	{
		x = 0.53; 
		y = 0.32;
		w = 0.10; 
		h = 0.04;
		text = "Cancel";	
		action = "closeDialog 51300;";	
	};
	
};

