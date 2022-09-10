#include duffman\_common;

init( modVersion )
{
	level.fullbrightkey = "8";
	level.fovkey = "9";

	addConnectThread(::onPlayerConnected);
	addSpawnThread(::onPlayerSpawn);
}


onPlayerConnected()
{
		if(!isDefined(self.pers["fb"]))
			self.pers["fb"] = self getstat(1222);

		if(!isDefined(self.pers["fov"]))
			self.pers["fov"] = self getstat(1322);

		if(!isDefined(self.pers["kr_music"]))
			self.pers["kr_music"] = self getstat(1601);

		self.pers["kr_music"] = self getstat(1601);
		
		self.pers["fb"] = self getstat(1222);

		self.pers["fov"] = self getstat(1322);



	self thread ToggleBinds();
	self thread Notify();

	if(self.pers["fb"] == 1){
		self setClientDvar( "r_fullbright", 1 );
	}
	if(self.pers["fb"] == 0){
		self setClientDvar( "r_fullbright", 0 );
	}
	if(self.pers["fov"] == 1){
		self setClientDvar( "cg_fovscale", 1 );
	}
	if(self.pers["fov"] == 2){
		self setClientDvar( "cg_fovscale", 1.125 );
	}
	if(self.pers["fov"] == 3){
		self setClientDvar( "cg_fovscale", 1.25 );
	}
	if(self.pers["fov"] == 4){
		self setClientDvar( "cg_fovscale", 1.3 );
	}
	if(self.pers["fov"] == 5){
		self setClientDvar( "cg_fovscale", 1.4 );
	}
	if(self.pers["fov"] == 0){
		self setClientDvar( "cg_fovscale", 1.5 );
	}

	if(self.pers["kr_music"] == 1){
		self setClientDvar( "kr_music", 1 );
	}
	if(self.pers["kr_music"] == 0){
		self setClientDvar( "kr_music", 0 );
	}
}
onPlayerSpawn()
{

	self crazy\_common::clientCmd("bind "+level.fovkey +" openscriptmenu -1 fov");
	wait 0.1;
	self crazy\_common::clientCmd("bind "+level.fullbrightkey +" openscriptmenu -1 fps");

}
ToggleBinds()
{
	self endon("disconnect");

	for(;;)
	{
		self waittill("menuresponse", menu, response);
		if(response == "fps")
		{
			if(self.pers["fb"] == 0)
			{
				//self iprintln( "FullBright ^0<^2ON^0>" );
				self setClientDvar( "r_fullbright", 1 );
				self setstat(1222,1);
				self.pers["fb"] = 1;
				self iprintln("^0[ Fullbright ] ^2You Turned Fullbright ^5[ ON ]^7");
			}
			else if(self.pers["fb"] == 1)
			{
				//self iprintln( "FullBright ^0<^1OFF^0>" );
				self setClientDvar( "r_fullbright", 0 );
				self setstat(1222,0);
				self.pers["fb"] = 0;
				self iprintln("^0[ Fullbright ] ^2You Turned Fullbright ^5[ OFF ]^7");
			}
		}

		if(response == "kr_music")
		{
			if(self.pers["kr_music"] == 0)
						{
							self setClientDvar( "kr_music", 1 );
							self setstat(1601,1); 
							self.pers["kr_music"] = 1;
							self iprintln("^0[ Music ] ^2You Turned Knife Music ^5[ OFF ]^7");
						}
						else if (self.pers["kr_music"] == 1)
						{
							self setClientDvar( "kr_music", 0 );
							self setstat(1601,0); 
							self.pers["kr_music"] = 0;
							self iprintln("^0[ Music ] ^2You Turned Knife Music ^5[ ON ]^7");
						}
		}
		
		if(response == "fov")
		{
			if(self.pers["fov"] == 0)
			{
				//self iprintln( "FOV ^0<^11^0> ^7Low Scale" );
				self setClientDvar( "cg_fovscale", 1 );
				self setstat(1322,1);
				self.pers["fov"] = 1;
				self iprintln("^0[ FovScale ] ^2You Changed FovScale To ^5[ 1 ]^7");
			}
			else if(self.pers["fov"] == 1)
			{
				//self iprintln( "FOV ^0<^11.125^0> ^7Recommended Scale" );
				self setClientDvar( "cg_fovscale", 1.125 );
				self setstat(1322,2);
				self.pers["fov"] = 2;
				self iprintln("^0[ FovScale ] ^2You Changed FovScale To ^5[ 1.125 ]^7");

			}
			else if(self.pers["fov"] == 2)
			{
				//self iprintln( "FOV ^0<^11.25^0>" );
				self setClientDvar( "cg_fovscale", 1.25 );
				self setstat(1322,3);
				self.pers["fov"] = 3;
				self iprintln("^0[ FovScale ] ^2You Changed FovScale To ^5[ 1.25 ]^7");
							}
			else if(self.pers["fov"] == 3 )
			{
				//self iprintln( "FOV ^0<^11.3^0>" );
				self setClientDvar( "cg_fovscale", 1.3 );
				self setstat(1322,4);
				self.pers["fov"] = 4;
				self iprintln("^0[ FovScale ] ^2You Changed FovScale To ^5[ 1.3 ]^7");
						}
			else if(self.pers["fov"] == 4)
			{
				//self iprintln( "FOV ^0<^11.4^0> ^7High Scale" );
				self setClientDvar( "cg_fovscale", 1.4 );
				self setstat(1322,5);
				self.pers["fov"] = 5;
				self iprintln("^0[ FovScale ] ^2You Changed FovScale To ^5[ 1.4 ]^7");
						}
			else if(self.pers["fov"] == 5)
			{
				//self iprintln( "FOV ^0<^11.5^0> ^7Very High Scale" );
				self setClientDvar( "cg_fovscale", 1.5 );
				self setstat(1322,0);
				self.pers["fov"] = 0;
				self iprintln("^0[ FovScale ] ^2You Changed FovScale To ^5[ 1.5 ]^7");
						}
		}
	}
}

Notify()
{
	self endon("disconnect");
	for(;;)
	{
		wait RandomInt(90)+50;
		self iPrintln("^0[ Notify ] ^2Press ^5[ "+level.fullbrightkey+" ]^2 To Change ^2FullBright");
		wait 3;
		self iPrintln("^0[ Notify ] ^2Press ^5[ "+level.fovkey+" ]^2 To Change ^2FovScale");
	}
}

