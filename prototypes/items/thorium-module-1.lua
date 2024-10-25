if settings.startup["ao-complexity-level"].value ~= "simple" then
  if mods["space-exploration"] and settings.startup["se-addon"].value == true then
    icon = se_addon_graphics .. "thorium-module-1.png"
    icon_size = 128
    effect = {
      productivity = 0.04,
      consumption = 1.00,
      speed = 0.10,
      pollution = 0.08
    }
  else
    icon = graphics .. "thorium-module-1.png"
    icon_size = 64
    effect = {
      productivity = 0.03,
      consumption = 0.40,
      speed = 0.15,
      pollution = 0.05
    }
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
        effect = effect,
        limitation = thorium_module_limitation(),
        limitation_message_key = "thorium-module-usable-only-on-intermediates"
      },
    }
  )
end
