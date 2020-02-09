function rotato(list)
    local list = list
    return function () 
        local val = table.remove(list, 1)
        table.insert(list, val)
        return val
    end
end

x = rotato({1,2,3})
y = rotato({'a', 'b', 'c'})

print(x())
print(y())
print(x())
print(y())
print(x())
print(y())