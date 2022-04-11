data:extend(
{
    {
        type = "recipe",
        name = "plutonium-without-research-data",
        icon = graphics .. "plutonium-without-research-recipe.png",
        icon_size = 64,
        mipmap_count = 4,
        category = "centrifuging",
        energy_required = 50,
        enabled = false,
        order = "c",
        subgroup = "reprocessing-without-research-data",
        ingredients =
        {
            {"plutonium-depleted-cell", 5}
        },
        results = 	{
            {"nuclear-waste", 10},
            {type="item", name="plutonium", amount_min = 2, amount_max = 4}
        },
    }
})