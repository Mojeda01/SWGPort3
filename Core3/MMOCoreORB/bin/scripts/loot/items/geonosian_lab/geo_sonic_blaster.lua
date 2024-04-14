--Automatically generated by SWGEmu Spawn Tool v0.12 loot editor.

geo_sonic_blaster = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/weapon/ranged/pistol/pistol_geonosian_sonic_blaster_loot.iff",
	craftingValues = {
		{"mindamage",11,100,0},
		{"maxdamage",63,224,0},
		{"attackspeed",5.3,3.4,1},
		{"woundchance",4.2,8.6,1},
		{"roundsused",15,60,0},
		{"hitpoints",750,750,0},
		{"zerorange",0,0,0},
		{"zerorangemod",18,18,0},
		{"midrange",15,15,0},
		{"midrangemod",34,34,0},
		{"maxrange",48,48,0},
		{"maxrangemod",-90,-90,0},
		{"attackhealthcost",20,11,0},
		{"attackactioncost",46,25,0},
		{"attackmindcost",21,11,0},
	},
	customizationStringNames = {},
	customizationValues = {},

	-- randomDotChance: The chance of this weapon object dropping with a random dot on it. Higher number means less chance. Set to 0 to always have a random dot.
	randomDotChance = 625,
	junkDealerTypeNeeded = JUNKARMS,
	junkMinValue = 30,
	junkMaxValue = 55

}

addLootItemTemplate("geo_sonic_blaster", geo_sonic_blaster)