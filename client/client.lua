os.loadAPI("json")
os.loadAPI("tank.lua")
local ws,err = http.websocket("ws://yourPublicWebServer")
local tInfo = tank.getTank()
if ws then
    while msg != "stop" do
        local msg = ws.receive()
        local obj = json.decode(msg)
        local func = loadstring(obj["func"])
        local ret = func()
        ws.send(ret)
    end
end