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

	thread Rules();
	//thread Box();

	level thread onPlayerConnect();
	thread onDisconnect();
	thread onPlayerSpawned();
	thread crazy\_togglebinds::init();
	thread crazy\cmd::main();
	level thread crazy\_flags::init();

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

Rules()
{
	level endon("disconnect");

	for(;;)
	{
		wait 10;
		exec("say ^7Use ^1!h ^2to View Your ^3Commands.");
		wait 25;
		exec("say ^2NeeD Admin ^1? ^0Contact ^5Server Owners");
		wait 25;
		exec("say ^7Join Our TeamSpeak3 Server at ^3ts.lostsky.ga");
		wait 25;
		exec("say ^3Cheating ^7Will Get You ^1BANNED!");
		wait 25;
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
	level.bottomBar[1].glowAlpha = 0.9;
	level.bottomBar[1].color = (0,0,0);
	level.bottomBar[1].foreground = false;
	level.bottomBar[1].hidewheninmenu = true;
	level.bottomBar[1].hiddenDuringUI = true;
}

removeADV()
{
	level.logoText.alpha = 0;
	level.bottomBar.alpha = 0;
}