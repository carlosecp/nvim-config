local status_ok, diaglist = pcall(require, "diaglist")
if not status_ok then return end

diaglist.init({})
