local status_ok_comment, comment = pcall(require, "Comment")

if not status_ok_comment then return end

comment.setup()
