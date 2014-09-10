import Control.Applicative ((<$>))
import Data.Maybe (fromJust)
import Network.Browser
import Network.HTTP
import Network.HTTP.Proxy (parseProxy)

main = do
  rsp <- browse $ do
    setProxy . fromJust $ parseProxy "proxy.network.com:3128"
    request $ getRequest "http://www.google.com"
  print $ rspBody <$> rsp
