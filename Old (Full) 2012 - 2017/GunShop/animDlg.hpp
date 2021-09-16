// edited by eddie vedder
//Re-edited by HarryWorner
class WEPdialog
{
	idd = -1;
	movingEnable = true;											
	controlsBackground[] = {DLG_BACK1, background,};
	objects[] = { };
	controls[] = {animationsliste, submit, cancel, dummybutton};

	class DLG_BACK1: RscBackground
	{    
	      colorBackground[] = {0.2, 0.1, 0.2, 0.7};
		x = 0.30; y = 0.12;
		w = 0.40; h = 0.65;
	};
	class background : RscBgRahmen
	{
	       colorText[] = {1,1,1,0};
			x = 0.29; y = 0.09;
			w = 0.43; h = 0.75;
			text = "";
	};
	class animationsliste : RscListBox
	{    
	   font = FontM;
		colorText[] = {0,1,0,1};
		idc = 1;
		x = 0.30; y = 0.12;
		w = 0.40; h = 0.65;
	};
	class submit : RscButton
	{
	
	   colorBackground[] = {0.2, 0.1, 0.2, 0.8};
		idc = 2;
		x = 0.30; y = 0.78;
		w = 0.19; h = 0.04;
		font = FontM;
		colorText[] = {1,0.2,0.2,1};
		text = "BUY";
		action = "";
	};
	class cancel : RscButton
	{
	   colorBackground[] = {0.2, 0.1, 0.2, 0.8};
		x = 0.51; y = 0.78;
		w = 0.19; h = 0.04;
		font = FontM;
		text = "CLOSE";
		colorText[] = {0.2,0.2,1,1};
		action = "closedialog 0;";
	};
		class dummybutton : RscDummy {idc = 1009;
	};

};


class Mission1Dialog
{
	idd = -1;
	movingEnable = true;											
	controlsBackground[] = {DLG_BACK1, background,};
	objects[] = { };
	controls[] = {submit,animationsliste,GreenBorder, cancel, dummybutton, Picture};

	class DLG_BACK1: RscBackground
	{    
	      colorBackground[] = {0.2, 0.1, 0.2, 0.7};
		x = 0.20; y = 0.12; //	x = 0.30; y = 0.12;
		w = 0.60; h = 0.75; //  w = 0.41; h = 0.65;
	};
	class background : RscBgRahmen
	{
	       colorText[] = {1,1,1,0};
			x = 0.30; y = 0.12; //x = 0.29; y = 0.09;
			w = 0.50; h = 0.75; //	w = 0.43; h = 0.75;
			text = "GUN SHOP";
	};

	
	class animationsliste : MyRscStructuredText
	{    
	   font = FontM;
		colorText[] = {0.2,0.2,1,1};
		idc = 1;
		x = 0.30; y = 0.32; //x = 0.30; y = 0.12;
		w = 0.50; h = 0.75; //w = 0.40; h = 0.65;
		text = "Target: Cozzac";
	};
	
		class GreenBorder : RscListBox
	{    
	   font = FontM;
		colorText[] = {0,1,0,1};
		idc = 1;
		x = 0.20; y = 0.12; //	x = 0.30; y = 0.12;
		w = 0.60; h = 0.75; //  w = 0.41; h = 0.65;
	};
	class submit : RscButton
	{
	
	   colorBackground[] = {0.2, 0.1, 0.2, 0.8};
		idc = 2;
		x = 0.30; y = 0.88;
		w = 0.20; h = 0.04;
		font = FontM;
		colorText[] = {1,0.2,0.2,1};
		text = "Accept";
		action = "[] execVM ""Check.sqf"";"; //action = "[] execVM ""Check.sqf"";"; 
	};
	class cancel : RscButton
	{
	   colorBackground[] = {0.2, 0.1, 0.2, 0.8};
		x = 0.51; y = 0.88;
		w = 0.20; h = 0.04;
		font = FontM;
		text = "Decline";
		colorText[] = {0.2,0.2,1,1};
		action = "closedialog 0;";
	};
		class dummybutton : RscDummy {idc = 1009;
	};
	
