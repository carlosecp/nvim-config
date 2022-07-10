local status_ok_diaglist, diaglist = pcall(require, "diaglist")

if not status_ok_diaglist then return end

diaglist.init({})
