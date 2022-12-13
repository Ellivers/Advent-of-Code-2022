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
    while (tempx > 0 && tempy > 0 && tempx < arr[0].length-1 && tempy < arr.length-1)
        tempx += offsetx
        tempy += offsety

        if (arr[tempy][tempx] >= height)
            break
        elsif (!(tempx > 0 && tempy > 0 && tempx < arr[0].length-1 && tempy < arr.length-1))
            return true
        end
    end
    return false
end

visible = 0

arr.each_with_index { |trees,y|
    trees.each_with_index { |tree,x|
        if (x > 0 && y > 0 && x < trees.length-1 && y < arr.length-1)
            for direction in [[-1, 0],[1,0],[0,-1],[0,1]].each do
                if (search_direction(arr, x, y, *direction))
                    visible += 1
                    break
                end
            end
        else
            visible += 1
            next
        end
    }
}

puts visible
