library(networkD3)
library(shinyWidgets)
library(shiny)
shinyServer(function(input, output, session) {
  links <- read.csv("/home/jjlynch/research/FATools/links.csv")
  nodes <- read.csv("/home/jjlynch/research/FATools/nodes.csv")
  index <- 1:nrow(nodes)
  s_nodes <- list(unique(nodes[,2]), unique(nodes[,3]), unique(nodes[,4]))
  for(i in index) {
    links[links[,1] == nodes[i,1],1] = i-1
    links[links[,2] == nodes[i,1],2] = i-1
  }
  grp = c('group1', 'group2', 'group3')
  col <- c("#fff0000", "#ea6011","#126a8f","#2f4f4f","#808000","#e9967a","#ba55d3","#8b0000","000000","#9acd32","#008000", "#000080", "#dda0dd", "#696969")
  observeEvent(input$radio, {  
    grp_ = grp[as.numeric(input$radio)]
    output$forceNetworkOSM <- renderForceNetwork({
      forceNetwork(Links = links, Nodes = nodes,
                   Source = "source", Target = "target",
                   Value = "value", NodeID = "name",
                   Group = grp_, opacity = 1,
                   Nodesize = "size",
                   opacityNoHover = 1,
                   colourScale = JS('d3.scaleOrdinal().range(["#fff0000", "#ea6011","#126a8f","#2f4f4f","#808000","#e9967a","#ba55d3","#8b0000","000000","#9acd32","#008000", "#000080", "#dda0dd", "#696969", "#1e90ff"])'),
                   zoom = FALSE,fontSize=10, bounded=TRUE, legend = TRUE,
                   linkDistance = JS('function(){d3.select("body").style("background-color", "#eeeeee"); return 50;}')
      )
    })
  })
})
