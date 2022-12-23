library(shiny)
library(shinythemes)

#THE USER INTERFACE

ui <- fluidPage(theme = shinytheme("superhero"),
                h2("QUADRATIC EQUATION SOLVER"),
                h4("Enter coefficients from here"),
                
                sidebarPanel(numericInput(inputId = "a",label = "a",value = 0),
                          
                numericInput(inputId = "b",label = "b",value = 0),
                
                numericInput(inputId = "c", label = "c",value = 0)
                ),
                
                mainPanel(
                  h1("ROOTS"),
                  verbatimTextOutput("dtls")
                ))

#THE SERVER
server <- function(input, output){
  output$dtls = renderText({
    number = input$b*input$b - 4*input$a*input$c
    if(input$a==0){
      paste("Infinity")
    }else{
      if(number<0){
        real_num = (-1*input$b)/(2*input$a)
        complex_num = sqrt(-1*number)/(2*input$a)
        paste("X1:",round(real_num,digits = 3),"+",round(complex_num,digits = 3),"i", "\nX2:",round(real_num,digits = 3),"-",round(complex_num,digits = 3),"i")
      }else{
        square_root = sqrt(number)
        root1 = (-1*input$b + square_root)/(2*input$a)
        root2 = (-1*input$b - square_root)/(2*input$a)
        paste("X1:",round(root1,digits = 3), "\nX2:",round(root2,digits = 3))
      }
    }
  })
}

#SHINY APP
shinyApp(ui = ui, server = server)