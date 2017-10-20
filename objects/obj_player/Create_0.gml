username = "jones";

/// @description Insert description here
// You can write your code in this editor
xspeed = 0;
yspeed = 0;

shooting = false;
weapon = Weapons.ASSAULT_RIFLE;
cooldown = false;

hp = 100;

//collision-related vars
collision_map = layer_tilemap_get_id(layer_get_id("collision_map"));

//boundary offsets from the sprite origin
left_offset = sprite_get_bbox_left(sprite_index) - sprite_get_xoffset(sprite_index);
right_offset = sprite_get_bbox_right(sprite_index) - sprite_get_xoffset(sprite_index);
bottom_offset = sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index);
top_offset = sprite_get_bbox_top(sprite_index) - sprite_get_yoffset(sprite_index);

//instance_create_depth(x, y, depth, obj_peer);