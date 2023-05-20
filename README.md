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

Upon returning to the Isart Digital venue, we run into the "WTFs" team ([Welcome To the Freak Show](https://www.youtube.com/watch?v=x4Z6YP9xnsc)). They have pulled almost an all-nighter on their project, the prototype of which, while visually basic, already boasts engaging gameplay.

As I power up my machine, I pull up yesterday's prototype and swiftly review the priority list I'd pondered over during my brief night's rest:

- Configuring lighting that accentuates Florian's artwork and our directorial decisions.
- Integrating the Xbox paddle to start seriously assessing the gameplay.
- Incorporating a scoring system and a finite number of lives — conventional elements of player motivation that I deem essential.

Once these game mechanics are in place, I can proceed to add the Game Over screens, as well as the sound effects and music prepped by Eddy, who appears to have spent an all-nighter with the WTFs. With these elements, we establish a full gameplay loop: Title screen, game screen, and game over screen.

Meanwhile, Olivier Lejade makes his rounds among the projects, testing the early prototypes and offering advice to the teams. After giving our nascent game a try, he poses a succinct, incisive question: "What's the challenge?".
We discuss some nebulous ideas for advancing the gameplay, and he advises us to make definitive decisions with respect to game design.

[Our prototype, second iteration](http://www.youtube.com/watch?v=MTBm25S97Ac), in the middle of the day.

My decision to forgo including a Game Designer in our team from the outset of the Game Jam was primarily driven by apprehension over juggling both the designer's concepts and the graphical assets. I recognize that, should I return to the GGJ next year, this is an area where I'll need to up my game!

As I delve back into my initial game design document, I overhear the team behind us, featuring Alexis, in full throttle discussing the dynamics of their game, SnakeDemocracy, with Olivier Lejade. In their quest for the "Over 1024 simultaneous players" achievement, they've reimagined the classic Snake game as an electoral battle. Players can log on to the [SnakeDemocracy](http://globalgamejam.org/2012/snake-democracy) server, cast their votes to steer the snake right, left, or keep it on a straight path. Via Twitter, supporters can engage in each campaign, adding apples (!) to the game grid. Considering the 48-hour timeframe, I regard this as a remarkable accomplishment in both game design and coding!

### 2pm, Saturday, January 28, 2012
The afternoon proves to be an intense stretch of work. Florian busies himself with creating bonus sprites, and I begin devising a system for spawning bonuses and traps — a feature I hadn't initially accounted for.

By the late afternoon, our player can drive, hurdle over the snake, neutralize it with the water cannon, and gather bonuses to repair the jeep.

With the addition of a life counter and a score tally, our prototype is beginning to resemble a bona fide game. The other Jammers, who graciously offer to test our prototype, consistently probe me with the same question: "What's your personal best score?"

After being asked the same question by the third tester, two things dawn on me:

- I don't embody the typical gamer mentality, as evidenced by my inability to answer their question.
- I need to introduce a high score system, preferably one with a save feature.

By the day's end, the bonuses are up and running, the high score is visible, most of Florian's decorative components are in place, and the snake's head is animated.

To imbue the challenge with a degree of subtlety, we settle on two divergent conclusions:

- If the player collides with the snake's clenched jaws, the game concludes due to the jeep sustaining damage. A game over screen then displays the jeep in a state of disrepair.
- If the player navigates the jeep into the snake's gaping maw, the game comes to an abrupt halt because the jeep has been ingested. Florian has illustrated an end screen that harks back to Jonah's adventures inside the whale's belly.

![Testing the 2 players mode](img/ggj12-report-003.png)

### 10pm, Saturday, January 28

After several hours spent wrestling with detecting the collision between the jeep and the snake's gaping mouth, I opt to comment out this entire segment of the source code.

The physical collisions fail to accurately relay this event, and my attempts to employ triggers prove equally unproductive.

Instead of depleting our energy reserves on this concept, we agree to randomly alternate between the two end screens. Although the game is distinctly unbalanced, it functions nonetheless. The prototype has made significant progress, signaling that it's time for us to indulge in a second night's rest.

### 8:30am, Sunday, January 28, 2012

Returning to my code, after a night partially dedicated to mulling over the remaining priorities, I introduce a final challenge component, artfully designed by Florian: tribal figures adorned with masks.

Once again, after about an hour of varied implementation attempts, I am unable to validate the interactions between the "water cannon" and the "tribal figures". Hence, we choose to discard yet another feature.

I do, however, manage to spare some time to create a [video capture](http://www.youtube.com/watch?v=2AjD8A8drUo) of the penultimate iteration of the game for submission to the Global Game Jam website.

With an internal deadline of around 11 AM for a testable version, I address the final game design refinements: introducing new obstacles to enhance the game's diversity, incorporating the latest sound effects crafted by Eddy, and adding finishing touches to the GUI.

The spawn pattern for traps and bonuses remains rather inflexible, reflecting the limits of my [spawning](http://en.wikipedia.org/wiki/Spawning_%28video_gaming%29) code. This is certainly an area I need to improve for my next Jam.

### 12pm

Last-minute panic sets in: the bonuses, which were functioning an hour ago, now remain unresponsive when the player picks them up. I must have inadvertently disrupted something in my code—a hazard that occasionally comes with coding, especially when done in a hurry.

As I commence my hunt for this eleventh-hour bug, Florian heads downstairs to retrieve sandwiches and wraps, courtesy of the Isart staff. [SVN](https://en.wikipedia.org/wiki/Apache_Subversion) comes to my rescue yet again: I instruct it to list the changes made to the source code in the last hour. Within moments, a line that I had deleted pops out at me—the bonuses are no longer being correctly initialized. I promptly restore the necessary line of code. A sigh of relief, as everything is back in working order!

While chatting with another Jammer, an Isart student who is watching me run the game for the final time, I hastily append a prominent "Game Over" to the end illustrations crafted by Florian: "You should add a 'Game Over', it's convention"... So there are conventions in video games? Much like in theatre or cinema? This enlightens me further about what it means to study video games at school. 🙂

### 1 pm

The official deadline for project completion is drawing near, yet we are eager to make the game available to other Jammers at the earliest. We still have a solid couple of hours to address the remaining playability issues, but I decide to release the game in its current state, particularly as my fingers are starting to feel numb. Over the next few hours, numerous Jammers and journalists covering the GGJ will take turns playing Jurasnake Park. One of them will even manage to set a high score that remains unbeaten to this day.

![Final gameplay with a Xbox pad in hand](img/ggj12-report-004.png)

A Jammer from a neighboring team suggests that our game might be a bit too challenging and could benefit from some difficulty adjustments. When I explain my intention to wrap up the release as swiftly as possible so that everyone could test the game, he retorts, "Oh? So you skipped the play-testing phase?"

The idea of launching a game while sidestepping the testing phase just to leverage a favorable launch window suddenly strikes a familiar chord...

## 2pm

While Jurasnake Park puts its players through a series of challenges, I take a moment to explore the completed projects of our fellow Jammers. Within minutes, I'm taken aback: the quality is impressive, particularly when compared to the previous year. Some concepts are brilliantly original:

- [SnakeDemocracy](https://web.archive.org/web/20120207054556/http://www.snakedemocracy.com/), a standout example, merges classic game mechanics with the potentials of social media in a highly topical political context.

- **Quetzacoatl**, a mystical-ecological metaphor that ingeniously repurposes a "virtual DJ" turntable. The team behind this project managed to pull off an effective prototype after 30 hours of wrestling with a device that refused to provide usable values.

- **The Loop**, a game of surprising elegance and polish, takes cues from titles like 'Flow'.

- **Reverse of Babylon**, a prototype with quality equating to an XBLA game, plunges the player into a fog-enshrouded Babylonian labyrinth with a double-sided journey. Impressively, the team confessed they switched technology at the onset of the Game Jam, making their accomplishment even more extraordinary.

- **Miop**, developed using WebGL and Javascript, combines flocking algorithms with refined, well-executed graphics. The sensitive touch of Chen, the 2D graphic designer, is adeptly transposed by the 3D graphic designer, and the pair of developers stage it all beautifully, having managed to implement a 3D renderer and artificial intelligence with cutting-edge tools.

- **InSnaketion**, a VR project, drew admiration from everyone for its high level of finish. I continually marvel at how such a large team (eight Jammers) could coordinate so effectively within such a tight timeframe!

The final assembly in the auditorium provides an opportunity for the various teams of Jammers to share their experiences, victories, and hurdles. Some teams faced more challenges than others, whether due to technical complications (a C++ engine that wouldn't compile, overwritten source files) or human issues (overly ambitious game designs). Although I've participated in similar events (demoparties, Tigsource Jams) in the past, the Global Game Jam's organization sets it apart.

The most fitting description seems to be: "The entire life cycle of a video game, from design to delivery, encompassing the promotion of the concept and its actualization, all condensed into 48 hours." It's akin to experiencing one or two accelerated years, complete with all the intensity and passion that video game creation entails.

**Kudos** to all the GGJ Paris 2012 Jammers, to Anne-Laure, the Communications Director of Isart Digital, for her impeccable organization and logistics, and to Olivier who announced his handover to Swing Swing Submarines for the management of next year's Jam! Lastly, feel free to explore [the list of 22 games created in Paris](http://globalgamejam.org/og/games/17474/list) during this exhilarating weekend.

:black_small_square: _GGJ12 report, end of line_




