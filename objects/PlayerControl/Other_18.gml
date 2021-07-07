var scoreKeyDown;
scoreKeyDown = keyboard_check_direct(global.showScores);
if(scoreKeyDown and !oldScoreKeyDown)
    inputShowScores();
else if(!scoreKeyDown and oldScoreKeyDown)
    inputCloseScores();
oldScoreKeyDown = scoreKeyDown;


