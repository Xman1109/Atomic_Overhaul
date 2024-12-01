data:extend({
    {
        type = "item",
        name = "X17-particle",
        icon = graphics .. "X17-container.png",
        icon_size = 64,
        icon_mipmaps = 4,
        pictures = {
            layers =
            {
                {
                    filename = graphics .. "X17-container.png",
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
        group = "atomic-overhaul",
        subgroup = "isotopes",
        order = "c",
        stack_size = 100
    }
})
