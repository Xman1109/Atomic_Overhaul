data:extend(
{
    {
        type = "recipe",
        name = "plutonium-fuel-reprocessing",
        icon = graphics .. "group.png",
        icon_size = 64,
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
        },
    }
})