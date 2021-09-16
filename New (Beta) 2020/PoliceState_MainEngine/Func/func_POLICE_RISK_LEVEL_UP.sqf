//func_POLICE_RISK_LEVEL_UP
private["_killer", "_VictimSIDE_str","_this"];

while{(POLICE_RISK_LEVEL_SCORE >= POLICE_REQ_SCORE_ToLevelUP)}do
{
	switch (POLICE_RISK_LEVEL) do 
	{
		case 1: 
		{ 
			POLICE_REQ_SCORE_ToLevelUP = 1; //Police loses: 1 police officer to get Risk Level 2	//1
		};    
		case 2: 
		{ 
			POLICE_REQ_SCORE_ToLevelUP = 5; //Police loses: 5 police officers	//6
		};    
		case 3: 
		{ 
			POLICE_REQ_SCORE_ToLevelUP = 24; //Police loses: 12 SWAT officers	//x2	//30
		};    
		case 4: 
		{ 
			POLICE_REQ_SCORE_ToLevelUP = 64; //Police loses: 16 HRT (FBI) officers 	//x4	//94
		}; 	
		case 5: 
		{ 
			POLICE_REQ_SCORE_ToLevelUP = 176; //Police loses: 22 (Delta Force) soldiers //x8	//270
		}; 
		case 6: 
		{ 
			POLICE_REQ_SCORE_ToLevelUP = 560; //Police loses: 35 (Omega Force) soldiers	//x16//270
		};     
		default { hintc "default func_POLICE_RISK_LEVEL_UP POLICE_RISK_LEVEL"; POLICE_REQ_SCORE_ToLevelUP = 999999; };
	};
	
	// hintc format ["func_POLICE_RISK_LEVEL_UP: POLICE_REQ_SCORE_ToLevelUP = %1 POLICE_RISK_LEVEL_SCORE = %2",POLICE_REQ_SCORE_ToLevelUP, POLICE_RISK_LEVEL_SCORE];

	if(POLICE_RISK_LEVEL_SCORE >= POLICE_REQ_SCORE_ToLevelUP)then
	{
		POLICE_RISK_LEVEL = POLICE_RISK_LEVEL + 1;
		POLICE_RISK_LEVEL_SCORE = POLICE_RISK_LEVEL_SCORE - POLICE_REQ_SCORE_ToLevelUP;
	}
};
