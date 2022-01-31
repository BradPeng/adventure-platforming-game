// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_slide_state(){
	move(o_solid);
	apply_friction(0.1);
			
	if (xspeed = 0 and yspeed = 0) {
		state = player.moving;
	}
			
	if (!is_on_ground(o_solid)) {
		state = player.moving;	
	}
			
	sprite_index = s_warrior_slide;
			
}