	class Picture: RscPicture
  {
   text = "Author.paa";
   x = 0.46;
   y = 0.63;
   w = 0.2;
   h = 0.2;
   colorText[] = {0.4,0.6745,0.2784,1.0};// whatever gives you a thrill 
  };
	

};



class GasStationdialog
{
	idd = -1;
	movingEnable = true;											
	controlsBackground[] = {DLG_BACK1};
	objects[] = { };
	controls[] = {Picture, submit,submit2,submit3, cancel};

	class DLG_BACK1: RscBackground
	{    
	      colorBackground[] = {0.2, 0.1, 0.2, 0};
		x = 0.30; y = 0.12;
		w = 0.40; h = 0.65;
	};


	class submit : RscButton
	{
	
	   colorBackground[] = {0.2, 0.1, 0.2, 0.1};
		idc = 2;
		x = 0.33; y = 0.35;
		w = 0.10; h = 0.05;
		font = FontM;
		colorText[] = {1,0.2,0.2,1};
		text = "BUY";
		action = "[""FuelCan"",45] execVM ""GunShop\BuyAction3.sqf"";";
	};
	
	
	class submit2 : RscButton
	{
	
	   colorBackground[] = {0.2, 0.1, 0.2, 0.1};
		idc = 2;
		x = 0.33; y = 0.59;
		w = 0.10; h = 0.05;
		font = FontM;
		colorText[] = {1,0.2,0.2,1};
		text = "BUY";
		action = "[""Candies"",6] execVM ""GunShop\BuyAction3.sqf"";";
	};
	
	
	class submit3 : RscButton
	{
	
	   colorBackground[] = {0.2, 0.1, 0.2, 0.1};
		idc = 2;
		x = 0.59; y = 0.29;
		w = 0.15; h = 0.05;
		font = FontM;
		colorText[] = {1,0.2,0.2,1};
		text = "Start refueling";
		action = "[] execVM ""CarAction\Refuel.sqf"";";
	};
	
	
	class cancel : RscButton
	{
	   colorBackground[] = {0.2, 0.1, 0.2, 0.1};
		x = 0.63; y = 0.79;
		w = 0.10; h = 0.05;
		font = FontM;
		text = "CLOSE";
		colorText[] = {0.2,0.2,1,1};
		action = "closedialog 0;";
	};





		class Picture: RscPicture
  {
   text = "Texture\GasStation.paa";
   x = 0.10; y =  0.03;
   w = 0.70; h = 1.00;
  };
  
};

	  
 

class PayForFuel
{
	idd = -1;		
	movingEnable = true;
	controlsBackground[] = {DLG_BACK1};
	objects[] = { };	
	controls[] = {infotext, button1, button2, dummybutton};	
	class DLG_BACK1: Rscbackground			
	{
	
	   colorBackground[] = {0.2, 0.1, 0.2, 0.7};
		x = 0.40; 
		y = 0.21;		
		w = 0.34;
		h = 0.10;
	};			
	
				
	
	class infotext : RscText2
	{						
		idc = 1;			
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
		font = FontM;
		colorText[] = {1,0.2,0.2,1};
		text = "Accept";	
		action = "IreadyToPay = true;[] execVM ""CarAction\Refuel.sqf"";closeDialog 0;";	
	};
	
	class button2 : RscButton	
	{
		x = 0.53; 
		y = 0.32;
		w = 0.10; 
		h = 0.04;
		colorText[] = {0.2,0.2,1,1};
		text = "Decline";	
		action = "closeDialog 0;";	
	};
	
	class dummybutton : RscDummy {idc = 1023;
	};
};




class Dump
{
	idd = -1;
	movingEnable = true;											
	controlsBackground[] = {DLG_BACK1};
	objects[] = { };
	controls[] = {Picture,  cancel, submit};

	class DLG_BACK1: RscBackground
	{    
	      colorBackground[] = {0.2, 0.1, 0.2, 0};
		x = 0.30; y = 0.12;
		w = 0.40; h = 0.65;
	};


	class submit : RscButton
	{
	
