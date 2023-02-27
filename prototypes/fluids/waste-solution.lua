if settings.startup["complexity-level"].value == "simple" then -- it's useless garbage isotopes we can only store somewhere forever
  data:extend({ {
    type = "fluid",
    name = "radioactive-waste-solution",
    group = "atomic_overhaul",
    subgroup = "waste-reprocessing",
    default_temperature = 15,
    base_color = { r = 168, g = 118, b = 0 },
    flow_color = { r = 0.7, g = 0.7, b = 0.7 },
    icon = graphics .. "waste-solution.png",
    icon_size = 64,
    icon_mipmaps = 4,
    order = "z"
  } })
else  -- it's not garbage, but contains all isotopes we love so much. It's an important part of reprocessing cycle
  data:extend({ {
    type = "fluid",
    name = "waste-solution",
    default_temperature = 15,
    base_color = { r = 168, g = 118, b = 0 },
    flow_color = { r = 0.7, g = 0.7, b = 0.7 },
    icon = graphics .. "waste-solution.png",
    icon_size = 64,
    icon_mipmaps = 4,
    order = "z"
  } })
end