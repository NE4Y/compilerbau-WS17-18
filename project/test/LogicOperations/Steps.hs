module LogicOperations.Steps where

import Lexer.Token

logicOperationsTokens = [Lexer.Token.CLASS, 
                        Lexer.Token.IDENTIFIER "LogicOperations", 
                        Lexer.Token.LEFT_BRACE,
                        Lexer.Token.BOOLEAN,
                        Lexer.Token.IDENTIFIER "i",
                        Lexer.Token.ASSIGN,
                        Lexer.Token.LEFT_PARANTHESES,
                        Lexer.Token.NOT,
                        Lexer.Token.BOOLEAN_LITERAL True,
                        Lexer.Token.AND,
                        Lexer.Token.BOOLEAN_LITERAL False,
                        Lexer.Token.OR,
                        Lexer.Token.BOOLEAN_LITERAL False,
                        Lexer.Token.RIGHT_PARANTHESES,
                        Lexer.Token.EQUAL,
                        Lexer.Token.LEFT_PARANTHESES,
                        Lexer.Token.BOOLEAN_LITERAL False,
                        Lexer.Token.NOT_EQUAL,
                        Lexer.Token.BOOLEAN_LITERAL True,
                        Lexer.Token.RIGHT_PARANTHESES,
                        Lexer.Token.SEMICOLON,
                        Lexer.Token.RIGHT_BRACE
                       ]