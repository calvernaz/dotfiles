function whoseport
    command lsof -i :$argv | grep LISTEN
end
