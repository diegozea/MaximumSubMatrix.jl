using MaximumSubMatrix
using Documenter

makedocs(;
    modules=[MaximumSubMatrix],
    authors="Diego Javier Zea",
    repo="https://github.com/diegozea/MaximumSubMatrix.jl/blob/{commit}{path}#L{line}",
    sitename="MaximumSubMatrix.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://diegozea.github.io/MaximumSubMatrix.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/diegozea/MaximumSubMatrix.jl",
)
