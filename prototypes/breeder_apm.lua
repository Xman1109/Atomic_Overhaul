local breeder_graphics = "__Atomic_Overhaul__/graphics/breeder/"
local breeder_sound = "__Atomic_Overhaul__/sound/breeder_working.ogg"
require('util')

-- Code of this particular mod entity Copyright (C) 2019 Bjoern Trimborn (alias Amator Phasma)
-- GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or any later version.

function breed.APM_breeder_reactor()
    local breeder_reactor = table.deepcopy(data.raw.reactor['nuclear-reactor'])
    breeder_reactor.type = 'reactor'
    breeder_reactor.name = 'apm_nuclear_breeder'
    breeder_reactor.icons = {
        { icon = breeder_graphics .. "apm_nuclear_breeder.png", icon_size = 64 }
    }

    breeder_reactor.flags = { "placeable-neutral", "placeable-player", "player-creation" }
    breeder_reactor.minable = { mining_time = 2, result = "apm_nuclear_breeder" }

    breeder_reactor.working_sound = {}
    breeder_reactor.working_sound.sound = {}
    breeder_reactor.working_sound.sound.filename = breeder_sound
    breeder_reactor.working_sound.sound.volume = 0.6
    breeder_reactor.working_sound.apparent_volume = 1.5

    breeder_reactor.consumption = "5MW"
    breeder_reactor.neighbour_bonus = 0.2
    breeder_reactor.energy_source = {}
    breeder_reactor.energy_source.type = "burner"
    breeder_reactor.energy_source.fuel_category = "nuclear-breeder"
    breeder_reactor.energy_source.effectivity = 1
    breeder_reactor.energy_source.fuel_inventory_size = 1
    breeder_reactor.energy_source.burnt_inventory_size = 1

    breeder_reactor.collision_box = { { -2.2, -2.2 }, { 2.2, 2.2 } }
    breeder_reactor.selection_box = { { -2.5, -2.5 }, { 2.5, 2.5 } }

    breeder_reactor.lower_layer_picture = {}
    breeder_reactor.lower_layer_picture.filename = breeder_graphics .. "reactor/breeder_reactor_pipes.png"
    breeder_reactor.lower_layer_picture.width = 156
    breeder_reactor.lower_layer_picture.height = 156
    breeder_reactor.lower_layer_picture.shift = util.by_pixel(-2, -4)
    breeder_reactor.lower_layer_picture.hr_version = {}
    breeder_reactor.lower_layer_picture.hr_version.filename =
        breeder_graphics .. "reactor/hr_breeder_reactor_pipes.png"
    breeder_reactor.lower_layer_picture.hr_version.width = 320
    breeder_reactor.lower_layer_picture.hr_version.height = 316
    breeder_reactor.lower_layer_picture.hr_version.scale = 0.5
    breeder_reactor.lower_layer_picture.hr_version.shift = util.by_pixel(-1, -5)

    breeder_reactor.heat_lower_layer_picture = {}
    breeder_reactor.heat_lower_layer_picture.filename =
        breeder_graphics .. "reactor/breeder_reactor_pipes_hot.png"
    breeder_reactor.heat_lower_layer_picture.width = 156
    breeder_reactor.heat_lower_layer_picture.height = 156
    breeder_reactor.heat_lower_layer_picture.shift = util.by_pixel(-3, -4)
    breeder_reactor.heat_lower_layer_picture.hr_version = {}
    breeder_reactor.heat_lower_layer_picture.hr_version.filename =
        breeder_graphics .. "reactor/hr_breeder_reactor_pipes_hot.png"
    breeder_reactor.heat_lower_layer_picture.hr_version.width = 320
    breeder_reactor.heat_lower_layer_picture.hr_version.height = 316
    breeder_reactor.heat_lower_layer_picture.hr_version.scale = 0.5
    breeder_reactor.heat_lower_layer_picture.hr_version.shift = util.by_pixel(-0.5, -4.5)

    breeder_reactor.picture = {}
    breeder_reactor.picture.layers = {}
    breeder_reactor.picture.layers[1] = {}
    breeder_reactor.picture.layers[1].filename =
        breeder_graphics .. "reactor/breeder_reactor.png"
    breeder_reactor.picture.layers[1].width = 240
    breeder_reactor.picture.layers[1].height = 170
    breeder_reactor.picture.layers[1].shift = { 1.375, 0 }
    breeder_reactor.picture.layers[1].hr_version = {}
    breeder_reactor.picture.layers[1].hr_version.filename =
        breeder_graphics .. "reactor/hr_breeder_reactor.png"
    breeder_reactor.picture.layers[1].hr_version.width = 480
    breeder_reactor.picture.layers[1].hr_version.height = 340
    breeder_reactor.picture.layers[1].hr_version.scale = 0.5
    breeder_reactor.picture.layers[1].hr_version.shift = { 1.375, 0 }
    breeder_reactor.picture.layers[2] = {}
    breeder_reactor.picture.layers[2].filename =
        breeder_graphics .. "reactor/breeder_reactor_shadow.png"
    breeder_reactor.picture.layers[2].width = 240
    breeder_reactor.picture.layers[2].height = 170
    breeder_reactor.picture.layers[2].shift = { 1.375, 0 }
    breeder_reactor.picture.layers[2].draw_as_shadow = true
    breeder_reactor.picture.layers[2].hr_version = {}
    breeder_reactor.picture.layers[2].hr_version.filename =
        breeder_graphics .. "reactor/hr_breeder_reactor_shadow.png"
    breeder_reactor.picture.layers[2].hr_version.width = 480
    breeder_reactor.picture.layers[2].hr_version.height = 340
    breeder_reactor.picture.layers[2].hr_version.scale = 0.5
    breeder_reactor.picture.layers[2].hr_version.shift = { 1.375, 0 }
    breeder_reactor.picture.layers[2].hr_version.draw_as_shadow = true

    breeder_reactor.working_light_picture = {}
    breeder_reactor.working_light_picture.filename =
        breeder_graphics .. "reactor/breeder_reactor_glow.png"
    breeder_reactor.working_light_picture.width = 240
    breeder_reactor.working_light_picture.height = 170
    breeder_reactor.working_light_picture.shift = { 1.375, 0 }
    breeder_reactor.working_light_picture.blend_mode = "additive"
    breeder_reactor.working_light_picture.hr_version = {}
    breeder_reactor.working_light_picture.hr_version.filename =
        breeder_graphics .. "reactor/hr_breeder_reactor_glow.png"
    breeder_reactor.working_light_picture.hr_version.width = 480
    breeder_reactor.working_light_picture.hr_version.height = 340
    breeder_reactor.working_light_picture.hr_version.scale = 0.5
    breeder_reactor.working_light_picture.hr_version.shift = { 1.375, 0 }
    breeder_reactor.working_light_picture.hr_version.blend_mode = "additive"

    --breeder_reactor.light = {intensity = 0.6, size = 9.9, shift = {0.0, 0.0}, color = {r = 1.0, g = 0.5, b = 0.0}}
    breeder_reactor.use_fuel_glow_color = true                                               -- should use glow color from fuel item prototype as light color and tint for working_light_picture
    breeder_reactor.default_fuel_glow_color = { r = 1.000, g = 0.500, b = 0.000, a = 0.500 } --color used as working_light_picture tint for fuels that don't have glow color defined

    breeder_reactor.heat_buffer = {}
    breeder_reactor.heat_buffer.max_temperature = 900
    breeder_reactor.heat_buffer.specific_heat = "4MJ"
    breeder_reactor.heat_buffer.max_transfer = "7GW"
    breeder_reactor.heat_buffer.minimum_glow_temperature = 350
    breeder_reactor.heat_buffer.glow_alpha_modifier = 0.6
    breeder_reactor.heat_buffer.connections = {}
    breeder_reactor.heat_buffer.connections[1] = {}
    breeder_reactor.heat_buffer.connections[1].position = { -2, -2 }
    breeder_reactor.heat_buffer.connections[1].direction = defines.direction.north
    breeder_reactor.heat_buffer.connections[2] = {}
    breeder_reactor.heat_buffer.connections[2].position = { 0, -2 }
    breeder_reactor.heat_buffer.connections[2].direction = defines.direction.north
    breeder_reactor.heat_buffer.connections[3] = {}
    breeder_reactor.heat_buffer.connections[3].position = { 2, -2 }
    breeder_reactor.heat_buffer.connections[3].direction = defines.direction.north
    breeder_reactor.heat_buffer.connections[4] = {}
    breeder_reactor.heat_buffer.connections[4].position = { 2, -2 }
    breeder_reactor.heat_buffer.connections[4].direction = defines.direction.east
    breeder_reactor.heat_buffer.connections[5] = {}
    breeder_reactor.heat_buffer.connections[5].position = { 2, 0 }
    breeder_reactor.heat_buffer.connections[5].direction = defines.direction.east
    breeder_reactor.heat_buffer.connections[6] = {}
    breeder_reactor.heat_buffer.connections[6].position = { 2, 2 }
    breeder_reactor.heat_buffer.connections[6].direction = defines.direction.east
    breeder_reactor.heat_buffer.connections[7] = {}
    breeder_reactor.heat_buffer.connections[7].position = { 2, 2 }
    breeder_reactor.heat_buffer.connections[7].direction = defines.direction.south
    breeder_reactor.heat_buffer.connections[8] = {}
    breeder_reactor.heat_buffer.connections[8].position = { 0, 2 }
    breeder_reactor.heat_buffer.connections[8].direction = defines.direction.south
    breeder_reactor.heat_buffer.connections[9] = {}
    breeder_reactor.heat_buffer.connections[9].position = { -2, 2 }
    breeder_reactor.heat_buffer.connections[9].direction = defines.direction.south
    breeder_reactor.heat_buffer.connections[10] = {}
    breeder_reactor.heat_buffer.connections[10].position = { -2, 2 }
    breeder_reactor.heat_buffer.connections[10].direction = defines.direction.west
    breeder_reactor.heat_buffer.connections[11] = {}
    breeder_reactor.heat_buffer.connections[11].position = { -2, 0 }
    breeder_reactor.heat_buffer.connections[11].direction = defines.direction.west
    breeder_reactor.heat_buffer.connections[12] = {}
    breeder_reactor.heat_buffer.connections[12].position = { -2, -2 }
    breeder_reactor.heat_buffer.connections[12].direction = defines.direction.west
    data:extend({ breeder_reactor })
end
