data:extend(
    {
        {
            type = "item",
            name = "isotope-scrap",
            icon = graphics .. "isotope-scrap.png",
            icon_size = 64,
            icon_mipmaps = 4,
            pictures = 
            {
                layers =
                {
                    {
                    filename = graphics .. "isotope-scrap.png",
                    size = 64,
                    scale = 0.25,
                    mipmap_count = 4,
                    },
                    {
                    draw_as_light = true,
                    flags = { "light" },
                    size = 64,
                    filename = graphics .. "isotope-scrap-light.png",
                    scale = 0.25,
                    mipmap_count = 4,
                    }
                }
            },
            subgroup = "intermediate-product",
            order = "f[isotope-scrap]",
            stack_size = 200
        }
    }
)
