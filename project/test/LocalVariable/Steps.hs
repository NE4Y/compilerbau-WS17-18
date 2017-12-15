module LocalVariable.Steps where

import Lexer.Token

localVariableTokens = [Lexer.Token.CLASS, 
                        Lexer.Token.IDENTIFIER "LocalVariable", 
                        Lexer.Token.LEFT_BRACE, 
                        Lexer.Token.VOID,
                        Lexer.Token.IDENTIFIER "doStuff",
                        Lexer.Token.LEFT_PARANTHESES,
                        Lexer.Token.RIGHT_PARANTHESES,
                        Lexer.Token.LEFT_BRACE,
                        Lexer.Token.INTEGER,
                        Lexer.Token.IDENTIFIER "i",
                        Lexer.Token.SEMICOLON,
                        Lexer.Token.RIGHT_BRACE,
                        Lexer.Token.RIGHT_BRACE
                       ]