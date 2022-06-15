if mods["bobrevamp"] then
    if mods["BigBags"] then
        data.raw["item"]["plutonium-fuel"].stack_size = data.raw["item"]["nuclear-fuel"].stack_size
        if ao_debug == true then
            log(debug_text .. "bobrevamp")
        end
    end
    if ao_debug == true then
        log(debug_text .. "bobrevamp")
    end
end