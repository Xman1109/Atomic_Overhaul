script.on_init(function() --I will make this more compact in the future
    if remote.interfaces["kr-radioactivity"] then
        remote.call("kr-radioactivity", "add_item", "plutonium-fuel-cell")
        remote.call("kr-radioactivity", "add_item", "plutonium")
        remote.call("kr-radioactivity", "add_item", "plutonium-fuel")
        remote.call("kr-radioactivity", "add_item", "plutonium-depleted-cell")
        remote.call("kr-radioactivity", "add_item", "MOX-fuel-cell")
        remote.call("kr-radioactivity", "add_item", "MOX")
        remote.call("kr-radioactivity", "add_item", "MOX-depleted-cell")
        remote.call("kr-radioactivity", "add_item", "thorium-fuel-cell")
        remote.call("kr-radioactivity", "add_item", "thorium")
        remote.call("kr-radioactivity", "add_item", "thorium-depleted-cell")
        if settings.startup["se-addon"].value == true and game.active_mods["space-exploration"] then
            remote.call("kr-radioactivity", "add_item", "iridium-fuel-cell")
            remote.call("kr-radioactivity", "add_item", "iridium-192")
            remote.call("kr-radioactivity", "add_item", "iridium-depleted-cell")
            remote.call("kr-radioactivity", "add_item", "holmium-fuel-cell")
            remote.call("kr-radioactivity", "add_item", "holmium-166")
            remote.call("kr-radioactivity", "add_item", "holmium-depleted-cell")
            remote.call("kr-radioactivity", "add_item", "beryllium-fuel-cell")
            remote.call("kr-radioactivity", "add_item", "beryllium-7")
            remote.call("kr-radioactivity", "add_item", "beryllium-depleted-cell")
        end
    end
end)
script.on_configuration_changed(function()
    if remote.interfaces["kr-radioactivity"] then
        remote.call("kr-radioactivity", "add_item", "plutonium-fuel-cell")
        remote.call("kr-radioactivity", "add_item", "plutonium")
        remote.call("kr-radioactivity", "add_item", "plutonium-fuel")
        remote.call("kr-radioactivity", "add_item", "plutonium-depleted-cell")
        remote.call("kr-radioactivity", "add_item", "MOX-fuel-cell")
        remote.call("kr-radioactivity", "add_item", "MOX")
        remote.call("kr-radioactivity", "add_item", "MOX-depleted-cell")
        remote.call("kr-radioactivity", "add_item", "thorium-fuel-cell")
        remote.call("kr-radioactivity", "add_item", "thorium")
        remote.call("kr-radioactivity", "add_item", "thorium-depleted-cell")
        if settings.startup["se-addon"].value == true and game.active_mods["space-exploration"] then
            remote.call("kr-radioactivity", "add_item", "iridium-fuel-cell")
            remote.call("kr-radioactivity", "add_item", "iridium-192")
            remote.call("kr-radioactivity", "add_item", "iridium-depleted-cell")
            remote.call("kr-radioactivity", "add_item", "holmium-fuel-cell")
            remote.call("kr-radioactivity", "add_item", "holmium-166")
            remote.call("kr-radioactivity", "add_item", "holmium-depleted-cell")
            remote.call("kr-radioactivity", "add_item", "beryllium-fuel-cell")
            remote.call("kr-radioactivity", "add_item", "beryllium-7")
            remote.call("kr-radioactivity", "add_item", "beryllium-depleted-cell")
        end
    end
end)

-- checking if the mod is loaded on a used savegame for the first time
script.on_init(function()
    game.print(
        "\nNOTE: If Atomic Overhaul has been added to an already existing savegame, you may need to troubleshoot your nuclear processing.\n")
end)

script.on_configuration_changed(function()
    game.print(
        "\nAtomic Overhaul now features a new way of creating Graphite.\nIf you dont like it, you can disable it in the mod settings.\n")
end)

-- this script replaces the nuclear fuel reprocessing recipe with a custom one
if k2_se then
    script.on_init(
        function()
            for index, force in pairs(game.forces) do
                local technologies = force.technologies
                local recipe = force.recipes
                if technologies["nuclear-fuel-reprocessing"].researched then
                    recipe["ao-nuclear-fuel-reprocessing"].enabled = true
                end
            end
        end)
