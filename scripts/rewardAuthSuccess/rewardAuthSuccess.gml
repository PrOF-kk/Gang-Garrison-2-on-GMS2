function rewardAuthSuccess(argument0, argument1) {
	var player, rewardString, rewardArray, i, rewardValue;
	player = argument0;
	rewardString = argument1;
        
	sendEventUpdateRewards(player, rewardString);
	doEventUpdateRewards(player, rewardString);



}
