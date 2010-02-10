/* 
 *  Awesome-helper 
 *  Copyright (C) 2003-2006 XMMS2 Team
 *  Copyright (C) 2010 Radu Andries
 *
 *  This program is free software; you can redistribute it and/or
 *  modify it under the terms of the GNU General Public
 *  License as published by the Free Software Foundation; either
 *  version 2 of the License, or (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 *  General Public License for more details.
 *
 */

#include <stdlib.h>
#include <string.h>
#include <unistd.h>

/* include xmmsclient header */
#include <xmmsclient/xmmsclient.h>

void run (xmmsc_connection_t *connection){
	/*
	 * Variables that we'll need later
	 */
	const char *val;
	const char *val1,*val2;
	char *exec_s;
	int intval;
	int id;
	xmmsv_t *dict_entry;
	xmmsv_t *infos;
	xmmsc_result_t *result;
	xmmsv_t *return_value;
	const char *err_buf;


	if (!xmmsc_connect (connection, getenv ("XMMS_PATH"))) {
		fprintf (stderr, "Connection failed: %s\n",
		         xmmsc_get_last_error (connection));

		exit (EXIT_FAILURE);
	}

	result = xmmsc_playback_current_id (connection);
	xmmsc_result_wait (result);
	return_value = xmmsc_result_get_value (result);

	if (xmmsv_is_error (return_value) &&
	    xmmsv_get_error (return_value, &err_buf)) {
		fprintf (stderr, "playback current id returns error, %s\n",
		         err_buf);
	}

	if (!xmmsv_get_int (return_value, &id)) {
		fprintf (stderr, "xmmsc_playback_current_id didn't "
		         "return int as expected\n");
		/* Fake id (ids are >= 1) used as an error flag. */
		id = 0;
	}

	if (id == 0) {
		fprintf (stderr, "Nothing is playing.\n");
		return;
	}

	result = xmmsc_medialib_get_info (connection, id);
	xmmsc_result_wait (result);
	return_value = xmmsc_result_get_value (result);

	if (xmmsv_is_error (return_value) &&
	    xmmsv_get_error (return_value, &err_buf)) {
		fprintf (stderr, "medialib get info returns error, %s\n",
		         err_buf);
		exit (EXIT_FAILURE);
	}

	infos = xmmsv_propdict_to_dict (return_value, NULL);

	if (!xmmsv_dict_get (infos, "artist", &dict_entry) ||
	    !xmmsv_get_string (dict_entry, &val)) {
		val = "No Artist";
	}


	if (!xmmsv_dict_get (infos, "title", &dict_entry) ||
	    !xmmsv_get_string (dict_entry, &val1)) {
		val = "No Title";
	}

	if (!xmmsv_dict_get (infos, "album", &dict_entry) ||
	    !xmmsv_get_string (dict_entry, &val2)) {
		val = "No Album";
	}

	if (!xmmsv_dict_get (infos, "bitrate", &dict_entry) ||
	    !xmmsv_get_int (dict_entry, &intval)) {
		intval = 0;
	}
	//"echo 'med_info.text=\"\"'|awesome-client"38
	exec_s=malloc((45+strlen(val)+strlen(val1)+strlen(val2))*sizeof(char));
	sprintf(exec_s,"echo 'med_info.text=\"%s - %s (%s)\"'|awesome-client",val,val1,val2);
	system(exec_s);
	free(exec_s);
	xmmsv_unref (infos);

	xmmsc_result_unref (result);

	xmmsc_unref (connection);

}

int main (int argc, char ** argv){
	xmmsc_connection_t *connection;
	connection = xmmsc_init ("tutorial3");
	if (!connection) {
		fprintf (stderr, "OOM!\n");
		exit (EXIT_FAILURE);
	}
	while(1){
		run (connection);
		sleep(3);
	}

	return (EXIT_SUCCESS);
}
