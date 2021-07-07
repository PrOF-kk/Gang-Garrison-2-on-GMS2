{
    pressedKeys |= keyState & ~lastKeyState;
    releasedKeys |= ~keyState & lastKeyState;
    lastKeyState = keyState;
}
