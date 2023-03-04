if settings.startup["ao-complexity-level"].value ~= "simple" then
  data:extend(
    {
      {
        type = "module",
        name = "thorium-module-2",
        icon = graphics .. "thorium-module-2.png",
        icon_size = 64,
        icon_mipmaps = 4,
        subgroup = "module",
        category = "thorium-module",
        tier = 2,
        order = "d[thorium-module-1]-d[thorium-module-2]",
        stack_size = 50,
        effect =
        {
          productivity = { bonus = 0.05 },
          consumption = { bonus = 0.50 },
          speed = { bonus = 0.20 },
          pollution = { bonus = 0.10 }
        },
        limitation = thorium_module_limitation(),
        limitation_message_key = "thorium-module-usable-only-on-intermediates"
      },
    }
  )
end
