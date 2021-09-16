_cop = _this select 0;


while{false}do{



_Knowledge =  _cop knowsAbout player;

_Text = format ["%1", _cop ] +  " Knowledge about you: " + format ["%1", _Knowledge ];
player globalchat _Text;
sleep 1;
};