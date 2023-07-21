addi _$s1_, $s0, _12_?
LOOP: lw _$t0_, 0($s1)
      _beq_ $t0, _$zero_, _END_
      div _$t0_, $s2
      _slt_ _$t1_, $t0, 50
      _beq_ $t1, _$zero_, _ELSE_
      _mfhi_ $t0
      jmp _NEXT_
ELSE: _mflo_ _$t0_
NEXT: sw _$t0_, _0($s1)_
      addi _$s1_, _$s1_, _4_
      jmp _LOOP_
END: