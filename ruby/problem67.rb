# Project Euler  - solution to problems 18 and 67
triangles = []


tra = [] 
File.open('p67.txt').each_line {
  |line| 
  tra.push(line.strip.split(""))
}

tra.map! {|arr| arr.join("")}
tra = tra.join(" ")
triangles << tra.split(" ").map!{|el| el.to_i}


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