items = "prototypes.items."
fluids = "prototypes.fluids."
recipes = "prototypes.recipes."
techs = "prototypes.technologies."
vanilla = "prototypes.vanilla-changes."
base_graphics = "__base__/graphics/icons/"
compatibility = "prototypes.compatibility."
graphics = "__Atomic_Overhaul__/graphics/icons/"

DEFAULT = {}
DEFAULT.item = {}
DEFAULT.recipe = {}

debug_text = "AO-DEBUG: Compatibilty loaded for: "

local tv = 1

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

function getDefaultOf(type, name)
    if type == "r" then
        type = "recipe"
    elseif type == "i" then
        type = "item"
    else
        log("Unknown type: " .. type)
    end
    if data.raw[type][name] then
        DEFAULT[type][tv] = table.deepcopy(data.raw[type][name])
        if ao_debug == true then
            log("Saved default of:" .. type .. "." .. name .. " at place: " .. tv)
        end
        tv = tv + 1
    else
        if ao_debug == true then
            log("Error: Could not get the default of " .. type .. "." .. name)
        end
    end
end

function loadDefaultOf(type, name)
    if type == "r" then
        type = "recipe"
    elseif type == "i" then
        type = "item"
    else
        log("Unknown type: " .. type)
    end
    --[[if special ~= nil then
        for k, v in pairs(DEFAULT[type]) do
            if DEFAULT[type][k].name == name then
                log(DEFAULT[type][k].name)
                data.raw[type][name] = DEFAULT[type][k]
                if ao_debug == true then
                    log("Loaded default of:" .. type .. "." .. name .. " from place: " .. k)
                end
            else
                log("Error 404: Not found")
            end
        end
    else]]
    for k, v in pairs(DEFAULT[type]) do
        if DEFAULT[type][k].name == name then
            data.raw[type][name] = DEFAULT[type][k]
            if ao_debug == true then
                log("Loaded default of:" .. type .. "." .. name .. " from place: " .. k)
            end
        else
            if ao_debug == true then
                log("Error: Could not find the default of " .. type .. "." .. name)
            end
        end
    end
    -- end
end
