data:extend(
    {
        {
        type = "recipe",
        name = "graphite-recipe",
        icon = "__Atomic_Overhaul__/graphics/icons/graphite.png",
        icon_size = 64, mipmap_count = 4,
        category = "advanced-crafting",
        energy_required = 20,
        enabled = false,
        order = "a",
        subgroup = "resources",
        ingredients =
        {
            {"coal", 10}
        },
        always_show_made_in = true,
        results = 	{
            {"graphite", 3},
            {type="item", name="coal", amount_min = 1, amount_max = 3}
        },
    }
})