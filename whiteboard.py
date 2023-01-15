# There is a bus moving in the city, and it loads and drops some people at each bus stop.
# You are provided with a list (or array)of lists of integer pairs. Elements of each pair represent
# number of people get into bus (The first item) and number of people get off the bus (The second item) in a bus stop.
# Your task is to return number of people who are still in the bus after the last bus station (after the last array).
# Even though it is the last bus stop, the bus is not empty and some people are still in the bus, and they are probably sleeping there :D
# Take a look on the test cases.
# ex1 = [[10,0],[3,5],[5,8]]
# output = 5   10+3-5+5-8
# ex2 = [[3,0],[9,1],[4,10],[12,2],[6,1],[7,10]]
# output = 17

def bus(people):
    on_bus = 0
    i = 0
    while i < len(people):
        on_bus += people[i][0]
        on_bus -= people[i][1]
        i += 1
    
    print(on_bus)


bus([[10,0],[3,5],[5,8]])


def bus2(people):
    on_bus = 0
    for x in range(len(people)):
        on_bus += people[x][0]
        on_bus -= people[x][1]

    print(on_bus)

bus2([[10,0],[3,5],[5,8]])
