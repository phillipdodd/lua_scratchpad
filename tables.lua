function makeFnLogger(prefix)
    return function(x)
        print(prefix .. x)
    end
end

--* param {table} table - the table to map over
--* param {function} fn - the function to be executed. will be passed the key and value
--* OPTIONAL param {function} filterFn - will only process values that return true when passed into this function
function mapTable(table, fn, filterFn)
    for k, v in pairs(table) do
        if filterFn and filterFn(v) == true then 
            fn(k,v)
        end
    end
end