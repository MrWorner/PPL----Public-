
//$[1.03,[[0,0,1,1],0.03125,0.05],[1800,"PhoneFrame",[1,"Phone",["0.429102 * safezoneW + safezoneX","0.29375 * safezoneH + safezoneY","0.121459 * safezoneW","0.288139 * safezoneH"],[1,1,1,1],[1,0,0,1],[0,1,0,1],""],[]],[1600,"PhoneButton_1",[1,"Firefighters",["0.448438 * safezoneW + safezoneX","0.335 * safezoneH + safezoneY","0.0834375 * safezoneW","0.0253704 * safezoneH"],[1,1,1,1],[0,0,0,1],[1,0,1,1],""],[]],[1601,"PhoneButton_2",[1,"Ambulance",["0.448438 * safezoneW + safezoneX","0.39 * safezoneH + safezoneY","0.0834375 * safezoneW","0.0253704 * safezoneH"],[1,1,1,1],[0,0,0,1],[1,0,1,1],""],[]],[1602,"PhoneButton_3",[1,"Police",["0.448438 * safezoneW + safezoneX","0.445 * safezoneH + safezoneY","0.0834375 * safezoneW","0.0253704 * safezoneH"],[1,1,1,1],[0,0,0,1],[1,0,1,1],""],[]],[1603,"PhoneButton_4",[1,"Taxi service",["0.448438 * safezoneW + safezoneX","0.5 * safezoneH + safezoneY","0.0834375 * safezoneW","0.0253704 * safezoneH"],[1,1,1,1],[0,0,0,1],[1,0,1,1],""],[]]]
class DIALOG_ActionsWindow
{
    idd = 50200;
    movingenable = true;
	onLoad = "call fnc_init_open;";//--- called when the dialog is created
	
    class Controls
    {	
		 class Listbox1: RscListbox
        {
            idc = 50201;
            x = 0.304062 * safezoneW + safezoneX;
            y = 0.269 * safezoneH + safezoneY;
            w = 0.180469 * safezoneW;
            h = 0.484 *  safezoneH;
            onLBSelChanged="call fnc_Sel_click;";//--- action/function to call when listbox or combobox has been changed
            onLBDblClick="call fnc_Sel_click;";//--- action/function to call when listbox or combobox has been double clicked
        };
        class ComboBox1: RscCombo
        {
            idc = 50202;
            x = 0.304062 * safezoneW + safezoneX;
            y = 0.236 * safezoneH + safezoneY;
            w = 0.180469 * safezoneW;
            h = 0.022 * safezoneH;
            onLBSelChanged="call fnc_Cmb_changed;";//--- action/function to call when listbox or combobox has been changed
 
        };
		
    };
};
