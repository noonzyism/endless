/// example_increment_client_handler(session, socket, ip, port, packet_id, values);

var _session   = argument[0],
    _socket    = argument[1],
    _ip        = argument[2],
    _port      = argument[3],
    _packet_id = argument[4],
    _values    = argument[5];

var _id			= _values[0];
var _username	= _values[1];
var _team		= _values[2];
var _score		= _values[3];
var _kills		= _values[4];
var _deaths		= _values[5];
var _objhold	= _values[6];

//self match state
if (_id == obj_client.clientId) {
	show_debug_message("Client received match update for self: " + _username + ", team=" + string(_team) + ", score=" + string(_score) + ", kills=" + string(_kills) + ", deaths=" + string(_deaths) + ", objhold=" + string(_objhold));
	obj_player.team	= _team;
	obj_player.matchscore = _score;
	obj_player.kills = _kills;
	obj_player.deaths = _deaths;
	obj_player.objhold = _objhold;
}

else {
	show_debug_message("Client received match update for some peer");
	var peer = obj_client.peers[_id, 0]; //get this peer's local instance id
	peer.username = _username;
	peer.team	= _team;
	peer.matchscore = _score;
	peer.kills = _kills;
	peer.deaths = _deaths;
	peer.objhold = _objhold;
}