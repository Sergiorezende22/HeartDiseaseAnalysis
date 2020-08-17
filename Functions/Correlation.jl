function GetCorrelationMatrix(df::DataFrame)
    _size = size(df)[2]
    corMatrix = zeros(_size, _size)

    for i = 1:_size
        for j = i:_size
            corMatrix[j, i] = cor(df[:, i], df[:, j])
            #corMatrix[i, j] = corMatrix[j, i]
        end
    end

    return corMatrix
end
