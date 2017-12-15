module BitWiseOperation.Steps where

import           Lexer.Token

bitWiseOperationTokens = [Lexer.Token.CLASS,
                        Lexer.Token.IDENTIFIER "BitWiseOperation",
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
                        Lexer.Token.RIGHT_BRACE
                       ]

