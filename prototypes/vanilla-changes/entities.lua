data.raw["reactor"]["nuclear-reactor"].use_fuel_glow_color = true
data.raw["reactor"]["nuclear-reactor"].default_fuel_glow_color = { 0, 1, 0, 1 }
data.raw["reactor"]["nuclear-reactor"].working_light_picture =
{
    filename = "__Atomic_Overhaul__/graphics/se-addon/entities/reactor-lights-color.png",
    blend_mode = "additive",
    draw_as_glow = true,
    width = 160,
    height = 160,
    shift = { -0.03125, -0.1875 },
    hr_version =
    {
        filename = "__Atomic_Overhaul__/graphics/se-addon/entities/hr-reactor-lights-color.png",
        blend_mode = "additive",
        draw_as_glow = true,
        width = 320,
        height = 320,
        scale = 0.5,
        shift = { -0.03125, -0.1875 },
    }
}
