/// example_increment_client_handler(session, socket, ip, port, packet_id, values);

var _session   = argument[0],
    _socket    = argument[1],
    _ip        = argument[2],
    _port      = argument[3],
    _packet_id = argument[4],
    _values    = argument[5];

var _id			= _values[0];
var _hp			= _values[1];
var _x			= _values[2];
var _y			= _values[3];
var _xspeed		= _values[4];
var _yspeed		= _values[5];
var _shooting	= _values[6];
var _aimx		= _values[7];
var _aimy		= _values[8];

//setting the position from server unconditionally causes the player to stutter a bit since the received position is a couple ms outdated
//in the future, we should consider having a synchronized match clock between all and pass a timestamp in this sync msg
//so the player could then calculate if the position is in sync or not and make adjustments only when necessary
//as a workaround, for now we'll just ignore the server's correction if we're only slightly off (which works fine too)
//choosing 11 because it's one over twice the speed of the player movement in one step
//TODO: still a little finnicky (adjustments happen rarely now, but when they do, they take a couple stutters to get resolved)

//self state
if (_id == obj_client.clientId) {
	show_debug_message("Client received host sync: client position [" + string(_x) + ", " + string(_y) + "]");
	if abs(obj_player.x - _x) > 11 {
		obj_player.x = _x;
	}

	if abs(obj_player.y - _y) > 11 {
		obj_player.y = _y;
	}
	
	//hp is fully dictated by server, any local calculation (no matter how "close" it is) gets overwritten by this
	obj_player.hp = _hp;
}
//server state
else if (_id == 0) {
	show_debug_message("Client received host sync: host position [" + string(_x) + ", " + string(_y) + "]");
	
	if (peers[0, 0] == -1) {
		obj_client.peers[0, 0] = instance_create_depth(_x, _y, 100, obj_peer);
		//TODO: send usernames to clients (maybe create a packet that's sent once to all peers notifying player join)
		//for now we just check if we're getting an update about a player for the first time
		//obj_client.peers[i, 1] = _username;
	}
	
	if abs(obj_client.peers[0, 0].x - _x) > 11 {
		obj_client.peers[0, 0].x = _x;
	}

	if abs(obj_client.peers[0, 0].y - _y) > 11 {
		obj_client.peers[0, 0].y = _y;
	}
	
	obj_client.peers[0, 0].xspeed = _xspeed;
	obj_client.peers[0, 0].yspeed = _yspeed;
	
	obj_client.peers[0, 0].image_angle = point_direction(_x, _y, _aimx, _aimy);
	
	obj_client.peers[0, 0].aimx = _aimx;
	obj_client.peers[0, 0].aimy = _aimy;
	
	obj_client.peers[0, 0].shooting = _shooting;
	
	obj_client.peers[0, 0].hp = _hp;
}
else { //other peer
	if (peers[_id, 0] == -1) {
		obj_client.peers[_id, 0] = instance_create_depth(_x, _y, 100, obj_peer);
		//TODO: send usernames to clients (maybe create a packet that's sent once to all peers notifying player join)
		//for now we just check if we're getting an update about a player for the first time
		//obj_client.peers[i, 1] = _username;
	}
	
	obj_client.peers[_id, 0].x = _x;
	obj_client.peers[_id, 0].y = _y;
	
	obj_client.peers[_id, 0].xspeed = _xspeed;
	obj_client.peers[_id, 0].yspeed = _yspeed;
	obj_client.peers[_id, 0].image_angle = point_direction(_x, _y, _aimx, _aimy);
	
	obj_client.peers[_id, 0].aimx = _aimx;
	obj_client.peers[_id, 0].aimy = _aimy;
	
	obj_client.peers[_id, 0].shooting = _shooting;
	obj_client.peers[_id, 0].hp = _hp;
}

