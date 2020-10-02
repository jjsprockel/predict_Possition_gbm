library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Predicting Possition from Accelerometers Data through Stochastic Gradient Boosting "),

    # Sidebar with a slider input for Accelerometers Data
    sidebarLayout(
        sidebarPanel(
            h3("Introduce the Accelerometers Data"),
            
            # to receive the six numeric inputs 
            numericInput('roll_belt', 'roll_belt', 1.41, min = -28.9, max = 162),
            numericInput('accel_belt_z', 'accel_belt_z', 22, min = -275, max = 105),
            numericInput('magnet_belt_y', 'magnet_belt_y', 599, min = 354, max = 667),
            numericInput('magnet_dumbbell_y', 'magnet_dumbbell_y', 293, min = -3600, max = 633),
            numericInput('roll_forearm', 'roll_forearm', 28.4, min = -180, max = 180),
            numericInput('pitch_forearm', 'pitch_forearm', -63.9, min = -72.5, max = 90),
            
            # With this button the inputs are sended for do the predict
            submitButton('Predict')
        ),
        # Explain the app and release the results
        mainPanel(
            br(),
            br(),
            br(),
            tags$h4("With this shiny prediction app, you can insert data from acelerometers 
                        and get back predictions about one of five body possitions. 
                        The model is based in a Stochastic Gradient Boosting.", style="font-size:150%"),
            
            br(),
            br(),
            h2('Results of prediction'),
            br(),
            br(),
            h4('Based on the supplied accelerometer data, the predicted position is: '),
            
            # her is where the result of the prediction is displayed
            textOutput("prediction"),
            
            h3("Were:"),
            h4("1: sitting"),
            h4("2: sitting down"),
            h4("3: standing"),
            h4("4: standing up"),
            h4("5: walking")
                
        )
    )
))
