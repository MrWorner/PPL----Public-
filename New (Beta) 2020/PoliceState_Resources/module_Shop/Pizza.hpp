
class DIALOG_Pizza1
{
	idd = 50500;
	movingEnable = true;											
	controlsBackground[] = {DLG_BACK1};
	objects[] = { };
	controls[] = {Picture, submit,submit2,submit3,cancel};

	class DLG_BACK1: RscBackground
	{    
	    colorBackground[] = {0.2, 0.1, 0.2, 0};
		x = 0.30; y = 0.12;
		w = 0.40; h = 0.65;
	};


	class submit : RscButton
	{
		idc = 50501;
		x = 0.58; y = 0.385;
		w = 0.05; h = 0.05;
		text = "BUY";
		action = "[""Classic Pizza"",17,30] call func_BuyFood_Cafe;";
	};
	
	
	class submit2 : RscButton
	{
		idc = 50502;
		x = 0.58; y = 0.524;
		w = 0.05; h = 0.05;
		text = "BUY";
		action = "[""Pepperoni"",26,42] call func_BuyFood_Cafe;";
	};
	
	class submit3 : RscButton
	{
	
		idc = 50503;
		x = 0.58; y = 0.684;
		w = 0.05; h = 0.05;
		text = "BUY";
		action = "[""Hawaiian"",33,63] call func_BuyFood_Cafe;";
	};
	
	
	class cancel : RscButton
	{
		x = 0.52; y = 0.86;
		w = 0.10; h = 0.05;
		text = "CLOSE";
		action = "closedialog 0;";
	};



		class Picture: RscPicture
  {
   text = "PoliceState_Resources\Pictures\module_Shop\PizzaWindow.paa";
   x = 0.10; y =  0.03;
   w = 0.70; h = 1.00;
  };
  
};

