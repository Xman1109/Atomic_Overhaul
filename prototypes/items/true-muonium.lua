data:extend({
    {
        type = "item",
        name = "true-muonium",
        icon = graphics .. "true-muonium-container.png",
        icon_size = 64,
        icon_mipmaps = 4,
        pictures = {
            layers =
            {
                {
                    filename = graphics .. "true-muonium-container.png",
                    size = 64,
                    mipmap_count = 4,
                    scale = 0.5
                },
                {
                    filename = graphics .. "isotope-light.png",
                    size = 64,
                    mipmap_count = 4,
                    scale = 0.5,
                    draw_as_light = true,
                    flags = { "light" }
                }
            }
        },
		fuel_category = "cold-fusion",
		fuel_glow_color = { 0, 0, 200, 1 },
		fuel_value = "20GJ",
        group = "atomic-overhaul",
        subgroup = "isotopes",
        order = "b",
        stack_size = 100
    }
})
