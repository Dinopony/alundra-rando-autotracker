WINDOW_WIDTH = 388
WINDOW_HEIGHT = 500
LEFT_MARGIN = 6
TOP_MARGIN = 6
BACKGROUND_COLOR = 0xFFCC44CC

REFRESH_EVERY_N_FRAMES = 20

ITEMS = {
    sword_1         = 0x01,
    sword_2         = 0x02,
    sword_3         = 0x03,
    sword_4         = 0x04,
    sword_5         = 0x08,

    bow_1           = 0x05,
    bow_2           = 0x06,

    flail_1         = 0x09,
    flail_2         = 0x0A,

    ice_wand        = 0x0E,
    fire_wand       = 0x10,
    spirit_wand     = 0x07,

    armor_1         = 0x11,
    armor_2         = 0x12,
    armor_3         = 0x13,
    armor_4         = 0x14,

    boots_2         = 0x1A,
    boots_3         = 0x1B,
    boots_4         = 0x1C,

    magic_earth_1   = 0x2B,
    magic_earth_2   = 0x2C,
    magic_water_1   = 0x2D,
    magic_water_2   = 0x2E,
    magic_fire_1    = 0x2F,
    magic_fire_2    = 0x30,
    magic_wind_1    = 0x31,
    magic_wind_2    = 0x32,

    bomb            = 0x23,
    spring_bean     = 0x1F,
    power_glove     = 0x3B,
    sand_cape       = 0x20,

    secret_pass     = 0x39,
    bouquet         = 0x4A,
    tree_gem        = 0x4D,
    aqua_cape       = 0x28,
    broken_armor    = 0x21,
    small_key       = 0x4B,

    crest_ruby      = 0x3E,
    crest_sapphire  = 0x3F,
    crest_topaz     = 0x40,
    crest_agate     = 0x41,
    crest_garnet    = 0x42,
    crest_emerald   = 0x43,
    crest_diamond   = 0x44,

    silver_armlet   = 0x35,
    navas_charm     = 0x36,
    olgas_ring      = 0x33,
    recovery_ring   = 0x37,
}

SIZE_UNIT = 60
LAYOUT = {     
    { x = 0,                y = 0,              items = { 'sword_1', 'sword_2', 'sword_3', 'sword_4' } },
    { x = SIZE_UNIT,        y = 0,              items = { 'flail_1', 'flail_2' } },
    { x = SIZE_UNIT*2,      y = 0,              items = { 'bow_1', 'bow_2' } },
    { x = SIZE_UNIT*3,      y = 0,              items = { 'fire_wand' } },
    { x = SIZE_UNIT*4,      y = 0,              items = { 'ice_wand' } },
    { x = SIZE_UNIT*5,      y = 0,              items = { 'spirit_wand' } },
    
    { x = 0,                y = SIZE_UNIT,      items = { 'armor_1', 'armor_2', 'armor_3', 'armor_4' } },
    { x = SIZE_UNIT,        y = SIZE_UNIT,      items = { 'boots_2' } },
    { x = SIZE_UNIT*2,      y = SIZE_UNIT,      items = { 'boots_3' } },
    { x = SIZE_UNIT*3,      y = SIZE_UNIT,      items = { 'boots_4' } },
    { x = SIZE_UNIT*5,      y = SIZE_UNIT,      items = { 'silver_armlet' } },
    
    { x = 0,                y = SIZE_UNIT*2,    items = { 'magic_earth_1', 'magic_earth_2' } },
    { x = SIZE_UNIT,        y = SIZE_UNIT*2,    items = { 'magic_water_1', 'magic_water_2' } },
    { x = SIZE_UNIT*2,      y = SIZE_UNIT*2,    items = { 'magic_fire_1', 'magic_fire_2' } },
    { x = SIZE_UNIT*3,      y = SIZE_UNIT*2,    items = { 'magic_wind_1', 'magic_wind_2' } },
    { x = SIZE_UNIT*5,      y = SIZE_UNIT*2,    items = { 'navas_charm' } },
    
    { x = 0,                y = SIZE_UNIT*3,    items = { 'bomb' } },
    { x = SIZE_UNIT,        y = SIZE_UNIT*3,    items = { 'spring_bean' } },
    { x = SIZE_UNIT*2,      y = SIZE_UNIT*3,    items = { 'power_glove' } },
    { x = SIZE_UNIT*3,      y = SIZE_UNIT*3,    items = { 'sand_cape' } },
    { x = SIZE_UNIT*4,      y = SIZE_UNIT*3,    items = { 'aqua_cape' } },
    { x = SIZE_UNIT*5,      y = SIZE_UNIT*3,    items = { 'olgas_ring' } },
    
    { x = 0,                y = SIZE_UNIT*4,    items = { 'secret_pass' } },
    { x = SIZE_UNIT,        y = SIZE_UNIT*4,    items = { 'bouquet' } },
    { x = SIZE_UNIT*2,      y = SIZE_UNIT*4,    items = { 'tree_gem' } },
    { x = SIZE_UNIT*3,      y = SIZE_UNIT*4,    items = { 'small_key' } },
    { x = SIZE_UNIT*4,      y = SIZE_UNIT*4,    items = { 'broken_armor' } },
    { x = SIZE_UNIT*5,      y = SIZE_UNIT*4,    items = { 'recovery_ring' } },

    { x = 12,               y = SIZE_UNIT*6,    items = { 'crest_topaz' } },
    { x = SIZE_UNIT+12,     y = SIZE_UNIT*5.5,  items = { 'crest_ruby' } },
    { x = SIZE_UNIT+12,     y = SIZE_UNIT*6.5,  items = { 'crest_agate' } },
    { x = (SIZE_UNIT+12)*2, y = SIZE_UNIT*6,    items = { 'crest_diamond' } },
    { x = (SIZE_UNIT+12)*3, y = SIZE_UNIT*5.5,  items = { 'crest_sapphire' } },
    { x = (SIZE_UNIT+12)*3, y = SIZE_UNIT*6.5,  items = { 'crest_emerald' } },
    { x = (SIZE_UNIT+12)*4, y = SIZE_UNIT*6,    items = { 'crest_garnet' } }
}

