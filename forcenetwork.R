
  links <- read.csv("/home/jjlynch/research/FATools/links.csv")
  nodes <- read.csv("/home/jjlynch/research/FATools/nodes.csv")
  index <- 1:nrow(nodes)
  
  for(i in index) {
    links[links[,1] == nodes[i,1],1] = i-1
    links[links[,2] == nodes[i,1],2] = i-1
  }
  nodes[nodes[,3] == "Open",3] = 1
  nodes[nodes[,3] == "Closed",3] = 2
  nodes[nodes[,3] == "Category",3] = 3
    forceNetwork(Links = links, Nodes = nodes,
                 Source = "source", Target = "target",
                 Value = "value", NodeID = "name",
                 Group = "group2", opacity = 1,
                 Nodesize = "size",
                 opacityNoHover = 1,
                 colourScale = JS('d3.scaleOrdinal().domain(["1", "2"]).range(["#126a8f","ff0000","#ea6011"])'),
                 zoom = FALSE,fontSize=10,
                 linkDistance = JS('function(){d3.select("body").style("background-color", "#eeeeee"); return 50;}'))
    )

