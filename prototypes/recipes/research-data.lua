data:extend(
    {
        {
        type = "recipe",
        name = "research-data-recipe",
        icon = graphics .. "research-data.png",
        icon_size = 64, mipmap_count = 4,
        category = "centrifuging",
        energy_required = 30,
        enabled = false,
        order = "z",
        subgroup = "resources",
        localized_name = "research-data",
        always_show_made_in = true,
        ingredients =
        {
            {"uranium-235", 1},
            {"copper-plate", 2},
            {"plastic-bar", 5}
        },
        results = 	{
            {type = "item", name = "research-data", amount_min = 3, amount_max = 5},
        },
    }
})