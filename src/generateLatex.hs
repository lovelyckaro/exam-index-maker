module Main where

import System.Environment (getArgs)
import System.Directory ( listDirectory )
import Data.List (isSuffixOf, sortBy)
import Data.Ord (Down)

getStart :: IO String
getStart = readFile "start.tex"

getEnd :: IO String
getEnd = readFile "end.tex"

getPdfs :: FilePath -> IO [FilePath]
getPdfs fp = do
    pdfs <- listDirectory fp
    return . sortBy (flip compare) $ pdfs

toLatex :: FilePath -> String -> String
toLatex dir name | ".pdf" `isSuffixOf` name  = "\\includepdf[pages=-]{" ++ dir ++ name ++ "}"
                 | otherwise = ""

main :: IO ()
main = do
    args <- getArgs
    start <- getStart
    end <- getEnd

    let dir = case args of
            (d:rest) -> d
            [] -> "exams"

    pdfs <- getPdfs dir

    let filename = case args of
            (_:fn:rest) -> fn
            _ -> "merged.tex"

    let middle = unlines . map (toLatex dir) $ pdfs
    writeFile filename (start ++ middle ++ end)
    