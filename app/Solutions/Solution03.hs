-- | 

module Solutions.Solution03 where

import Lib

import Data.List.Split (chunksOf)
import Data.List.Extra (allSame)
import Control.Monad (guard)
import Data.Char


parseInput = lines

findCommonChar :: (String, String) -> Char
findCommonChar (xs, ys) = head [ x | x <- xs, x `elem` ys ]

calcScore :: Char -> Int
calcScore x = ord x - (if x > 'Z' then 96 else 38)

part1
  = sum
  . map calcScore
  . map (\xs -> findCommonChar $ splitAt (length xs `div` 2) xs)

findBadge :: [[Char]] -> Char
findBadge [xs, ys, zs] = head [ x | x <- xs, y <- ys, z <- zs, allSame [x,y,z] ]

part2
  = sum
  . map (calcScore . findBadge)
  . chunksOf 3

solution = SolutionFN $ \input -> let parsed = parseInput input
                                  in (show $ part1 parsed , show $ part2 parsed)

-- $> runSolutionFN S3.solution <$> readInputDay 3
