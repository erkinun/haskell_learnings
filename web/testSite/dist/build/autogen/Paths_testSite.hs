module Paths_testSite (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,1], versionTags = []}
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/erkin.unlu/Library/Haskell/ghc-7.6.3/lib/testSite-0.1/bin"
libdir     = "/Users/erkin.unlu/Library/Haskell/ghc-7.6.3/lib/testSite-0.1/lib"
datadir    = "/Users/erkin.unlu/Library/Haskell/ghc-7.6.3/lib/testSite-0.1/share"
libexecdir = "/Users/erkin.unlu/Library/Haskell/ghc-7.6.3/lib/testSite-0.1/libexec"
sysconfdir = "/Users/erkin.unlu/Library/Haskell/ghc-7.6.3/lib/testSite-0.1/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "testSite_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "testSite_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "testSite_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "testSite_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "testSite_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
