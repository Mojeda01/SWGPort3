region_navmesh = SharedObjectTemplate:new {
	clientTemplateFileName = "",
	planetMapCategory = "",
	planetMapSubCategory = "",
	autoRegisterWithPlanetMap = 1,

	groundZoneComponent = "GroundZoneComponent",
	objectMenuComponent = "ObjectMenuComponent",
	containerComponent = "ContainerComponent",
	gameObjectType = 33554444
}

ObjectTemplates:addTemplate(region_navmesh, "object/region_navmesh.iff")