ao_debug = settings.startup["ao-debug"].value
log("Atomic_Overhaul-Debug = " .. tostring(ao_debug))

require(compatibility .. "other-small-mods")
if mods["bobplates"] then
    require(compatibility .. "bobplates")
    bobplates = true
    if ao_debug == true then
        log(debug_text .. "bobplates")
    end
end
if mods["Clowns-Nuclear"] then
    if mods["Clowns-AngelBob-Nuclear"] then
        require(compatibility .. "madclown-angelbob")
        if ao_debug == true then
            log(debug_text .. "Clowns-AngelBob-Nuclear")
        end
    else
        require(compatibility .. "clowns-nuclear")
        if ao_debug == true then
            log(debug_text .. "Clowns-Nuclear")
        end
    end
end
if mods["Nuclear Fuel"] then
    require(compatibility .. "nuclear-fuel")
    if ao_debug == true then
        log(debug_text .. "Nuclear Fuel")
    end
end
if mods["angelspetrochem"] then
    require(compatibility .. "angels-petrochem")
    if ao_debug == true then
        log(debug_text .. "angelspetrochem")
    end
end
if mods["Krastorio2"] then
    if mods["space-exploration"] then
        require(compatibility .. "k2-se")
        k2_se = true
        if ao_debug == true then
            log(debug_text .. "Krastorio2+Space Exploration")
        end
    else
        require(compatibility .. "krastorio2")
        if ao_debug == true then
            log(debug_text .. "Krastorio2")
        end
    end
end--[[
if mods["space-exploration"] then
    require(compatibility .. "space-exploration")
    if ao_debug == true then
        log(debug_text .. "space-exploration")
    end
end]]


