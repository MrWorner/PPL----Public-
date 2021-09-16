
class DIALOG_FastFood1
{
	idd = 50400;
	movingEnable = true;											
	controlsBackground[] = {DLG_BACK1};
	objects[] = { };
	controls[] = {Picture, submit,submit2,cancel};

	class DLG_BACK1: RscBackground
	{    
	      colorBackground[] = {0.2, 0.1, 0.2, 0};
		x = 0.30; y = 0.12;
		w = 0.40; h = 0.65;
	};


	class submit : RscButton
	{
		idc = 50401;
		x = 0.58; y = 0.39;
		w = 0.05; h = 0.05;
		text = "BUY";
		action = "[""Pirozhki"",5,15] call func_BuyFood_Cafe;";
	};
	
	
	class submit2 : RscButton
	{
		idc = 50402;
		x = 0.58; y = 0.54;
		w = 0.05; h = 0.05;
		text = "BUY";
		action = "[""Chiburekki"",9,21] call func_BuyFood_Cafe;";
	};

	
	
	class cancel : RscButton
	{
		x = 0.54; y = 0.69;
		w = 0.10; h = 0.05;
		text = "CLOSE";
		action = "closedialog 0;";
	};



		class Picture: RscPicture
  {
   text = "PoliceState_Resources\Pictures\module_Shop\FastFoodWindow.paa";
   x = 0.10; y =  0.03;
   w = 0.70; h = 1.00;
  };
  
};