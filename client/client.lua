os.loadAPI("json")
local ws,err = http.websocket("ws://localhost:8080")
if ws then
    while true do
        sleep(3)
        ws.send("move")
        local msg = ws.receive()
        local obj = json.decode(msg)
        write(msg)
        local func = loadstring(obj["func"])
        func()
    end
end