; ModuleID = 'main.c'
target triple = "x86_64-pc-linux-gnu"

@title = constant [17 x i8] c"Hello, from LLVM\00"

@width = constant i32 100
@height = constant i32 100

; win_size - size
@x_bound = constant i32 700
@y_bound = constant i32 500

; the following code (clang generated) packs the WHOLE struct into an i32
; ( MAY need ', align 1' to be able to do this right ( __attribute__((packed, aligned(1))) )

; basically red = u0xFF0000FF
;%struct.Color = type { i32, i32, i32, i32 }
;%color = alloca %struct.Color
;store i32 0, i32* %color
;%r = getelementptr %struct.Color, %struct.Color* %color, i32 0, i32 0
;store i32 255, i32* %r
;%g = getelementptr %struct.Color, %struct.Color* %color, i32 0, i32 1
;store i32 0, i32* %g
;%b = getelementptr %struct.Color, %struct.Color* %color, i32 0, i32 2
;store i32 0, i32* %b
;%a = getelementptr %struct.Color, %struct.Color* %color, i32 0, i32 3
;store i32 0, i32* %a
;%first = bitcast %struct.Color* %color to i32*
;%red = load i32, i32* %first

; bounds checking
define void @DoBoundPos(i32* %p, i32* %dp, i32 %pos_off, i32 %size) {
  %zero = icmp slt i32 %pos_off, 0
  %over = icmp sgt i32 %pos_off, %size

  %ok = or i1 %zero, %over

  br i1 %ok, label %update_dp, label %update_p

update_dp:
  %ldp = load i32, i32* %dp

  ; clever
  %neg_dp = sub nuw i32 0, %ldp
  store i32 %neg_dp, i32* %dp

  ret void

update_p:
  store i32 %pos_off, i32* %p

  ret void
}

define void @UpdatePos(i32* %x, i32* %y, i32* %dx, i32* %dy) {
  %posx = load i32, i32* %x
  %posy = load i32, i32* %y

  %ldx = load i32, i32* %dx
  %ldy = load i32, i32* %dy

  %posx_off = add nsw i32 %posx, %ldx
  %posy_off = add nsw i32 %posy, %ldy

  ; loading globals
  %x_bound = load i32, i32* @x_bound
  %y_bound = load i32, i32* @y_bound

  call void
    @DoBoundPos(
      i32* %x,
      i32* %dx,
      i32  %posx_off,
      i32  %x_bound
  )

  call void
    @DoBoundPos(
      i32* %y,
      i32* %dy,
      i32  %posy_off,
      i32  %y_bound
  )

  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define i32 @main() {

  %x = alloca i32
  %y = alloca i32

  %dx = alloca i32
  %dy = alloca i32

  store i32 200, i32* %x
  store i32 100, i32* %y

  store i32 1, i32* %dx
  store i32 1, i32* %dy

  br label %gameStart

gameStart:
  call void
    @InitWindow(
      i32 800,
      i32 600,
      i8* getelementptr (
        [17 x i8], [17 x i8] * @title, i64 0, i64 0
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

  ; global constants must be pointers
  %width = load i32, i32* @width
  %height = load i32, i32* @height
  
  call void
    @DrawRectangle(
      i32 %posx,
      i32 %posy,
      i32 %width,
      i32 %height,
      i32 u0xFF00FF00
    )

  call void @EndDrawing()

  ; incrementing position

  call void
    @UpdatePos(
      i32* %x,
      i32* %y,
      i32* %dx,
      i32* %dy
  )

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

