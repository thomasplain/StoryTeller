luaUnit = require('luaunit')
require('stringCollection')

local lines = {}

TestFileIOTests = {}
	function TestFileIOTests:setUp()
		io.output("someLines", w)
		io.write("Some text\n")
		io.write("Some more text\n")
		io.close()
	end	

	function TestFileIOTests:test1_readsFileBackLineByLine()
		io.input("someLines")
		assert(io.read("*l") == "Some text")
		assert(io.read("*l") == "Some more text")
	end
	
	function TestFileIOTests:test2_readsFileBackWholeFile()
		assert(readWholeFile("someLines") == "Some text\nSome more text\n")
	end

	function TestFileIOTests:test3_splitsFileByLine()
		assert(getLineFromFile("someLines", 1) == "Some text")
		assert(getLineFromFile("someLines", 2) == "Some more text")
	end

	function TestFileIOTests:test4_printRandomLine()
		print(getRandomLineFromFile("someWindowsLines"))
	end
--TestFunctions = LuaUnit.wrapFunctions('readsFileBackLineByLine')

luaUnit:run()