data:extend(
    {
        {
        type = "recipe",
        name = "space-reactor-recipe",
        icon = se_addon_graphics .. "space-reactor.png",
        icon_size = 64, mipmap_count = 4,
        category = "space-manufacturing",
        energy_required = 150,
        enabled = false,
        order = "f[nuclear-energy]-a[reactor]-b[space-reactor]",
        subgroup = "energy",
        ingredients =
        {
            {"se-beryllium-powder", 10},
            {type = "fluid", name = "se-beryllium-hydroxide", amount = 30}
        },
        always_show_made_in = true,
        results = 	{
            {"space-reactor", 1}
        },
    }
})