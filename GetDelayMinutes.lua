-- returns player delay rounded down to the nearest minute from scheduled time of arrival for timetable instruction. Intended to make scenario look fancy.

function GetDelayMinutes(bookedArrivalTime)
	-- booked time formatted "HH:MM"
    bookedArrivalTimeSeconds = (string.sub(bookedArrivalTime, 1, 2) * 3600) + (string.sub(bookedArrivalTime, 4, 5) * 60)

	actualArrivalTime = SysCall("ScenarioManager:GetTimeOfDay")

	return tostring(Math.floor((actualArrivalTime - bookedArrivalTimeSeconds) / 60))
end