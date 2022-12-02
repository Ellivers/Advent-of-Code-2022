# Part two

inp = open('input.txt', 'r').read().splitlines()

calories = []
holding = 0

for i in range(0,len(inp)):
    line = inp[i]
    if (line != ''):
        holding += int(line)
    if (line == '' or i == len(inp)-1):
        calories.append(holding)
        holding = 0

resultcals = sorted(calories)

print(resultcals[len(calories)-1] + resultcals[len(calories)-2] + resultcals[len(calories)-3])
