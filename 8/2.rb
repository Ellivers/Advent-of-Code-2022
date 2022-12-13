arr = %w()

File.readlines('input.txt').each { |line|
    arr.push([])
    line.split('').each { |char|
        if (["\n","\r"].include? char) then next end

        arr[-1].push(char)
    }
}

def search_direction(arr, x, y, offsetx, offsety)
    tempx = x
    tempy = y
    height = arr[y][x]
    distance = 0
    while (tempx > 0 && tempy > 0 && tempx < arr[0].length-1 && tempy < arr.length-1)
        tempx += offsetx
        tempy += offsety

        distance += 1

        if (arr[tempy][tempx] >= height)
            break
        end
    end
    return distance
end

scores = %w()

arr.each_with_index { |trees,y|
    trees.each_with_index { |tree,x|
        directionscores = %w()
        for direction in [[-1, 0],[1,0],[0,-1],[0,1]].each do
            directionscores.push(search_direction(arr, x, y, *direction))
        end
        scores.push([directionscores[0] * directionscores[1] * directionscores[2] * directionscores[3]])
    }
}

puts scores.sort[-1]
