data:extend(
{
    {
        type = "recipe",
        name = "holmium-166-without-research-data-recipe",
        icon = se_addon_graphics .. "holmium-166-without-research-data-recipe.png",
        icon_size = 64,
        icon_mipmaps = 4,
        category = "space-radiation",
        energy_required = 50,
        enabled = false,
        order = "za",
        subgroup = "reprocessing-without-research-data",
        ingredients =
        {
            {"holmium-depleted-cell", 5}
        },
        results = 	{
            {"nuclear-waste", 17},
            {type = "item", name = "se-holmium-powder", amount_min = 1, amount_max = 2}
        },
    }
})