data:extend(
    {
        {
        type = "recipe",
        name = "MOX-fuel-cell-recipe",
        icon = graphics .. "MOX-fuel-cell.png",
        icon_size = 64,
        icon_mipmaps = 4,
        category = "centrifuging",
        crafting_machine_tint = cmt.MOX,
        energy_required = 50,
        enabled = false,
        order = "d",
        subgroup = "fuel-cells",
        ingredients =
        {
            {"MOX", 10},
            {"empty-fuel-cell", 10},
            {"graphite", 1}
        },
        always_show_made_in = true,
        results = 	{
            {"MOX-fuel-cell", 10},
        },
    }
})