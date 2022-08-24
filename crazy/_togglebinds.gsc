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

		if(!isDefined(self.pers["boom_spec"]))
			self.pers["boom_spec"] = self getstat(1603);
	

		self.pers["kr_music"] = self getstat(1601);
		self.pers["boom_spec"] = self getstat(1603);

		
		self.pers["fb"] = self getstat(1222);

		self.pers["fov"] = self getstat(1322);



	self thread ToggleBinds();
	self thread Nodify();

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

	if(self.pers["boom_spec"] == 1){
		self setClientDvar( "boom_spec", 1 );
	}
	if(self.pers["boom_spec"] == 0){
		self setClientDvar( "boom_spec", 0 );
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
				self iprintln("^0>> ^2You Turned Fullbright ^5[ ON ]^7");
			}
			else if(self.pers["fb"] == 1)
			{
				//self iprintln( "FullBright ^0<^1OFF^0>" );
				self setClientDvar( "r_fullbright", 0 );
				self setstat(1222,0);
				self.pers["fb"] = 0;
				self iprintln("^0>> ^2You Turned Fullbright ^5[ OFF ]^7");
			}
		}

		if(response == "kr_music")
		{
			if(self.pers["kr_music"] == 0)
						{
							self setClientDvar( "kr_music", 1 );
							self setstat(1601,1); 
							self.pers["kr_music"] = 1;
							self iprintln("^0>> ^2You Turned Knife Music ^5[ OFF ]^7");
						}
						else if (self.pers["kr_music"] == 1)
						{
							self setClientDvar( "kr_music", 0 );
							self setstat(1601,0); 
							self.pers["kr_music"] = 0;
							self iprintln("^0>> ^2You Turned Knife Music ^5[ ON ]^7");
						}
		}

		if(response == "boom_spec")
		{
			if(self.pers["boom_spec"] == 0)
						{
							self setClientDvar( "boom_spec", 1 );
							self setstat(1603,1); 
							self.pers["boom_spec"] = 1;
							self iprintln("^0>> ^2You Turned Spectator List ^5[ OFF ]^7");
						}
						else if (self.pers["boom_spec"] == 1)
						{
							self setClientDvar( "boom_spec", 0 );
							self setstat(1603,0); 
							self.pers["boom_spec"] = 0;
							self iprintln("^0>> ^2You Turned Spectator List ^5[ ON ]^7");
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
				self iprintln("^0>> ^2You Changed FovScale To ^5[ 1 ]^7");
			}
			else if(self.pers["fov"] == 1)
			{
				//self iprintln( "FOV ^0<^11.125^0> ^7Recommended Scale" );
				self setClientDvar( "cg_fovscale", 1.125 );
				self setstat(1322,2);
				self.pers["fov"] = 2;
				self iprintln("^0>> ^2You Changed FovScale To ^5[ 1.125 ]^7");

			}
			else if(self.pers["fov"] == 2)
			{
				//self iprintln( "FOV ^0<^11.25^0>" );
				self setClientDvar( "cg_fovscale", 1.25 );
				self setstat(1322,3);
				self.pers["fov"] = 3;
				self iprintln("^0>> ^2You Changed FovScale To ^5[ 1.25 ]^7");
							}
			else if(self.pers["fov"] == 3 )
			{
				//self iprintln( "FOV ^0<^11.3^0>" );
				self setClientDvar( "cg_fovscale", 1.3 );
				self setstat(1322,4);
				self.pers["fov"] = 4;
				self iprintln("^0>> ^2You Changed FovScale To ^5[ 1.3 ]^7");
						}
			else if(self.pers["fov"] == 4)
			{
				//self iprintln( "FOV ^0<^11.4^0> ^7High Scale" );
				self setClientDvar( "cg_fovscale", 1.4 );
				self setstat(1322,5);
				self.pers["fov"] = 5;
				self iprintln("^0>> ^2You Changed FovScale To ^5[ 1.4 ]^7");
						}
			else if(self.pers["fov"] == 5)
			{
				//self iprintln( "FOV ^0<^11.5^0> ^7Very High Scale" );
				self setClientDvar( "cg_fovscale", 1.5 );
				self setstat(1322,0);
				self.pers["fov"] = 0;
				self iprintln("^0>> ^2You Changed FovScale To ^5[ 1.5 ]^7");
						}
		}
	}
}

quickNotify(msg,action){

	self endon( "disconnect" );
	
	self.title = newclientHudElem(self);
	self.title.x = -20;
	self.title.y = 120;
	self.title.alignx = "center";
	self.title.horzAlign = "center";
	self.title.sort = 1002;
	self.title.alpha = 1;
	self.title.glowalpha = 1;
	self.title.glowcolor = (0.3, 0.3, 0.3);
	self.title.glowAlpha = 2;
	self.title.fontscale = 2.4;
	self.title.foreground = false;
	self.title.hidewheninmenu = false;
	self.title setText( msg );

	self.happen = newclientHudElem(self);
	self.happen.x = -20;
	self.happen.y = 143;
	self.happen.alignx = "center";
	self.happen.horzAlign = "center";
	self.happen.sort = 1003;
	self.happen.alpha = 1;
	self.happen.glowalpha = 1;
	self.happen.fontscale = 2.2;
	self.happen.foreground = false;
	self.happen.hidewheninmenu = false;
	self.happen setText( "^0> "+action );


	self.title moveOverTime(0.15);
	self.title.x = 5;

	self.happen moveOverTime(0.15);
	self.happen.x = 0;
	wait 0.4;
	self.title destroy();
	self.happen destroy();
}

Nodify()
{
	self endon("disconnect");
	for(;;)
	{
		wait RandomInt(90)+50;
		self iPrintln("^0>> ^2Press ^5[ "+level.fullbrightkey+" ]^2 To Change ^2FullBright");
		wait 3;
		self iPrintln("^0>> ^2Press ^5[ "+level.fovkey+" ]^2 To Change ^2FovScale");
	}
}

reddot()
{
    self.reddot = newClientHudElem(self);
    self.reddot.x = 0;
    self.reddot.y = 0;
    self.reddot.alpha = 1;
    self.reddot.alignX = "center";
    self.reddot.alignY = "middle";
    self.reddot.horzAlign = "center";
    self.reddot.vertAlign = "middle";
    self.reddot setShader( "white", 3, 3);
    self.reddot.color = (1, 0, 0);
}
