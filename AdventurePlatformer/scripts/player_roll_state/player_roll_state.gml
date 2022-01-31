// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_roll_state(){
	sprite_index = s_warrior_roll;
	xspeed = 5 * image_xscale;
	if (!is_on_ground(o_solid)) {
			yspeed += gravity_acceleration;
	}
	move(o_solid);
			
}