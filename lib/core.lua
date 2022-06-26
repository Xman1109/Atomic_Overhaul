items = "prototypes.items."
fluids = "prototypes.fluids."
recipes = "prototypes.recipes."
techs = "prototypes.technologies."
vanilla = "prototypes.vanilla-changes."
base_graphics = "__base__/graphics/icons/"
compatibility = "prototypes.compatibility."
graphics = "__Atomic_Overhaul__/graphics/icons/"

debug_text = "AO-DEBUG: Compatibilty loaded for: "
data:extend({{
    type = "module-category",
    name = "thorium-module"

}})

function thorium_module_limitation()
    return {"uranium-processing", "nuclear-fuel-reprocessing", "uranium-without-research-data",
            "plutonium-fuel-reprocessing", "plutonium-without-research-data", "MOX-recipe", "MOX-reprocessing",
            "MOX-without-research-data", "thorium-recipe", "thorium-fuel-reprocessing"}
end

function resourceGlow(item)
    local scale
    if data.raw["item"][item].icon_size == 32 then
        scale = 0.5
    elseif data.raw["item"][item].icon_size == 64 then
        scale = 0.25
    end
    data.raw["item"][item].pictures = {
        layers = {{
            size = data.raw["item"][item].icon_size,
            filename = data.raw["item"][item].icon,
            scale = scale,
            mipmap_count = data.raw["item"][item].mipmap_count
        }, {
            draw_as_light = true,
            flags = {"light"},
            size = 64,
            filename = graphics .. "resource-light.png",
            scale = 0.25,
            mipmap_count = 4
        }}
    }
end
