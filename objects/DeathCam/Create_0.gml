cursor_sprite = -1;
alarm[0] = 60 / global.delta_factor;
alarm[2] = max(1, min(150/global.delta_factor, global.myself.alarm[5]));

zoom=1;
zooming=false;
killmessage = "";
DeathCamS=-1
hp=0;
maxHp=0;
if instance_exists(NoticeO) with NoticeO instance_destroy();
if instance_exists(Balancer) with Balancer instance_destroy();

