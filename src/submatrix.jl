# Code based on: https://www.geeksforgeeks.org/maximum-size-rectangle-binary-sub-matrix-1s/

function _update_rectangle!(x_coordinates, y_coordinates, xs, ys, max_area, area, i)
	if area ≥ max_area
		if area > max_area
			empty!(x_coordinates)
			empty!(y_coordinates)
		end
		max_area = area
		append!(x_coordinates, xs)
		append!(y_coordinates, [ (i - y[2] + 1, y[1] + i) for y in ys ])
	end
	max_area
end


function maximum_rectagular_submatrix(matrix)
	value_type = eltype(matrix)
	if value_type == Bool
		M = convert(Matrix{Int}, matrix)
	else
		M = deepcopy(matrix)
	end
	
	rows = collect(eachrow(M))
	Nrows, Ncols = size(M)
	max_area, xs, ys = maximum_rectagular_area(rows[1])
	x_coordinates = similar(xs, 0)
	y_coordinates = similar(ys, 0)
	append!(x_coordinates, xs)
	append!(y_coordinates, ys)
  	for i in 2:Nrows
		previous_row = rows[i - 1]
		current_row = rows[i]
		for j in 1:Ncols
			if current_row[j] != 0
				current_row[j] = previous_row[j] + 1
			end
		end
		area, xs, ys = maximum_rectagular_area(rows[i])
		max_area = _update_rectangle!(x_coordinates, y_coordinates, 
			xs, ys, max_area, area, i)
	end
	max_area, x_coordinates, y_coordinates
end