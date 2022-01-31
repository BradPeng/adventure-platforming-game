/// @description Initialize Player Variables

max_speed = 4;
xspeed = 0;
yspeed = 0;
acceleration = 1;
gravity_acceleration = .5;
jump_height = -9;
grab_width = 14;
has_shot_arrow = false;


enum player {
	moving,
	ledge_grab,
	door,
	hurt,
	death,
	attack_ground,
	attack_air,
	crouch,
	roll,
	slide,
	bow_ground,
	bow_air,
}

state = player.moving;