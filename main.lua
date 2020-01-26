--- Number Utility
-- @author jakedies

local Number = { }

Number.SuffixList = { "", "K", "M", "B", "T", "Q" }

--- Truncates a number.
-- @param[number] value  The value.
-- @optparam[number] idp  The index point relative to the one's place, rightward (default = 0).
-- @optparam[number] base  The base rounding operates on(default = 10).
-- @return[number] The rounded (truncated) value.
--
-- Example: Truncate(12.37, 1) --> 12.3
-- Example: Truncate(12.37, -1) --> 10
function Number.Truncate(value, idp, base)
	local mult = (base or 10) ^ (idp or 0)

	return math.floor(value * mult) / mult
end

--- Rounds a number.
-- @param[number] value  The value.
-- @optparam[number] idp  The index point relative to the one's place, rightward (default = 0).
-- @optparam[number] base  The base rounding operates on(default = 10).
-- @return[number] The rounded value.
--
-- Example: Round(12.37, 1) --> 12.4
-- Example: Round(12.37, -1) --> 10
function Number.Round(value, idp, base)
	local mult = (base or 10) ^ (idp or 1)

	return math.floor((value * mult) + 0.5) / mult
end

--- Returns a human-readable representation of a number by applying a suffix.
-- @param[number] value  The value.
-- @optparam[number] idp  The index point relative to the one's place the number is rounded to, rightward (default = 0).
-- @optparam[boolean] round  Whether to round instead of truncate (default = false).
-- @optparam[table] suffixList  The suffix list to use (default = Number.SuffixList).
-- @return[string] The human-readable representation of the number.
function Number.Format(value, idp, round, suffixList)
	suffixList = suffixList or Number.SuffixList

	local exp = math.floor(math.log(math.max(1, math.abs(value)), 1000))
	local suffix = suffixList[1 + exp] or ("e+" .. exp)
	local norm = math.floor(value * ((10 ^ idp) / (1000 ^ exp)) + (round and 0.5 or 0)) / (10 ^ idp)

	return ("%." .. idp .. "f%s"):format(norm, suffix)
end

--- Returns a human-readable representation of a number by inserting commas.
-- @param[number] value  The value.
-- @return[string] The human-readable representation of the number.
function Number.Commaify(value) -- credit http://richard.warburton.it
	local left, middle, right = string.match(value, "^([^%d]*%d)(%d*)(.-)$")
	return left .. (middle:reverse():gsub("(%d%d%d)", "%1,"):reverse()) .. right
end

return Number
