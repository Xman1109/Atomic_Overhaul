data:extend(
    {
        {
            type = "item",
            name = "advanced-plutonium-depleted-cell",
            icons =
            {
                {
                    icon = graphics .. "plutonium-used-up-fuel-cell.png",
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
                        filename = graphics .. "plutonium-used-up-fuel-cell.png",
                        size = 64,
                        scale = 0.25,
                        mipmap_count = 4,
                    },
                    zero_g_picture
                }
            },
            stack_size = 50,
            group = "atomic-overhaul",
            order = "zb",
            subgroup = "advanced-depleted-cells",
        }
    })
