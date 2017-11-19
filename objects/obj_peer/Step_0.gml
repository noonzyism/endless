/// @description peer step event
// You can write your code in this editor
x += xspeed;
y += yspeed;

if (shooting) {
	//TODO: right now, we just calc from the player origin to an arbitrarily far away point along the line
	//we should change this to get the point along the line that intersects with the view boundary
	
	weapon_fire(self, par_player, aimx, aimy);
	/*
	var hit = collision_line_first(x, y, aimx + (10 * xslope), aimy + (10 * yslope), obj_player, false, true);
	if (hit != noone) {
		var obstruction = find_obstruction(x, y, hit.x, hit.y, 1);
		if (obstruction == undefined) {
			hit.hp -= 1;
		}
	}
	*/

	/*
	var inst = instance_create_depth(x, y, depth, obj_peer_bullet);
	inst.direction = image_angle;
	inst.speed = 10;
	*/
}

//for now...
if (hp < 1) {
	hp = 100;	
}