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
                    scale = 0.25
                },
                {
                    filename = graphics .. "isotope-light.png",
                    size = 64,
                    mipmap_count = 4,
                    scale = 0.25,
                    draw_as_light = true,
                    flags = { "light" }
                }
            }
        },
        group = "atomic-overhaul",
        subgroup = "isotopes",
        order = "b",
        stack_size = 100
    }
})