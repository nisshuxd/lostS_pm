#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include common_scripts\utility;

init()
{	
	[[level.on]]( "spawned", ::AFKMonitor );
}

AFKMonitor()
{
    	self endon("disconnect");
	self endon("joined_spectators");
    	self endon("game_ended");
	level endon ("vote started");
	self endon ("isKnifing");
	self endon ( "inintro" );
	afktime = 0;
	while(isAlive(self))
	{
		ori = self.origin;
		angles = self.angles;
		wait 1;
		if(isAlive(self) && self.sessionteam != "spectator")
		{
			if(self.origin == ori && angles == self.angles)
			{
				afktime++;
			}
			else
			{
				afktime = 0;
			}
			if(afktime == 30)
			{
				self iPrintlnBOld("^1You Appear To Be ^1AFK!");
			}
			if(afktime >= 40)
			{
				self.sessionteam = "spectator";
				self.sessionstate = "spectator";
				self [[level.spawnSpectator]]();
				self notify("sdfsdfdsf");
				iPrintln("^0>> ^0[ " +self.name + " ] ^5Appears To Be ^1AFK!");
				return;
			}
		}
		else	
		{
			afktime = 0;
		}
	}
}
