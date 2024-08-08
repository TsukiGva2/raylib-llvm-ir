; ModuleID = 'main.c'
target triple = "x86_64-pc-linux-gnu"

@.str = constant [15 x i8] c"Hello, World!\0A\00"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32
  %2 = alloca i32
  store i32 0, i32* %1
  store i32 0, i32* %2
  br label %3

  ; comparison block
3:                                                ; preds = %8, %0

  ; %4 <= load i32, from %2
  %4 = load i32, i32* %2

  ; %5 <= int_cmp: %4 < 10
  ; slt = SIGNED less than
  %5 = icmp slt i32 %4, 10

  ; %5 has type i1 <- int 1 bit
  ; branch to 6 if %5 else 11
  br i1 %5, label %6, label %11

  ; body
6:                                                ; preds = %3
  %7 = call i32 (i8*, ...)
  	@printf(i8* getelementptr (
		[15 x i8], [15 x i8]* @.str, i64 0, i64 0)
	)

  br label %8

  ; i++
8:                                                ; preds = %6
  ; %9 <= load i32, from %2
  %9 = load i32, i32* %2

  ; (nsw = no signed wrap)
  ; add i32, %9 with number 1
  %10 = add nsw i32 %9, 1

  ; store i32, %10 into i32* %2
  store i32 %10, i32* %2

  ; jump to %3
  br label %3

11:                                               ; preds = %3
  ret i32 0
}

declare i32 @printf(i8* noundef, ...) #1

