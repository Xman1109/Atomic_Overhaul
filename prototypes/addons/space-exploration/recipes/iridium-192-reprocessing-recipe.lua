data:extend(
{
    {
        type = "recipe",
        name = "iridium-192-reprocessing",
        icon = se_addon_graphics .. "iridium-192-reprocessing-recipe.png",
        icon_size = 64,
        mipmap_count = 4,
        category = "space-radiation",
        energy_required = 50,
        enabled = false,
        order = "za",
        subgroup = "reprocessing",
        ingredients =
        {
            {"iridium-depleted-cell", 5}
        },
        results = 	{
            {"nuclear-waste", 15},
            {type = "item", name = "se-iridium-powder", amount_min = 0, amount_max = 3},
            {type="item", name="research-data", amount_min = 8, amount_max = 10}
        },
    }
})