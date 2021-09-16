//FUNC_CopLightSiren=
//{
private["_vcl", "_this", "_lichtstaerke", "_light1", "_SirenActivePursuit","_driver","_x"];


_vcl= _this select 0; 
_lichtstaerke = 0.3;
	_light1 = "#lightpoint" createVehicleLocal (getpos _vcl);
	_light1 attachTo [_vcl,[0,0,0.5]]; 
_SirenActivePursuit = false;
r1 hideObject true;
b1 hideObject true;
sleep 3;

while{alive _vcl}do{

_driver = driver _vcl;


if!(isNull _driver)then{
//if(side _driver == West)then{
if( _driver getVariable "CodePursuit" != 0)then{_SirenActivePursuit = true}else{ _SirenActivePursuit = false};
};
//};

if(_SirenActivePursuit)then{
for [{_x=0},{_x<2},{_x=_x+1}] do{

	r1 hideObject true;
	b1 hideObject false;
	_light1 setLightBrightness _lichtstaerke;
	_light1 setLightAmbient   [0, 0, 0.2];
	_light1 setLightColor     [0, 0, 0.2];


sleep 0.1;
_light1 setLightBrightness 0;
b1 hideObject true;
sleep 0.1;
};
}else{_light1 setLightBrightness 0;};
sleep 0.1;


if(_SirenActivePursuit)then{
for [{_x=0},{_x<2},{_x=_x+1}] do{

	r1 hideObject false;
	b1 hideObject true;
	_light1 setLightBrightness _lichtstaerke;
	_light1 setLightAmbient   [0.2, 0, 0];
	_light1 setLightColor     [0.2, 0, 0];


sleep 0.1;
_light1 setLightBrightness 0;
r1 hideObject true;
sleep 0.1;
};
}else{_light1 setLightBrightness 0; sleep 2;};
sleep 0.1;





};


	r1 hideObject true;
	b1 hideObject true;
_light1 setLightBrightness 0;
deletevehicle _light1;
	
	
//};


	