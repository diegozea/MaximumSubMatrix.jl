@testset "Maximum size rectangle binary sub-matrix with all 1s" begin

    matrix = [
        0  1  1  0  1
        1  1  0  1  0
        0  1  1  1  0
        1  1  1  1  0
        1  1  1  1  1
        0  0  0  0  0
    ]

    @test maximum_rectagular_submatrix(matrix) == (9, [(2, 4)], [(3, 5)])
    @test maximum_rectagular_submatrix(BitArray(matrix)) == (9, [(2, 4)], [(3, 5)])

    matrix = [
        0  1  1  0
        1  1  1  1
        1  1  1  1
        1  1  0  0
    ]

    @test maximum_rectagular_submatrix(matrix) == (8, [(1, 4)], [(2, 3)])
    @test maximum_rectagular_submatrix(BitArray(matrix)) == (8, [(1, 4)], [(2, 3)])
end