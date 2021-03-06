data:extend(
{
    {
        type = "recipe",
        name = "thorium-without-research-data",
        icon = graphics .. "thorium-without-research-recipe.png",
        icon_size = 64,
        mipmap_count = 4,
        category = "centrifuging",
        energy_required = 50,
        enabled = false,
        order = "e",
        subgroup = "reprocessing-without-research-data",
        ingredients =
        {
            {"thorium-depleted-cell", 5}
        },
        results = 	{
            {"nuclear-waste", 15},
            {type="item", name="thorium", amount_min = 2, amount_max = 3},
        },
    }
})