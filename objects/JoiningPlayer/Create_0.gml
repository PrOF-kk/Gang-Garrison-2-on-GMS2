socket = -1;
mapDownloadBuffer = -1;
occupiesSlot = false;
kicked = false;

STATE_EXPECT_HELLO = 1; // Hello message: 17 bytes (HELLO+UUID)
STATE_EXPECT_MESSAGELEN = 2; // 1 byte Message length header 
STATE_EXPECT_NAME = 3;
STATE_EXPECT_PASSWORD = 4;
STATE_CLIENT_AUTHENTICATED = 5;
STATE_EXPECT_COMMAND = 6;
STATE_CLIENT_DOWNLOADING = 7;

state = STATE_EXPECT_HELLO;
expectedBytes = 17;
lastContact = current_time; // To allow implementing a timeout
cumulativeMapBytes = 0;

