module UnitTests.LexTests (module UnitTests.LexTests) where

import           Arithmetic.Steps
import           BitWiseOperation.Steps
import           ClassAssign.Steps
import           ClassMethods.Steps
import           DoWhile.Steps
import           EmptyClass.Steps
import           ForLoop.Steps
import           InstanceOf.Steps
import           InstanzVariable.Steps
import           LocalVariable.Steps
import           LogicOperations.Steps
import           LogicOperations2.Steps
import           MethodCall.Steps
import           NewClass.Steps
import           ShortIf.Steps
import           SimpleIf.Steps
import           SwitchCase.Steps
import           Utils.SUnit
import           WhileLoop.Steps
import           WhileLoopCondition.Steps

lexTests :: [TestUnit]
lexTests = [LexerUnit "EmptyClass" emptyTokens,
            LexerUnit "InstanzVariable" instanzVariableTokens,
            LexerUnit "ClassAssign" classAssignTokens,
            LexerUnit "ClassMethods" classMethodTokens,
            LexerUnit "ForLoop" forLoopTokens,
            LexerUnit "LocalVariable" localVariableTokens,
            LexerUnit "SimpleIf" simpleIfTokens,
            LexerUnit "ShortIf" shortIfTokens,
            LexerUnit "SwitchCase" switchCaseTokens,
            LexerUnit "WhileLoop" whileLoopTokens,
            LexerUnit "WhileLoopCondition" whileLoopConditionTokens,
            LexerUnit "DoWhile" doWhileTokens,
            LexerUnit "Arithmetic" arithmeticTokens,
            LexerUnit "LogicOperations" logicOperationsTokens,
            LexerUnit "LogicOperations2" logicOperations2Tokens,
            LexerUnit "BitWiseOperation" bitWiseOperationTokens,
            LexerUnit "NewClass" newClassTokens,
            LexerUnit "InstanceOf" instanceOfTokens,
            LexerUnit "MethodCall" methodCallTokens
            ]