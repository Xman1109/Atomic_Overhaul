data:extend(
{
    {
        type = "recipe",
        name = "holmium-166-reprocessing",
        icon = se_addon_graphics .. "holmium-166-reprocessing-recipe.png",
        icon_size = 64,
        mipmap_count = 4,
        category = "space-radiation",
        energy_required = 50,
        enabled = false,
        order = "zb",
        subgroup = "reprocessing",
        ingredients =
        {
            {"holmium-depleted-cell", 5}
        },
        results = 	{
            {"nuclear-waste", 17},
            {type = "item", name = "se-holmium-powder", amount_min = 0, amount_max = 2},
            {type="item", name="research-data", amount_min = 9, amount_max = 10}
        },
    }
})