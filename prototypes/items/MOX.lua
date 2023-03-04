if settings.startup["ao-complexity-level"].value ~= "simple" then
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
              filename = graphics .. "MOX1.png",
              scale = 0.25,
              mipmap_count = 4
            },
            {
              draw_as_light = true,
              flags = { "light" },
              size = 64,
              filename = graphics .. "resource-light.png",
              scale = 0.25,
              mipmap_count = 4
            }
          }
        },
        icon_size = 64,
        icon_mipmaps = 4,
        group = "atomic-overhaul",
        order = "e",
        subgroup = "resources",
        stack_size = 100
      }
    })
end
