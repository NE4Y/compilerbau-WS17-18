module Main (module Main) where

import           ABSTree
import           Arithmetic.Steps
import           BitWiseOperation.Steps
import           ClassAssign.Steps
import           ClassMethods.Steps
import           Control.Exception
import           Data.List
import           EmptyClass.Steps
import           ForLoop.Steps
import           InstanzVariable.Steps
import           Lexer
import           Lexer.Token
import           LocalVariable.Steps
import           LogicOperations.Steps
import           Parser
import           SimpleIf.Steps
import           System.Directory
import           System.IO.Unsafe
import           WhileLoop.Steps
import           WhileLoopCondition.Steps


data TestUnit = LexerUnit String [Token] -- TestName, TestTokens
              | ParserUnit String [Class] -- Testname, TestClasses, fromTokens
                deriving(Eq, Show)

data Color
    = Green
    | Purple
    | Blue

color :: Color -> String -> String
color Green text  = "\x1b[32m" ++ text ++ "\x1b[0m"
color Purple text = "\x1b[35m" ++ text ++ "\x1b[0m"
color Blue text   = "\x1b[36m" ++ text ++ "\x1b[0m"

--catchAny :: IO a -> (SomeException -> IO a) -> IO a
catchAny = Control.Exception.catch

getLexerName :: TestUnit -> String
getLexerName (LexerUnit name testToken) = name

getLexerTestToken :: TestUnit -> [Token]
getLexerTestToken (LexerUnit name testToken) = testToken

getLexerRealToken :: TestUnit -> [Token]
getLexerRealToken (LexerUnit name testToken) = readTokens name

readTokens :: String -> [Token]
readTokens s = Lexer.lex (unsafePerformIO . readFile $ ("./test/" ++ s ++ "/Class.java"))

runTest :: TestUnit -> Bool
runTest (LexerUnit name expectedTokens) = catchAny (let tokens = readTokens name
                                          in
                                          readTokens name == expectedTokens) $ \e -> return False

runTest (ParserUnit name expectedClass) = catchAny (let parserClass = Parser.parse (readTokens name)
                                          in
                                          expectedClass == parserClass) $ \e -> return False

evalTest :: TestUnit -> String
evalTest (LexerUnit name expectedTokens) = let tokens = readTokens name
                                           in
                                           if readTokens name == expectedTokens
                                               then color Green ("Lexer: [" ++ name ++ "] passed")
                                           else color Purple ("Lexer: [" ++ name ++ "] failed" ++ "\n\t")
                                                ++ color Blue "expected:" ++ show expectedTokens ++ "\n\t" ++
                                               color Blue "got:" ++ show tokens ++ "\n\t" ++
                                               "difference:" ++ show (nub ((expectedTokens \\ tokens) ++ (tokens \\ expectedTokens)))

evalTest (ParserUnit name expectedClass) = let parserClass = Parser.parse (readTokens name)
                                           in
                                           if expectedClass == parserClass
                                             then color Green ("Parser: [" ++ name ++ "] passed")
                                           else color Purple ("Parser: [" ++ name ++ "] failed" ++ "\n\t")
                                                ++ color Blue "expected:" ++ show expectedClass ++ "\n\t" ++
                                               color Blue "got:" ++ show parserClass ++ "\n\t" ++
                                               color Blue "difference:" ++ show (nub ((expectedClass \\ parserClass) ++ (parserClass \\ expectedClass)))
runTests :: [TestUnit] -> [Bool]
runTests = map runTest

evalTests :: [TestUnit] -> [String]
evalTests = map evalTest

numberOfSuccess :: [TestUnit] -> Int
numberOfSuccess a = sum (map (fromEnum . runTest) a)

-- used to replace multiple tokens with different parameters
skipParameter :: Token -> Token
skipParameter (IDENTIFIER s)        = IDENTIFIER ""
skipParameter (BOOLEAN_LITERAL c)   = BOOLEAN_LITERAL True
skipParameter (CHARACTER_LITERAL c) = CHARACTER_LITERAL 'a'
skipParameter (INTEGER_LITERAL c)   = INTEGER_LITERAL 0
skipParameter a                     = a

tokenCovering :: [TestUnit] -> Int
tokenCovering a = length (nub (map skipParameter (foldr ((++) . getLexerRealToken) [] a))) -- get unique tokens used


lexTests :: [TestUnit]
lexTests = [LexerUnit "EmptyClass" emptyTokens,
            LexerUnit "InstanzVariable" instanzVariableTokens,
            LexerUnit "ClassAssign" classAssignTokens,
            LexerUnit "ClassMethods" classMethodTokens,
            LexerUnit "ForLoop" forLoopTokens,
            LexerUnit "LocalVariable" localVariableTokens,
            LexerUnit "SimpleIf" simpleIfTokens,
            LexerUnit "WhileLoop" whileLoopTokens,
            LexerUnit "WhileLoopCondition" whileLoopConditionTokens,
            LexerUnit "Arithmetic" arithmeticTokens,
            LexerUnit "LogicOperations" logicOperationsTokens,
            LexerUnit "BitWiseOperation" bitWiseOperationTokens
           ]

parserTests :: [TestUnit]
parserTests = [ParserUnit "EmptyClass" emptyABS,
               ParserUnit "InstanzVariable" instanzVariableABS,
               ParserUnit "ClassAssign" emptyABS
               ]

allTests :: [TestUnit]
allTests = lexTests ++ parserTests

main = do
       putStrLn "Lexer-Tests"

       putStrLn "-------------------------"
       mapM_ putStrLn (evalTests lexTests)
       putStrLn ""
       putStrLn (color Blue ("Tokencoverage: " ++ show (tokenCovering lexTests) ++ "/" ++ show (length Lexer.Token.all_tokens) ++ " (" ++ show (ceiling (fromIntegral (tokenCovering lexTests) / fromIntegral (length Lexer.Token.all_tokens) * 100)) ++ "%)"))
       putStrLn ""

       putStrLn "Parser-Tests"
       putStrLn "-------------------------"
       mapM_ putStrLn (evalTests parserTests)

       putStrLn ""

       putStrLn (color Blue ("Testresults: " ++ show (numberOfSuccess allTests) ++ "/" ++ show (length allTests) ++ " (" ++ show (ceiling (fromIntegral (numberOfSuccess allTests) / fromIntegral (length allTests) * 100)) ++ "%) passed"))

