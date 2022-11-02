\version "2.22.2"
\layout {
  ragged-last = ##f
} %egész sor
stemOff = \hide Staff.Stem
stemOn  = \undo \stemOff
divisioMaior = {
  \once \override BreathingSign.stencil = #ly:breathing-sign::divisio-maior
  \once \override BreathingSign.Y-offset = #0
  \breathe}
egesznek = {%az \egesznek után levő kottafejet lecseréli egészre, az érték marad az eredeti
  \once \override NoteHead.stencil = #ly:text-interface::print
  \once \override NoteHead.text = \markup {\musicglyph "noteheads.s0"}
}
bal = \override LyricText.self-alignment-X = #LEFT

\score {
  \new PianoStaff 
  <<
    \new Staff = "upper" \with { \remove "Time_signature_engraver" }
<<
      \new Voice = "melody" {%JK felső szólam, ehhez megy a szöveg
        \relative c'' {
          \voiceOne
          \key f \major
          \cadenzaOn %ütemvonalak ízlés szerint
          \stemOff
          \override Staff.NoteHead.style = #'altdefault
                    \mark \markup {\small{Žalm 149}}
          %a \breve \bar"!" a4 \tweak X-offset #0.5 \tweak Y-offset #3 -! \parenthesize g8 g \mark "†" \bar"!" %flexa
          a \breve \stemDown \phrasingSlurDashed f8\(e\) d4 \tweak X-offset #2 -\markup{\large *} \divisioMaior \bar""
          d \breve \phrasingSlurDashed g8\(f\) e4 \bar"|."
                  }
                            }			
      \new Voice= "second"%JK alsó
    \relative c'{
      \voiceTwo
      \key f \major
      \cadenzaOn  
   %\egesznek e\breve ~\egesznek 2 ~ 
   \egesznek e\breve \egesznek d2 \tweak X-offset #0.5 \tweak Y-offset #3 ^! 
   \once \override NoteColumn.force-hshift = #0.9 \egesznek d\breve ~\egesznek d4 \tweak X-offset #0.5 \tweak Y-offset #3 ^! c
    }                      
>>
    \new Staff = "lower" \with { \remove "Time_signature_engraver" }
    \relative c' {
  \clef bass
  \key f \major
  \cadenzaOn
  \stemOff
\override Staff.NoteHead.style = #'altdefault
  
  <<
  {
%\egesznek c\breve ~\egesznek c2 ~
\egesznek c \breve
\egesznek a2 \divisioMaior
\egesznek f\breve \egesznek d4 g
  }
  \\
  {
%\egesznek a\breve \egesznek bes2 
\egesznek a\breve
\egesznek f2 \divisioMaior
\egesznek bes,\breve \egesznek g4 c
  }
>>

}
    \new Lyrics \with { alignBelowContext = "lower" } {%alsó kottasor alá teszi a szöveget
      \lyricsto "melody" {
      \bal
      \set stanza = "1."
     Spievajte_Pánovi_pieseň \markup {\bold no} -_ \markup {vú;}
          % \set stanza = "2." 
      \markup {\char # 42 jeho chvála nech znie}  
      %\markup {\bold svä} -_ \markup {tých. (2.)}
      }
    }
    \new Lyrics {
      \lyricsto "melody" {
      \bal
      _ _ _ _ \markup {\char # 32 \char # 32 v zhromaždení}   \markup {\bold svä} -_ \markup {tých. (2.)}
      }
    }   

\new Lyrics {
      \lyricsto "melody" {
      \bal
      \set stanza = "2."
     \markup {Nech sa teší Izrael }
      }
    }    
\new Lyrics {
      \lyricsto "melody" {
      \bal
     \markup {zo svojho Stvori} -- \markup {\bold te} -_ \markup {ľa,}
          % \set stanza = "2." 
     \markup {\char # 42 synovia Siona}
      }
    } 
\new Lyrics {
      \lyricsto "melody" {
      \bal 
      _ _ _ _ \markup {\char # 32 \char # 32 nech jasajú nad svojím}  \markup {\bold krá} -_ \markup {ľom. (3.)}
      }
    } 
\new Lyrics {
      \lyricsto "melody" {
      \bal
      \set stanza = "3."
     \markup {Nech oslavujú jeho meno} \markup {\bold tan} -_ \markup {com,}
          % \set stanza = "2." 
      \markup {\char # 42 nech mu hrajú na bubne a na}  \markup {\bold ci} -- ta -- \markup {re. (4.)}
      }
    }
    \new Lyrics {
      \lyricsto "melody" {
      \bal
      \set stanza = "4."
     \markup {Lebo Pán miluje} \markup {\bold svoj} _ \markup {ľud}
          % \set stanza = "2." 
      \markup {\char # 42 a tichých venčí}  \markup {\bold ví} -- ťaz -- \markup {stvom. (5.)}
      }
    }
\new Lyrics {
      \lyricsto "melody" {
      \bal
      \set stanza = "5."
     \markup {Nech svätí jasajú} \markup {\bold {v slá}} -_ \markup {ve,}
          % \set stanza = "2." 
      \markup {\char # 42 nech sa veselia na svojich}  \markup {\bold lôž} -_ \markup {kach. (6.)}
      }
    }
\new Lyrics {
      \lyricsto "melody" {
      \bal
      \set stanza = "6."
     \markup {Oslavu Boha nech majú} \markup {\bold na} pe -- \markup {rách}
          % \set stanza = "2." 
      \markup {\char # 42 a v rukách meč}  \markup {\bold dvoj} -- seč -- \markup {ný, (7.)}
      }
    }    
\new Lyrics {
      \lyricsto "melody" {
      \bal
      \set stanza = "7."
     \markup {aby sa pomstili na} \markup {\bold po} -- ha -- \markup {noch}
          % \set stanza = "2." 
      \markup {\char # 42 a potrestali}  \markup {\bold ná} -- ro -- \markup {dy, (8.)}
      }
    }
\new Lyrics {
      \lyricsto "melody" {
      \bal
      \set stanza = "8."
     \markup {aby ich kráľom nasadili} \markup {\bold pu} -_ \markup {tá}
          % \set stanza = "2." 
      \markup {\char # 42 a ich veľmožom železné}  \markup {\bold o} -- ko -- \markup {vy (9.)}
      }
    }
\new Lyrics {
      \lyricsto "melody" {
      \bal
      \set stanza = "9."
     \markup {a aby ich súdili}
      }
    }
\new Lyrics {
      \lyricsto "melody" {
      \bal
     \markup {podľa písaného} \markup {\bold prá} -_ \markup {va.}
          % \set stanza = "2." 
      \markup {\char # 42 Všetkým jeho svätým to bude}  \markup {\bold na} slá -- \markup {vu. (10.)}
      }
    }
\new Lyrics {
      \lyricsto "melody" {
      \bal
      \set stanza = "10."
     \markup {Sláva Otcu i} \markup {\bold Sy} -_ \markup {nu}
          % \set stanza = "2." 
      \markup {\char # 42 i Duchu}  \markup {\bold Svä} -- té -- \markup {mu. (11.)}
      }
    }  
\new Lyrics {
      \lyricsto "melody" {
      \bal
      \set stanza = "11."
     \markup {Ako bolo na počiatku,}
      }
    }
\new Lyrics {
      \lyricsto "melody" {
      \bal
     \markup {tak nech je i teraz i} \markup {\bold vždyc} -_ \markup {ky}
          % \set stanza = "2." 
      \markup {\char # 42 i na veky vekov.}  \markup {\bold A} -_ \markup {men.}
      }
    }
  >>
}

