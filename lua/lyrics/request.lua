local M = {}

local curl = require('plenary.curl')
local cmd = vim.cmd
local conf = {}

function M.setup(config)
    conf = config
end

function M.run(args)
    local a = {}
    local o = {}
    local w = ""

    for word in string.gmatch(args, '([^:]+)') do
        w = string.gsub(word, ' ', '%%20')
        w = string.lower(w)
        word = string.upper(word)

        table.insert(a, w)
        table.insert(o, word)
    end

    print("Calling...")

    curl.request(
        {
            url = conf["url"] .. a[1] .. "/" .. a[2],
            method = "get",
            accept = "application/json",
            timeout = 1000,
            callback = vim.schedule_wrap(
                function(data)
                    if not (data and data.body) then
                        return
                    end

                    local ok, decoded = pcall(vim.json.decode, data.body)
                    if not ok or not (decoded and decoded.lyrics) then
                        print("Error decoding JSON")
                        return
                    end
                    pcall(cmd, 'enew')
                    cmd("normal i " .. o[1])
                    cmd("normal o")
                    cmd("normal i " .. o[2])
                    cmd("normal o")
                    cmd("normal o")
                    local song = vim.api.nvim_replace_termcodes(decoded.lyrics, true, true, true)
                    for line in string.gmatch(song, '([^\r\n]+)') do
                        cmd("normal i " .. line)
                        cmd("normal o")
                    end
                end
            )
        }
    )
end

return M
