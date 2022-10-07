\version "2.22.1"
\layout {
  ragged-last = ##f
} %egész sor 
divisioMinima = {
  \once \override BreathingSign.stencil = #ly:breathing-sign::divisio-minima
  \once \override BreathingSign.Y-offset = #2 % !!!!
  \breathe
} 
\score {
  \new PianoStaff
  <<
    \new Staff = "upper"
        <<
      \new Voice = "S" 
        \relative c' {
          \voiceOne
          \cadenzaOn
          \key f \major
    \mark \markup { \bold{Ant. 3}(solemnis)}
   f8 [g a a] c[ c bes a] g[a] bes4 a \divisioMinima a8[a\tweak Y-offset #3 -- g] f c4 \bar"|" d8[f] g4 f \bar"|."
                      }
                            			
       \new Voice= "A"
        \relative c'  {
          \voiceTwo
   \hide r4 f4 es? d~d4 a'8[g] c,4  c2. c4 f8[e] c4 
                      }            
        >> 
    \new Staff = "lower"
        <<
      \new Voice = "T" 
      \clef bass
       \relative c' { 
         \voiceThree
         \key f\major
   a8[bes] c4 a bes f d f e4. f bes2 a4
       }

      \new Voice = "B" 
        \relative c  {
        \voiceFour
   f2~4 g bes, g f a2.  bes4 c f
                     }    
        >>
   \new Lyrics \with {alignAboveContext = "lower"}{
     \lyricsto "S"{
   Chváľ -- te Bo -- ha, všet -- ci je -- ho slu -- žob -- ní -- ci, ma -- lí i veľ -- kí. A -- le -- lu -- ja.    
   }}
   
    >>
}

    
   