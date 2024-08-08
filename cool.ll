; ModuleID = 'main.c'
target triple = "x86_64-pc-linux-gnu"

@.str = constant [17 x i8] c"Hello, from LLVM\00"

; this casts the WHOLE struct into an i32
; basically red = u0xFF0000FF

;%struct.Color = type { i8, i8, i8, i8 }
;%color = alloca %struct.Color
;store i32 0, i32* %color
;%r = getelementptr %struct.Color, %struct.Color* %color, i32 0, i32 0
;store i8 255, i8* %r
;%g = getelementptr %struct.Color, %struct.Color* %color, i32 0, i32 1
;store i8 0, i8* %g
;%b = getelementptr %struct.Color, %struct.Color* %color, i32 0, i32 2
;store i8 0, i8* %b
;%a = getelementptr %struct.Color, %struct.Color* %color, i32 0, i32 3
;store i8 0, i8* %a
;%first = bitcast %struct.Color* %color to i32*
;%red = load i32, i32* %first

; Function Attrs: noinline nounwind optnone uwtable
define i32 @main() {

  %x = alloca i32
  %y = alloca i32

  store i32 100, i32* %x
  store i32 100, i32* %y

  br label %gameStart

gameStart:
  call void
    @InitWindow(
      i32 800,
      i32 600,
      i8* getelementptr (
        [17 x i8], [17 x i8]* @.str, i64 0, i64 0
      )
  )

  br label %shouldClose
  
shouldClose:
  %close = call i1 @WindowShouldClose()

  br i1 %close, label %closeWindow, label %draw

draw:
  call void @BeginDrawing()

  call void @ClearBackground(i32 u0xFF181818)

  %posx = load i32, i32* %x
  %posy = load i32, i32* %y

  call void
    @DrawRectangle(
      i32 %posx,
      i32 %posy,
      i32 100,
      i32 100,
      i32 u0xFF00FF00
    )

  call void @EndDrawing()

  ; incrementing positions

  %posx_off = add nsw i32 %posx, 1
  %posy_off = add nsw i32 %posy, 1

  store i32 %posx_off, i32* %x
  store i32 %posy_off, i32* %y


  br label %shouldClose

closeWindow:
  call void @CloseWindow()
  ret i32 0
}

declare void @InitWindow(i32, i32, i8*)
declare void @CloseWindow()

declare void @ClearBackground(i32)

declare void @BeginDrawing()
declare void @EndDrawing()

declare void @DrawRectangle(i32, i32, i32, i32, i32)

declare i1   @WindowShouldClose()

