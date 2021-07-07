function __http_construct_url(argument0) {
	// ***
	// This function forms part of Faucet HTTP v1.1.1
	// https://github.com/TazeTSchnitzel/Faucet-HTTP-Extension
	// 
	// Copyright (c) 2013-2015, Andrea Faulds <ajf@ajf.me>
	// 
	// Permission to use, copy, modify, and/or distribute this software for any
	// purpose with or without fee is hereby granted, provided that the above
	// copyright notice and this permission notice appear in all copies.
	// 
	// THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
	// WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
	// MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
	// ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
	// WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
	// ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
	// OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
	// ***

	// Constructs an URL from its components (as http_parse_url would return)
	// string __http_construct_url(real parts)

	// Return value is the string of the constructed URL
	// Keys of parts map:
	// "scheme" - the URL scheme (e.g. "http")
	// "host" - the hostname (e.g. "example.com" or "127.0.0.1")
	// "port" - the port (e.g. 8000) - this is a real, unlike the others
	// "abs_path" - the absolute path (e.g. "/" or "/index.html")
	// "query" - the query string (e.g. "a=b&c=3")
	// Parts which are omitted will be omitted in the URL
	// e.g. http://example.com lacks "port", "path" or "query" keys

	// This will *only* work properly for URLs of format:
	// scheme ":" "//" host [ ":" port ] [ abs_path [ "?" query ]]"
	// where [] denotes an optional component
	// file: URLs will *not* work as they lack the authority (host:port) component
	// Should work correctly for IPv6 host values, but bare in mind parse_url won't

	var parts;
	parts = argument0;

	var url;
	url = "";

	url += ds_map_find_value(parts, "scheme");
	url += "://";
	url += ds_map_find_value(parts, "host");
	if (ds_map_exists(parts, "port"))
	    url += ":" + string(ds_map_find_value(parts, "port"));
	if (ds_map_exists(parts, "abs_path"))
	{
	    url += ds_map_find_value(parts, "abs_path");
	    if (ds_map_exists(parts, "query"))
	        url += "?" + ds_map_find_value(parts, "query");
	}

	return url;



}
