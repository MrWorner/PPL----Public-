
class DIALOG_Cafe1
{
	idd = 50300;
	movingEnable = true;											
	controlsBackground[] = {DLG_BACK1};
	objects[] = { };
	controls[] = {Picture, submit,submit2,submit3,submit4,submit5, cancel};

	class DLG_BACK1: RscBackground
	{    
	    colorBackground[] = {0.2, 0.1, 0.2, 0};
		x = 0.30; 
		y = 0.12;
		w = 0.40; 
		h = 0.65;
	};


	class submit : RscButton
	{
	
		idc = 50301;
		x = 0.58; 
		y = 0.15;
		w = 0.05; 
		h = 0.05;
		text = "BUY";
		action = "[""Omelete"",10,18] call func_BuyFood_Cafe;";
	};
	
	
	class submit2 : RscButton
	{
	
		idc = 50302;
		x = 0.58; 
		y = 0.275;
		w = 0.05; 
		h = 0.05;
		text = "BUY";
		action = "[""Borch"",13,24] call func_BuyFood_Cafe;";
	};
	
	class submit3 : RscButton
	{
	
		idc = 50304;
		x = 0.58; 
		y = 0.42;
		w = 0.05;
		h = 0.05;
		text = "BUY";
		action = "[""Pelmeni"",19,45] call func_BuyFood_Cafe;";
	};
	
		class submit4 : RscButton
	{
	
		idc = 50305;
		x = 0.58; 
		y = 0.55;
		w = 0.05; 
		h = 0.05;
		text = "BUY";
		action = "[""Grechka"",24,70] call func_BuyFood_Cafe;";
	};
	
		class submit5 : RscButton
	{
	
		idc = 50306;
		x = 0.58; 
		y = 0.74;
		w = 0.05;
		h = 0.05;
		text = "BUY";
		action = "[""Shashlik"",45,90] call func_BuyFood_Cafe;";
	};
	
	
	class cancel : RscButton
	{
		idc = 50307;
		x = 0.40; 
		y = 0.89;
		w = 0.10; 
		h = 0.05;
		text = "CLOSE";
		action = "closedialog 50300;";
	};



	class Picture: RscPicture
	{
	text = "PoliceState_Resources\Pictures\module_Shop\CafeWindow.paa";
	x = 0.10; y =  0.03;
	w = 0.70; h = 1.00;
	};
  
};