	   colorBackground[] = {0.2, 0.1, 0.2, 0.1};
		x = 0.53; y = 0.42;
		w = 0.10; h = 0.05;
		font = FontM;
		colorText[] = {1,0.2,0.2,1};
		text = "CHECK";
		action = "[] execVM ""CarAction\CarSell.sqf"";closedialog 0;";
	};
	

	
	class cancel : RscButton
	{
	   colorBackground[] = {0.2, 0.1, 0.2, 0.1};
		x = 0.53; y = 0.52;
		w = 0.10; h = 0.05;
		font = FontM;
		text = "CLOSE";
		colorText[] = {0.2,0.2,1,1};
		action = "closedialog 0;";
	};

		class Picture: RscPicture
  {
   text = "Texture\SellCar.paa";
   x = 0.10; y =  0.03;
   w = 0.70; h = 1.00;
  };
  
};

	  
 
class SellCARready
{
	idd = -1;		
	movingEnable = true;
	controlsBackground[] = {DLG_BACK1};
	objects[] = { };	
	controls[] = {infotext, button1, button2, dummybutton};	
	class DLG_BACK1: Rscbackground			
	{
	
	   colorBackground[] = {0.2, 0.1, 0.2, 0.7};
		x = 0.40; 
		y = 0.21;		
		w = 0.34;
		h = 0.10;
	};			
	
				
	
	class infotext : RscText2
	{						
		idc = 1;			
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
		font = FontM;
		colorText[] = {1,0.2,0.2,1};
		text = "Accept";	
		action = "IreadyToSell = true;[] execVM ""CarAction\CarSell.sqf"";closeDialog 0;";	
	};
	
	class button2 : RscButton	
	{
		x = 0.53; 
		y = 0.32;
		w = 0.10; 
		h = 0.04;
		colorText[] = {0.2,0.2,1,1};
		text = "Decline";	
		action = "closeDialog 0;";	
	};
	
	class dummybutton : RscDummy {idc = 1023;
	};
};





class RepairDialog
{
	idd = -1;
	movingEnable = true;											
	controlsBackground[] = {DLG_BACK1};
	objects[] = { };
	controls[] = {Picture,  cancel, submit};

	class DLG_BACK1: RscBackground
	{    
	      colorBackground[] = {0.2, 0.1, 0.2, 0};
		x = 0.30; y = 0.12;
		w = 0.40; h = 0.65;
	};


	class submit : RscButton
	{
	
	   colorBackground[] = {0.2, 0.1, 0.2, 0.1};
		x = 0.53; y = 0.53;
		w = 0.10; h = 0.05;
		font = FontM;
		colorText[] = {1,0.2,0.2,1};
		text = "CHECK";
		action = "[] execVM ""CarAction\CarRepair.sqf"";closedialog 0;";
	};
	

	
	class cancel : RscButton
	{
	   colorBackground[] = {0.2, 0.1, 0.2, 0.1};
		x = 0.53; y = 0.69;
		w = 0.10; h = 0.05;
		font = FontM;
		text = "CLOSE";
		colorText[] = {0.2,0.2,1,1};
		action = "closedialog 0;";
	};

		class Picture: RscPicture
  {
   text = "Texture\RepairWindow.paa";
   x = 0.10; y =  0.03;
   w = 0.70; h = 1.00;
  };
  
};


 
class RepairCARready
{
	idd = -1;		
	movingEnable = true;
	controlsBackground[] = {DLG_BACK1};
	objects[] = { };	
	controls[] = {infotext, button1, button2, dummybutton};	
	class DLG_BACK1: Rscbackground			
	{
	
	   colorBackground[] = {0.2, 0.1, 0.2, 0.7};
		x = 0.40; 
		y = 0.21;		
		w = 0.34;
		h = 0.10;
	};			
	
				
	
	class infotext : RscText2
	{						
		idc = 1;			
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
		font = FontM;
		colorText[] = {1,0.2,0.2,1};
		text = "Accept";	
		action = "IreadyToRepair = true;[] execVM ""CarAction\CarRepair.sqf"";closeDialog 0;";	
	};
	
