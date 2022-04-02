---@diagnostic disable: undefined-global
data:extend(
{
    {
    type = "module",
    name = "thorium-module",
    icon = graphics .. "group.png",
    icon_size = 32,
    subgroup = "module",
    category = "productivity",
    tier = 1,
    order = "a",
    stack_size = 50,
    effect =
    {
      productivity = {bonus = 0.00},
      consumption = {bonus = 0.01},
      speed = {bonus = 0.01}
    },
    limitation = productivity_module_limitation(),
    limitation_message_key = "production-module-usable-only-on-intermediates"
  },
  }
  )