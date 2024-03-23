-- Remote interface. replace "example" with your mod name
remote.add_interface("Atomic_Overhaul", {
    informatron_menu = function(data)
        return example_menu(data.player_index)
    end,
    informatron_page_content = function(data)
        return example_page_content(data.page_name, data.player_index, data.element)
    end,
    -- add milestones to the "Milestones" mod
    milestones_preset_addons = function()
        return {
            ["Atomic_Overhaul"] = {
                required_mods = { "Atomic_Overhaul" },
                milestones = {
                    { type = "group", name = "Science" },
                    { type = "item",  name = "research-data",    quantity = 1 },
                    { type = "group", name = "Resources" },
                    { type = "item",  name = "uranium-235",      quantity = 1 },
                    { type = "item",  name = "plutonium",        quantity = 1 },
                    { type = "item",  name = "MOX",              quantity = 1 },
                    { type = "item",  name = "thorium",          quantity = 1 },
                    { type = "item",  name = "nuclear_reactor",  quantity = 1 },
                    { type = "item",  name = "thorium-module-1", quantity = 1 },
                    { type = "item",  name = "thorium-module-2", quantity = 1 },
                    { type = "item",  name = "thorium-module-3", quantity = 1 },
                }
            }
        }
    end,
    jetpack_fuels = {
                    "plutonium-fuel-cell",
                    "MOX-fuel-cell",
                    "thorium-fuel-cell",
                    "iridium-fuel-cell",
                    "holmium-fuel-cell",
                    "beryllium-fuel-cell",
                }
                -- remote.add_interface("your-mod", {
--   jetpack_fuels = function() return {["slow-fuel"] = 0.5, ["fast-fuel"] = 1.1} end
-- })
})