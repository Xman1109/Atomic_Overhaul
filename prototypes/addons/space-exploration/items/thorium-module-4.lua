data:extend(
{
      {
        type = "module",
        name = "thorium-module-4",
        icon = se_addon_graphics .. "thorium-module-4.png",
        icon_size = 128,
        icon_mipmaps = 4,
        subgroup = "module",
        category = "thorium-module",
        tier = 4,
        order = "d[thorium-module-3]-d[thorium-module-4]",
        stack_size = 50,
        effect =
        {
          productivity = { bonus = 0.10 },
          consumption = { bonus = 2.10 },
          speed = { bonus = 0.25 },
          pollution = { bonus = 0.20 }
        },
        limitation = productivity_module_limitation(),
		    limitation_message_key = "production-module-usable-only-on-intermediates"
      },
})
