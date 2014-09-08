module Metric

(MetricUnit(..),
 ImperialUnit(..),
 Measurement(..),
 convert)

where

data MetricUnit = Meter | Liter | KiloGram deriving (Show, Eq)

symbol :: MetricUnit -> String
symbol Meter = "m"
symbol Liter = "L"
symbol KiloGram = "kg"

data ImperialUnit = Yard | Gallon | Pound deriving (Show)

data Measurement = MetricMeasurement Double MetricUnit
                   | ImperialMeasurement Double ImperialUnit
                     deriving (Show)

convert :: Measurement -> Measurement
convert (MetricMeasurement val metricUnit) = (ImperialMeasurement (val * (factor metricUnit)) (correspond metricUnit))
convert (ImperialMeasurement val impUnit) = (MetricMeasurement (val * factorImp impUnit) (correspondImp impUnit))

--factor :: a -> Double
factor Meter = 1.09361
factor Liter = 0.264172
factor KiloGram = 2.20462
factorImp Yard  = 1 / factor Meter
factorImp Gallon = 1 / factor Liter
factorImp Pound = 1 / factor KiloGram

--correspond :: a -> b
correspond Meter = Yard
correspond Liter = Gallon
correspond KiloGram = Pound
correspondImp Yard = Meter
correspondImp Gallon = Liter
correspondImp Pound = KiloGram
