log("Atomic Overhaul: Isotope Conversion script loaded")

-- Event listener for when an entity is destroyed
script.on_event(defines.events.on_entity_died, function(event)
    local entity = event.entity

    -- Check if the destroyed entity is a nuclear reactor
    if entity.name == "nuclear-reactor" then
        -- Capture the reactor's position and surface BEFORE it gets invalid
        local position = { x = entity.position.x, y = entity.position.y }
        local surface = entity.surface

        -- Call the function to convert items in a x radius to scrap
        convert_items_to_scrap(surface, position, 50) -- Radius of x tiles
    end
end)

-- Function to convert items within the given radius to scrap
function convert_items_to_scrap(surface, position, radius)
    -- Find all items on the ground within the radius
    local items_on_ground = surface.find_entities_filtered({
        area = {
            { position.x - radius, position.y - radius },
            { position.x + radius, position.y + radius }
        },
        type = "item-entity" -- Looking for items on the ground
    })

    -- Loop through all found items and convert them to scrap
    for _, item in pairs(items_on_ground) do

        local position = item.position -- Get the position of the item
        local item_stack = item.stack  -- Get the item stack

        -- Destroy the current item and replace it with scrap
        if item_stack then
            -- Remove the old item
            item.destroy()

            -- Create a new item entity with scrap
            surface.spill_item_stack(
                position, -- Position of the item
                { name = "isotope-scrap", count = 1}, -- Item to be spilled
                true -- Enable the item to be picked up
            )

            game.print("Your radars picked up a strange signal coming from: [gps=" .. position.x .. ", " .. position.y .. "]") --TODO: make this message localised
        end
    end
end
