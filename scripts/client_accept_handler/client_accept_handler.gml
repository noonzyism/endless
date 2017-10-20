/// example_increment_client_handler(session, socket, ip, port, packet_id, values);

var _session   = argument[0],
    _socket    = argument[1],
    _ip        = argument[2],
    _port      = argument[3],
    _packet_id = argument[4],
    _values    = argument[5];

var _id = _values[0];

//retrieving clientId by incrementing locally to limit packet size over the network (ids are always >= 100000)
obj_client.clientId = _id;

show_debug_message("Client received id from server: " + string(obj_client.clientId));