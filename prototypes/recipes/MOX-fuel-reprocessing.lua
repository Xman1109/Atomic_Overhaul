data:extend(
{
    {
        type = "recipe",
        name = "MOX-reprocessing",
        icon = graphics .. "MOX-reprocessing-recipe.png",
        icon_size = 64,
        icon_mipmaps = 4,
        category = "centrifuging",
        energy_required = 50,
        enabled = false,
        order = "d",
        subgroup = "reprocessing",
        ingredients =
        {
            {"MOX-depleted-cell", 5}
        },
        results = 	{
            {"nuclear-waste", 13},
            {type="item", name="MOX", amount_min = 1, amount_max = 3},
            {type = "item", name = "research-data", amount_min = 7, amount_max = 10}
        },
    }
})