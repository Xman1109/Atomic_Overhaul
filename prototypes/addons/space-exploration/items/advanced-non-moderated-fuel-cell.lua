data:extend({
    {
        type = "item",
        name = "advanced-non-moderated-fuel-cell",
        icon = graphics .. "non-moderated-fuel-cell.png",
        icon_size = 64, icon_mipmaps = 4,
        pictures =
        {
            layers =
            {
                {
                    size = 64,
                    filename = graphics .. "non-moderated-fuel-cell.png",
                    scale = 0.25,
                    mipmap_count = 4
                },
                {
                    draw_as_light = true,
                    flags = { "light" },
                    size = 64,
                    filename = base_graphics .. "uranium-fuel-cell-light.png",
                    scale = 0.25,
                    mipmap_count = 4
                }
            }
        },
        group = "atomic-overhaul",
        order = "za",
        subgroup = "fuel-cells",
        fuel_category = "space-nuclear-fuel",
        burnt_result = "non-moderated-depleted-cell",
        fuel_glow_color = { 0, 1, 0 },
        fuel_value = "1.5GJ",
        stack_size = 50
    }
})
