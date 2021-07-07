function http_new_get_ex(argument0, argument1) {
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

	// Makes a GET HTTP request with custom headers
	// real http_new_get_ex(string url, real headers)

	// url - URL to send GET request to
	// headers - ds_map of extra headers to send

	// Return value is an HttpClient instance that can be passed to
	// fct_http_request_status etc.
	// (errors on failure to parse URL)

	var url, headers, client;

	url = argument0;
	headers = argument1;

	if (!variable_global_exists("__HttpClient"))
	    __http_init();

	client = instance_create(0, 0, global.__HttpClient);
	__http_prepare_request(client, "GET", url, headers, 0, "");
	return client;



}