	class button2 : RscButton	
	{
		x = 0.53; 
		y = 0.32;
		w = 0.10; 
		h = 0.04;
		colorText[] = {0.2,0.2,1,1};
		text = "Decline";	
		action = "closeDialog 0;";	
	};
	
	class dummybutton : RscDummy {idc = 1023;
	};
};



class CafeDialog
{
	idd = -1;
	movingEnable = true;											
	controlsBackground[] = {DLG_BACK1};
	objects[] = { };
	controls[] = {Picture, submit,submit2,submit3,submit4,submit5, cancel};

	class DLG_BACK1: RscBackground
	{    
	      colorBackground[] = {0.2, 0.1, 0.2, 0};
		x = 0.30; y = 0.12;
		w = 0.40; h = 0.65;
	};


	class submit : RscButton
	{
	
	   colorBackground[] = {0.2, 0.1, 0.2, 0.1};
		idc = 2;
		x = 0.58; y = 0.15;
		w = 0.05; h = 0.05;
		font = FontM;
		colorText[] = {1,0.2,0.2,1};
		text = "BUY";
		action = "[""Omelete"",10,18] execVM ""GunShop\Cafe.sqf"";";
	};
	
	
	class submit2 : RscButton
	{
	
	   colorBackground[] = {0.2, 0.1, 0.2, 0.1};
		idc = 2;
		x = 0.58; y = 0.275;
		w = 0.05; h = 0.05;
		font = FontM;
		colorText[] = {1,0.2,0.2,1};
		text = "BUY";
		action = "[""Borch"",13,24] execVM ""GunShop\Cafe.sqf"";";
	};
	
	class submit3 : RscButton
	{
	
	   colorBackground[] = {0.2, 0.1, 0.2, 0.1};
		idc = 2;
		x = 0.58; y = 0.42;
		w = 0.05; h = 0.05;
		font = FontM;
		colorText[] = {1,0.2,0.2,1};
		text = "BUY";
		action = "[""Pelmeni"",19,45] execVM ""GunShop\Cafe.sqf"";";
	};
	
		class submit4 : RscButton
	{
	
	   colorBackground[] = {0.2, 0.1, 0.2, 0.1};
		idc = 2;
		x = 0.58; y = 0.55;
		w = 0.05; h = 0.05;
		font = FontM;
		colorText[] = {1,0.2,0.2,1};
		text = "BUY";
		action = "[""Grechka"",24,70] execVM ""GunShop\Cafe.sqf"";";
	};
	
		class submit5 : RscButton
	{
	
	   colorBackground[] = {0.2, 0.1, 0.2, 0.1};
		idc = 2;
		x = 0.58; y = 0.74;
		w = 0.05; h = 0.05;
		font = FontM;
		colorText[] = {1,0.2,0.2,1};
		text = "BUY";
		action = "[""Shashlik"",45,90] execVM ""GunShop\Cafe.sqf"";";
	};
	
	
	class cancel : RscButton
	{
	   colorBackground[] = {0.2, 0.1, 0.2, 0.1};
		x = 0.40; y = 0.89;
		w = 0.10; h = 0.05;
		font = FontM;
		text = "CLOSE";
		colorText[] = {0.2,0.2,1,1};
		action = "closedialog 0;";
	};



		class Picture: RscPicture
  {
   text = "Texture\CafeWindow.paa";
   x = 0.10; y =  0.03;
   w = 0.70; h = 1.00;
  };
  
};


class PhoneDialog
{
	idd = -1;
	movingEnable = true;											
	controlsBackground[] = {DLG_BACK1};
	objects[] = { };
	controls[] = {Picture, submit, submit2, submit3, submit4, submit5, submit6, cancel};

	class DLG_BACK1: RscBackground
	{    
	      colorBackground[] = {0.2, 0.1, 0.2, 0};
		x = 0.30; y = 0.12;
		w = 0.40; h = 0.65;
	};


	class submit : RscButtonPhone
	{
	
