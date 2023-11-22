-- os.loadAPI("json")
-- os.loadAPI("tank.lua")
-- local ws,err = http.websocket("ws://vtt.dndylan.de:8080")
-- print("Establishing connection to websocket")
-- if ws then
--     print("Connected to websocket")
--     while 1 do
--         local msg = ws.receive()
--         local obj = json.decode(msg)
--         local func = loadstring(obj["func"])
--         local ret = func()
--         ws.send(ret)
--     end
-- else
--     print("Unable to connect to websocket")
-- end

os.loadAPI("json")
os.loadAPI("tank.lua")
local ws, err = http.websocket("ws://vtt.dndylan.de:8080")

if ws then
    while true do
        local msg = ws.receive()
        local obj = json.decode(msg)

        if obj.func == "tank.getTankInfo()" then
            local tankInfo = tank.getTankInfo()
            if tankInfo then
                local response = json.encode({ func = "tankInfo", data = tankInfo })
                ws.send(response.fluidRaw)
            else
                ws.send(json.encode({ func = "tankInfo", data = "Error retrieving tank info" }))
            end
        else
            local func = loadstring(obj["func"])
            if func then
                local ret = func()
                ws.send(ret)
            end
        end
    end
else
    print("Unable to connect to websocket")
end