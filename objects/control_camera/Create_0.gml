/// @description Insert description here
// You can write your code in this editor
view_enabled = true;

view_set_visible(0, true);

view_set_wport(0, 1024);
view_set_hport(0, 768);

cam = camera_create_view(300, 300, 1024, 768, 0, obj_player, -1, -1, 512, 384);

view_set_camera(0, cam);