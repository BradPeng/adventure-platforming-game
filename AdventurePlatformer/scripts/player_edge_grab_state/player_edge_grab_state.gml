// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_edge_grab_state(){
		if (down) {
				state = player.moving;
				alarm[0] = 15; // edge grab timer
			}
		
			if (up) {
				state = player.moving;
				yspeed = jump_height;
				alarm[0] = 15;
			}
			
			// facing right, click left
			if (image_xscale = 1) {
				if (left) {
					state = player.moving;
					alarm[0] = 15;
				} 
		
			}
		
			// facing left, click right
			if (image_xscale = -1) {
				if (right) {
					state = player.moving;
					alarm[0] = 15;
				}

			}
}