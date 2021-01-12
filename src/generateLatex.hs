module Main where

import System.Directory ( listDirectory )
import Data.List (sortBy)
import Data.Ord (Down)

getStart :: IO String
getStart = readFile "start.tex"

getEnd :: IO String
getEnd = readFile "end.tex"

getPdfs :: IO [FilePath]
getPdfs = do
    pdfs <- listDirectory "exams"
    return . sortBy (flip compare) $ pdfs

toLatex :: FilePath -> String
toLatex fp = "\\includepdf[pages=-]{exams/" ++ fp ++ "}"

main :: IO ()
main = do
    pdfs <- getPdfs
    start <- getStart
    end <- getEnd
    let middle = unlines . map toLatex $ pdfs
    writeFile "merged.tex" (start ++ middle ++ end)
    putStrLn "Done!"
    