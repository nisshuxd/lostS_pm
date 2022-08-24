#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include common_scripts\utility;

main(){
	for(;;){
		level waittill("connected", player);
		player thread playerSpawn();
	}
}

PlayerSpawn(){
	for(;;){
		self waittill("spawned_player");
		self thread advBar();
	}
}

advBar(){
	self.bottom_fk_shader = newClientHudElem(self);
   	self.bottom_fk_shader.elemType = "shader";
 	self.bottom_fk_shader.y = 465;
    	self.bottom_fk_shader.horzAlign = "fullscreen";
    	self.bottom_fk_shader.vertAlign = "fullscreen";
    	self.bottom_fk_shader.sort = 0;

    	self.bottom_fk_shader.color	= (0.0, 0.0, 0.0);
   	self.bottom_fk_shader setShader("line_horizontal",640,27);
	self.bottom_fk_shader.alpha = 1;

	self.bottom_fk_shader = newClientHudElem(self);
   	self.bottom_fk_shader.elemType = "shader";
 	self.bottom_fk_shader.y = 465;
  	self.bottom_fk_shader.horzAlign = "fullscreen";
    	self.bottom_fk_shader.vertAlign = "fullscreen";
    	self.bottom_fk_shader.sort = 0;

    	self.bottom_fk_shader.color	= (0.0, 0.0, 0.0);
    	self.bottom_fk_shader setShader("line_horizontal",640,27);
	self.bottom_fk_shader.alpha = 1;


}