
function randuint() :: UInt32
    Base.llvmcall((
"""
define i32 @randuint() #0 {
  %1 = tail call { i32, i32 } @llvm.x86.rdrand.32() #2
  %2 = extractvalue { i32, i32 } %1, 0
  ret i32 %2
}

; Function Attrs: nounwind
declare { i32, i32 } @llvm.x86.rdrand.32() #2

attributes #0 = { nounwind ssp uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+ssse3,+cx16,+rdrnd,+sse,+sse2,+sse3" "unsafe-fp-math"="true" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+ssse3,+cx16,+rdrnd,+sse,+sse2,+sse3" "unsafe-fp-math"="true" "use-soft-float"="false" }
attributes #2 = { nounwind }
"""
,
"""
%1 = call i32 @randuint()
ret i32 %1
"""),
        UInt32, Tuple{}
        )
end
