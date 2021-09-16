	
	if!(stunEffectON)then{
	 titleText["", "WHITE IN", 1];	
	"dynamicBlur" ppEffectEnable true; 
"dynamicBlur" ppEffectAdjust [6]; 
"dynamicBlur" ppEffectCommit 0.1; 
waitUntil {ppEffectCommitted "dynamicBlur"}; 
"dynamicBlur" ppEffectEnable true; 
"dynamicBlur" ppEffectAdjust [0]; 
"dynamicBlur" ppEffectCommit 2;
waitUntil {ppEffectCommitted "dynamicBlur"};
stunEffectON = false;
	};