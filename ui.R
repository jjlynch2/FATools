library(networkD3)
library(shinyWidgets)
library(shiny)
shinyUI(
  fluidPage(
    fluidRow(
      column(12,
        prettyRadioButtons("radio", h3(""), inline=TRUE, shape="curve", choices = list("Source Code" = 2, "Programming Language" = 1, "License" = 3), selected = 2)
      )
    ),
    fluidRow(
      column(4,
             forceNetworkOutput("forceNetworkOSM")
      )
    )
  )
)