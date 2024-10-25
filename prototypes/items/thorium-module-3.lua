if settings.startup["ao-complexity-level"].value ~= "simple" then
  if mods["space-exploration"] and settings.startup["se-addon"].value == true then
    icon = se_addon_graphics .. "thorium-module-3.png"
    icon_size = 128
    effect = {
      productivity = 0.08,
      consumption = 1.60,
      speed = 0.20,
      pollution = 0.16
    }
  else
    icon = graphics .. "thorium-module-3.png"
    icon_size = 64
    effect = {
      productivity = 0.10,
      consumption = 0.60,
      speed = 0.35,
      pollution = 0.15
    }
  end
  data:extend(
    {
      {
        type = "module",
        name = "thorium-module-3",
        icon = icon,
        icon_size = icon_size,
        icon_mipmaps = 4,
        subgroup = "module",
        category = "thorium-module",
        tier = 3,
        order = "d[thorium-module-2]-d[thorium-module-3]",
        stack_size = 50,
        effect = effect,
        limitation = thorium_module_limitation(),
        limitation_message_key = "thorium-module-usable-only-on-intermediates"
      },
    }
  )
end
