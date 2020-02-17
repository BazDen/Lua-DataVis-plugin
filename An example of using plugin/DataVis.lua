local Library = require "CoronaLibrary"

-- Create library
local lib = Library:new{ name='DataVis', publisherId='REVERSE_PUBLISHER_URL' }

-------------------------------------------------------------------------------
-- BEGIN (Insert your implementation starting here)
-------------------------------------------------------------------------------
lib.doSomething = function( display )
    print( "I did something!" )
end

lib.bar = function( display )
	local result = nil
		result = display.newRect( 10, 10, 150, 150 )
	return result
end
-------------------------------------------------------------------------------
-- END
-------------------------------------------------------------------------------

-- Return library instance
return lib
