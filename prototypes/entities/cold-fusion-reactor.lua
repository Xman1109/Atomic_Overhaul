--Totally WIP, if I get permission to use the graphics from Hurricane046, then this will be a thing.

local boiler_pictures = {
  structure = {
    layers = {
      {
        filename = entity_graphics .. "fusion-reactor-hr-animation.png",
        priority = "extra-high",
        width = 400,
        height = 400,
        -- frame_count = 60,
        -- line_length = 8,
        shift = util.by_pixel(0, 0),
        scale = 0.5
      },
      {
        filename = entity_graphics .. "fusion-reactor-hr-shadow.png",
        priority = "extra-high",
        width = 700,
        height = 600,
        shift = util.by_pixel(25, 15),
        draw_as_shadow = true,
        scale = 0.5
      }
    }
  },
  fire = {
    filename = entity_graphics .. "fusion-reactor-hr-animation-emission.png",
    draw_as_glow = true,
    priority = "extra-high",
    frame_count = 60,
    line_length = 8,
    width = 400,
    height = 400,
    animation_speed = 0.5,
    shift = util.by_pixel(0, 0),
    scale = 0.5,
    blend_mode = "additive"
  },
  fire_glow = {
    filename = entity_graphics .. "fusion-reactor-hr-animation-emission.png",
    draw_as_glow = true,
    priority = "extra-high",
    width = 400,
    height = 400,
    shift = util.by_pixel(0, 0),
    blend_mode = "additive",
    scale = 0.5,
  }
}
data:extend({
  {
    type = "boiler",
    name = "cold-fusion-reactor",
    icon = "__base__/graphics/icons/boiler.png",
    flags = { "placeable-neutral", "player-creation" },
    minable = { mining_time = 0.2, result = "boiler" },
    max_health = 500,
    corpse = "boiler-remnants",
    dying_explosion = data.raw["reactor"]["nuclear-reactor"].dying_explosion,
    impact_category = "metal-large",
    mode = "output-to-separate-pipe",
    resistances = {
      { type = "fire",      percent = 90 },
      { type = "explosion", percent = 30 },
      { type = "impact",    percent = 30 }
    },
    collision_box = { { -2.9, -2.9 }, { 2.9, 2.9 } },
    selection_box = { { -2.9, -2.9 }, { 2.9, 2.9 } },
    damaged_trigger_effect = data.raw["reactor"]["nuclear-reactor"].damaged_trigger_effect,
    target_temperature = 80,

    fluid_box = {
      volume = 400,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        { flow_direction = "input-output", direction = defines.direction.west, position = { -2.5, -0.5 } },
        { flow_direction = "input-output", direction = defines.direction.east, position = { 2.5, -0.5 } },
      },
      production_type = "input",
      filter = "xenon"
    },
    output_fluid_box =
    {
      volume = 200,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        { flow_direction = "input-output", direction = defines.direction.east, position = { 2.5, 0.5 } },
        { flow_direction = "input-output", direction = defines.direction.west, position = { -2.5, 0.5 } }
      },
      production_type = "output",
      filter = "water",
    },
    energy_consumption = "5MW",
    energy_source = {
      type = "burner",
      fuel_categories = { "cold-fusion" },
      effectivity = 1,
      fuel_inventory_size = 1,
      emissions_per_minute = { pollution = 10 },
      light_flicker = { color = { 0, 0, 0 }, minimum_intensity = 0.8, maximum_intensity = 1.0 }
    },

    working_sound = data.raw["reactor"]["nuclear-reactor"].working_sound,
    open_sound = data.raw["reactor"]["nuclear-reactor"].open_sound,
    close_sound = data.raw["reactor"]["nuclear-reactor"].close_sound,

    pictures = {
      north = boiler_pictures,
      east = boiler_pictures,
      south = boiler_pictures,
      west = boiler_pictures
    },

    fire_flicker_enabled = true,
    fire_glow_flicker_enabled = true,
    burning_cooldown = 20,
    water_reflection = boiler_reflection(),

    -- Prevents rotation
    allowed_effects = nil,
    rotatable = false
  }



