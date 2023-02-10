data:extend(
    {
        {
            type = "item",
            name = "advanced-thorium-depleted-cell",
            icons = {
                {
                    icon = graphics .. "thorium-used-up-fuel-cell.png",
                    icon_size = 64,
                    icon_mipmaps = 4
                },
                zero_g_icon
            },
            pictures =
            {
                layers =
                {
                    {
                        filename = graphics .. "thorium-used-up-fuel-cell.png",
                        size = 64,
                        scale = 0.25,
                        mipmap_count = 4
                    },
                    zero_g_picture
                }
            },
            stack_size = 50,
            group = "atomic-overhaul",
            order = "zd",
            subgroup = "used-up-fuel-cells",
        }
    })
