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
            {type="item", name="nuclear-reactor", amount=1},
            {type="item", name="processing-unit", amount=250},
            {type="item", name="se-heat-shielding", amount=100},
            {type="item", name="low-density-structure", amount=75},
            {type="item", name="se-holmium-plate", amount=50},
            {type="item", name="se-iridium-plate", amount=50},
        },
        always_show_made_in = true,
        results = 	{
            {type="item", name="space-reactor", amount=1}
        },
    }
})