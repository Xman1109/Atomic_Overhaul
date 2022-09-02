data:extend(
    {
        {
        type = "recipe",
        name = "graphite-fuel-cell-recipe",
        icon = graphics .. "graphite-fuel-cell.png",
        icon_size = 64, icon_mipmaps = 4,
        category = "centrifuging",
        crafting_machine_tint = cmt.graphite,
        energy_required = 50,
        enabled = false,
        order = "a",
        subgroup = "fuel-cells",
        ingredients =
        {
            {"empty-fuel-cell", 10},
            {"graphite", 10}
        },
        always_show_made_in = true,
        results = 	{
            {"graphite-fuel-cell", 10},
        },
    }
})