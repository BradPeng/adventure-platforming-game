// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_crouch_state(){
	if (!down) {
		state = player.moving	
	}
			
	sprite_index = s_warrior_crouch
			
	if (!is_on_ground(o_solid)) {
		state = player.moving;	
	}
}