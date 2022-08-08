data:extend(
{
    {
        type = "recipe",
        name = "graphite-fuel-reprocessing",
        icon = graphics .. "graphite-reprocessing-recipe.png",
        icon_size = 64,
        icon_mipmaps = 4,
        category = "centrifuging",
        energy_required = 50,
        enabled = false,
        order = "a",
        subgroup = "reprocessing",
        ingredients =
        {
            {"graphite-depleted-cell", 5}
        },
        results = 	{
            {type = "item", name = "graphite", amount_min = 2, amount_max = 3},
            {type="item", name="empty-fuel-cell", amount_min = 0, amount_max = 1}
        },
    }
})