function get_item_quantity(item_id)
    addr = 0x1DD830 + (item_id * 4)
    return memory.read_u8(addr, "MainRAM")
end

function is_game_playing()
    return memory.read_u16_le(0x1DD810, "MainRAM") == 0x1EE
end

function draw_inventory()
    forms.clear(canvas_handle, BACKGROUND_COLOR)
    for _, layout_slot in ipairs(LAYOUT) do
        -- Find the best owned item in slot
        best_owned_item_for_slot = ''
        for _, item_name in ipairs(layout_slot["items"]) do
            owned_quantity = inventory[item_name]
            if owned_quantity ~= nil and owned_quantity > 0 then
                best_owned_item_for_slot = item_name
            end
        end

        if best_owned_item_for_slot ~= '' then
            -- Use best owned item sprite
            image_path = string.format("./assets/%s.png", best_owned_item_for_slot)
        else
            -- If none is owned, use greyed out lowest tier icon
            image_path = string.format("./assets/%s_off.png", layout_slot["items"][1])
        end

        forms.drawImage(canvas_handle, image_path, LEFT_MARGIN + layout_slot["x"], TOP_MARGIN + layout_slot["y"])
    end

    forms.refresh(canvas_handle)
end

inventory = {}
console.log("Starting autotracker...")
form_handle = forms.newform(WINDOW_WIDTH, WINDOW_HEIGHT, "Alundra Randomizer Tracker")
canvas_handle = forms.pictureBox(form_handle, 0, 0, WINDOW_WIDTH, WINDOW_HEIGHT)

frame_count = 0
updated = true
while true do
    if is_game_playing() == true then
        frame_count = frame_count + 1
        if frame_count % REFRESH_EVERY_N_FRAMES == 0 then
            frame_count = 0
            for name, item_id in pairs(ITEMS) do
                new_value = get_item_quantity(item_id)
                old_value = inventory[name]
                if old_value == nil or new_value > old_value then
                    inventory[name] = new_value
                    updated = true
                end
            end
        end
    end

    if updated == true then
        draw_inventory()
        updated = false
    end

	emu.frameadvance()
end

forms.destroyall()