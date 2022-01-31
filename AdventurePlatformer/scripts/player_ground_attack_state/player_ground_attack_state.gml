// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_ground_attack_state(){
	sprite_index = s_warrior_attack_one;
	hitbox = instance_create_layer(x, y, "Player", o_hitbox);
	hitbox.sprite_index = s_warrior_attack_one_hitbox;
	hitbox.image_xscale = image_xscale;
}