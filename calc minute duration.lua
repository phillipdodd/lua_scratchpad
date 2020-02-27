hours = 24;
minutes = 60;
duration = 1;
irlMinutesInDay = 30;
newMinuteDuration = irlMinutesInDay / ((hours * minutes) / 60);
print(newMinuteDuration);

function setGameDayDurationTo(IRLMinutes) 
    Clock.SetMinuteDuration(
        IRLMinutes / 24
    )
end