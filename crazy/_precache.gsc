init()
{
	precacheMenu( "clientcmd" );
	
	precacheShader( "hud_us_smokegrenade" );
	PrecacheShellShock( "frag_grenade_mp" );
	precacheShader( "killiconmelee" );
	precacheShader( "reticle_flechette" );
	precacheShader( "gradient" );
	precacheShader( "gradient_fadein" );
	precacheShader("gradient_top");
	precacheShader("gradient_bottom");
	precacheShader("line_horizontal");
	precacheShader("flare");
	precacheShader("sles_killcam_logo");
	
	//precacheShader( "hud_us_throwingknife" );
	//precacheModel("weapon_parabolic_knife");
}