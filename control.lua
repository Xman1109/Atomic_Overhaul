-- checking if the mod is loaded on a used savegame for the first time
function checkSave()
    game.print(
        "\nINFO: If Atomic Overhaul has been added to a used save, you may need to troubleshoot your nuclear processing.\n")
end
script.on_init(checkSave)

-- this script replaces the nuclear fuel reprocessing recipe with a custom one
if k2_se then
    function replace_nfr()
        for index, force in pairs(game.forces) do
            local technologies = force.technologies
            local recipe = force.recipes
            if technologies["nuclear-fuel-reprocessing"].researched then
                recipe["ao-nuclear-fuel-reprocessing"].enabled = true
            end
        end
    end
end
script.on_init(replace_nfr)

if bobplates then
    function unlock_tech()
        for index, force in pairs(game.forces) do
            local technologies = force.technologies
            local recipe = force.recipes
            if recipe["empty-nuclear-fuel-reprocessing"].enabled then
                technologies["graphite-processing"].enabled = true
            end
        end
    end
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
        dog = 1,
        bird = {
            penguin = 1,
            corvid = {
                crow = 1,
                raven = 1,
                jay = 1
            }
        }
    }
end

function example_page_content(page_name, player_index, element)
    -- main page
    if page_name == "Atomic_Overhaul" then
        element.add {
            type = "label",
            name = "text_1",
            caption = {"Atomic_Overhaul.page_Atomic_Overhaul_text_1"}
        }
        element.add {
            type = "button",
            name = "ao_header",
            style = images .. "header"
        }

    end

    if page_name == "AO_materials" then
        element.add {
            type = "label",
            name = "text_1",
            caption = {"Atomic_Overhaul.page_AO_materials_text_1"}
        }
    end

    if page_name == "dog" then
        element.add {
            type = "label",
            name = "text_1",
            caption = {"example.page_dog_text_1"}
        }
    end

    if page_name == "bird" then
        element.add {
            type = "label",
            name = "text_1",
            caption = {"example.page_bird_text_1"}
        }
    end

    if page_name == "penguin" then
        element.add {
            type = "label",
            name = "text_1",
            caption = {"example.page_penguin_text_1"}
        }
        local image_container = element.add {
            type = "frame",
            name = "image_1",
            style = "informatron_image_container",
            direction = "vertical"
        }
        image_container.add {
            type = "button",
            name = "image_1",
            style = "example_image_1"
        } -- defined in data.lua. MUST be a completely unique style name
    end

    if page_name == "corvid" or page_name == "crow" or page_name == "raven" or page_name == "jay" then
        element.add {
            type = "label",
            name = "text_1",
            caption = {"example.page_" .. page_name .. "_text_1"}
        }
    end

end
