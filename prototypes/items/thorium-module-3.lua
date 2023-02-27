if settings.startup["complexity-level"].value ~= "simple" then
  data:extend(
    {
      {
        type = "module",
        name = "thorium-module-3",
        icon = graphics .. "thorium-module-3.png",
        icon_size = 64,
        icon_mipmaps = 4,
        subgroup = "module",
        category = "thorium-module",
        tier = 3,
        order = "d[thorium-module-2]-d[thorium-module-3]",
        stack_size = 50,
        effect =
        {
          productivity = { bonus = 0.10 },
          consumption = { bonus = 0.60 },
          speed = { bonus = 0.35 },
          pollution = { bonus = 0.15 }
        },
        limitation = thorium_module_limitation(),
        limitation_message_key = "thorium-module-usable-only-on-intermediates"
      },
    }
  )
end
