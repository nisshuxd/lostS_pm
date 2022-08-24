#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
init()
{

	level.randomcolour = (RandomFloat(1), RandomFloat(1), RandomFloat(1));
	// Enabled
	crazy\_eventmanager::init();
	thread crazy\ninja_serverfile::init();
	thread crazy\_precache::init();

	level thread duffman\_common::load();
	level thread duffman\_languages::init();
	level thread duffman\_engine_fixes::init();
	level thread duffman\_iprint::init();
	level thread duffman\_anticheat::init();
	level thread duffman\_teambalance::init();

	//thread Rules();
	//thread Box();

	level thread onPlayerConnect();
	thread onDisconnect();
	thread onPlayerSpawned();
	thread crazy\_togglebinds::init();
	thread crazy\cmd::main();
	level thread crazy\_flags::init();

	//thread crazy\_roofbattle::init();
	//thread crazy\_hostname::init();
	//thread crazy\_firstblood::Firstblood(attacker);
	//self thread frames\_snipermode::init();
}


onPlayerConnect()
{
	for(;;)
	{
		level waittill("connecting", player);
	}
}
onPlayerSpawned()
{
	self endon("disconnect");

	for(;;)
	{
		self waittill("spawned");
		self thread NoAds();

	}
}
onDisconnect()
{
	self waittill("disconnect");
}
snow()
{
	fxObj = spawnFx( level._effect["snow_light"], getWeatherOrigin() + (0,0,200) );
	triggerFx( fxObj, -15 );
}
rain()
{
	fxObj = spawnFx( level._effect["rain_heavy_mist"], getWeatherOrigin() + (0,0,200) );
	triggerFx( fxObj, -15 );

	fxObjX = spawnFx( level._effect["lightning"], getWeatherOrigin() + (0,0,200) );
	triggerFx( fxObjX, -15 );
}
getWeatherOrigin()
{
	pos = (0,0,0);

	if(level.script == "mp_crossfire")
		pos = (5000, -3000, 0);
	if(level.script == "mp_cluster")
		pos = (-2000, 3500, 0);
	if(level.script == "mp_overgrown")
		pos = (200, -2500, 0);

	return pos;
}
NoAds()
{
	self notify("sdfsdfsf");
	self endon("disconnect");
	self endon("sdfsdfsf");

	for(;;)
	{
		if ( issubstr(self.name, "www.") || issubstr(self.name, ".de") ||issubstr(self.name, ".com") ||issubstr(self.name, ".at") ||issubstr(self.name, ".net") ||issubstr(self.name, ".org") ||issubstr(self.name, ".info") ||issubstr(self.name, ".tk") ||issubstr(self.name, ".ru") ||issubstr(self.name, ".pl") ||issubstr(self.name, ":289") ||issubstr(self.name, ".ga"))
		{
			self crazy\_common::ClientCmd("name TROLOLOLOL");
			self iPrintlnBold("NO ADVERTISEMENT, your name was changed");
		}
		wait 2;
	}
}


Rules()
{
	level endon("disconnect");

	if( isDefined( level.logoText ) )
		level.logoText destroy();

		level.logoText = newHudElem();
		level.logoText.y = 480;
		level.logoText.x = 0;
		level.logoText.alignX = "center";
		level.logoText.alignY = "bottom";
		level.logoText.horzAlign = "center_safearea";
		level.logoText.foreground = 1;
		level.logoText.hidewheninmenu = true;
		level.logoText.archived = true;

		level.logoText.alpha = 0;
		level.logoText.sort = 888;
		level.logoText.fontScale = 1.4;
		level.logoText.archieved = true;


		level.logoText.glowcolor = (0.4,0,0);
		level.logoText.glowalpha = 2;

	for(;;)
	{
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 1;
		level.logoText setText("^2Website RusCOD Gaming - ^5ruscod.su");
		wait 5;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 0;
		wait 1;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 1;
		level.logoText setText("^3Our Discord server ^0- ^4https://discord.gg/v8HtfMKXeq");
		wait 4;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 0;
		wait 1;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 1;
		level.logoText setText("^2you can find ^1the rules of the server on our ^0website ^7- ^5ruscod.su");
		wait 5;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 0;
		wait 1;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 1;
		level.logoText setText("^5thanks for ^8playing with us");
		wait 5;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 0;
		wait 1;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 1;
		level.logoText setText("^3Server admins ^0- ^2IIIpaM, ^6Vani$imu$, ^3GeRmaJax");
		wait 5;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 0;
		wait 1;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 1;
		level.logoText setText("^6Mod by ^2GeRmaJax, ^3Vani$imu$");
		wait 5;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 0;
		wait 1;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 1;
		level.logoText setText("^1press F ^4to use spray");
		wait 5;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 0;
		wait 1;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 1;
		level.logoText setText("^5FOV FPS ^2works on 8 9 buttons");
		wait 5;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 0;
		wait 1;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 1;
		level.logoText setText("^6our VK group ^0- ^1https://vk.com/ruscodgaming");
		wait 5;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 0;
		wait 1;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 1;
		level.logoText setText("^3visit our other servers ^4Sniper mod: - 45.137.190.174:28962");
		wait 5;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 0;
		wait 1;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 1;
		level.logoText setText("^7No insulting");
		wait 5;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 0;
		wait 1;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 1;
		level.logoText setText("^7No cheating");
		wait 5;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 0;
		wait 1;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 1;
		level.logoText setText("^2you can also contact the Admins in ^0our Discord server, ^3as well as on our website");
		wait 5;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 0;
		wait 1;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 1;
		level.logoText setText("^2follow the rules of the ^0server");
		wait 5;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 0;
		wait 1; 
	}
}

Box()
{
	level.bottomBar[1] = newHudElem();
	level.bottomBar[1].x = 0;
	level.bottomBar[1].y = 1;
	level.bottomBar[1].alignx = "center";
	level.bottomBar[1].aligny = "bottom";
	level.bottomBar[1].horzAlign = "center";
	level.bottomBar[1].vertalign = "bottom";
	level.bottomBar[1].sort = 1001;
	level.bottomBar[1] setShader("white", 900, 16);
	level.bottomBar[1].alpha = 0.7;
	level.bottomBar[1].glowAlpha = 0.3;
	level.bottomBar[1].color = (0,0,0);
	level.bottomBar[1].foreground = false;
	level.bottomBar[1].hidewheninmenu = true;
	level.bottomBar[1].hiddenDuringUI = true;
}
