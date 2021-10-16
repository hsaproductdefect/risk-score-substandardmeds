

#Load package libraries
library(shiny)



f <- c(2) 
data1 <- as.data.frame(f)
#----------------------------------------------------------------------------------------	
#Define user-input 
shinyServer(function(input, output, session) {
  

  all.data <- reactive({
  
    vizDc <- as.factor(input$vizD)
    ORAc <- as.factor(input$ORA)
    TXIDc <- as.factor(input$Txid)
    meddrac <- as.factor(input$meddra)
    
    
    if (TXIDc == 3) {
      coeff_txid = 0
      output$TXIDDisplay <- renderText(paste("- Medicine used for symptomatic relief"))
    }
    if (TXIDc == 2) {
      coeff_txid = 1.78
      output$TXIDDisplay <- renderText(paste("- Medicine used for treatment of disease"))
    }
    if (TXIDc == 4) {
      coeff_txid = 1.78
      output$TXIDDisplay <- renderText(paste("- Medicine used for diagnostic purposes"))
    }
    if (TXIDc == 5) {
      coeff_txid = 1.78
      output$TXIDDisplay <- renderText(paste("- Medicine used as a prophylactic vaccine"))
    }
    if (as.factor(input$Txid) == 1) {
      coeff_txid = 2.74
      output$TXIDDisplay <- renderText(paste("- Medicine used as a lifesaving agent"))
    }
    
    
    #visual detectability 
    if (vizDc == 2) {
      
      coeff_viz = 1.04
      output$vizDdisplay <- renderText(paste("- Defect is not / poorly visible"))
    }
    else {
      coeff_viz = 0
      output$vizDdisplay <- renderText(paste("- Defect is visible"))
    }
    
    #Overseas reg action 
    
    if (ORAc == 3) {
      coeff_ora = -0.84 
      output$ORADisplay <- renderText(paste("- Overseas regulatory action not known"))
    }
    if (ORAc == 2) {
      coeff_ora = 0  
      output$ORADisplay <- renderText(paste("- No overseas regulatory action"))
    }
    if (ORAc == 1) {
      coeff_ora = 1.3
      output$ORADisplay <- renderText(paste("- Overseas regulatory action already taken"))
    }
    
    #THERAPEUTIC INDIC 

    
    #meddra 
    if (meddrac == 3 | meddrac == 4 | meddrac == 6| meddrac == 7|
        meddrac == 8| meddrac == 10| meddrac == 25| meddrac == 29) {
      coeff_meddra = 2.69
      output$meddraDisplay <- renderText(paste("- Nature of defect: severe"))
    }
    else {
      coeff_meddra = 0
      output$meddraDisplay <- renderText(paste("- Nature of defect: not severe"))
    }
    
    #meddra severe
    if (meddrac == 8) {
      
      output$meddraDisplay2 <- renderText(paste("- Nature of defect: Product inner label issue impacting strength, dose and/or safety "))
    }
    else if (meddrac == 7) {
      
      output$meddraDisplay2 <- renderText(paste("- Nature of defect: Product mix up  "))
    }
    else if (meddrac == 6) {
      
      output$meddraDisplay2 <- renderText(paste("- Nature of defect: Contamination with body fluid  "))
    }
    else if (meddrac == 3) {
    
      output$meddraDisplay2 <- renderText(paste("- Nature of defect: Contamination with microbes  "))
    }
    else if (meddrac == 4) {
      
      output$meddraDisplay2 <- renderText(paste("- Nature of defect: Contamination with glass and/or metal particle  "))
    }
    else if (meddrac == 10) {
      
      output$meddraDisplay2 <- renderText(paste("- Nature of defect: Product outer label issue impacting strength, dose and/or safety  "))
    }
    else if (meddrac == 25) {
      
      output$meddraDisplay2 <- renderText(paste("- Nature of defect: Product counterfeit  "))
    }
    else if (meddrac == 29) {
      
      output$meddraDisplay2 <- renderText(paste("- Nature of defect: Product formulation issue  "))
    }
    
    ##meddra non-severe 
    else if (meddrac == 2) {
      
      output$meddraDisplay2 <- renderText(paste("- Nature of defect: Contamination with chemical substance   "))
    }
    else if (meddrac == 1) {
      
      output$meddraDisplay2 <- renderText(paste("- Nature of defect: Accompanying dose delivery device issue   "))
    }
    else if (meddrac == 5) {
      
      output$meddraDisplay2 <- renderText(paste("- Nature of defect: Contamination with foreign matter "))
    }
    else if (meddrac == 9) {
      
      output$meddraDisplay2 <- renderText(paste("- Nature of defect: Product inner label issue NOT impacting strength, dose and/or safety"))
    }
    else if (meddrac == 11) {
      
      output$meddraDisplay2 <- renderText(paste("- Nature of defect: Product outer label issue NOT impacting strength, dose and/or safety"))
    }
    else if (meddrac == 12) {
      
      output$meddraDisplay2 <- renderText(paste("- Nature of defect: Product leaflet missing"))
    }
    else if (meddrac == 13) {
      
      output$meddraDisplay2 <- renderText(paste("- Nature of defect: Product leaflet issue impacting strength, dose and/or safety  "))
    }
    else if (meddrac == 14) {
      
      output$meddraDisplay2 <- renderText(paste("- Nature of defect: Product leaflet missing"))
    }
    else if (meddrac == 15) {
      
      output$meddraDisplay2 <- renderText(paste("- Nature of defect: Product batch number missing, illegible or incorrect"))
    }
    else if (meddrac == 16) {
      
      output$meddraDisplay2 <- renderText(paste("- Nature of defect: Product expiration date missing, illegible or incorrect"))
    }
    else if (meddrac == 17) {
      
      output$meddraDisplay2 <- renderText(paste("- Nature of defect: Product primary packaging issue"))
    }
    else if (meddrac == 18) {
      
      output$meddraDisplay2 <- renderText(paste("- Nature of defect: Product secondary packaging issue"))
    }
    else if (meddrac == 19) {
      
      output$meddraDisplay2 <- renderText(paste("- Nature of defect: Product adhesion issue"))
    }
    else if (meddrac == 20) {
      
      output$meddraDisplay2 <- renderText(paste("- Nature of defect: Product deposit"))
    }
    else if (meddrac == 21) {
      
      output$meddraDisplay2 <- renderText(paste("- Nature of defect: Product physical issue"))
    }
    else if (meddrac == 22) {
      
      output$meddraDisplay2 <- renderText(paste("- Nature of defect: Product volume incorrect"))
    }
    else if (meddrac == 23) {
      
      output$meddraDisplay2 <- renderText(paste("- Nature of defect: Product quantity incorrect"))
    }
    else if (meddrac == 24) {
      
      output$meddraDisplay2 <- renderText(paste("- Nature of defect: Product adulterated and/or contains prohibited substance"))
    }
    else if (meddrac == 26) {
      
      output$meddraDisplay2 <- renderText(paste("- Nature of defect: Product unregistered"))
    }
    else if (meddrac == 27) {
      
      output$meddraDisplay2 <- renderText(paste("- Nature of defect: Out of specification or out of trend test result"))
    }
    else if (meddrac == 28) {
      
      output$meddraDisplay2 <- renderText(paste("- Nature of defect: Manufacturing non-compliance"))
    }
    else if (meddrac == 30) {
      
      output$meddraDisplay2 <- renderText(paste("- Nature of defect: Product storage issue"))
    }
    else if (meddrac == 31) {
      
      output$meddraDisplay2 <- renderText(paste("- Nature of defect: Inappropriate release of product for distribution"))
    }
    else if (meddrac == 32) {
      
      output$meddraDisplay2 <- renderText(paste("- Nature of defect: Lack of efficacy"))
    }
    
    else {
  
      output$meddraDisplay2 <- renderText(paste("- Nature of defect: not severe"))
    }
    

    
  #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
   
  coeffsum =  coeff_viz + coeff_ora + coeff_meddra + coeff_txid - 4.88 
  
 data1$y = 100*(1.0 / (1.0 + exp(-coeffsum)))
 data1$high <- ifelse(data1$y>20,"Yes","No")
 return(data1)
  

 	})#Brackets closing "reactive" expression

  output$statement <- renderText ({paste("Probability of case resulting in high public health impact:", round(all.data()[,2], digits=0),"%")})
  output$class <- renderText ({paste("Prioritized case management required?", all.data()[1,3])})
  
    
    
  })	#Brackets closing "shinyServer" function
