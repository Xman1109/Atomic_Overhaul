data:extend(
{
    {
        type = "recipe",
        name = "beryllium-7-without-research-data-recipe",
        icon = se_addon_graphics .. "beryllium-7-without-research-data-recipe.png",
        icon_size = 64,
        mipmap_count = 4,
        category = "space-radiation",
        energy_required = 50,
        enabled = false,
        order = "za",
        subgroup = "reprocessing-without-research-data",
        ingredients =
        {
            {"beryllium-depleted-cell", 5}
        },
        results = 	{
            {"nuclear-waste", 20},
            {type = "item", name = "se-beryllium-powder", amount = 1},
        },
    }
})