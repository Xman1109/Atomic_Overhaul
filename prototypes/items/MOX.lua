data:extend(
    {
        {
            type = "item",
            name = "MOX",
            icon = graphics .. "MOX.png",
            pictures =
            {
              layers =
              {
                {
                  size = 64,
                  filename = "__Atomic_Overhaul__/graphics/icons/MOX1.png",
                  scale = 0.25,
                  mipmap_count = 4
                },
                {
                  draw_as_light = true,
                  blend_mode = "additive",
                  size = 64,
                  filename = "__Atomic_Overhaul__/graphics/icons/MOX1.png",
                  scale = 0.25,
                  tint = {r = 0.3, g = 0.3, b = 0.3, a = 0.3},
                  mipmap_count = 4
                }
              }
            },
            icon_size = 64, icon_mipmaps = 4,
            group = "intermediate-products",
            subgroup = "intermediate-product",
            order = "r[MOX-0]",
            stack_size = 100
        }
    })