// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_move_state(){
		
	// Bow
	if (is_on_ground(o_solid) and arrow_key and alarm[2] <= 0) {
		state = player.bow_ground;	
		has_shot_arrow = false;
		alarm[2] = 30;
	}
		
	// Roll
	if (/*is_on_ground(o_solid) and */ roll_key and alarm[1] <= 0) {
		state = player.roll;	
	}
		
	#region attacks
		if (keyboard_check(vk_space) and is_on_ground(o_solid)) {
			xspeed = 0;
			state = player.attack_ground;	
		}
	
		if (keyboard_check(vk_space) and !is_on_ground(o_solid)) {
			xspeed = 0;
			state = player.attack_air;	
		}
		
		if (arrow_key and !is_on_ground(o_solid) and alarm[2] <= 0) {
			state = player.bow_air;	
			has_shot_arrow = false;
			alarm[2] = 30;
		}
	#endregion
		
	#region crouch
		if (xspeed == 0 and yspeed == 0 and down and alarm[0] <= 0 and is_on_ground(o_solid)) {
			state = player.crouch;	
		}
	#endregion
	
	#region movement

	#region fall and jump
		
			if (!is_on_ground(o_solid)) {
				yspeed += gravity_acceleration;
				
				// set jump/fall sprite
				if (yspeed <= 0) {
					sprite_index = s_warrior_jump;
				} else if (yspeed > 0 and state == player.moving) {
					sprite_index = s_warrior_fall;
				}
		
				//short hopping
				if (up_release and yspeed < -6) {
				yspeed = -3;
				}
			} else { // on the ground
				yspeed = 0;
					
				// set either idle or run animation
				if (xspeed == 0) {
					sprite_index = s_warrior_idle;
				} else {
					sprite_index = s_warrior_run;
				}
			
			
				//Jumping code
				if (up) {
					yspeed = jump_height;
					audio_play_sound(a_jump, 5, false);
				}
			}
		
			// landing sound
			if (place_meeting(x, y + yspeed + 1, o_solid) and yspeed > 0) {
				audio_play_sound(a_step, 6, false);
			}
		#endregion

		#region horizontal movement
		
			//Change direction of sprite
			if (xspeed != 0) {
				image_xscale = sign(xspeed);
			}
		
			//Check for moving left or right
			if (right or left) {
				xspeed += (right - left) * acceleration;
				xspeed = clamp(xspeed, -max_speed, max_speed);
				
				if (down and xspeed > 2) {
					xspeed = 5;
					state = player.slide;
				}
					
				if (down and xspeed < -2) {
					xspeed = -5;
					state = player.slide;
				}
			} else {
				apply_friction(acceleration);
			}
		#endregion
			
		move(o_solid);
		
	#endregion
		
	#region edge grab code
		
		var falling = y - yprevious > 0;
		var wasnt_wall = !position_meeting(x + grab_width * image_xscale, yprevious, o_solid);
		var is_wall = position_meeting(x + grab_width * image_xscale, y, o_solid);
	
		if (falling and wasnt_wall and is_wall and alarm[0] <= 0) {
			xspeed = 0;
			yspeed = 0;
		
			//align to edge horizontally
			while (!place_meeting(x + image_xscale, y, o_solid)) {
				x += image_xscale;
			}
		
			//align to edge vertically
			while (position_meeting(x + grab_width * image_xscale, y + 1, o_solid)) {
				y -= 1;
			}
		
			//Change sprite and state
			sprite_index = s_warrior_edge_grab;
			state = player.ledge_grab;
		
			audio_play_sound(a_step, 6, false);
		}
		#endregion
}