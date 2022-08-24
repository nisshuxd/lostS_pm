#include crazy\_common;

init()
{

	precacheMenu("player_menu");
	
	level thread onPlayerConnect();
}

onPlayerConnect()
{
    for (;;)
    {
        level waittill("connecting", player);		
        player thread onConnected();
    }
}

onConnected()
{
	for(;;)
	{
		level waittill( "connected", player );
		self thread onMenuResponse();
	}
}

// response starts
onMenuResponse()
{	
    self endon("disconnect");
    for (;;)
    {
    self waittill("menuresponse", menu, response);

		switch( response )
		{	
				//player menu
				case "player_menu":
				self closeMenus();
				self openMenu("player_menu");
				continue;
		}
		
	}
	
}

closeMenus()
{
	self closeMenu();
	self closeInGameMenu();
}

