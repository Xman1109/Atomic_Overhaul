data:extend(
{
    {
        type = "recipe",
        name = "plutonium-fuel-reprocessing",
        icon = graphics .. "plutonium-reprocessing.png",
        icon_size = 256,
        mipmap_count = 4,
        category = "centrifuging",
        energy_required = 50,
        enabled = false,
        order = "c",
        subgroup = "reprocessing",
        ingredients =
        {
            {"plutonium-depleted-cell", 5}
        },
        results = 	{
            {"nuclear-waste", 10},
            {type="item", name="plutonium", amount_min = 1, amount_max = 3},
            {type = "item", name = "research-data", amount_min = 4, amount_max = 6}
        },
    }
})