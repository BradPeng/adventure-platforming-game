/// @description move(collision_object)
/// @param collision_object
function move(argument0) {
	var collision_object = argument0;

	//Horizontal Collisions
	if (place_meeting(x + xspeed, y, collision_object)) {
		while (!place_meeting(x + sign(xspeed),y, collision_object)) {
			x += sign(xspeed);
		}
		xspeed = 0;
	}

	x += xspeed;

	//Vertical Collisions
	y_move(collision_object);


}
