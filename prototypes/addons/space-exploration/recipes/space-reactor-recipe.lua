data:extend(
    {
        {
        type = "recipe",
        name = "space-reactor-recipe",
        icon = se_addon_graphics .. "space-reactor.png",
        icon_size = 64, icon_mipmaps = 4,
        category = "space-manufacturing",
        energy_required = 150,
        enabled = false,
        order = "f[nuclear-energy]-a[reactor]-b[space-reactor]",
        subgroup = "energy",
        ingredients =
        {
            {"nuclear-reactor", 1},
            {"processing-unit", 250},
            {"se-heat-shielding", 100},
            {"low-density-structure", 75},
            {"se-holmium-plate", 50},
            {"se-iridium-plate", 50},
        },
        always_show_made_in = true,
        results = 	{
            {"space-reactor", 1}
        },
    }
})