data:extend(
{
    {
        type = "recipe",
        name = "uranium-fuel-cell",
        icon = "__base__/graphics/icons/uranium-fuel-cell.png",
        icon_size = 64,
        mipmap_count = 4,
        category = "crafting",
        energy_required = 20,
        enabled = false,
        order = "b",
        subgroup = "fuel-cells",
        ingredients =
        {
            {"uranium-235", 1},
            {"graphite", 19},
            {"empty-fuel-cell", 10}
        },
        always_show_made_in = true,
        results = 	{
            {"uranium-fuel-cell", 10}
        },
    }
})