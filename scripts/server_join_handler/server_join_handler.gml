/// example_increment_server_handler(session, socket, ip, port, packet_id, values);

var _session   = argument[0],
    _socket    = argument[1],
    _ip        = argument[2],
    _port      = argument[3],
    _packet_id = argument[4],
    _values    = argument[5];

var _username = _values[0];

var client_id = add_client(string(_username), _socket);

/*
obj_server.clientId = instance_create_depth(100, 100, 100, obj_peer);
obj_server.clientName = string(_username);
obj_server.clientSocket = _socket;
*/

show_debug_message("Server received join request: [" + string(obj_server.clients[client_id, 1]) + ", " + string(client_id) + "]");

//decrementing id by 100000 to be resolved on client-side to limit packet size (ids are always >= 100000)
netplay_send(_session, _socket, Packets.ACCEPT, client_id);