-- function eatFirstValue(_, ...)
--     return table.unpack({...})
-- end

function createValueEmitter(values)

    return coroutine.wrap(
        function ()
            local vals = values
            local counter = #vals
            
            while true do 
                local v = vals[counter % #vals + 1]
                
                coroutine.yield((function ()
                                    if type(v) == 'table' then
                                        return table.unpack(v)
                                    else
                                        return v
                                    end
                                end)())

                counter = (function ()
                    if (counter < #vals) then
                        return counter + 1
                    else
                        return 1
                    end
                end)()
            end
        end
    )

end

valueEmitter = createValueEmitter({{0.5, "Half"}, {1, "Normal"}, {2, "Double"}})
print(valueEmitter())
print(valueEmitter())
print(valueEmitter())
print(valueEmitter())

function x () print('x') end
function y () print('y') end

fve = createValueEmitter({x, y})

-- print(valueEmitter.getNext())
-- print(valueEmitter.getNext())
-- print(valueEmitter.getNext())
-- print(valueEmitter.getNext())
-- print(valueEmitter.getNext())
-- print(valueEmitter.getNext())
-- 0.5	Half
-- 1	Normal
-- 2	Double
-- 0.5	Half
-- 1	Normal
-- 2	Double