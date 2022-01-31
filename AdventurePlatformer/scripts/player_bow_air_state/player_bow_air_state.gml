// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_bow_air_state(){
	sprite_index = s_warrior_bow_air;
	yspeed += gravity_acceleration;
	move(o_solid);
}