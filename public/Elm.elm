import Website.Skeleton (homeSkeleton, bigLogo)
import open Website.ColorScheme
import Website.Tiles (examples)

import Text
import JavaScript as JS
import Window

intro = [markdown|

Elm also brings the benefits of purity and an expressive static type system
to GUI programming. Elm is fully type inferred, so no type annotations are
needed to get the benefits of static checks.

Start programming in Elm with [the online editor](/try). No need to install anything!

Join the [elm-discuss list][list] for questions, announcements, and discussion!

  [list]: https://groups.google.com/forum/?fromgroups#!forum/elm-discuss "mailing list"

|]

other w = width (w `div` 2) [markdown|

#### Community

* [elm-discuss list][list]
* [`#elm` on IRC](http://webchat.freenode.net/?channels=elm irc)
* [/r/elm](http://www.reddit.com/r/elm subreddit)
* [Elm user group SF](http://www.meetup.com/Elm-user-group-SF/ meetup in SF)
* [Share Code](http://www.share-elm.com)
* [Contribute!](/Contribute.elm)

 [list]: https://groups.google.com/forum/?fromgroups#!forum/elm-discuss "mailing list"
|] `beside` width (w `div` 2) [markdown|

#### News

* [Hot-swapping](/blog/Interactive-Programming.elm) in Elm
* Elm at [StrangeLoop 2013][loop]
* Type-checker fixed in [Elm 0.9][v9]
* Elm in [VentureBeat][vb]
* [Elm and Prezi](http://elm-lang.org/blog/announce/Elm-and-Prezi.elm),
  [Prezi and Elm](http://engineering.prezi.com/blog/2013/05/21/elm-at-prezi/)
* Extensible Records in [Elm 0.7][v7]

 [vb]: http://venturebeat.com/2013/07/26/why-i-designed-a-front-end-programming-language-from-scratch/
 [v7]: /blog/announce/version-0.7.elm "Extensible Records"
 [v9]: /blog/announce/version-0.9.elm
 [loop]: https://thestrangeloop.com/sessions/functional-reactive-programming-in-elm "Elm at StrangeLoop"

|]

exampleBlock w =
    examples w [ [ "Mario", "Walk", "Pong", "SlideShow" ]
               , [ "Clock", "Physics", "Slide", "Stamps" ]
               ]

language = [markdown|

Elm is a functional programming language that compiles to HTML, CSS, and JavaScript. 
It is built around the concept of [functional reactive programming][frp],
making it easy to create [highly][mario] [interactive][pong] [applications][flickr].

  [frp]:    /learn/What-is-FRP.elm "functional reactive programming"
  [mario]:  /edit/examples/Intermediate/Mario.elm "mario"
  [pong]:   /edit/examples/Intermediate/Pong.elm "pong"
  [flickr]: /edit/examples/Intermediate/Flickr.elm "flickr"

|]

info w = let content = flow down [ spacer w 20
                                 , bigLogo
                                 , width w language
                                 , exampleBlock w
                                 , spacer w 10
                                 , width w intro
                                 , other w ]
         in  container w (heightOf content) middle content 

main = homeSkeleton info <~ Window.dimensions

title = constant (JS.fromString "Elm - functional web programming")
foreign export jsevent "title"
  title : Signal JS.JSString
