data:extend(
    {
        {
            type = "item",
            name = "advanced-MOX-depleted-cell",
            icons =
            {
                {
                    icon = graphics .. "MOX-used-up-fuel-cell.png",
                    icon_size = 64,
                    icon_mipmaps = 4,
                },
                zero_g_icon
            },
            pictures =
            {
                layers =
                {
                    {
                        size = 64,
                        filename = graphics .. "MOX-used-up-fuel-cell1.png",
                        scale = 0.25,
                        mipmap_count = 4
                    },
                    zero_g_picture
                }
            },
            stack_size = 50,
            group = "atomic-overhaul",
            order = "zc",
            subgroup = "used-up-fuel-cells",
        }
    })
