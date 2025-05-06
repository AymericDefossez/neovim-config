return function(table, value)
  for _, x in ipairs(table) do
    if value == x then
      return true
    end
  end
  return false
end
