if settings.startup["ao-complexity-level"].value ~= "simple" then
  if mods["space-exploration"] and settings.startup["se-addon"].value == true then
    icon = se_addon_graphics .. "thorium-module-1.png"
    icon_size = 128
  else
    icon = graphics .. "thorium-module-1.png"
    icon_size = 64
  end
  data:extend(
    {
      {
        type = "module",
        name = "thorium-module-1",
        icon = icon,
        icon_size = icon_size,
        icon_mipmaps = 4,
        subgroup = "module",
        category = "thorium-module",
        tier = 1,
        order = "d[productivity-module-3]-d[thorium-module-1]",
        stack_size = 50,
        effect =
        {
          productivity = { bonus = 0.03 },
          consumption = { bonus = 0.40 },
          speed = { bonus = 0.15 },
          pollution = { bonus = 0.05 }
        },
        limitation = thorium_module_limitation(),
        limitation_message_key = "thorium-module-usable-only-on-intermediates"
      },
    }
  )
end
