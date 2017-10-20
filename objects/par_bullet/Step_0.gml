/// @description Insert description here
// You can write your code in this editor
//TODO: make this pre-emptive checking instead of retroactive

var collision_exists = tilemap_get_at_pixel(collision_map, x, y) & tile_index_mask;

if (collision_exists != 0) {
	instance_destroy();
}

