#

library(shiny)

data(swiss)

shinyServer(function(input, output) {
  model1 <- lm(Fertility ~ Agriculture, data = swiss)
  model2 <- lm(Fertility ~ Agriculture, Examination, data = swiss)
  model3 <- lm(Fertility ~ Agriculture, Examination, Education, data = swiss)
  
  model1pred <- reactive({
    agriInput <- input$sliderAgri
    predict(model1, newdata = data.frame(Agriculture = agriInput))
  })
  
  model2pred <- reactive({
    examInput <- input$sliderExam
    predict(model2, newdata = data.frame(Agriculture = examInput))
  })
  
  model3pred <- reactive({
    eduInput <- input$sliderEducation
    predict(model3, newdata = data.frame(Agriculture = eduInput))
  })
  
    output$pred1 <- renderText({
      model1pred()
    })
  
    output$pred2 <- renderText({
     model2pred()
    })
 
    output$pred3 <- renderText({
     model3pred()
    })
})
