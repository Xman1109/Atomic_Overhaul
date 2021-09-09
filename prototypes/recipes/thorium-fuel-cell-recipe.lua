data:extend(
    {
        {
        type = "recipe",
        name = "thorium-fuel-cell-recipe",
        icon = graphics .. "thorium-fuel-cell.png",
        icon_size = 64, mipmap_count = 4,
        category = "centrifuging",
        energy_required = 50,
        enabled = false,
        order = "f",
        subgroup = "fuel-cells",
        ingredients =
        {
            {"thorium", 10},
            {"empty-fuel-cell", 10},
            {"graphite", 1}
        },
        always_show_made_in = true,
        results = 	{
            {"thorium-fuel-cell", 10},
        },
    }
})