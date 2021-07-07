function hasReward(argument0, argument1) {
	// real hasReward(real player, string rewardName)
	// Returns true if this Player has the specific non-class-specific reward

	var player, rewardName;
	player = argument0;
	rewardName = argument1;

	return ds_map_exists(player.rewards, rewardName);



}
