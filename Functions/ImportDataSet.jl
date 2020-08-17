using DataFrames

function GetDataSet(path::String)
    # Reading the dataset
    df = DataFrame(CSV.File(path))
    # Setting name in every column
    rename!(df, [:age, :sex, :cp, :trestbps, :chol, :fbs, :restecg, :thalach, :exang, :oldpeak, :slope, :ca, :thal, :target])

    # Parse to int
    df.sex = trunc.(Int, df.sex)
    df.cp = trunc.(Int, df.cp)
    df.restecg = trunc.(Int, df.restecg)
    df.exang = trunc.(Int, df.exang)
    df.slope = trunc.(Int, df.slope)


    return df
end
