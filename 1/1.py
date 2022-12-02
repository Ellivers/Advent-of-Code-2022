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
        continue

print(sorted(calories)[len(calories)-1])
