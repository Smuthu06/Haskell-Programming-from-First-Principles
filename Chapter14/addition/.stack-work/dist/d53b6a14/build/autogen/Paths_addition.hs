{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -Wno-missing-safe-haskell-mode #-}
module Paths_addition (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "D:\\Sankar\\Haskell\\Haskell Programming\\Chapter14\\addition\\.stack-work\\install\\30ba7c82\\bin"
libdir     = "D:\\Sankar\\Haskell\\Haskell Programming\\Chapter14\\addition\\.stack-work\\install\\30ba7c82\\lib\\x86_64-windows-ghc-9.0.2\\addition-0.1.0.0-3zmc8UiIMON6lqN4GunWo2"
dynlibdir  = "D:\\Sankar\\Haskell\\Haskell Programming\\Chapter14\\addition\\.stack-work\\install\\30ba7c82\\lib\\x86_64-windows-ghc-9.0.2"
datadir    = "D:\\Sankar\\Haskell\\Haskell Programming\\Chapter14\\addition\\.stack-work\\install\\30ba7c82\\share\\x86_64-windows-ghc-9.0.2\\addition-0.1.0.0"
libexecdir = "D:\\Sankar\\Haskell\\Haskell Programming\\Chapter14\\addition\\.stack-work\\install\\30ba7c82\\libexec\\x86_64-windows-ghc-9.0.2\\addition-0.1.0.0"
sysconfdir = "D:\\Sankar\\Haskell\\Haskell Programming\\Chapter14\\addition\\.stack-work\\install\\30ba7c82\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "addition_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "addition_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "addition_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "addition_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "addition_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "addition_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
