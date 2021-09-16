	
	if!(stunEffectON)then{
	stunEffectON = true;
	"colorCorrections" ppEffectEnable true;
    "colorCorrections" ppEffectAdjust[ 1, 1, 0, [0.97, -0.1, -0.31, 0.72],[5, 1.18, -1.56, 0.8],[1.23, -0.34, 0.73, 0.31]];
    "colorCorrections" ppEffectCommit 0.1; 	
	waitUntil {ppEffectCommitted "colorCorrections"}; 
    "colorCorrections" ppEffectEnable true;
  	 "colorCorrections" ppEffectAdjust[ 1, 1, 0, [0, 0, 0, 0],[1.8, 1.8, 0.3, 0.7],[0.2, 0.28, 0.11, 0]];
	"colorCorrections" ppEffectCommit 4.8;
		waitUntil {ppEffectCommitted "colorCorrections"}; 
		stunEffectON = false;
		"colorCorrections" ppEffectEnable false;
	};