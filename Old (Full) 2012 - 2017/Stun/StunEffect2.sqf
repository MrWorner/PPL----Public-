		if!(stunEffectON2)then{
	stunEffectON2 = false;

"dynamicBlur" ppEffectEnable true; 
"dynamicBlur" ppEffectAdjust [4]; 
"dynamicBlur" ppEffectCommit 0.1; 
waitUntil {ppEffectCommitted "dynamicBlur"}; 
"dynamicBlur" ppEffectEnable true; 
"dynamicBlur" ppEffectAdjust [0]; 
"dynamicBlur" ppEffectCommit 0.7;
waitUntil {ppEffectCommitted "dynamicBlur"};
stunEffectON2 = false;
};