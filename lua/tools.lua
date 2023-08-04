-- in tools.lua
local api = vim.api

local M = {};

function M.makeScratch()
	vim.bo[0].buftype=nofile -- set the current buffer's (buffer 0) buftype to nofile
	vim.bo[0].bufhidden=hide
	vim.bo[0].swapfile=false
end;



return M;