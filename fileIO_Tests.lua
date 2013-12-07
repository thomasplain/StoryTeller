luaUnit = require('luaunit')

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
		io.input("someLines")
		assert(io.read("*all") == "Some text\nSome more text\n")
	end

	function TestFileIOTests:test3_splitsFileByLineIntoArray()
		--local lines = {}
		io.input("someWindowsLines")
		wholeFile = io.read("*all")
		lines = split(wholeFile, "\n")
		assert(lines[1] == "Some text")
		assert(lines[2] == "Some more text")
	end
--TestFunctions = LuaUnit.wrapFunctions('readsFileBackLineByLine')

function split(str, delim)
    local result,pat,lastPos = {},"(.-)" .. delim .. "()",1
    for part, pos in string.gfind(str, pat) do
        table.insert(result, part); lastPos = pos
    end
    table.insert(result, string.sub(str, lastPos))
    return result
end

luaUnit:run()