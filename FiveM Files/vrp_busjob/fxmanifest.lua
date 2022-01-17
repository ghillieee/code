fx_version 'cerulean'
games { 'gta5' }

author "jud"

dependencies {
    'vrp'
}

client_scripts {
    "cl_*.lua"
}

server_scripts {
    "@vrp/lib/utils.lua",
    "sv_*.lua"
}