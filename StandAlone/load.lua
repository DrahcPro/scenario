--[[
Explosive Gaming

This file can be used with permission but this and the credit below must remain in the file.
Contact a member of management on our discord to seek permission to use our code.
Any changes that you may make to the code are yours but that does not make the script yours.
Discord: https://discord.gg/r6dC2uK
]]
--Please Only Edit Below This Line-----------------------------------------------------------
local return_err = true
local _require = require
local function require(path)
    local success, err = pcall(_require,path)
    if not success and return_err then error(err) end
end
-- this file will just contain all the diffrent requires
require('body-marker')
require('one-hour-peace')
require('colours')
require('health')
require('spawn')
require('starting-items')
require('real-death-world')