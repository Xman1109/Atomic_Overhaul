data:extend(
    {
        {
        type = "recipe",
        name = "MOX-recipe",
        icon = "__Atomic_Overhaul__/graphics/icons/MOX.png",
        icon_size = 64, mipmap_count = 4,
        category = "centrifuging",
        energy_required = 20,
        enabled = false,
        order = "d",
        subgroup = "resources",
        ingredients =
        {
            {"uranium-235", 9},
            {"plutonium", 1}
        },
        always_show_made_in = true,
        results = 	{
            {"MOX", 8},
        },
    }
})