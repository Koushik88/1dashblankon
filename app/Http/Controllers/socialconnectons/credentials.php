<?php
/**
 * Twitter App Credentials
 */
define('CONSUMER_KEY', 'csqH9LTtFiBLIdGwrGaT69OTa');
define('CONSUMER_SECRET', 'v15Hra1LdPNoHnycNfbzj70zgFQU5C0u9nrAGooh3FIw0k6HiX');
define('OAUTH_CALLBACK', env('APP_URL') . 'twitter_oauth');
/**
 * Facebook App Credentials
 */
define('FB_APP_ID', '314358688908517');
// define('FB_APP_ID', '546632258880173'); //local mine
define('FB_APP_SECRET', 'eb32a4991926f4bfa6045925be1d8d77');
// define('FB_APP_SECRET', '8fe2f5e2700fe69f010fec40f433e145'); //local mine
define('FB_OAUTH_CALLBACK', env('APP_URL') . 'facebook_oauth');
function get_fbPermissions() {
	$permissions = ['publish_actions', 'user_posts', 'manage_pages'];
	return $permissions;
}
/**
 * Instagram App Credentials
 */
define('INSTAGRAM_CLIENT_ID', 'b10a1bc5a8b44af0b2879ef2509fef52');
// define('INSTAGRAM_CLIENT_ID', 'c63cc56f56924a0e915c8151fc10dec8'); //local mine
define('INSTAGRAM_CLIENT_SECRET', '11dc2114b86e4d46b5e026ed470e9171');
// define('INSTAGRAM_CLIENT_SECRET', 'd62ef3762be247af8aef54d39c57e8fe'); //local mine
define('INSTAGRAM_OAUTH_CALLBACK', env('APP_URL') . 'instagram_oauth');
/**
 * Pinterest App Credentials
 */
define('PINTEREST_CLIENT_ID', '4855867933835931140');
define('PINTEREST_CLIENT_SECRET', 'e3a3de85f8c371b3566bf779f94470de3e8be6f016a4b5fc223e73a642d9ea59');
define('PINTEREST_OAUTH_CALLBACK', env('APP_URL') . 'pinterest_oauth');
function get_PinterestScope() {
	$SCOPE = array('read_public', 'write_public', 'read_relationships', 'write_relationships');
	return $SCOPE;
}

/**
 * Vimeo App Credentials
 */
define('VIMEO_CLIENT_ID', '5f9a49debe8669994d8fff6fc6ba5bc1fafc8e5b');
define('VIMEO_CLIENT_SECRET', 'yRJ8ubnYu/9UyOMEk9bXYnxxOAtnE1zsFpqt58P3iOVhbUbFp1odmgEOxmzv6h5K8vSW4/EIJ1u81WG5pS2Ek0boxX8xfLtAhy07n5k6hAGUsCUb7wGjxy1nKnsgeOpG');
define('VIMEO_OAUTH_CALLBACK', env('APP_URL') . 'vimeo_oauth');