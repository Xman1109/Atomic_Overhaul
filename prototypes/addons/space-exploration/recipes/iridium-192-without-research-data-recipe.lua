data:extend(
{
    {
        type = "recipe",
        name = "iridium-192-without-research-data-recipe",
        icon = se_addon_graphics .. "iridium-192-without-research-data-recipe.png",
        icon_size = 64,
        mipmap_count = 4,
        category = "space-radiation",
        energy_required = 50,
        enabled = false,
        order = "za",
        subgroup = "reprocessing-without-research-data",
        ingredients =
        {
            {"iridium-depleted-cell", 5}
        },
        results = 	{
            {"nuclear-waste", 15},
            {type = "item", name = "se-iridium-powder", amount_min = 1, amount_max = 3}
        },
    }
})