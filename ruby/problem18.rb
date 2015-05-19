# Project Euler  - solution to problems 18 and 67
triangles = []

triangles <<  [75,95,64,17,47,82,18,35,87,10,20,4,82,47,65,19,1,23,75,3,34,88,2,77,73,7,63,67,99,65,4,28,6,16,70,92,41,41,26,56,83,40,80,70,33,41,48,72,33,47,32,37,16,94,29,53,71,44,65,25,43,91,52,97,51,14,70,11,33,28,77,73,17,78,39,68,17,57,91,71,52,38,17,14,91,43,58,50,27,29,48,63,66,4,68,89,53,67,30,73,16,69,87,40,31,4,62,98,27,23,9,70,98,73,93,38,53,60,4,23]

def makeTriangle(ar)
    rowCount=0
    $rowsArr=[]
    while ar.size > 0
      $rowsArr[rowCount] = []
      reducer = rowCount+1
      while reducer > 0
       $rowsArr[rowCount].push(ar.shift)
       reducer-=1
      end
    rowCount+=1
    end
    $rowsArr
end

def solveTriangle(triangle) 
numRows = triangle.length()-1
while numRows > 0
  $ar= Array.new
  $rowsArr[numRows-1].each_index{|i|
    sumFirstRoute = triangle[numRows-1][i]+triangle[numRows][i]
    sumLastRoute = triangle[numRows-1][i]+triangle[numRows][i+1]
    higher = sumFirstRoute>sumLastRoute  ? sumFirstRoute : sumLastRoute
    triangle[numRows-1][i]=  higher
  }
  numRows-=1 
end
triangle[0][0]
end
triangles.each{|tri| puts "Max attainable value from triangle\: #{solveTriangle( makeTriangle(tri))}"}