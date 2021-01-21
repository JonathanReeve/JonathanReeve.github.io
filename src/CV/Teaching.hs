{-# LANGUAGE OverloadedStrings #-}

module CV.Teaching where

import Data.Text
import CV.Shared hiding (url)

type Markdown = Text

data Teaching = Workshop { dates :: [Date],
                           workshopName :: Text,
                           venue :: Venue,
                           url :: URI,
                           notes :: Maybe Text}
              | Course { dateRanges :: [DateRange],
                         courseName :: Text,
                         teachingRole :: TeachingRole,
                         venue :: Venue,
                         url :: URI,
                         teachingUpdates :: [Update],
                         notes :: Maybe Text
                       } deriving Show

data TeachingRole = Instructor | TA | TAInstructor deriving Show

cuEng :: Venue
cuEng = Venue "Department of English and Comparative Literature" "https://english.columbia.edu/" (uni "cu")

teaching :: [Teaching]
teaching = [Course { dateRanges = [DateRange (date 2020 09) (date 2020 12)],
                      courseName = "Introduction to Computational Literary Analysis",
                      teachingRole = Instructor,
                      url = "https://icla2020b.jonreeve.com",
                      venue = cuEng,
                      teachingUpdates = [
                       Update (date 2020 11) (Talk
                                              "Digital Teaching Alternatives to Zoom"
                                              "https://blogs.cuit.columbia.edu/englishpedagogycolloquium/2020/11/20/digital-teaching-alternatives-to-zoom/"
                                              (Venue "Pedagogy Colloquim, Department of English and Comparative Literature" "https://blogs.cuit.columbia.edu/englishpedagogycolloquium/" (uni "cu")))
                         ],
                      notes = Nothing
                    },
            Course { dateRanges = [DateRange (date 2020 09) (date 2020 12)]
                   , courseName = "Computing in Context: Computational Linguistics"
                   , teachingRole = Instructor
                   , url = "https://scienceandsociety.columbia.edu/content/un1002-computing-context-cannon"
                   , venue = Venue "Department of Computer Science" "https://www.cs.columbia.edu/" (uni "cu")
                   , teachingUpdates = []
                   , notes = Nothing
                   },
            Course { dateRanges = [DateRange (date 2018 07) (date 2018 09),
                                    DateRange (date 2019 07) (date 2019 08),
                                    DateRange (date 2020 07) (date 2020 08)],
                      courseName = "Introduction to Computational Literary Analysis",
                      teachingRole = Instructor,
                      url = "https://icla2020.jonreeve.com",
                      venue = Venue "Digital Humanities Summer Minor Program" "https://summerdigitalhumanities.berkeley.edu/" (uni "ucb"),
                      teachingUpdates = [
                       Update (date 2020 12) (Publication Article
                                              "Building STEAM for DH and Electronic Literature: An Educational Approach to Nurturing the STEAM Mindset in Higher Education"
                                              "http://electronicbookreview.com/essay/building-steam-for-dh-and-electronic-literature-an-educational-approach-to-nurturing-the-steam-mindset-in-higher-education/"
                                              (Venue "Electronic Book Review" "http://electronicbookreview.com/" "U Chicago")
                                             )
                         ],
                      notes = Nothing
                      },
            Workshop { dates = [date 2021 06, date 2021 06]
                     , workshopName = "Meaningful Text Analysis with Word Embeddings"
                     , url = "https://dhsi.org/course-offerings/"
                     , venue = Venue "Digital Humanities Summer Institute" "https://dhsi.org" "U Victoria, Canada"
                     , notes = Nothing
                     },
            Workshop { dates = [date 2019 10,  date 2019 10]
                     , workshopName = "Python User Group sessions: Text Analysis I, II, III"
                     , url = "" -- TODO
                     , venue = Venue "Foundations for Research Computing program" "" (uni "cu")
                     , notes = Nothing
                     },
            Workshop { dates = [date 2019 01]
                     , workshopName = "Advanced Topics in Word Embeddings"
                     , url = "" -- TODO
                     , venue = Venue "New York City Digital Humanities (NYCDH) Week" "" (uni "cu")
                     , notes = Nothing
                     },
             Course { dateRanges = [DateRange (date 2018 09) (date 2018 12)],
                      courseName = "Literary Texts and Critical Methods",
                      teachingRole = TAInstructor,
                      url = "",
                      venue = cuEng,
                      teachingUpdates = [],
                      notes = Nothing
                      },
             Workshop { dates = [date 2018 06, date 2019 06],
                        workshopName = "Web APIs with Python",
                        url = "", -- TODO
                        venue = Venue "Digital Humanities Summer Institute" "https://dhsi.org" "U Victoria, Canada",
                        notes = Just "Co-taught with Stephen Zweibel, Patrick Smyth, and Jojo Karlin" },
             Workshop { dates = [date 2017 11],
                        workshopName = "Text Analysis with SpaCy and Scikit-Learn",
                        url = "https://pydata.org/nyc2017/schedule/presentation/51/",
                        venue = Venue "PyData NYC" "https://pydata.org/" "Microsoft",
                        notes = Nothing
                      },
             Course  { dateRanges = [DateRange (date 2017 09) (date 2017 12),
                                     DateRange (date 2019 01) (date  2019 05)],
                       teachingRole = Instructor,
                       courseName = "University Writing with Readings in the Data Sciences",
                       url = "",
                       venue = cuEng,
                       teachingUpdates = [],
                       notes = Nothing
                      },
             Workshop { dates = [date 2017 11],
                        workshopName = "An Introduction to Semantic Markup and Computational Analysis of Ulysses",
                        venue = Venue "Finnegan's Waves"
                                  "https://www.buffalo.edu/ubnow/stories/2017/10/finnegans-waves.html"
                                  (uni "buffalo"),
                        url = "",
                        notes = Nothing
                      },
             Workshop { dates = [date 2017 04],
                        workshopName = "An Introduction to Text Analysis and Visualization",
                        url = "https://github.com/JonathanReeve/dataviz-workshop-2017",
                        venue = Venue "Art of Data Visualization Week"
                                  "http://library.columbia.edu/news/events/art-or-knowledge/dv_program.html"
                                  (uni "cu"),
                        notes = Nothing
                      },
             Workshop { dates = [date 2017 02],
                        workshopName = "Advanced Text Analysis with SpaCy and TextaCy",
                        url = "https://github.com/JonathanReeve/advanced-text-analysis-workshop-2017/blob/master/advanced-text-analysis.ipynb",
                        venue = Venue "2017 NYCDH Week" "http://dhweek.nycdh.org/" (uni "nyu"),
                        notes = Just "[Workshop notebook](https://github.com/JonathanReeve/advanced-text-analysis-workshop-2017/blob/master/advanced-text-analysis.ipynb) featured in the [SpaCy notebook collection](https://github.com/explosion/spacy-notebooks)"
                      },
             Course   { dateRanges = [DateRange (date 2016 09) (date 2016 12)],
                        teachingRole = TAInstructor,
                        venue = cuEng,
                        courseName =  "James Joyce",
                        url = "",
                        teachingUpdates = [],
                        notes = Just "Led a weekly discussion section in Joyce’s _Ulysses_"
                      },
             Workshop { dates = [date 2016 04],
                        workshopName = "An Introduction to Version Control with Git",
                        venue = Venue "Society for Textual Scholarship"
                          "https://textualsociety.org/current-conference-program/"
                          "Ottawa, Canada",
                        url = "",
                        notes = Nothing
                      },
             Workshop { dates = [date 2016 04],
                        workshopName = "An Introduction to Visualizing Text with Python",
                        venue = Venue "Art of Data Visualization"
                          "http://library.columbia.edu/news/events/data-visualization.html" (uni "cu"),
                        url = "",
                        notes = Nothing
                      },
             Workshop { dates = [ date 2016 02 ],
                        workshopName = "Text Editing with Vim",
                        url = "http://dhweek.nycdh.org/event/lightning-fast-text-editing-with-vim/",
                        venue = Venue "NYCDH Week 2016" "http://dhweek.nycdh.org/" (uni "cu"),
                        notes = Nothing
                      },
             Course { dateRanges = [ DateRange (date 2016 01) (date 2016 05) ],
                      teachingRole = TA,
                      courseName = "History of the English Language",
                      venue = cuEng,
                      url = "",
                      teachingUpdates = [],
                      notes = Nothing
                    },
             Course { dateRanges = [ DateRange (date 2012 09) (date 2012 12) ],
                      teachingRole = TA,
                      courseName = "Computing in the Humanities",
                      venue = Venue "English Department" "" (uni "nyu"),
                      url = "",
                      teachingUpdates = [],
                      notes = Just "Lectured in BASH scripting, command-line image manipulation"
                    },
             Course { dateRanges = [ DateRange (date 2012 11) (date 2013 05) ],
                      teachingRole = Instructor,
                      courseName = "Writing 300: Research Paper Writing",
                      venue = Venue "English Department" "" (uni "york"),
                      url = "",
                      teachingUpdates = [],
                      notes = Just "Taught two sections per semester"
                    },
             Course { dateRanges = [ DateRange (date 2010 11) (date 2011 05) ],
                      teachingRole = Instructor,
                      courseName = "Reading 100, Writing 100",
                      venue = Venue "International School" "" "Vietnam National U",
                      url = "",
                      teachingUpdates = [],
                      notes = Nothing
                    },
             Course { dateRanges = [ DateRange (date 2009 08) (date 2009 12) ],
                      teachingRole = Instructor,
                      courseName = "English 1 (composition, nonfiction readings)",
                      venue = Venue "English Department" "" (uni "bc"),
                      url = "",
                      teachingUpdates = [],
                      notes = Nothing
                      },
             Course { dateRanges = [ DateRange (date 2010 01) (date 2010 06) ],
                      teachingRole = Instructor,
                      courseName = "English 2 (composition, readings in literature)",
                      venue = Venue "English Department" "" (uni "bc"),
                      url = "",
                      teachingUpdates = [],
                      notes = Nothing
                    },
             Course { dateRanges = [ DateRange (date 2005 03) (date 2006 01) ],
                      teachingRole = Instructor,
                      courseName = "Reading 100, Writing 100",
                      url = "",
                      venue = Venue "English Department" "" "Missouri State U (Dalian, China Branch Campus)",
                      teachingUpdates = [],
                      notes = Nothing
                    }
           ]
