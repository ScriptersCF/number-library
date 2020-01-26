--- Number Utility
-- @author jakedies
 
local Number = { }
 
Number.SuffixList = { "", "K", "M", "B", "T", "Q" }
 
function Number.Truncate(value, idp, base)
    local mult = (base or 10) ^ (idp or 1)
 
    return math.floor(value * mult) / mult
end

function Number.Round(value, idp, base)
    local mult = (base or 10) ^ (idp or 1)
 
    return math.floor((value * mult) + 0.5) / mult
end
 
function Number.Format(value, idp, round, suffixList)
	suffixList = suffixList or Number.SuffixList

    local exp = math.floor(math.log(math.max(1, math.abs(value)), 1000))
    local suffix = suffixList[1 + exp] or ("e+" .. exp)
    local norm = math.floor(value * ((10 ^ idp) / (1000 ^ exp)) + (round and 0.5 or 0)) / (10 ^ idp)
 
    return ("%." .. idp .. "f%s"):format(norm, suffix)
end
 
function Number.Commaify(value) -- credit http://richard.warburton.it
    local left, middle, right = string.match(value, "^([^%d]*%d)(%d*)(.-)$")
    return left .. (middle:reverse():gsub("(%d%d%d)", "%1,"):reverse()) .. right
end
 
return Number
