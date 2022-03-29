data:extend(
{
    {
        type = "recipe",
        name = "graphite-fuel-reprocessing",
        icon = graphics .. "graphite-reprocessing-recipe.png",
        icon_size = 64,
        mipmap_count = 4,
        category = "centrifuging",
        energy_required = 50,
        enabled = false,
        order = "a",
        subgroup = "reprocessing",
        ingredients =
        {
            {"graphite-depleted-cell", 1}
        },
        results = 	{
            {"graphite", 3},
            {type="item", name="empty-fuel-cell", amount_min = 0, amount_max = 1}
        },
    }
})