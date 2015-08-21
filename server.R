METRIC   = 1; 
IMPERIAL = 2; 
bmi <- function(mass, height, units) { 
  bmi = mass / height^2 
  if (units == IMPERIAL) { 
    bmi = bmi * 703 
  } 
  return (bmi) } 

shinyServer(function(input, output) { 
       output$input <- renderText({ 
               if (input$units == METRIC) { 
                         unit.weight = "kg" 
                           unit.height = "m" 
                   } else { 
                           unit.weight = "lb" 
                           unit.height = "in" 
                   } 
                    
                   paste0("You are ", "<strong>",input$mass, " ", unit.weight, " @ ", input$height, " ", unit.height, "</strong>") 
           }) 
          
         output$result <- renderText({ 
                   bmi = bmi(mass = input$mass, height = input$height, units = input$units) 
                    
                   if      (bmi <  15.0) info = "<span style='color: red'>Very severely underweight</span>" 
                   else if (bmi <= 16.0) info = "<span style='color: red'>Severely underweight</span>" 
                   else if (bmi <= 18.5) info = "<span style='color: orange'>Underweight</span>" 
                   else if (bmi <= 25.0) info = "<span style='color: green'>Normal (healthy weight)</span>" 
                   else if (bmi <= 30.0) info = "<span style='color: orange'>Overweight</span>" 
                   else if (bmi <= 35.0) info = "<span style='color: red'>Obese Class I (Moderately obese)</span>" 
                   else if (bmi <= 40.0) info = "<span style='color: red'>Obese Class II (Severely obese)</span>" 
                   else                  info = "<span style='color: red'>Obese Class III (Very severely obese)</span>" 
                    
                   paste0("Your BMI is ", "<code>", round(bmi, 2), "</code>", ", which is: ", info) 
           }) 
            
          
   }) 

