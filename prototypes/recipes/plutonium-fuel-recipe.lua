data:extend(
{
    {
        type = "recipe",
        name = "plutonium-fuel-recipe",
        icon = graphics .. "group.png",
        icon_size = 64,
        mipmap_count = 4,
        category = "advanced-crafting",
        energy_required = 20,
        enabled = false,
        order = "b",
        subgroup = "fuel",
        ingredients =
        {
            {"plutonium", 5},
            {"rocket-fuel", 10}
        },
        always_show_made_in = true,
        results = 	{
            {"plutonium-fuel", 3}
        },
    }
})