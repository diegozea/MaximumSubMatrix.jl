# Code based on: https://www.geeksforgeeks.org/largest-rectangle-under-histogram/

function _rectangular_area!(stack, histogram, i₀, i)
	min_height_index = pop!(stack)
	height = histogram[min_height_index]
	
	left_index = isempty(stack) ? i₀ : first(stack) + 1
	rigth_index = i - 1
	base = rigth_index - left_index + 1
	
	area = height * base

	return area, (left_index, rigth_index), (0, height)
end


function _update_max_area!(x_coordinates, y_coordinates, xs, ys, max_area, area)
	if area ≥ max_area
		if area > max_area
			empty!(x_coordinates)
			empty!(y_coordinates)
		end
		max_area = area
		push!(x_coordinates, xs)
		push!(y_coordinates, ys)
	end
	max_area
end


function maximum_rectagular_area(histogram)
	height_type = eltype(histogram)
    rectangle_type = height_type == Bool ? Int : height_type
    
	indices = eachindex(histogram)
	i₀ = first(indices)
	indextype = typeof(i₀)
    stack = Stack{typeof(i₀)}()
	x_coordinates = Tuple{indextype,indextype}[]
	y_coordinates = Tuple{rectangle_type,rectangle_type}[]
	max_area = 0
	if isempty(indices)
		return max_area, x_coordinates, y_coordinates
	end
    
    i = i₀
	while true
        if isempty(stack) || (histogram[first(stack)] ≤ histogram[i])
            push!(stack, i)
            next = iterate(indices, i)
			if next === nothing
				break
    			else
				_, i = next
			end
		else
			area, xs, ys = _rectangular_area!(stack, histogram, i₀, i)
			max_area = _update_max_area!(x_coordinates, y_coordinates, 
				xs, ys, max_area, area)
		end
	end
	
	i = last(indices) + 1
	while !isempty(stack)
		area, xs, ys = _rectangular_area!(stack, histogram, i₀, i)
		max_area = _update_max_area!(x_coordinates, y_coordinates, 
			xs, ys, max_area, area)
	end
	
	max_area, x_coordinates, y_coordinates
end