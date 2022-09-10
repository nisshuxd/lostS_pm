#include duffman\_common;

init()
{
	level.delay = 10;
	level thread advertisement();
}

saytxt(txt)
{
	level hudmsg(txt);
}

advertisement()
{	
	while(1)
	{
	
		level hudmsg("^3www.LostSky.ga");
	
		wait level.delay;
	
		level hudmsg("^3ts.LostSky.ga");
		
		wait level.delay;
		
		level hudmsg("^3Sri Lanka's ^1No.1 ^3Online Gaming Community");
		
		wait level.delay;

	}
}

hudmsg(text) 
{
	msg = addTextHud( level, 750, 475, 1, "left", "middle", undefined, undefined, 1.6, 888 );
	msg SetText(text);
	msg.sort = 102;
	msg.foreground = 1;
	msg.archived = true;
	msg.alpha = 1;
	msg.fontScale = 1.5;
	msg.color = level.randomcolour;
	msg MoveHud(30,-1300);
	wait 20;
	msg destroy();
}