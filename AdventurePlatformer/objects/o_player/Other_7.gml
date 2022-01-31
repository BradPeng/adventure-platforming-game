/// @description Insert description here
// You can write your code in this editor
if (state == player.attack_air or state == player.attack_ground) {
	state = player.moving;	
	instance_destroy(o_hitbox);
}

if (state == player.death) {
	room_restart();	
}

if (state == player.roll) {
	state = player.moving;
	alarm[1] = 30;
}

if (state == player.bow_ground || state == player.bow_air) {
	alarm[2] = 30;
	state = player.moving;	
	if (has_shot_arrow == false) {
			has_shot_arrow = true;	
			arrow = instance_create_layer(x+10, y + 3, "Player", o_arrow);
			arrow.image_xscale = image_xscale;
			arrow.xspeed *= image_xscale;
	}
}