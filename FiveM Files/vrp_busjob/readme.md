# vrp_busjob

A drag and drop configurable bus job for dunko_vrp framework

# How to configure
* First the bus, to change the bus simply change the ``"bus"`` to the spawncode of the car you want to use. (cl_busjob.lua)
* Second the stops, to change the bus stops (drops) you want to get the coords of the place you want to use and put the X,Y,Z in ``local drop1 = vector3(COORDS HERE)`` and then find the number of drop you are changing and change the coords in here ``SetNewWaypoint(COORDS HERE)`` to only the X,Y coords if you use Z it may break. (cl_busjob.lua)

# Notes
* This script was originally made by jud#0001 but I just edited it to work as a bus job. His server > [discord.gg/rebeldm](https://discord.gg/rebeldm)
* If you would like to join my discord server you can [here](https://discord.com/StSa3jDMT9)

# Images
[![N|Solid](https://media.discordapp.net/attachments/803662178338734083/932572340829687829/unknown.png?width=841&height=473)]()
[![N|Solid](https://media.discordapp.net/attachments/803662178338734083/932572612696100894/unknown.png?width=841&height=473)]()
