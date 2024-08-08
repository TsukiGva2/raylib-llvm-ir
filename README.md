# llvm-ir-raylib

Simple llvm-ir example using raylib to make a bouncing square.

![tsoding](https://github.com/user-attachments/assets/1d20f11f-53d3-4390-8b33-8404ac50beb9)

### ![Watch the stream by Tsoding Daily!](https://www.youtube.com/watch?v=rzXEsactdT4)

First, i want to thank Tsoding for this cool learning experience, llvm ir is something
i've been wanting to dive in for a while, and that was just what i needed to get me hooked into it!

Many thanks to the creator and contributors of [raysan5/raylib](https://github.com/raysan5/raylib) for
providing such a nice and simple API for game development.

I also want to thank the author(s) of [rhysd/vim-llvm](https://github.com/rhysd/vim-llvm) for the
amazing work, worked like a charm and it's got the coolest syntax highlighting ever.

this repo contains my notes and me messing around with the clang compiler's llvm backend.
it consists of a simple bouncing square animation using nothing more than raylib and LLVM IR,
which is commonly used as a target language for compilers and not as an actual programming language.
But it still crazy what you can do with it (and how readable it can actually get if you try hard enough XD).

My approach to writing the code and uncovering things was quite a bit different, as i tried to
keep some comments so i wouldn't get lost in this thing, this made it quite a cool learning
experience if you want to get llvm basics down. I'd say check out `loop.ll`/`hello.ll` first, then
move on to `game.ll` to really get hands-on with it.

## Some cool screenshots

![Screenshot_2024-08-08_00-14-19](https://github.com/user-attachments/assets/dcc80151-6c3b-4a81-8922-807fcff0cb9b)

![Screenshot_2024-08-08_00-09-18](https://github.com/user-attachments/assets/e7b1ae9f-a6a8-4f6b-8adb-14574e442dbd)
