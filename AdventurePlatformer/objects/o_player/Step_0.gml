/// @description State machine

#region Set up controls for the player
right = keyboard_check(ord("D"));
left = keyboard_check(ord("A"));
up = keyboard_check(ord("W"));
down = keyboard_check(ord("S"));
up_release = keyboard_check_released(ord("W"));
roll_key = keyboard_check(ord("F"));
arrow_key = keyboard_check(ord("E"));

#endregion

#region State Machine
switch (state) {
	
	case player.moving:
		player_move_state();
		break;
	
	case player.ledge_grab:
		player_edge_grab_state();
		break;
	

	case player.door:
		player_door_state();
		break;


	case player.hurt:
		player_hurt_state();
		break;
	

	case player.death:
		player_death_state();
		break;
	
	case player.attack_ground:
		player_ground_attack_state();
		break;
			

	case player.attack_air:
		player_air_attack_state();	
		break;
	

	case player.crouch:
		player_crouch_state();
		break;


	case player.roll:
		player_roll_state();
		break;


	case player.slide:
		player_slide_state();
		break;


	case player.bow_ground:
		player_bow_state();
		break;
		
	case player.bow_air:
		player_bow_air_state();
		break;
}
#endregion
