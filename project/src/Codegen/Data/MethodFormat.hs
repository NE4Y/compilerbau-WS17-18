module Codegen.Data.MethodFormat where

-- TODO Add complete assembler from 
-- https://docs.oracle.com/javase/specs/jvms/se7/html/jvms-6.html#jvms-6.5.astore
data Assembler = Aload0
               | Aload1
               | Aload2
               | Aload3
               | Aload 
                   { index :: Int } 
               | Invokespecial 
                   { indexbyte1 :: Int
                   , indexbyte2 :: Int
                   }
               | Return
               | Iconst0
               | Iconst1
               | Iconst2
               | Iconst3
               | Iconst4
               | Iconst5
               | Bipush Int 
               | Putfield 
                   { indexbyte1 :: Int
                   , indexbyte2 :: Int
                   }
               | Getfield 
                   { indexbyte1 :: Int
                   , indexbyte2 :: Int
                   }
               | Iadd
               | IStore0
               | IStore1 
               | IStore2 
               | IStore3 
               | IStore Int
               | Iinc
                   { index :: Int
                   , const :: Int
                   }
               | New 
                   { indexbyte1 :: Int
                   , indexbyte2 :: Int
                   }
               | Dup
               | Astore0
               | Astore1
               | Astore2
               | Astore3
               | Astore 
                   { index :: Int }
               | Iload0
               | Iload1
               | Iload2
               | Iload3
               | Iload 
                   { index :: Int }
               | Invokevirtual
                   { indexbyte1 :: Int
                   , indexbyte2 :: Int
                   }
               | Areturn
               | Ireturn
               | IfIcmpEq
                   { branchbyte1 :: Int
                   , branchbyte2 :: Int
                   }
               | IfIcmpNe
                   { branchbyte1 :: Int
                   , branchbyte2 :: Int
                   }
               | IfIcmpLt
                   { branchbyte1 :: Int
                   , branchbyte2 :: Int
                   }
               | IfIcmpGe
                   { branchbyte1 :: Int
                   , branchbyte2 :: Int
                   }
               | IfIcmpGt
                   { branchbyte1 :: Int
                   , branchbyte2 :: Int
                   }
               | IfIcmpLe
                   { branchbyte1 :: Int
                   , branchbyte2 :: Int
                   }

type Code = [Assembler]

codeToInt :: Code                       -> [Int] 
codeToInt (Aload0:xs)                   = 0x2a : codeToInt xs
codeToInt (Aload1:xs)                   = 0x2b : codeToInt xs
codeToInt (Aload2:xs)                   = 0x2c : codeToInt xs
codeToInt (Aload3:xs)                   = 0x2d : codeToInt xs
codeToInt (Aload ind :xs)               = 0x19 : ind : codeToInt xs
codeToInt (Invokespecial ind1 ind2 :xs) = 0xb7 : ind1 : ind2 : codeToInt xs
codeToInt (Return:xs)                   = 0xb1 : codeToInt xs
codeToInt (Iconst0:xs)                  = 0x3  : codeToInt xs
codeToInt (Iconst1:xs)                  = 0x4  : codeToInt xs
codeToInt (Iconst2:xs)                  = 0x5  : codeToInt xs
codeToInt (Iconst3:xs)                  = 0x6  : codeToInt xs
codeToInt (Iconst4:xs)                  = 0x7  : codeToInt xs
codeToInt (Iconst5:xs)                  = 0x8  : codeToInt xs
codeToInt (Bipush ind :xs)              = 0x10 : ind : codeToInt xs
codeToInt (Putfield  b1 b2:xs)          = 0xb5 : b1 : b2 : codeToInt xs
codeToInt (Getfield  b1 b2:xs)          = 0xb4 : b1 : b2 : codeToInt xs
codeToInt (Iadd:xs)                     = 0x60 : codeToInt xs
codeToInt (IStore0:xs)                  = 0x59 : codeToInt xs
codeToInt (IStore1 :xs)                 = 0x60 : codeToInt xs
codeToInt (IStore2 :xs)                 = 0x61 : codeToInt xs
codeToInt (IStore3 :xs)                 = 0x62 : codeToInt xs
codeToInt (IStore ind:xs)               = 0x36 : ind : codeToInt xs
codeToInt (Iinc ind con:xs)             = 0x84 : ind : con : codeToInt xs
codeToInt (New  ind1 ind2:xs)           = 0xbb : ind1 : ind2 : codeToInt xs
codeToInt (Dup:xs)                      = 0x59 : codeToInt xs
codeToInt (Astore0:xs)                  = 0x75 : codeToInt xs
codeToInt (Astore1:xs)                  = 0x76 : codeToInt xs
codeToInt (Astore2:xs)                  = 0x77 : codeToInt xs
codeToInt (Astore3:xs)                  = 0x78 : codeToInt xs
codeToInt (Astore ind :xs)              = 0x3a : ind : codeToInt xs
codeToInt (Iload0:xs)                   = 0x1a : codeToInt xs
codeToInt (Iload1:xs)                   = 0x1b : codeToInt xs
codeToInt (Iload2:xs)                   = 0x1c : codeToInt xs
codeToInt (Iload3:xs)                   = 0x1d : codeToInt xs
codeToInt (Iload ind :xs)               = 0x15 : ind : codeToInt xs
codeToInt (Invokevirtual ind1 ind2:xs)  = 0xb6 : ind1 : ind2 : codeToInt xs
codeToInt (Areturn:xs)                  = 0xb0 : codeToInt xs
codeToInt (Ireturn:xs)                  = 0xac : codeToInt xs
codeToInt (IfIcmpEq b1 b2:xs)           = 0x9f : b1 : b2 : codeToInt xs
codeToInt (IfIcmpNe b1 b2:xs)           = 0xa0 : b1 : b2 : codeToInt xs
codeToInt (IfIcmpLt b1 b2:xs)           = 0xa1 : b1 : b2 : codeToInt xs
codeToInt (IfIcmpGe b1 b2:xs)           = 0xa2 : b1 : b2 : codeToInt xs
codeToInt (IfIcmpGt b1 b2:xs)           = 0xa3 : b1 : b2 : codeToInt xs
codeToInt (IfIcmpLe b1 b2:xs)           = 0xa4 : b1 : b2 : codeToInt xs
