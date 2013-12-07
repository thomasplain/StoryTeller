require('math')
require('os')
function readWholeFile(filename)
	io.input(filename)
	wholeFile = io.read("*all")
	return wholeFile
end

function splitStringByLine(stringToSplit)
	local lines = split(stringToSplit, "\n")
	return lines
end

function getLineFromFile(filename, lineNumber)
	fileString = readWholeFile(filename)
	local lines = splitStringByLine(fileString)
	return lines[lineNumber]
end

function getRandomLineFromFile(filename)
	math.randomseed(os.time())
	fileString = readWholeFile(filename)
	local lines = splitStringByLine(fileString)
	upper = table.getn(lines) - 1
	math.random(upper); math.random(upper); math.random(upper)
	return lines[math.random(upper)]

end

function split(str, delim)
    local result,pat,lastPos = {},"(.-)" .. delim .. "()",1
    for part, pos in string.gfind(str, pat) do
        table.insert(result, part); lastPos = pos
    end
    table.insert(result, string.sub(str, lastPos))
    return result
end