--   { -- Not used because it doesnt support a glow animation
--     type = "fusion-reactor",
--     name = "cold-fusion-reactor",
--     minable = {mining_time = 0.2, result = "boiler"},
--     max_health = 1000,
--     impact_category = "metal",
--     corpse = data.raw["reactor"]["nuclear-reactor"].corpse,
--     dying_explosion = data.raw["reactor"]["nuclear-reactor"].dying_explosion,
--     resistances = {
--         { type = "fire", percent = 70 }
--     },
--     collision_box = {{-3, -3}, {3, 3}},
--     selection_box = {{-3, -3}, {3, 3}},
--     damaged_trigger_effect = data.raw["reactor"]["nuclear-reactor"].damaged_trigger_effect,
--     two_direction_only = true,

--     neighbour_connectable = nil,

--     energy_source = {
--         type = "electric",
--         usage_priority = "primary-input",
--     },
--     power_input = "10MW",
--     max_fluid_usage = 4/second,

--     burner = {
--         type = "burner",
--         fuel_categories = {"cold-fusion"},
--         effectivity = 1,
--         fuel_inventory_size = 1,
--         emissions_per_minute = { pollution = 0 },
--         light_flicker = {
--             color = {1, 0, 0.7},
--             minimum_intensity = 0.0,
--             maximum_intensity = 0.1
--         }
--     },

--     input_fluid_box = {
--         production_type = "input",
--         volume = 1000,
--         filter = "xenon",
--         pipe_connections = {
--             {flow_direction = "input-output", position = {-2.5, -1.5}, direction = defines.direction.west },
--             {flow_direction = "input-output", position = { 2.5, -1.5}, direction = defines.direction.east },
--             {flow_direction = "input-output", position = {-2.5,  1.5}, direction = defines.direction.west },
--             {flow_direction = "input-output", position = { 2.5,  1.5}, direction = defines.direction.east }
--         }
--     },

--     output_fluid_box = {
--         production_type = "output",
--         volume = 1000,
--         filter = "water",
--         pipe_connections = {
--             {flow_direction = "output", position = {-1.5, -2.5}, direction = defines.direction.south },
--             {flow_direction = "output", position = { 1.5, -2.5}, direction = defines.direction.north },
--             {flow_direction = "output", position = {-1.5,  2.5}, direction = defines.direction.south },
--             {flow_direction = "output", position = { 1.5,  2.5}, direction = defines.direction.north }
--         }
--     },

--     graphics_set =
--   {
--     use_fuel_glow_color = false,
--     default_fuel_glow_color = {1,0,0.4,1},
--     -- fusion_effect_uv_map =
--     -- {
--     --   filename = "__space-age__/graphics/entity/fusion-reactor/plasma-UV.png",
--     --   width = 384,
--     --   height = 384,
--     --   shift = {0,0},
--     --   dice_x = 2,
--     --   dice_y = 5,
--     --   priority = "extra-high",
--     --   scale = 0.5
--     -- },
--     structure =
--     {
--       layers =
--       {
--         {
--           filename = entity_graphics .. "fusion-reactor-hr-animation.png",
--           priority = "extra-high",
--           width = 400,
--           height = 400,
--           frame_count = 60,
--           line_length = 8,
--           shift = util.by_pixel(0, 0),
--           scale = 0.5
--         },
--         {
--           filename = entity_graphics .. "fusion-reactor-hr-shadow.png",
--           priority = "extra-high",
--           width = 700,
--           height = 600,
--           shift = util.by_pixel(25, 15),
--           draw_as_shadow = true,
--           scale = 0.5
--         },
--         -- util.sprite_load(entity_graphics .. "fusion-reactor-hr-animation.png",
--         -- {
--         --   priority = "high",
--         --   scale = 0.5,
--         --   frame_count = 60,
--         --   line_length = 8
--         -- }),
--         -- util.sprite_load(entity_graphics .. "fusion-reactor-hr-shadow.png",
--         -- {
--         --   priority = "high",
--         --   draw_as_shadow = true,
--         --   scale = 0.5
--         -- }),
--       }
--     },
--     working_light_pictures =
--     {
--       layers =
--       {
--         {
--           filename = entity_graphics .. "fusion-reactor-hr-animation-emission.png",
--           priority = "extra-high",
--           blend_mode = "additive",
--           draw_as_glow = true,
--           width = 400,
--           height = 400,
--           scale = 0.5,
--           frame_count = 60,
--           line_length = 8,
--           animation_speed = 0.5,
--         }
--         -- util.sprite_load(entity_graphics .. "fusion-reactor-hr-animation-emission.png",
--         -- {
--         --   priority = "high",
--         --   blend_mode = "additive",
--         --   draw_as_glow = true,
--         --   scale = 0.5,
--         --   frame_count = 60,
--         --   line_length = 8
--         -- }),
--       }
--     },
--     connections_graphics = nil,
--     -- {
--     --   reactor_connection_pictures(1, { -1.5, -3 }),
--     --   reactor_connection_pictures(2, {  1.5, -3 }),
--     --   reactor_connection_pictures(3, {  2.5, -2.5 }),
--     --   reactor_connection_pictures(4, {  2.5,  0.5 }),
--     --   reactor_connection_pictures(5, {  1.5,  2 }),
--     --   reactor_connection_pictures(6, { -1.5,  2 }),
--     --   reactor_connection_pictures(7, { -2.5,  0.5 }),
--     --   reactor_connection_pictures(8, { -2.5, -2   })
--     -- },
--     direction_to_connections_graphics =
--     {
--       north = { 1, 2, 3, 4, 5, 6, 7, 8 },
--       east = { 3, 4, 5, 6, 7, 8, 1, 2 }
--     },
--     plasma_category = "fusion-reactor-plasma"
--   },

--     working_sound = data.raw["reactor"]["nuclear-reactor"].working_sound,

--     perceived_performance = {
--         minimum = 0.25,
--         performance_to_activity_rate = 2.0
--     },

--     vehicle_impact_sound = data.raw["reactor"]["nuclear-reactor"].vehicle_impact_sound,
--     open_sound = data.raw["reactor"]["nuclear-reactor"].open_sound,
--     close_sound = data.raw["reactor"]["nuclear-reactor"].close_sound,

--     -- Prevents rotation
--     allowed_effects = nil,
--     rotatable = false
-- }
})

