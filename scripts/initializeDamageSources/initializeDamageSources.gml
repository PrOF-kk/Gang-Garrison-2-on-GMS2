function initializeDamageSources() {
	global.damageSourceIcons = ds_list_create();

	createGlobalDamageSource("DAMAGE_SOURCE_NEEDLEGUN",           NeedleKL);
	createGlobalDamageSource("DAMAGE_SOURCE_RIFLE",               RifleKL);
	createGlobalDamageSource("DAMAGE_SOURCE_RIFLE_CHARGED",       RifleChargedKL);
	createGlobalDamageSource("DAMAGE_SOURCE_MINEGUN",             MineKL);
	createGlobalDamageSource("DAMAGE_SOURCE_MINIGUN",             MinigunKL);
	createGlobalDamageSource("DAMAGE_SOURCE_FLAMETHROWER",        FlameKL);
	createGlobalDamageSource("DAMAGE_SOURCE_SCATTERGUN",          ScatterKL);
	createGlobalDamageSource("DAMAGE_SOURCE_SHOTGUN",             ShotgunKL);
	createGlobalDamageSource("DAMAGE_SOURCE_ROCKETLAUNCHER",      RocketKL);
	createGlobalDamageSource("DAMAGE_SOURCE_REVOLVER",            RevolverKL);
	createGlobalDamageSource("DAMAGE_SOURCE_SENTRYTURRET",        TurretKL);
	createGlobalDamageSource("DAMAGE_SOURCE_BLADE",               BladeKL);
	createGlobalDamageSource("DAMAGE_SOURCE_BUBBLE",              BubbleKL);
	createGlobalDamageSource("DAMAGE_SOURCE_REFLECTED_ROCKET",    RocketReflectKL);
	createGlobalDamageSource("DAMAGE_SOURCE_REFLECTED_STICKY",    MineReflectKL);
	createGlobalDamageSource("DAMAGE_SOURCE_KNIFE",               KnifeKL);
	createGlobalDamageSource("DAMAGE_SOURCE_BACKSTAB",            BackstabKL);
	createGlobalDamageSource("DAMAGE_SOURCE_FLARE",               FlareKL);
	createGlobalDamageSource("DAMAGE_SOURCE_REFLECTED_FLARE",     FlareReflectKL);
	createGlobalDamageSource("DAMAGE_SOURCE_KILL_BOX",            DeadKL);
	createGlobalDamageSource("DAMAGE_SOURCE_FRAG_BOX",            DeadKL);
	createGlobalDamageSource("DAMAGE_SOURCE_PITFALL",             DeadKL);
	createGlobalDamageSource("DAMAGE_SOURCE_FINISHED_OFF",        DeadKL);
	createGlobalDamageSource("DAMAGE_SOURCE_FINISHED_OFF_GIB",    DeadKL);
	createGlobalDamageSource("DAMAGE_SOURCE_BID_FAREWELL",        DeadKL);
	createGlobalDamageSource("DAMAGE_SOURCE_GENERATOR_EXPLOSION", ExplodeKL);



}
