#include duffman\_common;

init()
{


    blackscreen = addTextHud( level, 0, 0, 0.9, "center", "middle", "center", "middle", 3, 0 );
    blackscreen thread fadeIn(2);
    blackscreen setShader("white",1000,1000);
    blackscreen.color = (0,0,0);

	//thread duffman\_common::playSoundOnAllPlayers( "music7" );
		
    level.creditTime = 5;
    duffman\_common::cleanScreen();
    wait 2;


    thread showCredit( "__", 2.7 );
    wait 0.5;
    thread showCredit( "^5Thank You for Playing", 2.8 );
    wait 0.5;
    thread showCredit( "---- ^1Lost ^5Sky ^2GaminG ^7----", 2.6 );
    wait 0.5;
    thread showCredit( "---- ^2Promod ^2SnD ^1Server ^7----", 2.1 );
    wait 0.5;
    thread showCredit( "Whatsapp - chat.whatsapp.com/KYbvHYshtcVIian2XdUxha ", 1.9 );
    wait 0.5;
    thread showCredit( "Teamspeak - ts.lostsky.ga", 1.9 );
    wait 0.3;
    thread showCredit( "__", 2.7 );
    wait 0.5;
    thread showCredit( "^5Server Owners", 2.5 );
    wait 0.5;
        thread showCredit( "^1LS| BuNNs / Owner", 1.6 );
        wait 0.2;
        thread showCredit( "^1LS| Loki / Owner", 1.5 );
        wait 0.3;
        thread showCredit( "LS| Toshi / Admin", 1.5 );
        wait 0.2;
        thread showCredit( "LS| Kota / Admin", 1.5 );
        wait 0.2;
        thread showCredit( "LS| M-es / Admin", 1.5 );
        wait 0.2;
        thread showCredit( "LS| Lol / Admin", 1.5 );
        wait 0.2;
        thread showCredit( "LS| Ctrl.Shift / Admin", 1.5 );
    wait 0.5;
    thread showCredit( "___", 2.7 );
    wait 0.5;
    thread showCredit( "www.lostsky.ga", 1.8 );
    wait 0.5;
    thread showCredit( "^2Developed By MrBoom", 1.6 );
    wait 0.3;
    thread showCredit( "__", 2.5 );


    wait 5; 
		blackscreen destroy();

    boom\_mapvote::startMapVote();
		
    //self thread addDisplay();

}

addDisplay(){

    creditAdd = newHudElem();
    creditAdd.font = "objective";
    creditAdd.alignX = "center";
    creditAdd.alignY = "top";
    creditAdd.horzAlign = "center";
    creditAdd.vertAlign = "top";
    creditAdd setShader( "sles_add", 400, 400 );
    creditAdd.x = 0;
    creditAdd.y = 540;
    creditAdd.sort = 2; //-3
    creditAdd.alpha = 1;
    creditAdd moveOverTime(level.creditTime);
    creditAdd.y = 30;
    creditAdd.foreground = true;
    wait level.creditTime;
    wait 5;
    creditAdd destroy();
}


showCredit( text, scale )
{
    end_text = newHudElem();
    end_text.font = "objective";
    end_text.fontScale = scale;
    end_text SetText(text);
    end_text.alignX = "center";
    end_text.alignY = "top";
    end_text.horzAlign = "center";
    end_text.vertAlign = "top";
    end_text.x = 0;
    end_text.y = 540;
    end_text.sort = 3; //-3
    end_text.alpha = 1;
    //end_text.glowColor = (0.5,0.1,0.8);
    //end_text.glowAlpha = 1;
    end_text moveOverTime(level.creditTime);
    end_text.y = -60;
    end_text.foreground = true;
    wait level.creditTime;
    end_text destroy();
}


neon()
{
    neon = addNeon( "^1www^0.lostsky^0.^1tk", 1.4 );
    while( 1 )
    {
        neon moveOverTime( 8 );
        neon.x = 800;
        wait 15;
        neon moveOverTime( 8 );
        neon.x = -800;
        wait 15;
    }
}

addNeon( text, scale )
{
    end_text = newHudElem();
    end_text.font = "objective";
    end_text.fontScale = scale;
    end_text SetText(text);
    end_text.alignX = "center";
    end_text.alignY = "top";
    end_text.horzAlign = "center";
    end_text.vertAlign = "top";
    end_text.x = -200;
    end_text.y = 8;
    end_text.sort = -1; //-3
    end_text.alpha = 1;
    //end_text.glowColor = (1,0,0.1);
    //end_text.glowAlpha = 1;
    end_text.foreground = true;
    return end_text;
}

freezeall()
{
    for(i=0;i<level.players.size;i++)
        level.players[i] freezecontrols(true);
}