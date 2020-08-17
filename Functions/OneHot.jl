function OneHotSpecific(col::Array{<:Number, 1}, category::Number)
    # return broadcast(a -> a in unique(sort([matrix...], rev=true))[1:3] ? 0 : a, matrix)
    return broadcast(a -> a == category ? 1 : 0, col)
end

function one_hot(col::Array{<:Number, 1}, categories::Array{<:Number, 1})
    oh = zeros(length(col), length(categories))
    for i = 1:length(categories)
        temp = OneHotSpecific(col, categories[i])

        for j = 1:length(col)
            oh[j, i] = temp[j]
        end
    end

    return oh
end

function OneHotEncoding(df::DataFrame)
    # CP
    temp = trunc.(Int8, one_hot(df.cp, [1, 2, 3, 4]))
    oh = DataFrame(temp)
    rename!(oh, [:cp_1, :cp_2, :cp_3, :cp_4])
    df = hcat(df, oh)
    select!(df, Not(:cp))

    # restecg
    temp = trunc.(Int8, one_hot(df.restecg, [0, 1, 2]))
    oh = DataFrame(temp)
    rename!(oh, [:restecg_1, :restecg_2, :restecg_3])
    df = hcat(df, oh)
    select!(df, Not(:restecg))

    # slope
    temp = trunc.(Int8, one_hot(df.slope, [1, 2, 3]))
    oh = DataFrame(temp)
    rename!(oh, [:slope_1, :slope_2, :slope_3])
    df = hcat(df, oh)
    select!(df, Not(:slope))

    # thal
    temp = trunc.(Int8, one_hot(df.thal, [3, 6, 7]))
    oh = DataFrame(temp)
    rename!(oh, [:thal_3, :thal_6, :thal_7])
    df = hcat(df, oh)
    select!(df, Not(:thal))

    df = df[:,[:age,:sex,:trestbps,:chol,:fbs,:thalach,:exang,:ca,:oldpeak,:cp_1,:cp_2,:cp_3,:cp_4,:restecg_1,
        :restecg_2,:restecg_3,:slope_1,:slope_2,:slope_3,:thal_3,:thal_6,:thal_7,:target]];

    return df
end
