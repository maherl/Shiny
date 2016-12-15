library(shiny)
Advertising <- read.csv("~/Stat159/shinylab/Advertising.csv")


ui <- fluidPage(
  selectInput(inputId = "media", 
    label = "Choose a media", 
    choices = c("TV", "Radio", "Newspaper")),
  plotOutput("scatter")
)

server <- function(input, output) {
  output$scatter <- renderPlot({
    plot(Advertising[,input$media], Advertising$Sales)
  })
}

shinyApp(ui = ui, server = server)