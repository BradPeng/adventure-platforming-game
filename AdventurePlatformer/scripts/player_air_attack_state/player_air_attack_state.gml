// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_air_attack_state(){
	
#region vertical movement code from move state
	// keep falling
	if (!is_on_ground(o_solid)) {
		yspeed += gravity_acceleration;
	}
	
	// horizontal movement in air
	if (right or left) {
		xspeed += (right - left) * acceleration;
		xspeed = clamp(xspeed, -max_speed, max_speed);
	} else {
		apply_friction(acceleration);
	}
		
	move(o_solid);
#endregion
		
sprite_index = s_warrior_attack_air;
hitbox = instance_create_layer(x, y, "Player", o_hitbox);
hitbox.sprite_index = s_warrior_attack_air_hitbox;
hitbox.image_xscale = image_xscale;
			
}