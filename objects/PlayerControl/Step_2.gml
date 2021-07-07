if(global.myself.object == -1) exit;
    
//AFK Check -- double length for server host
if(global.isHost)
    afktimer -= 0.5 * global.delta_factor
else
    afktimer -= 1 * global.delta_factor;

if ((afktimer <= 0) and !global.myself.object.afk)
{
    global.myself.object.afk = true;
    if !instance_exists(TeamSelectController)
        instance_create(0,0,TeamSelectController);
    with(TeamSelectController)
        afk = true;
}
   
if(global.myself.class == CLASS_ENGINEER)
{
    if(global.myself.sentry and !instance_exists(SentryHealthHud))
        instance_create(0,0,SentryHealthHud);

    if(!instance_exists(NutsNBoltsHud))
        instance_create(0,0,NutsNBoltsHud);
}
if(global.myself.class == CLASS_HEAVY)
{
    if(!instance_exists(SandwichHud))
        instance_create(0,0,SandwichHud);
}

// Sticky HUD. Because real men let computers count for them.
else if (global.myself.class == CLASS_DEMOMAN) && !instance_exists(StickyCounter) instance_create(0,0,StickyCounter);
  
else if global.myself.class == CLASS_MEDIC {
    //Uber HUD
    if !instance_exists(UberHud) instance_create(0,0,UberHud);
    //Healing Hud
    if !instance_exists(HealingHud) && global.showHealing = 1 instance_create(0,0,HealingHud);
    //Medic Radar
    if global.medicRadar == 1 && !instance_exists(MedicRadar) instance_create(0,0,MedicRadar);
}
        
// Health HUD
if  !instance_exists(HealthHud) instance_create(0,0,HealthHud);

// Healed HUD
if !instance_exists(HealedHud) && global.showHealer = 1 instance_create(0,0,HealedHud);

