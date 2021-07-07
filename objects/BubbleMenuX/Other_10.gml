    if(not done) {
        write_ubyte(global.serverSocket, CHAT_BUBBLE);
        write_ubyte(global.serverSocket, bubbleImage);
    }
    done = true;

