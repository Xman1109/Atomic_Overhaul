data:extend(
{
    {
        type = "recipe",
        name = "empty-fuel-cell-recipe",
        icon = "__Atomic_Overhaul__/graphics/icons/empty-fuel-cell.png",
        icon_size = 64,
        mipmap_count = 4,
        category = "crafting",
        energy_required = 20,
        enabled = false,
        order = "a",
        subgroup = "fuel-cells",
        ingredients =
        {
            {"plastic-bar", 10},
            {"iron-plate", 10}
        },
        always_show_made_in = true,
        results = 	{
            {"empty-fuel-cell", 10}
        },
    }
})

ATOMIC