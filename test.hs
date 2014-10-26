import Metric

reportMeasurement :: Measurement -> String
reportMeasurement (Metric.MetricMeasurement val unit) 
  = (show val) ++ " " ++ (show unit)
reportMeasurement measure
  = reportMeasurement (convert measure)

test2 :: String -> Int -> Bool
test2 str i = False
