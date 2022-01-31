// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_door_state(){
	sprite_index = s_warrior_idle;
			image_speed = 0;
			
			//Fade out
			if (image_alpha > 0) {
				image_alpha -= .05;
			} else {
				//Go to the next room
				room_goto_next();
			}
}