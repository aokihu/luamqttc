package.cpath = package.cpath .. ';/Users/yongke/IdeaProjects/luamqttc/build/?.dylib'
local luamqttc = require "mqttpacket"

local conn = luamqttc.serialize_connect({
    client_id = "xx",
    username = "a",
    password = "b",
    keep_alive_interval = 60
})

local function range(a, b, step)
    if not b then
        b = a
        a = 1
    end
    step = step or 1
    local f =
    step > 0 and
            function(_, lastvalue)
                local nextvalue = lastvalue + step
                if nextvalue <= b then return nextvalue end
            end or
            step < 0 and
            function(_, lastvalue)
                local nextvalue = lastvalue + step
                if nextvalue >= b then return nextvalue end
            end or
            function(_, lastvalue) return lastvalue end
    return f, nil, a - step
end

print(conn)
print(#conn)

local connack = luamqttc.deserialize_connack("invalid")
print(connack)

local pingreq = luamqttc.serialize_pingreq()
print(#pingreq)

local publishreq = luamqttc.serialize_publish("topic-1", "payload2")
print(publishreq)

local ack = luamqttc.deserialize_ack("invalid")
print(connack)

local pingreq = luamqttc.serialize_disconnect()
print(#pingreq)

local socket = require "socket"
print(socket.gettime())