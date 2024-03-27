local M = {}

local function get_remote_url()
    local handle = io.popen("git config --get remote.origin.url")
    local remote_url = handle:read("*a")
    handle:close()
    return remote_url
end

local function get_ref()
    local handle = io.popen("git symbolic-ref HEAD")
    local ref = handle:read("*a")
    handle:close()
    return ref:gsub("%s+", "")
end

M.open_current_in_bitbucket = function()
    local remote_url = get_remote_url()
    local current_file = vim.api.nvim_buf_get_name(0)
    local ref = get_ref()

    local base_url, common_part = string.match(remote_url, "(https://.+/)(.+)%.git")

    base_url = base_url:gsub("/scm/", "/projects/") .. "repos/"
    local file_url_part = string.match(current_file, ".+/" .. common_part .. "/(.+)")
    local file_url = base_url .. common_part .. "/browse/" .. file_url_part .. "?at=" .. ref

    vim.cmd("!open \"" .. file_url .. "\"")
end

return M