	   colorBackground[] = {0.2, 0.1, 0.2, 0.1};
		idc = 2;
		x = 0.36; y = 0.31;
		w = 0.17; h = 0.05;
		font = FontM;
		colorText[] = {1,0.2,0.2,1};
		text = "";
		action = "[""""] execVM ""GunShop\Cafe.sqf"";"; //FireDept
	};
	
	
	class submit2 : RscButtonPhone
	{
	
	   colorBackground[] = {0.2, 0.1, 0.2, 0.1};
		idc = 2;
		x = 0.36; y = 0.38;
		w = 0.17; h = 0.05;
		font = FontM;
		colorText[] = {1,0.2,0.2,1};
		text = "";
		action = "[""""] execVM ""GunShop\Cafe.sqf"";"; //Police
	};
	
		class submit3 : RscButtonPhone
	{
	
	   colorBackground[] = {0.2, 0.1, 0.2, 0.1};
		idc = 2;
		x = 0.36; y = 0.44;
		w = 0.17; h = 0.05;
		font = FontM;
		colorText[] = {1,0.2,0.2,1};
		text = "";
		action = "[""""] execVM ""GunShop\Cafe.sqf"";"; //Medic
	};
	
	
			class submit4 : RscButtonPhone
	{
	
	   colorBackground[] = {0.2, 0.1, 0.2, 0.1};
		idc = 2;
		x = 0.36; y = 0.505;
		w = 0.17; h = 0.05;
		font = FontM;
		colorText[] = {1,0.2,0.2,1};
		text = "";
		action = "[""""] execVM ""GunShop\Cafe.sqf"";"; //Repair
	};
	
	
			class submit5 : RscButtonPhone
	{
	
	   colorBackground[] = {0.2, 0.1, 0.2, 0.1};
		idc = 2;
		x = 0.36; y = 0.57;
		w = 0.17; h = 0.05;
		font = FontM;
		colorText[] = {1,0.2,0.2,1};
		text = "";
		action = "[""""] execVM ""Radio\Taxi\taxi.sqf""; TaxiSetMarkerActivated = true;"; //Taxi
	};
	
	
			class submit6 : RscButtonPhone
	{
	
	   colorBackground[] = {0.2, 0.1, 0.2, 0.1};
		idc = 2;
		x = 0.36; y = 0.63;
		w = 0.17; h = 0.05;
		font = FontM;
		colorText[] = {1,0.2,0.2,1};
		text = "";
		action = "[""""] execVM ""Radio\taxi.sqf"";"; //PIZZA
	};
	
	
	
	
	class cancel : RscButtonPhone
	{
	   colorBackground[] = {0.2, 0.1, 0.2, 0.1};
		x = 0.475; y = 0.71;
		w = 0.062; h = 0.05;
		font = FontM;
		text = "";
		colorText[] = {0.2,0.2,1,1};
		action = "closedialog 0; PhoneOpened = false;";
	};



		class Picture: RscPicture
  {
   text = "Texture\PHONE.paa";
   x = 0.10; y =  0.03;
   w = 0.70; h = 1.00;
  };
  
};




class TaxiDialog {
idd = 50000;
objects[] = {};
controlsBackground[] = {};
controls[] = {Picture,mp,FonD,submit,cancel};
class FonD : RscText {colorBackground[] = {0.909,0.729,0.270,0.0};x = -1;y = -1;w = 3;h = 3;text = "";};
class Mp : RscMapControl {
   x = 0.3145; y =  0.2385;
   w = 0.248; h = 0.50;
};

		class submit : RscButtonPhone
	{
	
	   colorBackground[] = {0.2, 0.1, 0.2, 0.1};
		idc = 2;
		x = 0.317; y = 0.735;
		w = 0.076; h = 0.03;
		font = FontM;
		colorText[] = {1,0.2,0.2,1};
		text = "";
		action = "[""""] execVM ""Radio\taxi\TaxiGo.sqf"";"; 
	};
	class cancel : RscButtonPhone
	{
	   colorBackground[] = {0.2, 0.1, 0.2, 0.1};
		x = 0.48; y = 0.735;
		w = 0.079; h = 0.03;
		font = FontM;
		text = "";
		colorText[] = {0.2,0.2,1,1};
		action = "[""""] execVM ""Radio\taxi\NON.sqf"";";
	};


