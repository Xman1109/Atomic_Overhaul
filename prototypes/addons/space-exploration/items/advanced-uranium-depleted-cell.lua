data:extend(
    {
        {
            type = "item",
            name = "advanced-uranium-depleted-cell",
            icons =
            {
                {
                    icon = data.raw["item"]["used-up-uranium-fuel-cell"].icon,
                    icon_size = 64,
                    icon_mipmaps = 4,
                },
                zero_g_picture
            },
            pictures =
            {
                layers =
                {
                    {
                        filename = data.raw["item"]["used-up-uranium-fuel-cell"].icon,
                        size = 64,
                        scale = 0.25,
                        mipmap_count = 4,
                    },
                    zero_g_picture
                }
            },
            stack_size = 50,
            group = "atomic-overhaul",
            order = "za",
            subgroup = "used-up-fuel-cells",
        }
    })
