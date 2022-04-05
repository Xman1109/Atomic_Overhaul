data:extend(
{
    {
        type = "recipe",
        name = "plutonium-fuel-recipe",
        icon = graphics .. "plutonium-fuel.png",
        icon_size = 64,
        mipmap_count = 4,
        category = "centrifuging",
        energy_required = 20,
        enabled = false,
        order = "b",
        subgroup = "fuel",
        ingredients =
        {
            {"plutonium", 1},
            {"rocket-fuel", 1}
        },
        always_show_made_in = true,
        results = 	{
            {"plutonium-fuel", 1}
        },
    }
})