data:extend(
{
    {
        type = "recipe",
        name = "plutonium-fuel-cell-recipe",
        icon = "__Atomic_Overhaul__/graphics/icons/plutonium-fuel-cell.png",
        icon_size = 64,
        mipmap_count = 4,
        category = "centrifuging",
        energy_required = 50,
        enabled = false,
        order = "c",
        subgroup = "fuel-cells",
        ingredients =
        {
            {"empty-fuel-cell", 10},
            {"graphite", 1},
            {"plutonium", 19}
        },
        always_show_made_in = true,
        results = 	{
            {"plutonium-fuel-cell", 10}
        },
    }
})