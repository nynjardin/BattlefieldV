resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'

--resource_type 'gametype' { name = 'Hot Putsuit' }

description 'Gamemode by Nynjardin.'

files{
	'vehicles.meta',
	'handling.meta',
	'weaponrusarmy.meta',
	'army.meta'
}

data_file 'PED_METADATA_FILE' 'army.meta'
data_file 'HANDLING_FILE' 'handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'vehicles.meta'
data_file 'VEHICLE_WEAPON_FILE' 'weaponrusarmy.meta'

client_script 'bf_cl.lua'
server_script 'bf_srv.lua'