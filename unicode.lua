---@meta
--- Because all strings pass through Java at some point it can be useful to handle them with Unicode support (since Java's internal string representation is UTF-8 encoded). In particular, screens display UTF-8 strings, meaning the related GPU functions expect UTF-8 strings. Also, keyboard input will generally be UTF-8 encoded, especially the clipboard.
unicode = {}

--- UTF-8 aware version of `string.char`. The values may be in the full UTF-8 range, not just ASCII.
---@param value number
---@vararg ...
function unicode.char(value, ...) end

--- Returns the width of the first character given. For example, for `シ` it'll return `2`, where `a` would return `1`.
---@param value string
---@vararg ...
function unicode.charWidth(value, ...) end

--- Returns if the width of the first character given is greater than 1. For example, for `シ` it'll return `true`, where `a` would return `false`.
---@param value string
---@return boolean
function unicode.isWide(value) end

--- UTF-8 aware version of `string.len`. For example, for `Ümläüt` it'll return `6`, where `string.len` would return `9`.
---@param value string
---@return number
function unicode.len(value) end

--- UTF-8 aware version of string.lower.
---@param value string
---@return string
function unicode.lower(value) end

--- UTF-8 aware version of `string.reverse`. For example, for `Ümläüt` it'll return `tüälmÜ`, where string.reverse would return `tälm`.
---@param value string
---@return string
function unicode.reverse(value) end

--- UTF-8 aware version of `string.sub`.
---@param value string
---@param i integer
---@param j integer
function unicode.sub(value, i, j) end

--- UTF-8 aware version of `string.upper`.
---@param value string
---@return string
function unicode.upper(value) end

--- Returns the width of the entire string.
---@param value string
---@return number
function unicode.wlen(value) end

--- Truncates the given string up to but not including count width. If there are not enough characters to match the wanted width, the function errors.
---@param value string
---@param count integer
---@return string
function unicode.wtrunc(value, count) end
