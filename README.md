# llvm-ir-raylib

Simple llvm-ir example using raylib to make a bouncing square.

![tsoding](https://github.com/user-attachments/assets/79211f6a-0ae7-492e-bf26-04ee85303221)

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

![Screenshot_2024-08-08_00-14-19](https://github.com/user-attachments/assets/91798657-db3f-447a-8498-ee997c40f74a)

![Screenshot_2024-08-08_00-09-18](https://github.com/user-attachments/assets/723fcf9e-9169-4f10-bdde-a836375c83af)
