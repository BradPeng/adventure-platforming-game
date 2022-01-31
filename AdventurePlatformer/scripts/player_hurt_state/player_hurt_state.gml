// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_hurt_state(){
sprite_index = s_warrior_hurt;
			//Change direction as we fly around
			if (xspeed != 0) {
				image_xscale = sign(xspeed);
			}
			
			if (!place_meeting(x, y + 1, o_solid)) {
				yspeed += gravity_acceleration;
			} else {
				yspeed = 0;
				apply_friction(acceleration);
			}
			
			direction_move_bounce(o_solid);
		
			//die if health 0, otherwise move state
			if (xspeed == 0 and yspeed == 0) {
				//Check health
				if (o_player_stats.hp <= 0) {
					state = player.death;
				} else {
					image_blend = c_white;
					state = player.moving;
				}
			}
}