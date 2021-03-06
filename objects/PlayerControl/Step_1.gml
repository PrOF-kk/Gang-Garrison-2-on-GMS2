if(instance_exists(MenuController))
    exit;
    
var kickOpen;
kickOpen = false
if (instance_exists(ScoreTableController))
    if (ScoreTableController.showadmin)
        kickOpen = true;
    
if(instance_exists(TeamSelectController) || instance_exists(ClassSelectController) || kickOpen)
    menuOpen = true;
else
    menuOpen = false;

//Checking for input - Mapped Keys
if(keyboard_check_pressed(global.changeTeam))
    inputChangeTeam();
if(keyboard_check_pressed(global.changeClass))
    inputChangeClass();

event_user(8);
    
var keybyte;
keybyte = 0;

/* KeyByte flags:
    02 - down
    
    08 - primary
    10 - secondary
    
    20 - right
    40 - left
    80 - up
*/

//character object exists
if(global.myself.object != -1)
{
    if(!menuOpen)
    {
        if(keyboard_check(global.left) || keyboard_check(global.left2)) keybyte |= $40;
        if(keyboard_check(global.right) || keyboard_check(global.right2)) keybyte |= $20;
        if(keyboard_check(global.jump) || keyboard_check(global.jump2)) keybyte |= $80;
        if(keyboard_check(global.down) || keyboard_check(global.down2)) keybyte |= $02;
        if(keyboard_check(global.taunt)) keybyte |= $01;
        if(keyboard_check_pressed(global.chat1)) inputChat1();
        if(keyboard_check_pressed(global.chat2)) inputChat2();
        if(keyboard_check_pressed(global.chat3)) inputChat3();
        if(keyboard_check_pressed(global.drop)) inputDrop();
        
        if(keyboard_check_pressed(global.medic))
        {
            inputCallMedic();
        }
        
        if(!global.myself.humiliated)
        {
            if(keyboard_check(global.attack)) keybyte |= $10;
            if(keyboard_check(global.special)) keybyte |= $08;
            if(keyboard_check_pressed(global.special)) inputSpecial();
            if(keyboard_check_pressed(global.taunt)) inputTaunt();
            
            if(mouse_check_button(mb_left))
            {
                if(global.attack == MOUSE_LEFT) keybyte |= $10;
                if(global.special == MOUSE_LEFT) keybyte |= $08;
            }
            if(mouse_check_button_pressed(mb_left) and global.special == MOUSE_LEFT)
                inputSpecial();

            if(mouse_check_button(mb_right))
            {
                if(global.attack == MOUSE_RIGHT) keybyte |= $10;
                if(global.special == MOUSE_RIGHT) keybyte |= $08;
            }
            if(mouse_check_button_pressed(mb_right) and global.special == MOUSE_RIGHT)
                inputSpecial();
            
        }
    }
    
    if(global.run_virtual_ticks)
        ClientInputstate(global.serverSocket, keybyte);
    socket_send(global.serverSocket);
}
// spectator controls
else if (instance_exists(Spectator))
{
    if(!menuOpen)
    {
        if(mouse_check_button_pressed(mb_left))
            with (Spectator) event_user(7);
        if(mouse_check_button_pressed(mb_right))
            with (Spectator) event_user(8);
    }
}

if(keybyte != 0
        or keyboard_check(global.left) or keyboard_check(global.left2)
        or keyboard_check(global.right) or keyboard_check(global.right2)
        or keyboard_check(global.jump) or keyboard_check(global.jump2)
        or keyboard_check(global.down) or keyboard_check(global.down2)) {
    afktimer = afktimeout;
}


/* */
/*  */
