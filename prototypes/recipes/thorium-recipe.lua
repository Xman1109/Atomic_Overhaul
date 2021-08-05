data:extend(
    {
        {
        type = "recipe",
        name = "thorium-recipe",
        icon = "__Atomic_Overhaul__/graphics/icons/thorium.png",
        icon_size = 64, mipmap_count = 4,
        category = "centrifuging",
        energy_required = 20,
        enabled = false,
        order = "f",
        subgroup = "resources",
        ingredients =
        {
            {"uranium-ore", 15}
        },
        always_show_made_in = true,
        results = 	{
            {"uranium-238", 3},
            {type="item", name="uranium-235", amount_min = 1, amount_max = 2},
            {type="item", name="thorium", amount_min = 0, amount_max = 3}
        },
    }
})