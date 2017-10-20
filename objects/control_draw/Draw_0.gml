/// @description Insert description here
// You can write your code in this editor
draw_text(obj_player.x-16, obj_player.y-32, obj_player.username + ": " + string(obj_player.hp));

if (instance_exists(obj_peer)) {
	draw_text(obj_peer.x-16, obj_peer.y-32, string(obj_peer.hp));
}

if (obj_player.shooting) {
	draw_set_color(c_yellow);
	draw_line(obj_player.x, obj_player.y, mouse_x + random_range(-10, 10), mouse_y + random_range(-10, 10));
}


draw_text(obj_player.x - 32, obj_player.y-64, "weapon equipped: " + string(obj_player.weapon));

draw_text(obj_player.x - 32, obj_player.y-86, "cooldown: " + string(obj_player.cooldown));