luaUnit = require('luaunit')

TestFileIOTests = {}
	function TestFileIOTests:setUp()
		io.output("someLines", w)
		io.write("Some text\n")
		io.write("Some more text")
		io.close()
	end	

	function TestFileIOTests:test1_readsFileBackLineByLine()
		io.input("someLines")
		assert(io.read("*l") == "Some text")
		assert(io.read("*l") == "Some more text")
	end
	
	function TestFileIOTests:test2_readsFileBackLineByLine()
		io.input("someLines")
		assert(io.read("*all") == "Some text\nSome more text")
	end
--TestFunctions = LuaUnit.wrapFunctions('readsFileBackLineByLine')

luaUnit:run()