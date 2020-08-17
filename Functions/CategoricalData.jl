function show_categorical(array::Array{<:Number, 1}, types::Array{<:Number, 1}, labels::Array{<:String, 1}, title::String; legend = :right)
    gr()
    tempProportion = zeros(length(types))
    totalProportion = length(array)
    for i = 1:length(types)
        tempProportion[i] = length(filter(a -> a == types[i] , array)) / totalProportion
        labels[i] *= " $(round(tempProportion[i] * 100, digits=2))%"
    end
    return pie(labels, tempProportion; title=title, legend = legend, bottom_margin = 10px, right_margin = 75px)

end
