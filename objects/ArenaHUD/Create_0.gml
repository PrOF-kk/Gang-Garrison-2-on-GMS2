/*
The Arena game mode consists of multiple rounds. Each round starts with a fixed-time setup period where
players can spawn and change their team and class. This is followed by the round proper, which is won
by the first team to either eliminate the enemy team or gain control of the ArenaCP, which unlocks a
fixed time into the round proper.
When a winner is decided, there is a fixed-time round end period where the current score is shown and
where humiliation for the losing team is in effect (if any of them survive).
If not enough players are present (at least one on each team), the game mode goes into a waitingForPlayers
state after roundEnd, which transitions to roundSetup once enough players are present again.
An Arena map can end in one of two ways: Either by one team winning $caplimit rounds, or by the map timer
running down to 0. In either case the map end is only induced after a roundEnd, so a running round will always
be allowed to finish. However, if the timer runs out in the "waitingForPlayers" state, the map ends immediately.
        
Notes:
SetupGates do not unlock after the setup period, they unlock together with the CP. For this reason,
Arena maps don't use setup gates around the spawn area.
*/

ARENA_STATE_WAITING = 0;
ARENA_STATE_ROUND_SETUP = 1;
ARENA_STATE_ROUND_PROPER = 2;
ARENA_STATE_ROUND_END = 3;

timeLimit = global.timeLimitMins*30*60;
timer = timeLimit;
winners = TEAM_SPECTATOR;
redWins = 0;
blueWins = 0;
endCount = 0;
roundStart = 0;
cpUnlock = 1800;
overtime = 0;
redteamCharacters = 0;
blueteamCharacters = 0;
state = ARENA_STATE_WAITING;


/* */
/*  */
