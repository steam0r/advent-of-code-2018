import re
from datetime import datetime

inputFile = open("input", "r")
lines = inputFile.readlines()
currentGuard = None
guards = {}
startSleep = 0
sleepDuration = 0
commands = {}


class Guard:
    id = None
    overallSleep = 0
    sleepMinutes = {}

    def __init__(self, id):
        self.id = id
        self.sleepMinutes = {}
        self.overallSleep = 0

    pass


for line in lines:
    fields = re.split('^\[(.*)\] (.*)$', line)
    date = datetime.strptime(fields[1], '%Y-%m-%d %H:%M')
    command = fields[2]
    commands[date] = command

for date, command in sorted(commands.items()):
    minute = date.minute
    if "begins shift" in command:
        currentGuardId = command.split(' ')[1].replace('#', '')
        if currentGuardId not in guards:
            guards[currentGuardId] = Guard(currentGuardId)
        currentGuard = guards.get(currentGuardId)
        startSleep = 0
        sleepDuration = 0
    elif "wakes up" in command:
        sleepDuration = minute - startSleep - 1
        currentGuard.overallSleep += sleepDuration
        for i in range(startSleep + 1, minute):
            if i in currentGuard.sleepMinutes:
                currentGuard.sleepMinutes[i] += 1
            else:
                currentGuard.sleepMinutes[i] = 1
    elif "falls asleep" in command:
        startSleep = minute
        currentGuard.overallSleep += 1
        if minute in currentGuard.sleepMinutes:
            currentGuard.sleepMinutes[startSleep] += 1
        else:
            currentGuard.sleepMinutes[startSleep] = 1
    else:
        continue

sortedGuards = sorted(guards.values(), key=lambda x: x.overallSleep, reverse=True)
laziestGuard = sortedGuards[0]
sortedMinutes = sorted(laziestGuard.sleepMinutes, key=laziestGuard.sleepMinutes.get, reverse=True)
sneakInAt = sortedMinutes[0]
print("the laziest guard is #%s, most likely to be asleep at minute %d, multiplication yields %d" % (
    laziestGuard.id, sneakInAt, (int(laziestGuard.id) * sneakInAt)
))
