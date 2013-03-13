
width = 800
height = 300

salmon = "#FC6E60"
blue = "#6ED3CD"
dark_yellow = "#AEA020"
yellow = "#FEE92C"
gray = "#303031"

opacity = 0.5

data = [0,1,2,3,4,5,6,20,3,24,29,33,20,15,23,10,8,7,5,6,2,0]

extent = d3.extent(data)

x_scale = d3.scale.linear().domain([0,data.length]).range([20, width - 20])
y_scale = d3.scale.linear().domain(extent).range([height, 20])

area = d3.svg.area()
  .x((d,i) -> x_scale(i))
  .y0(height)
  .y1((d) -> y_scale(d))
  .interpolate('cardinal')

vis = d3.select("#vis").append("svg")
  .attr("width", width)
  .attr("height", height)
  .style("display", "block")
  .style("margin", "0 auto")
vis.append("rect")
  .attr("fill", "#fff")
  .attr("width", width)
  .attr("height", height)

vis.append("path")
  .datum(data)
  .attr("fill", salmon)
  .attr("opacity", opacity)
  .attr("d", area)

data = data.reverse()

vis.append("path")
  .datum(data)
  .attr("fill", gray)
  .attr("opacity", opacity)
  .attr("d", area)
y_scale.range([0, height - 20])

area.y0((d) -> y_scale(d))
  .y1(0)

vis.append("path")
  .datum(data)
  .attr("fill", blue)
  .attr("opacity", opacity)
  .attr("d", area)
