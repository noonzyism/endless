/// @description Insert description here
// You can write your code in this editor
var mouse_dir = point_direction(x, y, mouse_x, mouse_y);

left_bound = x + left_offset;
right_bound = x + right_offset;
bottom_bound = y + bottom_offset;
top_bound = y + top_offset;

//movement logic
if keyboard_check(ord("W")) {
	var t1 = tilemap_get_at_pixel(collision_map, left_bound, top_bound-5) & tile_index_mask;
	var t2 = tilemap_get_at_pixel(collision_map, right_bound, top_bound-5) & tile_index_mask;
	
	if (t1 != 0 || t2 != 0) {
		yspeed = 0;
	}
	else {
		yspeed = -5;
	}
}
if keyboard_check(ord("A")) {
	var t1 = tilemap_get_at_pixel(collision_map, left_bound-5, top_bound) & tile_index_mask;
	var t2 = tilemap_get_at_pixel(collision_map, left_bound-5, bottom_bound) & tile_index_mask;
	
	if (t1 != 0 || t2 != 0) {
		xspeed = 0;
	}
	else {
		xspeed = -5;
	}
}
if keyboard_check(ord("S")) {
	var t1 = tilemap_get_at_pixel(collision_map, left_bound, bottom_bound+5) & tile_index_mask;
	var t2 = tilemap_get_at_pixel(collision_map, right_bound, bottom_bound+5) & tile_index_mask;
	
	if (t1 != 0 || t2 != 0) {
		yspeed = 0;
	}
	else {
		yspeed = 5;
	}
}


if keyboard_check(ord("D")) {
	var t1 = tilemap_get_at_pixel(collision_map, right_bound+5, top_bound) & tile_index_mask;
	var t2 = tilemap_get_at_pixel(collision_map, right_bound+5, bottom_bound) & tile_index_mask;
	
	if (t1 != 0 || t2 != 0) {
		xspeed = 0;
	}
	else {
		xspeed = 5;
	}
}

if !(keyboard_check(ord("A")) ^^ keyboard_check(ord("D"))) {
	xspeed = 0;
}

if !(keyboard_check(ord("W")) ^^ keyboard_check(ord("S"))) {
	yspeed = 0;
}

x += xspeed;
y += yspeed;

//aiming/shooting logic
image_angle = mouse_dir;

if mouse_check_button(mb_left) {
	shooting = true;
	weapon_fire(self, par_player, mouse_x, mouse_y);
}
else {
	shooting = false;
}

//for now...
if (hp < 1) {
	hp = 100;	
}

if (keyboard_check_released(ord("Q"))) {
	//toggle weapon
	weapon_switch(self);
}