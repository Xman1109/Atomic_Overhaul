remote.add_interface("Atomic_Overhaul", {
    milestones_presets = function()
        return {
            ["Atomic_Overhaul"] = {
                required_mods = { "Atomic_Overhaul" },
                milestones = {
                    { type = "group", name = "Science" },
                    { type = "item",  name = "research-data",    quantity = 1 },
                    { type = "group", name = "Progress" },
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
    end
})