end

if bobplates then
    script.on_init(
        function()
            for index, force in pairs(game.forces) do
                local technologies = force.technologies
                local recipe = force.recipes
                if recipe["empty-nuclear-fuel-reprocessing"].enabled then
                    technologies["ao-graphite-processing"].enabled = true
                end
            end
        end)
end

if bzcarbon then
    script.on_init(
        function()
            for index, force in pairs(game.forces) do
                local technologies = force.technologies
                if technologies["ao-graphite-processing"].researched then
                    technologies["graphite-processing"].researched = true
                end
            end
        end)
end


-- example code from informatron

-- Remote interface. replace "example" with your mod name
remote.add_interface("Atomic_Overhaul", {
    informatron_menu = function(data)
        return example_menu(data.player_index)
    end,
    informatron_page_content = function(data)
        return example_page_content(data.page_name, data.player_index, data.element)
    end
})

function example_menu(player_index)
    return {
        AO_materials = 1,
        SE_materials = 1
    }
end

function example_page_content(page_name, player_index, element)
    -- main page
    if page_name == "Atomic_Overhaul" then
        element.add {
            type = "button",
            name = "ao_header",
            style = "header"
        }
        element.add {
            type = "label",
            name = "text_1",
            caption = { "Atomic_Overhaul.page_Atomic_Overhaul_text_1" }
        }
    end

    if page_name == "AO_materials" then
        element.add {
            type = "label",
            name = "text_1",
            caption = { "Atomic_Overhaul.page_AO_materials_text_1" }
        }
        element.add {
            type = "button",
            name = "graphite",
            style = "graphite",
        }
        element.add {
            type = "label",
            name = "text_2",
            caption = { "Atomic_Overhaul.page_AO_materials_text_2" }
        }
        element.add {
            type = "button",
            name = "uranium",
            style = "uranium",
        }
        element.add {
            type = "label",
            name = "text_3",
            caption = { "Atomic_Overhaul.page_AO_materials_text_3" }
        }
        element.add {
            type = "button",
            name = "plutonium",
            style = "plutonium",
        }
        element.add {
            type = "label",
            name = "text_4",
            caption = { "Atomic_Overhaul.page_AO_materials_text_4" }
        }
        element.add {
            type = "button",
            name = "MOX",
            style = "MOX",
        }
        element.add {
            type = "label",
            name = "text_5",
            caption = { "Atomic_Overhaul.page_AO_materials_text_5" }
        }
        element.add {
            type = "button",
            name = "thorium",
            style = "thorium",
        }
        element.add {
            type = "label",
            name = "text_6",
            caption = { "Atomic_Overhaul.page_AO_materials_text_6" }
        }
    end

    if page_name == "SE_materials" then
        element.add {
            type = "label",
            name = "text_1",
            caption = { "Atomic_Overhaul.page_SE_materials_text_1" }
        }
        element.add {
            type = "button",
            name = "Space_Reactor",
            style = "Space_Reactor",
        }
        element.add {
            type = "label",
            name = "text_2",
            caption = { "Atomic_Overhaul.page_SE_materials_text_2" }
        }
        element.add {
            type = "button",
            name = "Iridium",
            style = "iridium",
        }
        element.add {
            type = "label",
            name = "text_3",
            caption = { "Atomic_Overhaul.page_SE_materials_text_3" }
        }
        element.add {
            type = "button",
            name = "Holmium",
            style = "holmium",
        }
        element.add {
            type = "label",
            name = "text_4",
            caption = { "Atomic_Overhaul.page_SE_materials_text_4" }
        }
        element.add {
            type = "button",
            name = "Beryllium",
            style = "beryllium",
        }
        element.add {
            type = "label",
            name = "text_5",
            caption = { "Atomic_Overhaul.page_SE_materials_text_5" }
        }
        element.add {
            type = "button",
            name = "glow_1",
            style = "glow_1",
        }
    end

end

-- local k2 = require("scripts.krastorio2")
-- local informatron = require("scripts.informatron")
-- if ruins then
--     local ruins = require("scripts.ruins-mod")
-- end
