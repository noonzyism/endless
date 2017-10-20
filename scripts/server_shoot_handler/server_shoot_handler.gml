/// example_increment_server_handler(session, socket, ip, port, packet_id, values);

var _session   = argument[0],
    _socket    = argument[1],
    _ip        = argument[2],
    _port      = argument[3],
    _packet_id = argument[4],
    _values    = argument[5];

var _cid	  = _values[0];
var _weapon	  = _values[1];
var _shooting = _values[2];
var _aimx     = _values[3];
var _aimy     = _values[4];

var peer = obj_server.clients[_cid, 0];

show_debug_message("Server received: [id=" + string(_cid) + " | shooting=" + string(_shooting) + "| mouse x,y=" + string(_aimx) + ", " + string(_aimy) + "]");

if (peer.weapon != _weapon) {
	weapon_switch(_cid);
}

peer.shooting = _shooting;
peer.image_angle = point_direction(peer.x, peer.y, _aimx, _aimy);
peer.aimx = _aimx;
peer.aimy = _aimy;


//TODO: 
// 1. for now this sync packet will simply send the client his current official state as a reply
//    later, this sync packet should include info on EVERY user in the match and be sent at regular intervals (multi-client task)
// 2. right now, we pass in an id=1 to indicate the client and id=0 to indicate the server - this should be changed to be dynamic (multi-client task)
broadcast_sync(_session, _cid);