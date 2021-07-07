smokeCount += 1 * global.delta_factor;
if (global.isHost)
{
    if hp <= 0
    {
        sendEventGeneratorDestroy(team);
        doEventGeneratorDestroy(team);
    }
    else if GameServer.frame mod 1800 == 0
        GameServer.syncTimer = 1;
}
if hp >= maxHp*0.66 spriteStart = 0;
else if hp >= maxHp*0.33 && hp < maxHp*0.66{ 
    spriteStart = 16;
    if(global.particles = PARTICLES_NORMAL) {
        if smokeCount mod 50 == 0 effect_create_above(ef_smoke,x+20-random(40),y+20-random(40),choose(0,1),c_gray);
    }
}
else {
    spriteStart = 32;
    if(global.particles = PARTICLES_NORMAL) {
        if smokeCount mod 25 == 0 effect_create_above(ef_smoke,x+20-random(40),y+20-random(40),choose(0,1),c_gray);
    }
}
spriteEnd = spriteStart+15;
if image_index > spriteEnd
    image_index = spriteStart;

