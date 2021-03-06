/// @description Execute the state

switch (state) {
	#region Bat Idle
	case bat.idle:
		sprite_index = s_bat_idle;
		if (instance_exists(o_player)) {
			var dis = point_distance(x, y, o_player.x, o_player.y);
			if (dis < sight) {
				y += 4;
				state = bat.chase;
			}
		}
	break;
	#endregion
	#region Bat Chase
	case bat.chase:
		
		if (instance_exists(o_player)) {
			sprite_index = s_bat_fly;
			var dis = point_distance(x, y, o_player.x, o_player.y);
		
			if (dis > sight) {
				state = bat.returnToRest;
			}
			
			var dir = point_direction(x, y, o_player.x, o_player.y);
			xspeed = lengthdir_x(max_speed, dir);
			yspeed = lengthdir_y(max_speed, dir);
		
			if (xspeed != 0) {
				image_xscale = sign(xspeed);
			}
			
			move(o_solid);
		}
	break;
	#endregion
	
	
	case bat.returnToRest:	
		sprite_index = s_bat_fly;
		if (xspeed != 0) {
			image_xscale = sign(xspeed);
			xspeed = 0;
		}
		//yspeed = -max_speed;
		if (!position_meeting(x, y+yspeed, o_solid)) {
			y += -max_speed;	
		} else {
			while (!position_meeting(x, y, o_solid)) {
				y--;	
			}
		}
}