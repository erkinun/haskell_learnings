main = do   
    line <- getLine  
    let isNull = null line
    case isNull of 
                 True -> return ()
                 False -> do 
                   putStrLn $ reverseWords line  
                   main  
  
--    if null line  
  --      then return ()  
    --    else do  
      --      putStrLn $ reverseWords line  
        --    main  
  
reverseWords :: String -> String  
reverseWords line  = unwords . map reverse . words $ line
