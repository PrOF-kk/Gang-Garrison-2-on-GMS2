function initializeDamageSources() {
	
	enum DamageSource {
		NEEDLEGUN =            1,
		RIFLE =                2,
		RIFLE_CHARGED =        3,
		MINEGUN =              4,
		MINIGUN =              5,
		FLAMETHROWER =         6,
		SCATTERGUN =           7,
		SHOTGUN =              8,
		ROCKETLAUNCHER =       9,
		REVOLVER =            10,
		SENTRYTURRET =        11,
		BLADE =               12,
		BUBBLE =              13,
		REFLECTED_ROCKET =    14,
		REFLECTED_STICKY =    15,
		KNIFE =               16,
		BACKSTAB =            17,
		FLARE =               18,
		REFLECTED_FLARE =     19,
		KILL_BOX =            20,
		FRAG_BOX =            21,
		PITFALL =             22,
		FINISHED_OFF =        23,
		FINISHED_OFF_GIB =    24,
		BID_FAREWELL =        25,
		GENERATOR_EXPLOSION = 26
	}

	global.damageSourceIcons = ds_list_create();
	global.damageSourceIcons[| DamageSource.NEEDLEGUN]           = NeedleKL;
	global.damageSourceIcons[| DamageSource.RIFLE]               = RifleKL;
	global.damageSourceIcons[| DamageSource.RIFLE_CHARGED]       = RifleChargedKL;
	global.damageSourceIcons[| DamageSource.MINEGUN]             = MineKL;
	global.damageSourceIcons[| DamageSource.MINIGUN]             = MinigunKL;
	global.damageSourceIcons[| DamageSource.FLAMETHROWER]        = FlameKL;
	global.damageSourceIcons[| DamageSource.SCATTERGUN]          = ScatterKL;
	global.damageSourceIcons[| DamageSource.SHOTGUN]             = ShotgunKL;
	global.damageSourceIcons[| DamageSource.ROCKETLAUNCHER]      = RocketKL;
	global.damageSourceIcons[| DamageSource.REVOLVER]            = RevolverKL;
	global.damageSourceIcons[| DamageSource.SENTRYTURRET]        = TurretKL;
	global.damageSourceIcons[| DamageSource.BLADE]               = BladeKL;
	global.damageSourceIcons[| DamageSource.BUBBLE]              = BubbleKL;
	global.damageSourceIcons[| DamageSource.REFLECTED_ROCKET]    = RocketReflectKL;
	global.damageSourceIcons[| DamageSource.REFLECTED_STICKY]    = MineReflectKL;
	global.damageSourceIcons[| DamageSource.KNIFE]               = KnifeKL;
	global.damageSourceIcons[| DamageSource.BACKSTAB]            = BackstabKL;
	global.damageSourceIcons[| DamageSource.FLARE]               = FlareKL;
	global.damageSourceIcons[| DamageSource.REFLECTED_FLARE]     = FlareReflectKL;
	global.damageSourceIcons[| DamageSource.KILL_BOX]            = DeadKL;
	global.damageSourceIcons[| DamageSource.FRAG_BOX]            = DeadKL;
	global.damageSourceIcons[| DamageSource.PITFALL]             = DeadKL;
	global.damageSourceIcons[| DamageSource.FINISHED_OFF]        = DeadKL;
	global.damageSourceIcons[| DamageSource.FINISHED_OFF_GIB]    = DeadKL;
	global.damageSourceIcons[| DamageSource.BID_FAREWELL]        = DeadKL;
	global.damageSourceIcons[| DamageSource.GENERATOR_EXPLOSION] = ExplodeKL;
	
}
