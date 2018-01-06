module Codegen.GenerateFields (
  generateFields
) where

import ABSTree
import Codegen.Data.ClassFormat
import Codegen.GenerateConstantPool
import Data.Char(ord)
import Control.Lens
import Control.Monad.Trans.State.Lazy

generateFields :: ClassFile ->  [FieldDecl] -> ClassFile
generateFields = foldl generateFD

generateFD :: ClassFile -> FieldDecl -> ClassFile
generateFD cf (FieldDecl vds vis static) 
  = foldl (generateVD vis static) cf vds

generateVD :: Visibility 
           -> Bool 
           -> ClassFile 
           -> VariableDecl 
           -> ClassFile
generateVD vis static cf (VariableDecl name typ final mayExpr)
  = execState 
     (do indexName <- generateUTF8 name 
         indexType <- generateUTF8 $ typeToDescriptor typ 
         attrFields <- generateAttrFields mayExpr 
         let accessFlags = visToFlag vis : [8 | static] ++ [4 | final]
             fieldInfo = FieldInfo { _afFi = AccessFlags accessFlags
                                   , _indexNameFi = indexName
                                   , _indexDescrFi = indexType
                                   , _tamFi = length attrFields
                                   , _arrayAttrFi = attrFields 
                                   } 
         modify $ (countFields +~ 1) . over arrayFields (fieldInfo:))
     cf
           

generateAttrFields :: Maybe Expr 
                   -> State ClassFile AttributeInfos
generateAttrFields Nothing  = return [] 
generateAttrFields (Just expr) = 
  do indexName <- generateUTF8 "constant"
     indexValue <- exprToConstantPool expr 
     return [AttributeConstantValue { _indexNameAttr = indexName
                                    , _tamAttr = 2
                                    , _indexValueAttr = indexValue
                                    }]

-- helper functions

exprToConstantPool ::  Expr -> State ClassFile Int
exprToConstantPool (BooleanLiteral True)  = generateInteger 1
exprToConstantPool (BooleanLiteral False) = generateInteger 1
exprToConstantPool (CharLiteral char)     = generateInteger $ ord char 
exprToConstantPool (IntegerLiteral int)   = generateInteger $ fromIntegral int 

visToFlag :: Visibility -> Int
visToFlag Public = 1
visToFlag Private = 2
-- visToFlag Protected = 4

typeToDescriptor :: String -> String
typeToDescriptor "boolean" = "Z"
typeToDescriptor "char" = "C"
typeToDescriptor "int" = "I"
