module BitWiseOperation.Steps where

import           ABSTree
import           Lexer.Token

bitWiseOperationTokens = [Lexer.Token.CLASS,
                        Lexer.Token.IDENTIFIER "BitWiseOperation",
                        Lexer.Token.LEFT_BRACE,
                        Lexer.Token.VOID,
                        Lexer.Token.IDENTIFIER "doStuff",
                        Lexer.Token.LEFT_PARANTHESES,
                        Lexer.Token.RIGHT_PARANTHESES,
                        Lexer.Token.LEFT_BRACE,
                        Lexer.Token.INTEGER,
                        Lexer.Token.IDENTIFIER "a",
                        Lexer.Token.ASSIGN,
                        Lexer.Token.INTEGER_LITERAL 1,
                        Lexer.Token.SEMICOLON,
                        Lexer.Token.INTEGER,
                        Lexer.Token.IDENTIFIER "b",
                        Lexer.Token.ASSIGN,
                        Lexer.Token.INTEGER_LITERAL 2,
                        Lexer.Token.SEMICOLON,
                        Lexer.Token.IDENTIFIER "a",
                        Lexer.Token.ASSIGN,
                        Lexer.Token.IDENTIFIER "a",
                        Lexer.Token.BITWISE_AND,
                        Lexer.Token.IDENTIFIER "b",
                        Lexer.Token.SEMICOLON,
                        Lexer.Token.IDENTIFIER "a",
                        Lexer.Token.ASSIGN,
                        Lexer.Token.IDENTIFIER "a",
                        Lexer.Token.BITWISE_OR,
                        Lexer.Token.IDENTIFIER "b",
                        Lexer.Token.SEMICOLON,
                        Lexer.Token.IDENTIFIER "a",
                        Lexer.Token.ASSIGN,
                        Lexer.Token.IDENTIFIER "a",
                        Lexer.Token.BITWISE_XOR,
                        Lexer.Token.IDENTIFIER "b",
                        Lexer.Token.SEMICOLON,
                        Lexer.Token.IDENTIFIER "a",
                        Lexer.Token.ASSIGN,
                        Lexer.Token.IDENTIFIER "a",
                        Lexer.Token.SHIFTLEFT,
                        Lexer.Token.INTEGER_LITERAL 2,
                        Lexer.Token.SEMICOLON,
                        Lexer.Token.IDENTIFIER "a",
                        Lexer.Token.ASSIGN,
                        Lexer.Token.IDENTIFIER "a",
                        Lexer.Token.SHIFTRIGHT,
                        Lexer.Token.INTEGER_LITERAL 2,
                        Lexer.Token.SEMICOLON,
                        Lexer.Token.IDENTIFIER "a",
                        Lexer.Token.ASSIGN,
                        Lexer.Token.IDENTIFIER "a",
                        Lexer.Token.UNSIGNED_SHIFTRIGHT,
                        Lexer.Token.INTEGER_LITERAL 2,
                        Lexer.Token.SEMICOLON,
                        Lexer.Token.RIGHT_BRACE,
                        Lexer.Token.RIGHT_BRACE
                       ]

bitWiseOperationABS = [Class "BitWiseOperation" []
                       [MethodDecl "doStuff" "void" []
                           (Block [LocalVarDecls [VariableDecl "a" "int" False (Just (IntegerLiteral 1))],
                                   LocalVarDecls [VariableDecl "b" "int" False (Just (IntegerLiteral 2))],
                                   StmtExprStmt (Assign (LocalOrFieldVar "a") (Binary "&" (LocalOrFieldVar "a") (LocalOrFieldVar "b"))),
                                   StmtExprStmt (Assign (LocalOrFieldVar "a") (Binary "|" (LocalOrFieldVar "a") (LocalOrFieldVar "b"))),
                                   StmtExprStmt (Assign (LocalOrFieldVar "a") (Binary "^" (LocalOrFieldVar "a") (LocalOrFieldVar "b"))),
                                   StmtExprStmt (Assign (LocalOrFieldVar "a") (Binary "<<" (LocalOrFieldVar "a") (IntegerLiteral 2))),
                                   StmtExprStmt (Assign (LocalOrFieldVar "a") (Binary ">>" (LocalOrFieldVar "a") (IntegerLiteral 2))),
                                   StmtExprStmt (Assign (LocalOrFieldVar "a") (Binary ">>>" (LocalOrFieldVar "a") (IntegerLiteral 2)))
                           ]) Public False
                        ]
                      ]


