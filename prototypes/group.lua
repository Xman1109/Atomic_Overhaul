data:extend(
    {
        {
            type = "item-group",
            name = "atomic-overhaul",
            icon = graphics .. "group.png",
            icon_size = 128,
            icon_mipmaps = 4,
            order = "z"
        },
        {
            type = "item-subgroup",
            name = "resources",
            group = "atomic-overhaul",
            order = "a"
        },
        {
            type = "item-subgroup",
            name = "fuel-rods",
            group = "atomic-overhaul",
            order = "b"
        },
        {
            type = "item-subgroup",
            name = "isotopes",
            group = "atomic-overhaul",
            order = "b-c"
        },
        {
            type = "item-subgroup",
            name = "fuel-cells",
            group = "atomic-overhaul",
            order = "c"
        },
        {
            type = "item-subgroup",
            name = "used-up-fuel-cells",
            group = "atomic-overhaul",
            order = "d"
        },
        {
            type = "item-subgroup",
            name = "reprocessing",
            group = "atomic-overhaul",
            order = "e"
        },
        {
            type = "item-subgroup",
            name = "reprocessing-without-research-data",
            group = "atomic-overhaul",
            order = "f"
        },
        {
            type = "item-subgroup",
            name = "modules",
            group = "atomic-overhaul",
            order = "g"
        },
        {
            type = "item-subgroup",
            name = "fuel",
            group = "atomic-overhaul",
            order = "h"
        },
        {
            type = "item-subgroup",
            name = "waste-reprocessing",
            group = "atomic-overhaul",
            order = "i"
        },
        {
            type = "item-subgroup",
            name = "other-items",
            group = "atomic-overhaul",
            order = "j"
        },
        {
            type = "item-subgroup",
            name = "upgrade-items",
            group = "atomic-overhaul",
            order = "k"
        },
        {
            type = "item-subgroup",
            name = "weaponry",
            group = "atomic-overhaul",
            order = "l"
        },
        {
            type = "item-subgroup",
            name = "cold-fusion",
            group = "atomic-overhaul",
            order = "m"
        },
        {
            type = "module-category",
            name = "thorium-module"
        },
        { type = "module-category", name = "thorium-module" },
        { type = "module-category", name = "thorium-module-1" },
        { type = "module-category", name = "thorium-module-2" },
    })
if settings.startup["ao-complexity-level"].value == "simple" or
    settings.startup["old-graphite-fuel"].value == false then
    data:extend({ {
        type = "recipe-category",
        name = "heat-furnace"
    } })
end

if settings.startup["ao-isotope-update"].value == true then
    data:extend({
        {
            type = "fuel-category",
            name = "cold-fusion"
        }
    })
end
