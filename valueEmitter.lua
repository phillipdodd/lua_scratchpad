function valueEmitter(list)
    local list = list
    return function () 
        local val = table.remove(list, 1)
        table.insert(list, val)
        return val
    end
end

x = valueEmitter({1,2,3})
y = valueEmitter({'a', 'b', 'c'})

print(x())
print(y())
print(x())
print(y())
print(x())
print(y())