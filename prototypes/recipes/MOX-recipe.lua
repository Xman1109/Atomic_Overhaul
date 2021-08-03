data:extend(
    {
        {
        type = "recipe",
        name = "MOX-recipe",
        icon = "__Atomic_Overhaul__/graphics/icons/MOX.png",
        icon_size = 64,
        category = "advanced-crafting",
        energy_required = 20,
        enabled = false,
        order = "z",
        subgroup = "resources",
        ingredients =
        {
            {"uranium", 9},
            {"plutonium", 9}
        },
        always_show_made_in = true,
        results = 	{
            {"MOX", 8},
        },
    }
})