--[[
{ For reference
    type = "fusion-reactor",
    name = "fusion-reactor",
    factoriopedia_description = {"factoriopedia-description.fusion-reactor"},
    icon = "__space-age__/graphics/icons/fusion-reactor.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "fusion-reactor"},
    max_health = 1000,
    impact_category = "metal",
    corpse = "fusion-reactor-remnants",
    dying_explosion = "fusion-reactor-explosion",
    -- alert_icon_shift = util.by_pixel(0, -12),
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    collision_box = {{-2.9, -2.9}, {2.9, 2.9}},
    selection_box = {{-3, -3}, {3, 3}},
    damaged_trigger_effect = hit_effects.entity(),
    fast_replaceable_group = "fusion-reactor",
    neighbour_connectable =
    {
      connections =
      {
        { location = { position = { -1.5, -3   }, direction = defines.direction.north }, category = "fusion-reactor-plasma",  neighbour_category = {"fusion-reactor-plasma", "fusion-reactor-coolant"} },
        { location = { position = {  1.5, -3   }, direction = defines.direction.north }, category = "fusion-reactor-plasma",  neighbour_category = {"fusion-reactor-plasma", "fusion-reactor-coolant"} },
        { location = { position = {  3,   -1.5 }, direction = defines.direction.east  }, category = "fusion-reactor-coolant", neighbour_category = {"fusion-reactor-plasma", "fusion-reactor-coolant"} },
        { location = { position = {  3,    1.5 }, direction = defines.direction.east  }, category = "fusion-reactor-coolant", neighbour_category = {"fusion-reactor-plasma", "fusion-reactor-coolant"} },
        { location = { position = {  1.5,  3   }, direction = defines.direction.south }, category = "fusion-reactor-plasma",  neighbour_category = {"fusion-reactor-plasma", "fusion-reactor-coolant"} },
        { location = { position = { -1.5,  3   }, direction = defines.direction.south }, category = "fusion-reactor-plasma",  neighbour_category = {"fusion-reactor-plasma", "fusion-reactor-coolant"} },
        { location = { position = { -3,    1.5 }, direction = defines.direction.west  }, category = "fusion-reactor-coolant", neighbour_category = {"fusion-reactor-plasma", "fusion-reactor-coolant"} },
        { location = { position = { -3,   -1.5 }, direction = defines.direction.west  }, category = "fusion-reactor-coolant", neighbour_category = {"fusion-reactor-plasma", "fusion-reactor-coolant"} },
      }
    },

    two_direction_only = true,
    graphics_set = require ("__space-age__.prototypes.entity.fusion-system-pictures").reactor_graphics_set,
    working_sound =
    {
      sound = {filename = "__space-age__/sound/entity/fusion/fusion-reactor.ogg", volume = 0.6, modifiers = volume_multiplier("main-menu", 1.44)},
      use_doppler_shift = false,
      match_volume_to_activity = true,
      max_sounds_per_type = 3,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    perceived_performance = { minimum = 0.25, performance_to_activity_rate = 2.0 },

    vehicle_impact_sound = sounds.generic_impact,
    open_sound = sounds.metal_large_open,
    close_sound = sounds.metal_large_close,

    energy_source =
    {
      type = "electric",
      usage_priority = "primary-input",
    },
    power_input = "10MW", -- at normal quality
    max_fluid_usage = 4/second, -- at normal quality

    burner =
    {
      type = "burner",
      fuel_categories = {"fusion"},
      effectivity = 1,
      fuel_inventory_size = 1,
      emissions_per_minute = { pollution = 0 },
      light_flicker =
      {
        color = {1,0,0.7},
        minimum_intensity = 0.0,
        maximum_intensity = 0.1,
      }
    },
    input_fluid_box =
    {
      production_type = "input",
      volume = 1000,
      filter = "fluoroketone-cold",
      pipe_connections =
      {
        { flow_direction = "input-output", direction = defines.direction.west, position = {-2.5, -1.5} },
        { flow_direction = "input-output", direction = defines.direction.west, position = {-2.5,  1.5} },
        { flow_direction = "input-output", direction = defines.direction.east, position = { 2.5, -1.5} },
        { flow_direction = "input-output", direction = defines.direction.east, position = { 2.5,  1.5} },
      },
    },
    output_fluid_box =
    {
      production_type = "output",
      volume = 10,
      filter = "fusion-plasma",
      pipe_connections =
      {
        { flow_direction = "input-output", direction = defines.direction.south, position = {-1.5,  2.5}, connection_category = {"fusion-plasma"} },
        { flow_direction = "input-output", direction = defines.direction.south, position = { 1.5,  2.5}, connection_category = {"fusion-plasma"} },
        { flow_direction = "input-output", direction = defines.direction.north, position = {-1.5, -2.5}, connection_category = {"fusion-plasma"} },
        { flow_direction = "input-output", direction = defines.direction.north, position = { 1.5, -2.5}, connection_category = {"fusion-plasma"} },
      }
    }
  }
]]
