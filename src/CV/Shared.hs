{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}

module CV.Shared where

import qualified Data.Text as T
import PyF

data Date = Present | Date { year :: Int
                           , month :: Int
                           } deriving Show

data DateRange = DateRange { start :: Date
                           , end :: Date
                           } deriving Show

-- Validate the dates.
date :: Int -> Int -> Date
date y m | y < 1981 || y > 2100 = error "You're probably not alive in that year."
         | m < 1 || m > 12 = error "The month doesn't exist."
         | otherwise = Date y m

formatDate :: Date -> T.Text
formatDate date = let yy = year date
                      mm = month date
                  in [fmt|{yy}-{mm}|]

formatDateRange :: DateRange -> T.Text
formatDateRange dateRange = case dateRange of
  DateRange (Date sy sm) Present -> [fmt| "({startDate}–)"|]
  DateRange (Date sy sm) (Date ey em) -> [fmt|"({startDate}–{endDate})"|]
  where startDate = formatDate $ start dateRange
        endDate = formatDate $ end dateRange

-- TODO: get this from Pandoc
type Markdown = T.Text

-- TODO: validate URIs
type URI = T.Text

data Link = Link { url :: URI, text :: T.Text } deriving Show

data Update = Update Date Event deriving Show

data Event = News Markdown
           | Award T.Text Venue
           | Talk Title URI Venue
           | Publication PublicationType Title URI Venue
           deriving Show

type Title = T.Text

data PublicationType = Tutorial | Article | Chapter | Abstract deriving Show

uni :: T.Text -> T.Text
uni abbr = case abbr of "nyu" ->  "New York U"
                        "cu" -> "Columbia U"
                        "bc"  -> "Brooklyn College, City U of New York"
                        "msu" -> "Montclair State U"
                        "ucb" -> "U of California, Berkeley"
                        "buffalo" -> "U at Buffalo"
                        "york" -> "York College, City U of New York"
                        "cuny" -> "City U of New York"

data Venue = Venue { name :: T.Text,
                     venueUrl :: URI,
                     location :: T.Text } deriving Show
