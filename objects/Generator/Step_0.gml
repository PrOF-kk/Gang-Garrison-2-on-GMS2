if (isShieldRegenerating) {
    shieldHp = min(shieldHp+isShieldRegenerating*global.delta_factor, maxShieldHp);  
    if (shieldHp == maxShieldHp)
        isShieldRegenerating = false;
}

if (shieldHp > 0) {
    shieldIndex += 4/30 * global.delta_factor;
    if shieldIndex > 4 shieldIndex = 0;
}

