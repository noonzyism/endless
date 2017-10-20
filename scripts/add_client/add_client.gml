var _username = argument0,
	_socket   = argument1;
	
var i = 1;

while (obj_server.clients[i, 0] != -1) {
	i++;
}

obj_server.clients[i, 0] = instance_create_depth(100, 100, 100, obj_peer);
obj_server.clients[i, 1] = _username;
obj_server.clients[i, 2] = _socket;

show_debug_message("Created client [" + string(obj_server.clients[i, 0]) + ", " + string(obj_server.clients[i, 1]) + ", " + string(obj_server.clients[i, 2]) + "]");


return i;