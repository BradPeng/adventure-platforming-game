// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_death_state(){
	sprite_index = s_warrior_death;
			with (o_player_stats) {
				hp = max_hp;
				sapphires = 0;
			}
}