		class Picture: RscPicture
  {
   text = "Texture\PHONEmap.paa";
   x = 0.10; y =  0.03;
   w = 0.70; h = 1.00;
  };
  

};


class TaxiDialog2 {
idd = 50000;
objects[] = {};
controlsBackground[] = {};
controls[] = {Picture, mp,FonD,submit,cancel};
class FonD : RscText {colorBackground[] = {0.909,0.729,0.270,0.0};x = -1;y = -1;w = 3;h = 3;text = "";};
class Mp : RscMapControl {
   x = 0.15; y =  0.15;
   w = 0.640; h = 0.640;
};


	class cancel : RscButtonPhone
	{
	   colorBackground[] = {0.2, 0.1, 0.2, 0.1};
		x = 0.68; y = 0.8;
		w = 0.08; h = 0.06;
		font = FontM;
		colorText[] = {1,0.2,0.2,1};
		text = "Cancel";
		action = "[""""] execVM ""Radio\taxi\NON2.sqf"";";
	};

	
			class submit : RscButton
	{
	
	   colorBackground[] = {0.2, 0.1, 0.2, 0.1};
		idc = 2;
		x = 0.18; y = 0.8;
		w = 0.08; h = 0.06;
		font = FontM;
		colorText[] = {1,0.2,0.2,1};
		text = "Accept";
		action = "[""""] execVM ""Radio\taxi\TaxiGo2.sqf"";"; 
	};
	
	

		class Picture: RscPicture
  {
   text = "Texture\MapTaxi.paa";
   x = 0.1; y =  0.019;
   w = 0.755; h = 1;
  };
  

};




class HospitalDialog
{
	idd = -1;
	movingEnable = true;											
	controlsBackground[] = {DLG_BACK1};
	objects[] = { };
	controls[] = {Picture,  cancel, submit};

	class DLG_BACK1: RscBackground
	{    
	      colorBackground[] = {0.2, 0.1, 0.2, 0};
		x = 0.30; y = 0.12;
		w = 0.40; h = 0.65;
	};


	class submit : RscButton
	{
	
	   colorBackground[] = {0.2, 0.1, 0.2, 0.1};
		x = 0.53; y = 0.53;
		w = 0.10; h = 0.05;
		font = FontM;
		colorText[] = {1,0.2,0.2,1};
		text = "CHECK";
		action = "[] execVM ""Medic1\MedicChecking.sqf"";closedialog 0;";
	};
	

	
	class cancel : RscButton
	{
	   colorBackground[] = {0.2, 0.1, 0.2, 0.1};
		x = 0.53; y = 0.69;
		w = 0.10; h = 0.05;
		font = FontM;
		text = "CLOSE";
		colorText[] = {0.2,0.2,1,1};
		action = "closedialog 0;";
	};

		class Picture: RscPicture
  {
   text = "Texture\HospitalWindow.paa";
   x = 0.10; y =  0.03;
   w = 0.70; h = 1.00;
  };
  
};





class MedicReady
{
	idd = -1;		
	movingEnable = true;
	controlsBackground[] = {DLG_BACK1};
	objects[] = { };	
	controls[] = {infotext, button1, button2, dummybutton};	
	class DLG_BACK1: Rscbackground			
	{
	
	   colorBackground[] = {0.2, 0.1, 0.2, 0.7};
		x = 0.40; 
		y = 0.21;		
		w = 0.34;
		h = 0.10;
	};			
	
				
	
	class infotext : RscText2
	{						
		idc = 1;			
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
		font = FontM;
		colorText[] = {1,0.2,0.2,1};
		text = "Accept";	
		action = "IreadyToRepair = true;[] execVM ""Medic1\MedicChecking.sqf"";closeDialog 0;";	
	};
	
	class button2 : RscButton	
	{
		x = 0.53; 
		y = 0.32;
		w = 0.10; 
		h = 0.04;
		colorText[] = {0.2,0.2,1,1};
		text = "Decline";	
		action = "closeDialog 0;";	
	};
	
	class dummybutton : RscDummy {idc = 1023;
	};
};
