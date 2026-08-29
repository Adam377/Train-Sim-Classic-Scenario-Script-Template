-- returns player delay rounded down to the nearest minute from scheduled time of arrival for timetable instruction. Intended to make scenario look fancy.

function GetDelayMinutes(bookedArrivalTime, actualArrivalTime)
	-- booked time formatted "HH:MM"
    bookedArrivalTimeSeconds = (string.sub(bookedArrivalTime, 1, 2) * 3600) + (string.sub(bookedArrivalTime, 4, 5) * 60)

	return tostring(Math.floor((actualArrivalTime - bookedArrivalTimeSeconds) / 60))
end