module ClassMethods.Steps where

import           ABSTree
import           Lexer.Token

classMethodTokens = [Lexer.Token.CLASS,
                    Lexer.Token.IDENTIFIER "ClassMethod",
                    Lexer.Token.LEFT_BRACE,
                    Lexer.Token.INTEGER,
                    Lexer.Token.IDENTIFIER "i",
                    Lexer.Token.ASSIGN,
                    Lexer.Token.JNULL,
                    Lexer.Token.SEMICOLON,
                    Lexer.Token.INTEGER,
                    Lexer.Token.IDENTIFIER "getInt",
                    Lexer.Token.LEFT_PARANTHESES,
                    Lexer.Token.RIGHT_PARANTHESES,
                    Lexer.Token.LEFT_BRACE,
                    Lexer.Token.RETURN,
                    Lexer.Token.INTEGER_LITERAL 1,
                    Lexer.Token.SEMICOLON,
                    Lexer.Token.RIGHT_BRACE,
                    Lexer.Token.PUBLIC,
                    Lexer.Token.STATIC,
                    Lexer.Token.INTEGER,
                    Lexer.Token.IDENTIFIER "returnInt",
                    Lexer.Token.LEFT_PARANTHESES,
                    Lexer.Token.INTEGER,
                    Lexer.Token.IDENTIFIER "x",
                    Lexer.Token.RIGHT_PARANTHESES,
                    Lexer.Token.LEFT_BRACE,
                    Lexer.Token.RETURN,
                    Lexer.Token.IDENTIFIER "x",
                    Lexer.Token.SEMICOLON,
                    Lexer.Token.RIGHT_BRACE,
                    Lexer.Token.PRIVATE,
                    Lexer.Token.INTEGER,
                    Lexer.Token.IDENTIFIER "doStuff",
                    Lexer.Token.LEFT_PARANTHESES,
                    Lexer.Token.RIGHT_PARANTHESES,
                    Lexer.Token.LEFT_BRACE,
                    Lexer.Token.RETURN,
                    Lexer.Token.IDENTIFIER "i",
                    Lexer.Token.SEMICOLON,
                    Lexer.Token.RIGHT_BRACE,
                    Lexer.Token.RIGHT_BRACE
                   ]


classMethodsABS = [Class "ClassMethod"
                   [FieldDecl [VariableDecl "i" "int" False (Just JNull)] Public False]
                   [MethodDecl "getInt" "int" []
                       (Block [Return (IntegerLiteral 1)]) Public False,
                    MethodDecl "returnInt" "int" [ArgumentDecl "x" "int" False]
                        (Block [Return (LocalOrFieldVar "x")]) Public True,
                    MethodDecl "doStuff" "int" []
                        (Block [Return (LocalOrFieldVar "i")]) Private False
                   ]
                  ]
