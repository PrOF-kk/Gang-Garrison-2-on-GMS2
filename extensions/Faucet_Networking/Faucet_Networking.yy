{
  "optionsFile": "options.json",
  "options": [],
  "exportToGame": true,
  "supportedTargets": 9223372036854775807,
  "extensionVersion": "1.7.1",
  "packageId": "",
  "productId": "",
  "author": "",
  "date": "2021-07-07T10:18:52.6952656+02:00",
  "license": "ISC license",
  "description": "Provides basic networking functionality",
  "helpfile": "",
  "iosProps": true,
  "tvosProps": false,
  "androidProps": true,
  "installdir": "",
  "files": [
    {"filename":"faucetNetworking.dll","origname":"D:\\Eigene Dateien\\Programmierung\\CB_Faucet\\Faucet Networking\\bin\\Release\\Faucet Networking.dll","init":"dllStartup","final":"dllShutdown","kind":1,"uncompress":false,"functions":[
        {"externalName":"append_file_to_buffer","kind":12,"help":"append_file_to_buffer(dest, filename)","hidden":false,"returnType":2,"argCount":2,"args":[
            2,
            1,
          ],"resourceVersion":"1.0","name":"append_file_to_buffer","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"bit_get","kind":12,"help":"bit_get(value,bitnum)","hidden":false,"returnType":2,"argCount":2,"args":[
            2,
            2,
          ],"resourceVersion":"1.0","name":"bit_get","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"bit_set","kind":12,"help":"bit_set(value,bitnum,bitval)","hidden":false,"returnType":2,"argCount":3,"args":[
            2,
            2,
            2,
          ],"resourceVersion":"1.0","name":"bit_set","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"buffer_bytes_left","kind":12,"help":"buffer_bytes_left(source)","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"resourceVersion":"1.0","name":"fct_buffer_bytes_left","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"buffer_clear","kind":12,"help":"buffer_clear(buffer)","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"resourceVersion":"1.0","name":"fct_buffer_clear","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"buffer_create","kind":12,"help":"buffer_create()","hidden":false,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"fct_buffer_create","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"buffer_destroy","kind":12,"help":"buffer_destroy(buffer)","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"resourceVersion":"1.0","name":"fct_buffer_destroy","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"buffer_set_readpos","kind":12,"help":"buffer_set_readpos(source, pos)","hidden":false,"returnType":2,"argCount":2,"args":[
            2,
            2,
          ],"resourceVersion":"1.0","name":"fct_buffer_set_readpos","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"buffer_size","kind":12,"help":"buffer_size(buffer)","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"resourceVersion":"1.0","name":"fct_buffer_size","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"build_ubyte","kind":12,"help":"build_ubyte(bit7,bit6,bit5,bit4,bit3,bit2,bit1,bit0)","hidden":false,"returnType":2,"argCount":8,"args":[
            2,
            2,
            2,
            2,
            2,
            2,
            2,
            2,
          ],"resourceVersion":"1.0","name":"build_ubyte","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"debug_handles","kind":12,"help":"debug_handles()","hidden":false,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"debug_handles","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"dllShutdown","kind":12,"help":"","hidden":false,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"dllShutdown","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"dllStartup","kind":12,"help":"","hidden":false,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"dllStartup","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"ipv4_lookup_create","kind":12,"help":"ipv4_lookup_create(hostname)","hidden":false,"returnType":2,"argCount":1,"args":[
            1,
          ],"resourceVersion":"1.0","name":"ipv4_lookup_create","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"ipv6_lookup_create","kind":12,"help":"ipv6_lookup_create(hostname)","hidden":false,"returnType":2,"argCount":1,"args":[
            1,
          ],"resourceVersion":"1.0","name":"ipv6_lookup_create","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"ip_is_v4","kind":12,"help":"ip_is_v4(string)","hidden":false,"returnType":2,"argCount":1,"args":[
            1,
          ],"resourceVersion":"1.0","name":"ip_is_v4","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"ip_is_v6","kind":12,"help":"ip_is_v6(string)","hidden":false,"returnType":2,"argCount":1,"args":[
            1,
          ],"resourceVersion":"1.0","name":"ip_is_v6","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"ip_lookup_create","kind":12,"help":"ip_lookup_create(hostname)","hidden":false,"returnType":2,"argCount":1,"args":[
            1,
          ],"resourceVersion":"1.0","name":"ip_lookup_create","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"ip_lookup_destroy","kind":12,"help":"ip_lookup_destroy(lookup)","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"resourceVersion":"1.0","name":"ip_lookup_destroy","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"ip_lookup_has_next","kind":12,"help":"ip_lookup_has_next(lookup)","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"resourceVersion":"1.0","name":"ip_lookup_has_next","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"ip_lookup_next_result","kind":12,"help":"ip_lookup_next_result(lookup)","hidden":false,"returnType":1,"argCount":1,"args":[
            2,
          ],"resourceVersion":"1.0","name":"ip_lookup_next_result","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"ip_lookup_ready","kind":12,"help":"ip_lookup_ready(lookup)","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"resourceVersion":"1.0","name":"ip_lookup_ready","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"mac_addrs","kind":12,"help":"mac_addrs()","hidden":false,"returnType":1,"argCount":0,"args":[],"resourceVersion":"1.0","name":"mac_addrs","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"read_base64","kind":12,"help":"read_base64(source, len)","hidden":false,"returnType":1,"argCount":2,"args":[
            2,
            2,
          ],"resourceVersion":"1.0","name":"read_base64","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"read_byte","kind":12,"help":"read_byte(source)","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"resourceVersion":"1.0","name":"read_byte","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"read_double","kind":12,"help":"read_double(source)","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"resourceVersion":"1.0","name":"read_double","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"read_float","kind":12,"help":"read_float(source)","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"resourceVersion":"1.0","name":"read_float","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"read_hex","kind":12,"help":"read_hex(source, len)","hidden":false,"returnType":1,"argCount":2,"args":[
            2,
            2,
          ],"resourceVersion":"1.0","name":"read_hex","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"read_int","kind":12,"help":"read_int(source)","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"resourceVersion":"1.0","name":"read_int","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"read_short","kind":12,"help":"read_short(source)","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"resourceVersion":"1.0","name":"read_short","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"read_string","kind":12,"help":"read_string(source, length)","hidden":false,"returnType":1,"argCount":2,"args":[
            2,
            2,
          ],"resourceVersion":"1.0","name":"read_string","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"read_ubyte","kind":12,"help":"read_ubyte(source)","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"resourceVersion":"1.0","name":"read_ubyte","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"read_uint","kind":12,"help":"read_uint(source)","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"resourceVersion":"1.0","name":"read_uint","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"read_ushort","kind":12,"help":"read_ushort(source)","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"resourceVersion":"1.0","name":"read_ushort","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"set_little_endian","kind":12,"help":"set_little_endian(buffer|socket, bool)","hidden":false,"returnType":2,"argCount":2,"args":[
            2,
            2,
          ],"resourceVersion":"1.0","name":"set_little_endian","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"set_little_endian_global","kind":12,"help":"set_little_endian_global(bool)","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"resourceVersion":"1.0","name":"set_little_endian_global","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"socket_accept","kind":12,"help":"socket_accept(acceptor)","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"resourceVersion":"1.0","name":"socket_accept","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"socket_connecting","kind":12,"help":"socket_connecting(socket)","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"resourceVersion":"1.0","name":"socket_connecting","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"socket_destroy","kind":12,"help":"socket_destroy(socket)","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"resourceVersion":"1.0","name":"socket_destroy","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"socket_destroy_abortive","kind":12,"help":"socket_destroy_abortive(socket)","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"resourceVersion":"1.0","name":"socket_destroy_abortive","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"socket_error","kind":12,"help":"socket_error(socket)","hidden":false,"returnType":1,"argCount":1,"args":[
            2,
          ],"resourceVersion":"1.0","name":"socket_error","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"socket_handle_io","kind":12,"help":"socket_handle_io()","hidden":false,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"socket_handle_io","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"socket_has_error","kind":12,"help":"socket_has_error(socket)","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"resourceVersion":"1.0","name":"socket_has_error","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"socket_local_port","kind":12,"help":"socket_local_port(socket)","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"resourceVersion":"1.0","name":"socket_local_port","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"socket_receivebuffer_size","kind":12,"help":"socket_receivebuffer_size(socket)","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"resourceVersion":"1.0","name":"socket_receivebuffer_size","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"socket_remote_ip","kind":12,"help":"socket_remote_ip(socket)","hidden":false,"returnType":1,"argCount":1,"args":[
            2,
          ],"resourceVersion":"1.0","name":"socket_remote_ip","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"socket_remote_port","kind":12,"help":"socket_remote_port(socket)","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"resourceVersion":"1.0","name":"socket_remote_port","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"socket_send","kind":12,"help":"socket_send(tcpSocket)","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"resourceVersion":"1.0","name":"socket_send","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"socket_sendbuffer_limit","kind":12,"help":"socket_sendbuffer_limit(socket, limit)","hidden":false,"returnType":2,"argCount":2,"args":[
            2,
            2,
          ],"resourceVersion":"1.0","name":"socket_sendbuffer_limit","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"socket_sendbuffer_size","kind":12,"help":"socket_sendbuffer_size(socket)","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"resourceVersion":"1.0","name":"socket_sendbuffer_size","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"tcp_connect","kind":12,"help":"tcp_connect(host, port)","hidden":false,"returnType":2,"argCount":2,"args":[
            1,
            2,
          ],"resourceVersion":"1.0","name":"tcp_connect","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"tcp_eof","kind":12,"help":"tcp_eof(tcpSocket)","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"resourceVersion":"1.0","name":"tcp_eof","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"tcp_listen","kind":12,"help":"tcp_listen(port)","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"resourceVersion":"1.0","name":"tcp_listen","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"tcp_listening_v4","kind":12,"help":"tcp_listening_v4(acceptor)","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"resourceVersion":"1.0","name":"tcp_listening_v4","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"tcp_listening_v6","kind":12,"help":"tcp_listening_v6(acceptor)","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"resourceVersion":"1.0","name":"tcp_listening_v6","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"tcp_receive","kind":12,"help":"tcp_receive(tcpSocket, numBytes)","hidden":false,"returnType":2,"argCount":2,"args":[
            2,
            2,
          ],"resourceVersion":"1.0","name":"tcp_receive","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"tcp_receive_available","kind":12,"help":"tcp_receive_available(tcpSocket)","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"resourceVersion":"1.0","name":"tcp_receive_available","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"tcp_set_nodelay","kind":12,"help":"tcp_set_nodelay(tcpSocket, noDelay)","hidden":false,"returnType":2,"argCount":2,"args":[
            2,
            2,
          ],"resourceVersion":"1.0","name":"tcp_set_nodelay","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"udp_bind","kind":12,"help":"udp_bind(port)","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"resourceVersion":"1.0","name":"udp_bind","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"udp_broadcast","kind":12,"help":"udp_broadcast(udpSocket|buffer, port)","hidden":false,"returnType":2,"argCount":2,"args":[
            2,
            2,
          ],"resourceVersion":"1.0","name":"udp_broadcast","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"udp_receive","kind":12,"help":"udp_receive(udpSocket)","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"resourceVersion":"1.0","name":"udp_receive","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"udp_send","kind":12,"help":"udp_send(udpSocket|buffer, host, port)","hidden":false,"returnType":2,"argCount":3,"args":[
            2,
            1,
            2,
          ],"resourceVersion":"1.0","name":"udp_send","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"write_base64","kind":12,"help":"write_base64(dest, base64)","hidden":false,"returnType":2,"argCount":2,"args":[
            2,
            1,
          ],"resourceVersion":"1.0","name":"write_base64","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"write_buffer","kind":12,"help":"write_buffer(dest, source)","hidden":false,"returnType":2,"argCount":2,"args":[
            2,
            2,
          ],"resourceVersion":"1.0","name":"write_buffer","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"write_buffer_part","kind":12,"help":"write_buffer_part(dest, source, bytes)","hidden":false,"returnType":2,"argCount":3,"args":[
            2,
            2,
            2,
          ],"resourceVersion":"1.0","name":"write_buffer_part","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"write_buffer_to_file","kind":12,"help":"write_buffer_to_file(source, filename)","hidden":false,"returnType":2,"argCount":2,"args":[
            2,
            1,
          ],"resourceVersion":"1.0","name":"write_buffer_to_file","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"write_byte","kind":12,"help":"write_byte(dest, value)","hidden":false,"returnType":2,"argCount":2,"args":[
            2,
            2,
          ],"resourceVersion":"1.0","name":"write_byte","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"write_double","kind":12,"help":"write_double(dest, value)","hidden":false,"returnType":2,"argCount":2,"args":[
            2,
            2,
          ],"resourceVersion":"1.0","name":"write_double","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"write_float","kind":12,"help":"write_float(dest, value)","hidden":false,"returnType":2,"argCount":2,"args":[
            2,
            2,
          ],"resourceVersion":"1.0","name":"write_float","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"write_hex","kind":12,"help":"write_hex(dest, hexString)","hidden":false,"returnType":2,"argCount":2,"args":[
            2,
            1,
          ],"resourceVersion":"1.0","name":"write_hex","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"write_int","kind":12,"help":"write_int(dest, value)","hidden":false,"returnType":2,"argCount":2,"args":[
            2,
            2,
          ],"resourceVersion":"1.0","name":"write_int","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"write_short","kind":12,"help":"write_short(dest, value)","hidden":false,"returnType":2,"argCount":2,"args":[
            2,
            2,
          ],"resourceVersion":"1.0","name":"write_short","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"write_string","kind":12,"help":"write_string(dest, string)","hidden":false,"returnType":2,"argCount":2,"args":[
            2,
            1,
          ],"resourceVersion":"1.0","name":"write_string","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"write_ubyte","kind":12,"help":"write_ubyte(dest, value)","hidden":false,"returnType":2,"argCount":2,"args":[
            2,
            2,
          ],"resourceVersion":"1.0","name":"write_ubyte","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"write_uint","kind":12,"help":"write_uint(dest, value)","hidden":false,"returnType":2,"argCount":2,"args":[
            2,
            2,
          ],"resourceVersion":"1.0","name":"write_uint","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"write_ushort","kind":12,"help":"write_ushort(dest, value)","hidden":false,"returnType":2,"argCount":2,"args":[
            2,
            2,
          ],"resourceVersion":"1.0","name":"write_ushort","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"_fnet_hidden_read_cstring","kind":12,"help":"_fnet_hidden_read_cstring(source)","hidden":false,"returnType":1,"argCount":1,"args":[
            2,
          ],"resourceVersion":"1.0","name":"_fnet_hidden_read_cstring","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"_fnet_hidden_read_delimited_string","kind":12,"help":"_fnet_hidden_read_delimited_string(source, delimiter)","hidden":false,"returnType":1,"argCount":2,"args":[
            2,
            1,
          ],"resourceVersion":"1.0","name":"_fnet_hidden_read_delimited_string","tags":[],"resourceType":"GMExtensionFunction",},
      ],"constants":[],"ProxyFiles":[],"copyToTargets":9223372036854775807,"order":[
        {"name":"append_file_to_buffer","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"bit_get","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"bit_set","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"fct_buffer_bytes_left","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"fct_buffer_clear","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"fct_buffer_create","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"fct_buffer_destroy","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"fct_buffer_set_readpos","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"fct_buffer_size","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"build_ubyte","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"debug_handles","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"dllShutdown","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"dllStartup","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"ipv4_lookup_create","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"ipv6_lookup_create","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"ip_is_v4","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"ip_is_v6","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"ip_lookup_create","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"ip_lookup_destroy","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"ip_lookup_has_next","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"ip_lookup_next_result","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"ip_lookup_ready","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"mac_addrs","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"read_base64","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"read_byte","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"read_double","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"read_float","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"read_hex","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"read_int","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"read_short","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"read_string","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"read_ubyte","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"read_uint","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"read_ushort","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"set_little_endian","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"set_little_endian_global","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"socket_accept","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"socket_connecting","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"socket_destroy","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"socket_destroy_abortive","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"socket_error","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"socket_handle_io","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"socket_has_error","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"socket_local_port","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"socket_receivebuffer_size","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"socket_remote_ip","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"socket_remote_port","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"socket_send","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"socket_sendbuffer_limit","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"socket_sendbuffer_size","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"tcp_connect","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"tcp_eof","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"tcp_listen","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"tcp_listening_v4","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"tcp_listening_v6","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"tcp_receive","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"tcp_receive_available","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"tcp_set_nodelay","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"udp_bind","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"udp_broadcast","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"udp_receive","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"udp_send","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"write_base64","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"write_buffer","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"write_buffer_part","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"write_buffer_to_file","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"write_byte","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"write_double","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"write_float","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"write_hex","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"write_int","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"write_short","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"write_string","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"write_ubyte","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"write_uint","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"write_ushort","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"_fnet_hidden_read_cstring","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"_fnet_hidden_read_delimited_string","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
      ],"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMExtensionFile",},
    {"filename":"faucetnet_gmscripts.gml","origname":"D:\\Eigene Dateien\\Programmierung\\CB_Faucet\\Faucet Networking\\faucetnet_gmscripts.gml","init":"","final":"","kind":2,"uncompress":false,"functions":[
        {"externalName":"read_cstring","kind":2,"help":"read_cstring(source)","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"resourceVersion":"1.0","name":"read_cstring","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"read_delimited_string","kind":2,"help":"read_delimited_string(source, delimiter)","hidden":false,"returnType":2,"argCount":2,"args":[
            2,
            2,
          ],"resourceVersion":"1.0","name":"read_delimited_string","tags":[],"resourceType":"GMExtensionFunction",},
      ],"constants":[],"ProxyFiles":[],"copyToTargets":9223372036854775807,"order":[
        {"name":"read_cstring","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
        {"name":"read_delimited_string","path":"extensions/Faucet_Networking/Faucet_Networking.yy",},
      ],"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMExtensionFile",},
  ],
  "classname": "",
  "tvosclassname": "",
  "tvosdelegatename": "",
  "iosdelegatename": "",
  "androidclassname": "",
  "sourcedir": "",
  "androidsourcedir": "",
  "macsourcedir": "",
  "maccompilerflags": "",
  "tvosmaccompilerflags": "",
  "maclinkerflags": "",
  "tvosmaclinkerflags": "",
  "iosplistinject": "",
  "tvosplistinject": "",
  "androidinject": "",
  "androidmanifestinject": "",
  "androidactivityinject": "",
  "gradleinject": "",
  "iosSystemFrameworkEntries": [],
  "tvosSystemFrameworkEntries": [],
  "iosThirdPartyFrameworkEntries": [],
  "tvosThirdPartyFrameworkEntries": [],
  "IncludedResources": [],
  "androidPermissions": [],
  "copyToTargets": 9223372036854775807,
  "iosCocoaPods": "",
  "tvosCocoaPods": "",
  "iosCocoaPodDependencies": "",
  "tvosCocoaPodDependencies": "",
  "parent": {
    "name": "Extensions",
    "path": "folders/Extensions.yy",
  },
  "resourceVersion": "1.2",
  "name": "Faucet_Networking",
  "tags": [],
  "resourceType": "GMExtension",
}