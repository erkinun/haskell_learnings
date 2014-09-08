import Metric

reportMeasurement :: Measurement -> String
reportMeasurement (Metric.MetricMeasurement val unit) 
  = (show val) ++ " " ++ (show unit)
reportMeasurement measure
  = reportMeasurement (convert measure)
