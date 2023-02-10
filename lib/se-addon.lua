se_addon_graphics = "__Atomic_Overhaul__/graphics/se-addon/icons/"
se_addon_entity_graphics = "__Atomic_Overhaul__/graphics/se-addon/entities/"
se_addon_items = "__Atomic_Overhaul__.prototypes.addons.space-exploration.items."
se_addon_recipes = "__Atomic_Overhaul__.prototypes.addons.space-exploration.recipes."
se_addon_techs = "__Atomic_Overhaul__.prototypes.addons.space-exploration.technologies."
se_addon_entities = "__Atomic_Overhaul__.prototypes.addons.space-exploration.entities."

hit_effects = require("__base__.prototypes.entity.hit-effects")
sounds = require("__base__.prototypes.entity.sounds")

zero_g_picture = {
    filename = se_addon_graphics .. "zero-g.png",
    priority = "extra-high",
    width = 64,
    height = 64,
    scale = 0.25,
    mipmap_count = 4
}

zero_g_icon = {
    icon = se_addon_graphics .. "zero-g.png",
    icon_size = 64,
    icon_mipmaps = 4
}

debug_addon_text = "AO-DEBUG: Add-on loaded for: "


fuel_cell = settings.startup["fuel-cell-ingredient"].value
if fuel_cell == "Advanced Fuel Cell" then
    fuel_cell = "advanced-fuel-cell"
elseif fuel_cell == "Normal Fuel Cell" then
    fuel_cell = "empty-fuel-cell"
else
    if ao_debug then
        log("Atomic Overhaul: [SE Addon] [Fuel Cell] Invalid fuel cell ingredient: " .. fuel_cell)
    end
    fuel_cell = settings.startup["fuel-cell-ingredient"].default_value
end

-- Space Exploration's color palette
cmt.iridium = {
    primary = {
        r = 1.000,
        g = 0.958,
        b = 0.000,
        a = 1.000
    },
    secondary = {
        r = 1.000,
        g = 0.852,
        b = 0.172,
        a = 1.000
    },
    tertiary = {
        r = 0.876,
        g = 0.869,
        b = 0.597,
        a = 1.000
    },
    quaternary = {
        r = 0.969,
        g = 1.000,
        b = 0.019,
        a = 1.000
    },
}
cmt.holmium = {
    primary = {
        a = 1,
        g = 0.338,
        b = 0.482,
        r = 0.965
    },
    quaternary = {
        a = 1,
        g = 0.191,
        b = 0.763,
        r = 0.939
    },
    secondary = {
        a = 1,
        g = 0.222,
        b = 0.560,
        r = 0.831
    },
    tertiary = {
        a = 1,
        g = 0.443,
        b = 0.728,
        r = 0.818,
    }
}
cmt.beryllium = {
    primary = {
        r = 0.338,
        g = 0.965,
        b = 0.482,
        a = 1.000
    },
    quaternary = {
        r = 0.191,
        g = 0.939,
        b = 0.763,
        a = 1.000
    },
    secondary = {
        r = 0.222,
        g = 0.831,
        b = 0.56,
        a = 1.000
    },
    tertiary = {
        r = 0.443,
        g = 0.818,
        b = 0.728,
        a = 1.000
    }
}
