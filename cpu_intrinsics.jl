
function randuint() :: UInt32
    Base.llvmcall("""
%1 = call { i32, i32 } @llvm.x86.rdrand.32()
%2 = extractvalue { i32, i32 } %1, 0
ret i32 %2
        """,
        UInt32, Tuple{}
        )
end
