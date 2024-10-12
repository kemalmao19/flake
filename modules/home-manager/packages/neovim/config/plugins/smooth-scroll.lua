local status_ok, neoscroll = pcall(require, "neoscroll")
if not status_ok then
    vim.notify("neoscroll not found ")
    return
end
neoscroll.setup({})
