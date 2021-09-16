//NonLethalArsenal
LESS_LETHAL_AMMO = 
[
"B_12Gauge_74Slug",
"B_9x18_SD",
"cal68_FieldPaint",
"d3z_ammo_shot_2",
"d3z_ammo_shot_pel",
"d3z_ammo_pel"
];



LESS_LETHAL_ARSENAL = 
[
"M1014",
"Saiga12K",
"cal68_egosl",
"cal68_brass_n"
//"AA12_PMC" 20Rnd_B_AA12_74Slug   LESS LETHAL!
];


LESS_LETHAL_GL = 
[
"M32_EP1",
"M79_EP1",
"MK13_EP1"
];



LESS_LETHAL_GRENADES =
[
"SmokeShell",
"RAB_L111A1",
"HandGrenade_West"
];



NON_LETHAL_ITEMS = 
[
"Binocular", 
"NVGoggles", 
"ItemMap", 
"ItemCompass", 
"ItemRadio", 
"ItemWatch", 
"ItemGPS"
];

//**pain threshold
// Shotgun = 60
// PepperGun = 10
// Taser = 100
// Rubber pistol = 25
// Gas grenade = 10 per sec
// Flashbang = 100
// Tranquilizer rifle = 100 (90sec)

ServerLogic setVariable ["B_12Gauge_74Slug",[60,"physical"],true];
ServerLogic setVariable ["d3z_ammo_shot_2",[60,"physical"],true];
ServerLogic setVariable ["d3z_ammo_shot_pel",[60,"physical"],true];
ServerLogic setVariable ["d3z_ammo_pel",[60,"physical"],true];
ServerLogic setVariable ["B_9x18_SD",[25,"physical"],true];
ServerLogic setVariable ["cal68_FieldPaint",[10,"gas"],true];