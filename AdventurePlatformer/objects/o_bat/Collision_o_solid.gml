/// @description Insert description here
// You can write your code in this editor
if (instance_exists(o_player)) {
	var dis = point_distance(x, y, o_player.x, o_player.y);
	if (dis < sight) {
		state = bat.chase;
	}
}
	
	
if (state = bat.returnToRest) {
	var below_block = y > other.y;
	if (below_block) {
		state = bat.idle;
	}
}

