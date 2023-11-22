os.loadAPI("json")
os.loadAPI("tank.lua")

local ws, err = http.websocket("ws://vtt.dndylan.de:8080")

local tInfo = tank.getTankInfo()
ws.send((tInfo))
sleep(1) -- Adjust the sleep time according to how frequently you want to send tank info
ws.close()
   -- print("Failed to connect to WebSocket: " .. err)