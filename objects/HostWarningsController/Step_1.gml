// clear facade-link text
for(i = 0; i < 4; i += 1)
    item_name[i] = "";

n = 0;

var classlimittotal;
classlimittotal = 0;
for(i = 0; i < 10; i += 1)
    classlimittotal += global.classlimits[i];

if(classlimittotal < floor(global.playerLimit/2))
{
    item_name[n] = "Warning: Player limit exceeds classlimits.#"
                  +"         Classlimits may not work properly.#"
    n += 1;
}


items = n;


