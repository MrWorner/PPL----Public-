	
	if!(stunEffectON)then{
	stunEffectON = true;
	"colorCorrections" ppEffectEnable true;
    "colorCorrections" ppEffectAdjust[ 1, 1, 0, [0.93, 0, -0.93, 0],[4.9, 0.97, 0.2, -1.48],[4.59, 5, 5, -0.52]];
    "colorCorrections" ppEffectCommit 1; 	
	waitUntil {ppEffectCommitted "colorCorrections"}; 
    "colorCorrections" ppEffectEnable true;
  	 "colorCorrections" ppEffectAdjust[ 1, 1, 0, [0, 0, 0, 0],[1.8, 1.8, 0.3, 0.7],[0.2, 0.28, 0.11, 0]];
	"colorCorrections" ppEffectCommit 4;
		waitUntil {ppEffectCommitted "colorCorrections"}; 
		stunEffectON = false;
		"colorCorrections" ppEffectEnable false;
	};