#

library(shiny)

shinyUI(fluidPage(
  titlePanel("Swiss Dataset: Predicting Fertility from Agriculture, Examination, and Education Values"),
  h4("Outcome is a standard measure of fertility from a 0 to 100 scale"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("sliderAgri", "Select agriculture value", 0, 100, value = 50),
      sliderInput("sliderExam", "Select examination value", 0, 100, value = 50),
      sliderInput("sliderEducation", "Select education value", 0, 100, value = 50),
      submitButton("Submit")
    ),
    mainPanel(
      h3("Predicted Fertility from Model 1:"),
      h5("Modeling on Agriculture"),
      textOutput("pred1"),
      h3("Predicted Fertility from Model 2:"),
      h5("Modeling on Agriculture and Examination"),
      textOutput("pred2"),
      h3("Predicted Fertility from Model 3:"),
      h5("Modeling on Agriculture, Examination, and Education"),
      textOutput("pred3")
    )
  )
))

