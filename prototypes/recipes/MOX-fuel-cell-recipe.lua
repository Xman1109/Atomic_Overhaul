data:extend(
    {
        {
        type = "recipe",
        name = "MOX-fuel-cell-recipe",
        icon = "__Atomic_Overhaul__/graphics/icons/MOX-fuel-cell.png",
        icon_size = 64,
        mipmap_count = 4,
        category = "centrifuging",
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