#  GGJ2012 Jurasnake Park

:joystick: _A 2 players game made for the Global Game Jam 2012, Isart Digital, Paris._

The game is implemented in [Squirrel](https://github.com/albertodemichelis/squirrel), based on [GameStart3D](https://www.youtube.com/@GameStart3D/videos).
It was created during the Global Game Jam 2012, where the theme was `Ouroboros`.

_The game was done in 48h (Global Game Jam rules)._

[![](img/jurasnake-park-yt-screenshot.png)](https://www.youtube.com/watch?v=2AjD8A8drUo)

:Joystick: Action game created during GGJ2012 at Isart Digital Paris. Two players, the first one controls the jeep, the second one aims the water cannon. The goal is to remain as long as possible on track, avoiding obstacles and collecting different bonuses.

## :memo: Devlog

_During the GGJ12, I kept a devlog that was published on the [Game Side Story](https://www.gamesidestory.com/2012/02/03/carnet-de-bord-global-game-jam-2012-paris/) website. Here is it, translated into English._

### 3:30pm, Friday, January 27, 2012
![Isart Digital School](img/ggj12-report-000.png)

Upon arriving at the GGJ, proudly wearing our t-shirts and badges, we find ourselves waiting in the courtyard of [Isart Digital](http://www.isartdigital.com/) for the rest of the participants to join us. Among the crowd, there are some familiar faces, including a specialist from the VRGeeks team lugging an entire crate filled with sensors, helmets, and various accelerometers.

The crowd of jammers is predominantly male... We clearly still have some distance to cover before achieving gender parity! Meanwhile, I'm busy fine-tuning my mini framework in [GameStart](http://www.gamestart3d.com/) (working on screen transition routines, Xbox controller input reading, and so forth...)

### 5pm

Official launch of the GGJParis.

Olivier Lejade, the founder of [MekenSleep](http://www.mekensleep.com/) studio, kicks off the event with an introduction and an outline of the day's proceedings. He then hands over the stage to [Swing Swing Submarine](http://www.swingswingsubmarine.com/), a pair of well-known developers from Montpellier who created [Blocks That Matter](http://www.swingswingsubmarine.com/games/blocks-that-matter/) (available on XBLA, STEAM). Having already participated in previous Jams, they underscore the point that while being an indie developer can often provide more creative freedom, it doesn't necessarily equate to a swift route to financial independence.

Then it's time for the video keynote, rich with international accents. Gonzalo Frasca (PowerfulRobot), Brenda Garno (Jagged Alliance), John Romero (Doom), Will Wright (SimCity), and Tomohisa Kuramitsu (Baiyon.com) each take the stage in turn, sharing poignant and touching anecdotes from their respective experiences. Romero and Garno delve into their collaborative experiences, Frasca discusses the potent connection between empathy and work relationships, emphasizing the importance of continuous improvement with each competition. Wright expounds on his methodology, using the metaphor of wandering ants, while Kuramitsu surprises us all by demonstrating his DJ scratching techniques using 8bit video cartridges.

Following this enriching keynote, teeming with wisdom and valuable insights, Olivier Lejade reveals the theme: instead of a word, it's an [image](https://www.gamesidestory.com/wp-content/gallery/contenu-divers/ouroboros-preview.png)... A snake biting its tail, embodying the cyclical and circular motion, the Ouroboros, for those of us well-read in such symbolism.

On your mark, get set, go! We have a brisk 30 minutes to conceive a concept, which each of us will then need to develop and pitch to the rest in a mere 30 seconds. The stress is palpable, heightened by the challenging task of distilling our ideas down to their essence in such a brief span. Personally, I won't have the opportunity to fully present my concept, which is decidedly simpler than most of the wild and imaginative propositions brought forward by my fellow jammers.

![The 30 seconds pitch ordeal!](img/ggj12-report-001.png)

Among the multitude of ideas that sparked my interest, some standing out for their brilliant originality or sheer hilarity, there was one from Alexis Moroz, an experienced game designer I had the pleasure of witnessing in action at GGJ2011. He proposed a concept that, regrettably, would not see further development. However, as GGJ2012 Paris wrapped up, I was given a glimpse of just how astonishingly dazzling and efficient his work could be!

### 6pm (more or less)

The recruitment session gets underway. Everyone mingles throughout Isart, one hand holding a pizza (as usual, the catering by Isart Digital is on point) and the other grasping their game concept, on the lookout for potential collaborators.

Teams comprising 2 or 3 (!) enthusiastic coders are in hot pursuit of graphic designers, while on the flip side, game designers and artists are leaving no stone unturned in their quest to coax a coder into joining their project.

As for me, I choose to partner with [Florian Belmonte](https://twitter.com/florianbelmonte), an illustrator and 2D animator from my hometown with whom I've yet to collaborate. He's on board with developing my game concept. We're intentionally minimizing risk - after all, this is my first GGJ as a coder, and I have no intention of letting the ship go under!

![Let's code!](img/ggj12-report-002.png)

Now, all we need to find is a sound designer, a task that turns out to be trickier than anticipated due to Olivier Lejade's decision to restrict the number of sound designers in the Jammer pool. Eventually, Eddy is more than willing to join us, aware that he'll have the chance to contribute to one or two other projects simultaneously. The Global Game Jam embodies this spirit: diving headfirst into a 48-hour whirlwind of creativity with perfect strangers!

A few hours in, just as Olivier had predicted, the teams take shape. We reconvene in the auditorium where each team showcases the projects that have been collectively chosen. No fewer than 21 games are in the works, setting a new record for both Isart and the GGJ Paris.

### 10pm

Our small yet dynamic team is now in place! A 2D artist, a sound designer, and a coder — we're ready to put our all into crafting "Jurasnake Park". Unpacking our equipment, each of us sets up our workstations, connects our computers to Isart's local network, and preps our respective tools.

Here's our game concept: A jeep is racing along the back of a seemingly endless serpent, and the driver must evade its gaping maw by jumping. The first player steers the jeep and handles the jumps, while the second player operates a water cannon tasked with dousing the snake to render it harmless. Our goal is to accomplish one of the achievements proposed by GGJ2012: the collaboration of a hardcore and a casual player.

Given our concept's relative simplicity and our team's compact size, the discussions surrounding game design are notably brief. Florian and I draft an initial list of the 2D assets he'll need to generate, as well as a preliminary target for quality. There's little sense in striving for a refined finish when the dimensions and proportions of the game elements are still susceptible to change.

Simultaneously, Eddy is compiling a list of the indispensable sound effects for our game: the roar of the engine, the sound of jumping, the ambient noise of the jungle.

In alignment with the GGJ's principle of open projects, I opt, for practical reasons, to establish a Google Code Project. This will serve as a backup server and SVN, a tool I find invaluable when it comes to coding. It's available here: [Google Code Project](https://code.google.com/p/ggj2012-jurasnake-park/).

By around 10pm, our target is to have a functioning executable by the wee hours of the morning. Florian and I also plan on getting enough rest during this initial night to ensure our mental sharpness and work productivity remain at their peak for the remainder of the 48-hour period.

### 2am, Saturday, January 28, 2012

After 4 hours of graphics, sound design, and coding, we have a working prototype!

The snake endlessly spins, the jeep moves on its back, jumps, and hits its mouth (which is currently closed).

I have time to make a video capture and upload the result of iteration #0 (a coder often counts from zero, a quirk or snobbery?). Hooray! We can go and rest!

[Our prototype](http://www.youtube.com/watch?v=Np6DMsygroM), first iteration.

### 8:30am, Saturday, January 28, 2012

Back at the Isart Digital premises. We find the “WTFs” team there ([Welcome To the Freak Show](https://www.youtube.com/watch?v=x4Z6YP9xnsc)). They have spent almost an all-nighter on their project, whose prototype, although visually basic, already has interesting gameplay.

As I boot up my machine, I find yesterday's prototype and quickly consider the list of priorities I thought about during my (short) night:

- Setting up lighting that highlights Florian's work and our staging choices.
- Implementing the Xbox paddle to start really testing the gameplay.
- Implementing a score and a limited number of lives, conventional player motivation elements that seem essential to me.

Once this game mechanic is in place, I can then add the Game Over screens, as well as the sound effects and music prepared by Eddy who seems to have spent an all-nighter with the WTFs. This way, we have a complete gameplay loop: Title screen, game screen, and game over screen.

In the meantime, Olivier Lejade goes around the projects, tests the first prototypes, advises the teams. After testing our game embryo, his question falls, quick and concise: "What's the challenge ?" We discuss some vague paths to develop the gameplay and he advises us to make decisions in terms of game design.

[Our prototype, second iteration](http://www.youtube.com/watch?v=MTBm25S97Ac), in the middle of the day.

If I decided from the start of the Game Jam not to include a Game Designer in the team, it's mainly for fear of not being able to manage both the designer's ideas and the graphic assets. I know that next year, if I come back to the GGJ, I'll have to improve on this point!

As I dive back into my initial game design document, I hear Alexis's team behind us, completely "overclocked", discussing the mechanisms of their game: SnakeDemocracy with Olivier Lejade. Pursuing the "Over 1024 simultaneous players" achievement, they decided to turn the classic Snake game into an electoral issue. Players can log on to the [SnakeDemocracy](http://globalgamejam.org/2012/snake-democracy) server, vote to direct the snake right, left, or straight ahead. Via Twitter, activists can participate in each campaign, adding apples (!) to the game grid. In 48 hours, I consider this an achievement in game design and coding!

### 2pm, Saturday, January 28, 2012

The afternoon will be intense. Florian is preparing bonus sprites and I'm starting to implement a bonus and trap spawn system, something I hadn't anticipated at all from the start.

By late afternoon, the player is able to drive, jump over the snake, shoot it with the water cannon, and pick up bonuses to repair the jeep.

With a life counter and a score, it's starting to look like a game, and the other Jammers who kindly test the prototype are pressing me with questions: "And you, what's your score?"

After the third tester who asks me the same thing, I realize that:

- I don't have the mindset of a gamer, being unable to answer the question.
- I need to implement a high score, with a save feature if possible.

By the end of the day, the bonuses are functional, the high score shows up, Florian's decorative elements are almost all in place, and the snake's head is animated.

To add a nuance to the challenge, we decide on two alternative endings:

- If the player collides with the closed mouth of the snake, the game ends because the jeep is damaged. A game over screen will show the jeep in pieces.
- If the player drives the jeep into the snake's open mouth, the game stops directly because the jeep has been swallowed. Florian has drawn an ending screen that is reminiscent of Jonah's misadventures in the whale's belly.

![Testing the 2 players mode](img/ggj12-report-003.png)

### 10pm, Saturday, January 28

After several hours of determined attempt to correctly detect the collision between the jeep and the gaping mouth of the snake, I decide to comment out all of this part of the source code.

Physical collisions are not accurately reporting this event to me, and the use of triggers also proves fruitless.

Rather than risk exhausting ourselves on this idea, we decide to use the two end screens randomly. The game works, although it's particularly unbalanced. The prototype is however well advanced, it's time to take a second night's rest.
### 8:30am, Sunday, January 28, 2012

Back on my code, after a night partly spent thinking about the last priorities, I add a final challenge element, drawn by Florian: indigenous people wearing masks.

Again, after 1 hour of various implementations, I fail to test the "water cannon / indigenous" collisions. So we decide once again to abandon a feature.

I just take the time to make a [video capture](http://www.youtube.com/watch?v=2AjD8A8drUo) of the almost-last iteration of the game, to register the game on the Global Game Jam website.

Having set a deadline around 11 AM for a testable version, I take care of the last game design adjustments: new obstacles to increase the diversity of the game and the last sound effects produced by Eddy, as well as cosmetic elements around the GUI.

The randomness of traps and bonuses remains quite rigid, as I've reached the limit of what my [spawning](http://en.wikipedia.org/wiki/Spawning_%28video_gaming%29) code could generate. This is also a point I need to improve at my next Jam.

### 12pm

Last second stress: the bonuses, which were working an hour ago, remain inert when the player picks them up. I probably broke something in my code, which sometimes happens when programming, and even more so in a hurry.

While I start to track down this last-minute bug, Florian goes downstairs to fetch Sandwiches & Wraps, offered by the Isart staff. Once again, SVN is going to save my life: I ask it to give me the list of changes made to the source code in the last hour. In a few seconds, a line that I had deleted catches my attention: the bonuses are no longer correctly initialized. I restore the line of code in question. Phew, everything works again!

While discussing with another Jammer, a student at Isart, who watches me test the game one last time, I urgently add a huge "Game Over" to the end illustrations produced by Florian: "You should add a 'Game Over', by convention" ... So there are conventions in video games? Like in theater or cinema? I realize a little more what it's like to learn video games in a school 🙂

### 1 pm

The official project completion deadline is approaching, but we want to make the game accessible to other Jammers as soon as possible. We still have 2 good hours to correct the last playability issues, but I prefer to release the game as is, especially since my fingers are starting to get numb. In the hours to come, many Jammers and journalists covering the GGJ will take turns on Jurasnake Park. One of them will manage to break a high score that remains undefeated to this day.

![Final gameplay with a Xbox pad in hand](img/ggj12-report-004.png)

One of our neighboring Jammers points out to me that the game is still a bit hardcore, and that the difficulty deserves to be adjusted. When I explain to him that I wanted to wrap up the release as soon as possible so that everyone could test the game, he replies: "Ah? So you skipped the play-test phase?"

Releasing a game by avoiding the testing phase to take advantage of a favorable launch window? This pattern suddenly seems eerily familiar ...

## 2pm

While Jurasnake Park is torturing the players who try it, I decide to check out the finished projects from our fellow Jammers. After a few minutes, I'm shocked: the level is really high, especially compared to last year. Some concepts are truly original:

- [SnakeDemocracy](https://web.archive.org/web/20120207054556/http://www.snakedemocracy.com/), of course, which offers a reinterpretation of a video game standard with the possibilities of social networks and a totally current political angle.

- **Quetzacoatl**, an ecological-mystical metaphor using a completely hijacked "virtual Dj" turntable. The team behind this project miraculously managed to deliver an effective prototype, after 30 hours of tough fight against a stubborn device that refused to send usable values.

- **The Loop**, of surprising beauty and finish, continuing games like 'Flow'.

- **Reverse of Babylon**, a prototype of a quality equivalent to an XBLA game, invites the player to explore the Babylonian maze, in a double-sided course half submerged in fog. The team behind this project confessed to having changed technology at the start of the Game Jam, making the feat even greater.

- **Miop**, made in WebGL + Javascript, mixes flocking algorithms with very pure and perfectly mastered graphics. The handwriting of Chen, the 2D graphic designer, is sensitively transcribed by the 3D graphic designer who handles the transposition, and everything is superbly staged by the two developers who managed to implement a 3D renderer and Artificial Intelligence with avant-garde tools.

- **InSnaketion**, one of the VR projects that everyone was impressed with its level of finish! Seeing such a large team (8 jammers) is a constant source of amazement for me, as to their ability to coordinate in such a short time!

The final meeting in the auditorium will be an opportunity for the Jammers' teams to discuss their experiences, successes and/or failures. Some suffered more than others, for technical reasons (C++ engine that doesn't compile, source file overwrite) or human reasons (game design 10 times too ambitious...). While I have participated in similar events (demoparties, Tigsource Jams) in the past, the organization of the Global Game Jam makes it totally unique.

The definition that seems to best match is this: "The life cycle of a video game, from design to delivery to players, through the promotion of the concept and its realization, condensed into 48 hours." It's a bit like living one or two years accelerated, with all the intensity and passion that the creation of a video game can bring.

**Congratulations** to all the Jammers of GGJ Paris 2012, to Anne-Laure, Communications Director of Isart Digital for a perfect organization and logistics, and Olivier who announced that he was handing over to Swing Swing Submarines for the management of next year's Jam! Finally, don't hesitate to discover [the list of 22 games created in Paris](http://globalgamejam.org/og/games/17474/list) during this exciting weekend.

:black_small_square: _GGJ12 report, end of line_




