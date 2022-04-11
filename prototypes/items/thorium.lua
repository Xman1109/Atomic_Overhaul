data:extend(
    {
        {
            type = "item",
            name = "thorium",
            icon = graphics .. "thorium.png",
            pictures =
            {
              layers =
              {
                {
                  size = 64,
                  filename = "__Atomic_Overhaul__/graphics/icons/thorium.png",
                  scale = 0.25,
                  mipmap_count = 4
                },
                {
                  draw_as_light = true,
                  flags = {"light"},
                  size = 64,
                  filename = "__Atomic_Overhaul__/graphics/icons/resource-light.png",
                  scale = 0.25,
                  mipmap_count = 4
                }
              }
            },
            icon_size = 64, icon_mipmaps = 4,
            group = "intermediate-products",
            subgroup = "intermediate-product",
            order = "r[thorium-0]",
            stack_size = 100
        }
    })