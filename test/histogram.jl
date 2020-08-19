@testset "Largest Rectangular Area in a Histogram" begin

    @test maximum_rectagular_area([6, 2, 5, 4, 5, 1, 6]) == (12, [(3, 5)], [(0, 4)])

    @test maximum_rectagular_area([6, 6]) == (12, [(1, 2)], [(0, 6)])
    @test maximum_rectagular_area([6]) == (6, [(1, 1)], [(0, 6)])

    @test maximum_rectagular_area([]) == (0, Tuple{Int64,Int64}[], Tuple{Int64,Int64}[])

    @test maximum_rectagular_area([6, 5, 4, 3, 2, 1]) == (12, [(1, 3), (1, 4)], [(0, 4), (0, 3)])

    @test maximum_rectagular_area([false, true, true, false, true]) == (2, [(2, 3)], [(0, 1)])
    @test maximum_rectagular_area([0, 1, 1, 0, 1]) == (2, [(2, 3)], [(0, 1)])
    @test maximum_rectagular_area(BitVector([0, 1, 1, 0, 1])) == (2, [(2, 3)], [(0, 1)])
end