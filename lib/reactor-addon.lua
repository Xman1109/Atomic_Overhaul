entities = "prototypes.entities."
entity_graphics = "__Atomic_Overhaul__/graphics/entities/"


--#reactors#
local heated_pipes_tint = {0.5, 0.4, 0.3, 0.5}
local heat_glow_tint = {1, 1, 1, 1}

apply_heat_pipe_glow = function(layer)
    layer.tint = heated_pipes_tint
    if layer.hr_version then
        layer.hr_version.tint = heated_pipes_tint
    end
    local light_layer = util.copy(layer)
    light_layer.draw_as_light = true
    light_layer.tint = heat_glow_tint
    if light_layer.hr_version then
        light_layer.hr_version.draw_as_light = true
        light_layer.hr_version.tint = heat_glow_tint
    end
    return {
        layers = {layer, light_layer}
    }
end


--#heat-exchangers#
pipecoverspictures = function()
    return {
        north = {
            layers = {{
                filename = "__base__/graphics/entity/pipe-covers/pipe-cover-north.png",
                priority = "extra-high",
                width = 64,
                height = 64,
                hr_version = {
                    filename = "__base__/graphics/entity/pipe-covers/hr-pipe-cover-north.png",
                    priority = "extra-high",
                    width = 128,
                    height = 128,
                    scale = 0.5
                }
            }, {
                filename = "__base__/graphics/entity/pipe-covers/pipe-cover-north-shadow.png",
                priority = "extra-high",
                width = 64,
                height = 64,
                draw_as_shadow = true,
                hr_version = {
                    filename = "__base__/graphics/entity/pipe-covers/hr-pipe-cover-north-shadow.png",
                    priority = "extra-high",
                    width = 128,
                    height = 128,
                    scale = 0.5,
                    draw_as_shadow = true
                }
            }}
        },
        east = {
            layers = {{
                filename = "__base__/graphics/entity/pipe-covers/pipe-cover-east.png",
                priority = "extra-high",
                width = 64,
                height = 64,
                hr_version = {
                    filename = "__base__/graphics/entity/pipe-covers/hr-pipe-cover-east.png",
                    priority = "extra-high",
                    width = 128,
                    height = 128,
                    scale = 0.5
                }
            }, {
                filename = "__base__/graphics/entity/pipe-covers/pipe-cover-east-shadow.png",
                priority = "extra-high",
                width = 64,
                height = 64,
                draw_as_shadow = true,
                hr_version = {
                    filename = "__base__/graphics/entity/pipe-covers/hr-pipe-cover-east-shadow.png",
                    priority = "extra-high",
                    width = 128,
                    height = 128,
                    scale = 0.5,
                    draw_as_shadow = true
                }
            }}
        },
        south = {
            layers = {{
                filename = "__base__/graphics/entity/pipe-covers/pipe-cover-south.png",
                priority = "extra-high",
                width = 64,
                height = 64,
                hr_version = {
                    filename = "__base__/graphics/entity/pipe-covers/hr-pipe-cover-south.png",
                    priority = "extra-high",
                    width = 128,
                    height = 128,
                    scale = 0.5
                }
            }, {
                filename = "__base__/graphics/entity/pipe-covers/pipe-cover-south-shadow.png",
                priority = "extra-high",
                width = 64,
                height = 64,
                draw_as_shadow = true,
                hr_version = {
                    filename = "__base__/graphics/entity/pipe-covers/hr-pipe-cover-south-shadow.png",
                    priority = "extra-high",
                    width = 128,
                    height = 128,
                    scale = 0.5,
                    draw_as_shadow = true
                }
            }}
        },
        west = {
            layers = {{
                filename = "__base__/graphics/entity/pipe-covers/pipe-cover-west.png",
                priority = "extra-high",
                width = 64,
                height = 64,
                hr_version = {
                    filename = "__base__/graphics/entity/pipe-covers/hr-pipe-cover-west.png",
                    priority = "extra-high",
                    width = 128,
                    height = 128,
                    scale = 0.5
                }
            }, {
                filename = "__base__/graphics/entity/pipe-covers/pipe-cover-west-shadow.png",
                priority = "extra-high",
                width = 64,
                height = 64,
                draw_as_shadow = true,
                hr_version = {
                    filename = "__base__/graphics/entity/pipe-covers/hr-pipe-cover-west-shadow.png",
                    priority = "extra-high",
                    width = 128,
                    height = 128,
                    scale = 0.5,
                    draw_as_shadow = true
                }
            }}
        }
    }
end
function make_4way_animation_from_spritesheet(animation)
    local function make_animation_layer(idx, anim)
        local start_frame = (anim.frame_count or 1) * idx
        local x = 0
        local y = 0
        if anim.line_length then
            y = anim.height * math.floor(start_frame / (anim.line_length or 1))
        else
            x = idx * anim.width
        end
        return {
            filename = anim.filename,
            priority = anim.priority or "high",
            flags = anim.flags,
            x = x,
            y = y,
            width = anim.width,
            height = anim.height,
            frame_count = anim.frame_count or 1,
            line_length = anim.line_length,
            repeat_count = anim.repeat_count,
            shift = anim.shift,
            draw_as_shadow = anim.draw_as_shadow,
            force_hr_shadow = anim.force_hr_shadow,
            apply_runtime_tint = anim.apply_runtime_tint,
            animation_speed = anim.animation_speed,
            scale = anim.scale or 1,
            tint = anim.tint,
            blend_mode = anim.blend_mode
        }
    end

    local function make_animation_layer_with_hr_version(idx, anim)
        local anim_parameters = make_animation_layer(idx, anim)
        if anim.hr_version and anim.hr_version.filename then
            anim_parameters.hr_version = make_animation_layer(idx, anim.hr_version)
        end
        return anim_parameters
    end

    local function make_animation(idx)
        if animation.layers then
            local tab = {
                layers = {}
            }
            for k, v in ipairs(animation.layers) do
                table.insert(tab.layers, make_animation_layer_with_hr_version(idx, v))
            end
            return tab
        else
            return make_animation_layer_with_hr_version(idx, animation)
        end
    end

    return {
        north = make_animation(0),
        east = make_animation(1),
        south = make_animation(2),
        west = make_animation(3)
    }
end
