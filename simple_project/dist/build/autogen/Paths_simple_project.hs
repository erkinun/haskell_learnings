module Paths_simple_project (
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
version = Version {versionBranch = [0,1,0,0], versionTags = []}
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/erkin.unlu/Library/Haskell/ghc-7.6.3/lib/simple-project-0.1.0.0/bin"
libdir     = "/Users/erkin.unlu/Library/Haskell/ghc-7.6.3/lib/simple-project-0.1.0.0/lib"
datadir    = "/Users/erkin.unlu/Library/Haskell/ghc-7.6.3/lib/simple-project-0.1.0.0/share"
libexecdir = "/Users/erkin.unlu/Library/Haskell/ghc-7.6.3/lib/simple-project-0.1.0.0/libexec"
sysconfdir = "/Users/erkin.unlu/Library/Haskell/ghc-7.6.3/lib/simple-project-0.1.0.0/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "simple_project_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "simple_project_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "simple_project_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "simple_project_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "simple_project_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
