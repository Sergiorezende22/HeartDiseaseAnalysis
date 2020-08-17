function RemoveMissing(df::DataFrame)
    # Allowing missing data and setting missing
    df = filter(row -> row.ca != "?" && row.thal != "?", df);

    # Changing ca and thal types (defaulted as string)
    df.ca = parse.(Float16, df.ca)
    df.thal = parse.(Float16, df.thal)
    df.ca = trunc.(Int, df.ca)
    df.thal = trunc.(Int, df.thal)

    return df
end
