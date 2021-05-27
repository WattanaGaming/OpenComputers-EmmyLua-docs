---@meta

--- Computers provide a couple of API callbacks. Note that these can only be called by the computer itself, or its direct neighbors (i.e. other computers that share a face with that computer). Also note that since robots cannot interact with external components they cannot start/stop/query computers, but computers can interact with robots sitting next to them.
computer = {}

--- Plays a tone, useful to alert users via audible feedback. Supports frequencies from 20 to 2000Hz, with a duration of up to 5 seconds.
---
--- This method is overloaded taking a single string parameter as a pattern of dots `.` and dashes `-` for short and long beeps respectively.
---
---@overload fun(beeps: string)
---@param frequency? integer
---@param duration? number
function computer.beep(frequency, duration) end

--- Returns a table of device information. Note that this is architecture-specific and some may not implement it at all.
---@return table
function computer.getDeviceInfo() end

--- Returns the computer's current architecture.
---@return string
function computer.getArchitecture() end

--- The component address of this computer.
---@return string address
function computer.address() end

--- The component address of the computer's temporary file system (if any), used for mounting it on startup.
---@return string address
function computer.tmpAddress() end

--- The amount of memory currently unused, in bytes. If this gets close to zero your computer will probably soon crash with an out of memory error.
---@return integer
function computer.freeMemory() end

--- The total amount of memory installed in this computer, in bytes.
---@return integer
function computer.totalMemory() end

--- The amount of energy currently available in the network the computer is in. For a robot this is the robot's own energy / fuel level.
---@return number
function computer.energy() end

--- The maximum amount of energy that can be stored in the network the computer is in. For a robot this is the size of the robot's internal buffer (what you see in the robot's GUI).
---@return number
function computer.maxEnergy() end

--- The time in real world seconds this computer has been running, measured based on the world time that passed since it was started - meaning this will not increase while the game is paused, for example.
---@return number
function computer.uptime() end

--- Shuts down the computer. Optionally reboots the computer, if `reboot` is true, i.e. shuts down, then starts it again automatically. This function never returns.
---@param reboot boolean
function computer.shutdown(reboot) end

--- Get the address of the filesystem component from which to try to boot first. New since OC 1.3.
---@return string address
function computer.getBootAddress() end

--- Set the address of the filesystem component from which to try to boot first. Call with nil / no arguments to clear. New since OC 1.3.
---@param address string
function computer.setBootAddress(address) end

--- A list of all users registered on this computer, as a tuple. To iterate the result as a list, use table.pack on it, first. Please see the user rights documentation.
---@return string
---@return ...
function computer.users() end

--- Registers a new user with this computer. Returns `true` if the user was successfully added. Returns `nil` and an error message otherwise.
---
--- The user must be currently in the game. The user will gain full access rights on the computer. In the shell, `useradd USER` is a command line option to invoke this method.
---@param name string
---@return boolean|nil success
---@return string error
function computer.addUser(name) end

--- Unregisters a user from this computer. Returns `true` if the user was removed, `false` if they weren't registered in the first place.
---
--- The user will lose all access to this computer. When the last user is removed from the user list, the computer becomes accessible to all players. `userdel USER` is a command line option to invoke this method.
---@param name string
---@return boolean success
function computer.removeUser(name) end

--- Pushes a new signal into the queue. Signals are processed in a FIFO order. The signal has to at least have a name. Arguments to pass along with it are optional. Note that the types supported as signal parameters are limited to the basic types nil, boolean, number, string, and tables.
---
--- Note that only tables of the supported types are supported. That is, tables must compose types supported, such as other strings and numbers, or even sub tables. But not of functions or threads.
---@param name string
---@vararg ...
function computer.pushSignal(name, ...) end

--- Tries to pull a signal from the queue, waiting up to the specified amount of time before failing and returning `nil`. If no timeout is specified waits forever.
---
--- The first returned result is the signal name, following results correspond to what was pushed in `pushSignal`, for example. These vary based on the event type.
---@param timeout number
---@return string name
---@return ...
function computer.pullSignal(timeout) end
