function printTable (table)
    if table and #table then
        for i = 1, #table do
            print(table[i])
        end
    end
end

someTable = {'a', 'b', 'c'}
newTable = {}
newTable = table.move(someTable, 2, #someTable, 1, newTable)


printTable(someTable)
print('')
printTable(newTable)
