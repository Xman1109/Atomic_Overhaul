-- if mods["AbandonedRuins"] then
--     table.insert(data.raw["string-setting"]["AbandonedRuins-set"].allowed_values, "Atomic_Overhaul")
--     data.raw["string-setting"]["AbandonedRuins-set"].default_value = "Atomic_Overhaul"
--     if ao_debug then
--         log("Atomic Overhaul: Ruins Mod detected, setting ruins to Atomic Overhaul's ruins.")
--     end
-- end

if not data.raw["bool-setting"]["nuclear-fuel-kovarex-enabled"] then
    data:extend({
        {
            type = "bool-setting",
            name = "ao-kovarex-enabled",
            setting_type = "startup",
            default_value = true,
            order = "i",
            hidden = false
        }
    })
end