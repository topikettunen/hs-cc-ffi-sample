{-# LANGUAGE ForeignFunctionInterface #-}

module Main where

import Control.Exception ( mask_ )
import Foreign.Ptr ( FunPtr, Ptr )
import Foreign.C.Types ( CInt(..) )
import Foreign.ForeignPtr ( ForeignPtr, newForeignPtr, withForeignPtr )

data Arith

foreign import ccall unsafe "arith_capi.h arith_new" c_arithNew :: IO (Ptr Arith)
foreign import ccall unsafe "arith_capi.h &arith_delete" c_arithDelete :: FunPtr (Ptr Arith -> IO ())
foreign import ccall unsafe "arith_capi.h arith_add" c_arithAdd :: Ptr Arith -> CInt -> CInt -> IO CInt
foreign import ccall unsafe "arith_capi.h arith_sub" c_arithSub :: Ptr Arith -> CInt -> CInt -> IO CInt
foreign import ccall unsafe "arith_capi.h arith_mult" c_arithMult :: Ptr Arith -> CInt -> CInt -> IO CInt
foreign import ccall unsafe "arith_capi.h arith_div" c_arithDiv :: Ptr Arith -> CInt -> CInt -> IO CInt

-- | Create new foreign object that will be cleaned after it's not in use
-- anymore. It also uses mask_ in case the pointer leaks if exception happens.
newArith :: IO (ForeignPtr Arith)
newArith = mask_ c_arithNew >>= newForeignPtr c_arithDelete

main :: IO ()
main = newArith >>= \arith -> withForeignPtr arith $ \ptr -> do
  -- Foreign object is now unwrapped to a foreign pointer which you can use in
  -- any FFI function you described above.
  c_arithAdd ptr 1 1 >>= print
  c_arithSub ptr 1 1 >>= print
  c_arithMult ptr 2 2 >>= print
  c_arithDiv ptr 2 2 >>= print
