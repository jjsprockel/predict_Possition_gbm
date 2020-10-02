library(shiny)
library(caret) # we will use caret for calculate the gbm model

# load the trained ml model (gbm)
model_gbm <- readRDS(file = './gbm_courseproject.rda')

# Define server logic required to calculate the result of the model
shinyServer(function(input, output) {
    
    model_gbm_predict <- reactive ({
        # create the data frame with the inputs to do the prediction 
        newdata<- data.frame(roll_belt= input$roll_belt,
                             accel_belt_z=  input$accel_belt_z,
                             magnet_belt_y= input$magnet_belt_y,
                             magnet_dumbbell_y= input$magnet_dumbbell_y,
                             roll_forearm= input$roll_forearm,
                             pitch_forearm= input$pitch_forearm)
        
        # do the prediction from data 
        predict(model_gbm, newdata)
    })
    
    # display the result
    output$prediction <- renderText({model_gbm_predict()})
})
