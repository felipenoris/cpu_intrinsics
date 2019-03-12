
function randuint() :: UInt32
    Base.llvmcall((
"""
; Function Attrs: noinline nounwind optnone uwtable
define i32 @randuint() #0 {
  %1 = alloca i32*, align 8
  %2 = alloca i32, align 4
  store i32* %2, i32** %1, align 8
  %3 = load i32*, i32** %1, align 8
  %4 = call { i32, i32 } @llvm.x86.rdrand.32() #3
  %5 = extractvalue { i32, i32 } %4, 0
  store i32 %5, i32* %3
  %6 = extractvalue { i32, i32 } %4, 1
  %7 = load i32, i32* %2, align 4
  ret i32 %7
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare { i32, i32 } @llvm.x86.rdrand.32() #3

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+rdrnd,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+rdrnd,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
"""
,
"""
%1 = call i32 @randuint()
ret i32 %1
"""),
        UInt32, Tuple{}
        )
end
