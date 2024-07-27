---
title: Special projekt SCK
header: Exe_unit_w47 
author: Arseni Sialitski
date: December 12, 2023
---


# Specyfikacja modułu Exe_unit_w47

## Opis

Moduł **exe_unit_w47** jest jednostką wykonawczą, działającą na liczbach systemu ZNAK-MODUŁ. Realizuje operacje arytmetyczne i logiczne na liczbach całkowitych.

## Wejścia i wyjścia:
 

| Wejścia  | Szerokość| Funkcja |
| -------- |:--------:|:---------:|
| i_oper   | **N**-bitowe | Kod operacji |
| i_argA   | **M**-bitowe | argument A |
| i_argB   | **M**-bitowe | argument B |
| i_clk    | binarne  | wejście zegara |
| i_rsn    | binarne  | reset synchroniczny |

| Wyjście  | Szerokość | funkcja |
| -------- |:----------:|:---:|
| o_result   | **M**-bitow    | wyjście synchroniczne wyniku  |
| o_status   |   4-bitowe     | wyjście synchroniczne statusu |

 **N** oraz **M** - parametry, moduł testowany przy **M** = 4; **N** ma być nie mniejszy niż *2* do poprawnego działania modułu. 

Każdy z czterech bitów wyjścia **o_status** opisuje otrzymany wynik w następujący sposób:

|Pozycja | Nazwa | Opis |Przykład (od o_result)|
|---|:-:|:-:|:--:|
| 3 | ERROR | operacja nie została wykonana|  -  |
| 2 | ODD   | w wyniku jest nieparzysta liczba jedynek| 1001 |
| 1 | ZERO |  wszystkie bity wyniku są ustawione na 0 |0000|
| 0 | NEG |  wynik jest liczbą ujemną|1010|



## Realizowane funkcji:

W zależności od ustawionej wartości na wejściu sterującym **i_oper** moduł wykona następujące funkcji: 

|i_oper|  Funkcja |
| ---- |:-----------------:|
| 00   | Zamiana na liczbę przeciwną argumentu B |
| 01   | Porównanie argumentów A >= B|
| 10   | Ustawienie bitu B w argumencie A na wartość 0 |
| 11   | Konwersja argumentu A z kodu **ZNAK-MODUŁ** na kod **U2** |

## Schemat blokowy 

![](schemat.png)
 Schemat uproszczony działania układu 

## Raport z syntezy logiczney Yosys

```

 /----------------------------------------------------------------------------\
 |                                                                            |
 |  yosys -- Yosys Open SYnthesis Suite                                       |
 |                                                                            |
 |  Copyright (C) 2012 - 2020  Claire Xenia Wolf <claire@yosyshq.com>         |
 |                                                                            |
 |  Permission to use, copy, modify, and/or distribute this software for any  |
 |  purpose with or without fee is hereby granted, provided that the above    |
 |  copyright notice and this permission notice appear in all copies.         |
 |                                                                            |
 |  THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES  |
 |  WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF          |
 |  MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR   |
 |  ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES    |
 |  WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN     |
 |  ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF   |
 |  OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.            |
 |                                                                            |
 \----------------------------------------------------------------------------/

 Yosys 0.34 (git sha1 4a1b5599258, gcc 13.2.1 -march=x86-64 -mtune=generic -O2 
 -fno-plt -fexceptions -fstack-clash-protection -fcf-protection 
 -ffile-prefix-map=/build/yosys/src=/usr/src/debug/yosys -fPIC -Os)


-- Executing script file `run.ys' --

1. Executing Verilog-2005 frontend: sync_arith_unit_1.sv
Parsing SystemVerilog input from `sync_arith_unit_1.sv' to AST representation.
Generating RTLIL representation for module `\sync_arith_unit_1'.
Successfully finished Verilog frontend.

2. Executing HIERARCHY pass (managing design hierarchy).

2.1. Analyzing design hierarchy..
Top module:  \sync_arith_unit_1_rtl

2.2. Analyzing design hierarchy..
Top module:  \sync_arith_unit_1_rtl
Removing unused module `\sync_arith_unit_1'.
Removed 1 unused modules.

3. Executing SYNTH pass.

3.1. Executing HIERARCHY pass (managing design hierarchy).

3.1.1. Analyzing design hierarchy..
Top module:  \sync_arith_unit_1_rtl

3.1.2. Analyzing design hierarchy..
Top module:  \sync_arith_unit_1_rtl
Removed 0 unused modules.

3.2. Executing PROC pass (convert processes to netlists).

3.2.1. Executing PROC_CLEAN pass (remove empty switches from decision trees).
Cleaned up 0 empty switches.

3.2.2. Executing PROC_RMDEAD pass (remove dead branches from decision trees).
Removed 1 dead cases from process $proc$sync_arith_unit_1.sv:0$4 in 
module sync_arith_unit_1_rtl.
Marked 7 switch rules as full_case in process $proc$sync_arith_unit_1.sv:
0$4 in module sync_arith_unit_1_rtl.
Marked 1 switch rules as full_case in process $proc$sync_arith_unit_1.sv:
116$52 in module sync_arith_unit_1_rtl.
Removed a total of 1 dead cases.

3.2.3. Executing PROC_PRUNE pass (remove redundant assignments in processes).
Removed 5 redundant assignments.
Promoted 14 assignments to connections.

3.2.4. Executing PROC_INIT pass (extract init attributes).
Found init rule in `\sync_arith_unit_1_rtl.$proc$sync_arith_unit_1.sv:0$54'.
  Set init value: \o_result = 4'0000
  Set init value: \o_status = 4'0000
  Set init value: \s_op = 2'00
  Set init value: \s_arg_A = 4'0000
  Set init value: \s_arg_B = 4'0000

3.2.5. Executing PROC_ARST pass (detect async resets in processes).

3.2.6. Executing PROC_ROM pass (convert switches to ROMs).
Converted 0 switches.
<suppressed ~8 debug messages>

3.2.7. Executing PROC_MUX pass (convert decision trees to multiplexers).
Creating decoders for process `\sync_arith_unit_1_rtl.$proc$sync_arith_unit_1.sv:0$4'.
     1/21: $7\s_result[3:0] [3]
     2/21: $7\s_result[3:0] [2:0]
     3/21: $2\OVERFLOW[0:0]
     4/21: $4\ERROR[0:0]
     5/21: $6\s_result[3:0]
     6/21: $3\ERROR[0:0]
     7/21: $5\s_result[3:0]
     8/21: $2$bitselwrite$sel$sync_arith_unit_1.sv:82$3[3:0]$28
     9/21: $2$bitselwrite$data$sync_arith_unit_1.sv:82$2[3:0]$27
    10/21: $2$bitselwrite$mask$sync_arith_unit_1.sv:82$1[3:0]$26
    11/21: $4\s_result[3:0]
    12/21: $3\s_result[3:0]
    13/21: $2\ERROR[0:0]
    14/21: $2\s_result[3:0]
    15/21: $1\s_result[3:0]
    16/21: $1\ERROR[0:0]
    17/21: $1$bitselwrite$sel$sync_arith_unit_1.sv:82$3[3:0]$10
    18/21: $1$bitselwrite$data$sync_arith_unit_1.sv:82$2[3:0]$9
    19/21: $1$bitselwrite$mask$sync_arith_unit_1.sv:82$1[3:0]$8
    20/21: $1\OVERFLOW[0:0]
    21/21: $1\pos_comp_result[0:0]
Creating decoders for process `\sync_arith_unit_1_rtl.$proc$sync_arith_unit_1.sv:116$52'.
     1/5: $0\o_status[3:0]
     2/5: $0\o_result[3:0]
     3/5: $0\s_op[1:0]
     4/5: $0\s_arg_B[3:0]
     5/5: $0\s_arg_A[3:0]
Creating decoders for process `\sync_arith_unit_1_rtl.$proc$sync_arith_unit_1.sv:0$54'.

3.2.8. Executing PROC_DLATCH pass (convert process syncs to latches).
No latch inferred for signal `\sync_arith_unit_1_rtl.\pos_comp_result' 
from process `\sync_arith_unit_1_rtl.$proc$sync_arith_unit_1.sv:0$4'.
No latch inferred for signal `\sync_arith_unit_1_rtl.\ERROR' from process 
`\sync_arith_unit_1_rtl.$proc$sync_arith_unit_1.sv:0$4'.
No latch inferred for signal `\sync_arith_unit_1_rtl.\EVEN_ONES' from process 
`\sync_arith_unit_1_rtl.$proc$sync_arith_unit_1.sv:0$4'.
No latch inferred for signal `\sync_arith_unit_1_rtl.\ZEROS' from process 
`\sync_arith_unit_1_rtl.$proc$sync_arith_unit_1.sv:0$4'.
No latch inferred for signal `\sync_arith_unit_1_rtl.\OVERFLOW' from process 
`\sync_arith_unit_1_rtl.$proc$sync_arith_unit_1.sv:0$4'.
No latch inferred for signal `\sync_arith_unit_1_rtl.\s_result' from process 
`\sync_arith_unit_1_rtl.$proc$sync_arith_unit_1.sv:0$4'.
No latch inferred for signal `\sync_arith_unit_1_rtl.$bitselwrite$mask
$sync_arith_unit_1.sv:82$1' from process `\sync_arith_unit_1_rtl.
$proc$sync_arith_unit_1.sv:0$4'.
No latch inferred for signal `\sync_arith_unit_1_rtl.$bitselwrite$data
$sync_arith_unit_1.sv:82$2' from process `\sync_arith_unit_1_rtl.
$proc$sync_arith_unit_1.sv:0$4'.
No latch inferred for signal `\sync_arith_unit_1_rtl.$bitselwrite$sel
$sync_arith_unit_1.sv:82$3' from process `\sync_arith_unit_1_rtl.
$proc$sync_arith_unit_1.sv:0$4'.

3.2.9. Executing PROC_DFF pass (convert process syncs to FFs).
Creating register for signal `\sync_arith_unit_1_rtl.\o_result' 
using process `\sync_arith_unit_1_rtl.$proc$sync_arith_unit_1.sv:116$52'.
  created $dff cell `$procdff$198' with positive edge clock.
Creating register for signal `\sync_arith_unit_1_rtl.\o_status' 
using process `\sync_arith_unit_1_rtl.$proc$sync_arith_unit_1.sv:116$52'.
  created $dff cell `$procdff$199' with positive edge clock.
Creating register for signal `\sync_arith_unit_1_rtl.\s_op' 
using process `\sync_arith_unit_1_rtl.$proc$sync_arith_unit_1.sv:116$52'.
  created $dff cell `$procdff$200' with positive edge clock.
Creating register for signal `\sync_arith_unit_1_rtl.\s_arg_A' 
using process `\sync_arith_unit_1_rtl.$proc$sync_arith_unit_1.sv:116$52'.
  created $dff cell `$procdff$201' with positive edge clock.
Creating register for signal `\sync_arith_unit_1_rtl.\s_arg_B' 
using process `\sync_arith_unit_1_rtl.$proc$sync_arith_unit_1.sv:116$52'.
  created $dff cell `$procdff$202' with positive edge clock.

3.2.10. Executing PROC_MEMWR pass (convert process memory writes to cells).

3.2.11. Executing PROC_CLEAN pass (remove empty switches from decision trees).
Found and cleaned up 7 empty switches in `\sync_arith_unit_1_rtl.
$proc$sync_arith_unit_1.sv:0$4'.
Removing empty process `sync_arith_unit_1_rtl.$proc$sync_arith_unit_1.sv:0$4'.
Found and cleaned up 1 empty switch in `\sync_arith_unit_1_rtl.
$proc$sync_arith_unit_1.sv:116$52'.
Removing empty process `sync_arith_unit_1_rtl.$proc$sync_arith_unit_1.sv:116$52'.
Removing empty process `sync_arith_unit_1_rtl.$proc$sync_arith_unit_1.sv:0$54'.
Cleaned up 8 empty switches.

3.2.12. Executing OPT_EXPR pass (perform const folding).
Optimizing module sync_arith_unit_1_rtl.
<suppressed ~23 debug messages>

3.3. Executing OPT_EXPR pass (perform const folding).
Optimizing module sync_arith_unit_1_rtl.
<suppressed ~2 debug messages>

3.4. Executing OPT_CLEAN pass (remove unused cells and wires).
Finding unused cells or wires in module \sync_arith_unit_1_rtl..
Removed 27 unused cells and 106 unused wires.
<suppressed ~31 debug messages>

3.5. Executing CHECK pass (checking for obvious problems).
Checking module sync_arith_unit_1_rtl...
Found and reported 0 problems.

3.6. Executing OPT pass (performing simple optimizations).

3.6.1. Executing OPT_EXPR pass (perform const folding).
Optimizing module sync_arith_unit_1_rtl.

3.6.2. Executing OPT_MERGE pass (detect identical cells).
Finding identical cells in module `\sync_arith_unit_1_rtl'.
<suppressed ~66 debug messages>
Removed a total of 22 cells.

3.6.3. Executing OPT_MUXTREE pass (detect dead branches in mux trees).
Running muxtree optimizer on module \sync_arith_unit_1_rtl..
  Creating internal representation of mux trees.
  Evaluating internal representation of mux trees.
  Analyzing evaluation results.
    dead port 1/2 on $mux $procmux$122.
    dead port 2/2 on $mux $procmux$124.
    dead port 2/2 on $mux $procmux$131.
    dead port 2/2 on $mux $procmux$139.
    dead port 2/2 on $mux $procmux$147.
    dead port 1/2 on $mux $procmux$59.
    dead port 2/2 on $mux $procmux$61.
    dead port 1/2 on $mux $procmux$67.
    dead port 2/2 on $mux $procmux$69.
    dead port 2/2 on $mux $procmux$74.
    dead port 2/2 on $mux $procmux$79.
    dead port 2/2 on $mux $procmux$84.
    dead port 2/2 on $mux $procmux$90.
    dead port 2/2 on $mux $procmux$96.
Removed 14 multiplexer ports.
<suppressed ~7 debug messages>

3.6.4. Executing OPT_REDUCE pass (consolidate $*mux and $reduce_* inputs).
  Optimizing cells in module \sync_arith_unit_1_rtl.
    New ctrl vector for $pmux cell $procmux$174: { $auto$opt_reduce.cc:134:
    opt_pmux$204 $procmux$150_CMP }
  Optimizing cells in module \sync_arith_unit_1_rtl.
Performed a total of 1 changes.

3.6.5. Executing OPT_MERGE pass (detect identical cells).
Finding identical cells in module `\sync_arith_unit_1_rtl'.
<suppressed ~3 debug messages>
Removed a total of 1 cells.

3.6.6. Executing OPT_DFF pass (perform DFF optimizations).

3.6.7. Executing OPT_CLEAN pass (remove unused cells and wires).
Finding unused cells or wires in module \sync_arith_unit_1_rtl..
Removed 0 unused cells and 37 unused wires.
<suppressed ~1 debug messages>

3.6.8. Executing OPT_EXPR pass (perform const folding).
Optimizing module sync_arith_unit_1_rtl.

3.6.9. Rerunning OPT passes. (Maybe there is more to do..)

3.6.10. Executing OPT_MUXTREE pass (detect dead branches in mux trees).
Running muxtree optimizer on module \sync_arith_unit_1_rtl..
  Creating internal representation of mux trees.
  Evaluating internal representation of mux trees.
  Analyzing evaluation results.
Removed 0 multiplexer ports.
<suppressed ~8 debug messages>

3.6.11. Executing OPT_REDUCE pass (consolidate $*mux and $reduce_* inputs).
  Optimizing cells in module \sync_arith_unit_1_rtl.
Performed a total of 0 changes.

3.6.12. Executing OPT_MERGE pass (detect identical cells).
Finding identical cells in module `\sync_arith_unit_1_rtl'.
Removed a total of 0 cells.

3.6.13. Executing OPT_DFF pass (perform DFF optimizations).

3.6.14. Executing OPT_CLEAN pass (remove unused cells and wires).
Finding unused cells or wires in module \sync_arith_unit_1_rtl..

3.6.15. Executing OPT_EXPR pass (perform const folding).
Optimizing module sync_arith_unit_1_rtl.

3.6.16. Finished OPT passes. (There is nothing left to do.)

3.7. Executing FSM pass (extract and optimize FSM).

3.7.1. Executing FSM_DETECT pass (finding FSMs in design).

3.7.2. Executing FSM_EXTRACT pass (extracting FSM from design).

3.7.3. Executing FSM_OPT pass (simple optimizations of FSMs).

3.7.4. Executing OPT_CLEAN pass (remove unused cells and wires).
Finding unused cells or wires in module \sync_arith_unit_1_rtl..

3.7.5. Executing FSM_OPT pass (simple optimizations of FSMs).

3.7.6. Executing FSM_RECODE pass (re-assigning FSM state encoding).

3.7.7. Executing FSM_INFO pass (dumping all available information on FSM cells).

3.7.8. Executing FSM_MAP pass (mapping FSMs to basic logic).

3.8. Executing OPT pass (performing simple optimizations).

3.8.1. Executing OPT_EXPR pass (perform const folding).
Optimizing module sync_arith_unit_1_rtl.

3.8.2. Executing OPT_MERGE pass (detect identical cells).
Finding identical cells in module `\sync_arith_unit_1_rtl'.
Removed a total of 0 cells.

3.8.3. Executing OPT_MUXTREE pass (detect dead branches in mux trees).
Running muxtree optimizer on module \sync_arith_unit_1_rtl..
  Creating internal representation of mux trees.
  Evaluating internal representation of mux trees.
  Analyzing evaluation results.
Removed 0 multiplexer ports.
<suppressed ~8 debug messages>

3.8.4. Executing OPT_REDUCE pass (consolidate $*mux and $reduce_* inputs).
  Optimizing cells in module \sync_arith_unit_1_rtl.
Performed a total of 0 changes.

3.8.5. Executing OPT_MERGE pass (detect identical cells).
Finding identical cells in module `\sync_arith_unit_1_rtl'.
Removed a total of 0 cells.

3.8.6. Executing OPT_DFF pass (perform DFF optimizations).
Adding SRST signal on $procdff$202 ($dff) from module sync_arith_unit_1_rtl 
(D = \i_arg_B, Q = \s_arg_B, rval = 4'0000).
Adding SRST signal on $procdff$201 ($dff) from module sync_arith_unit_1_rtl 
(D = \i_arg_A, Q = \s_arg_A, rval = 4'0000).
Adding SRST signal on $procdff$200 ($dff) from module sync_arith_unit_1_rtl 
(D = \i_op, Q = \s_op, rval = 2'00).
Adding SRST signal on $procdff$199 ($dff) from module sync_arith_unit_1_rtl 
(D = { \ERROR \EVEN_ONES \ZEROS \OVERFLOW }, Q = \o_status, rval = 4'0000).
Adding SRST signal on $procdff$198 ($dff) from module sync_arith_unit_1_rtl 
(D = \s_result, Q = \o_result, rval = 4'0000).

3.8.7. Executing OPT_CLEAN pass (remove unused cells and wires).
Finding unused cells or wires in module \sync_arith_unit_1_rtl..
Removed 5 unused cells and 5 unused wires.
<suppressed ~6 debug messages>

3.8.8. Executing OPT_EXPR pass (perform const folding).
Optimizing module sync_arith_unit_1_rtl.

3.8.9. Rerunning OPT passes. (Maybe there is more to do..)

3.8.10. Executing OPT_MUXTREE pass (detect dead branches in mux trees).
Running muxtree optimizer on module \sync_arith_unit_1_rtl..
  Creating internal representation of mux trees.
  Evaluating internal representation of mux trees.
  Analyzing evaluation results.
Removed 0 multiplexer ports.
<suppressed ~4 debug messages>

3.8.11. Executing OPT_REDUCE pass (consolidate $*mux and $reduce_* inputs).
  Optimizing cells in module \sync_arith_unit_1_rtl.
Performed a total of 0 changes.

3.8.12. Executing OPT_MERGE pass (detect identical cells).
Finding identical cells in module `\sync_arith_unit_1_rtl'.
Removed a total of 0 cells.

3.8.13. Executing OPT_DFF pass (perform DFF optimizations).

3.8.14. Executing OPT_CLEAN pass (remove unused cells and wires).
Finding unused cells or wires in module \sync_arith_unit_1_rtl..

3.8.15. Executing OPT_EXPR pass (perform const folding).
Optimizing module sync_arith_unit_1_rtl.

3.8.16. Finished OPT passes. (There is nothing left to do.)

3.9. Executing WREDUCE pass (reducing word size of cells).
Removed top 29 bits (of 32) from port B of cell sync_arith_unit_1_rtl.
$gt$sync_arith_unit_1.sv:44$12 ($gt).
Removed top 30 bits (of 32) from port B of cell sync_arith_unit_1_rtl.
$gt$sync_arith_unit_1.sv:75$24 ($gt).
Removed top 27 bits (of 32) from port A of cell sync_arith_unit_1_rtl.
$neg$sync_arith_unit_1.sv:0$30 ($neg).
Converting cell sync_arith_unit_1_rtl.$neg$sync_arith_unit_1.sv:0$30 
($neg) from signed to unsigned.
Removed top 1 bits (of 5) from port A of cell sync_arith_unit_1_rtl.
$neg$sync_arith_unit_1.sv:0$30 ($neg).
Removed top 28 bits (of 32) from port Y of cell sync_arith_unit_1_rtl.
$shift$sync_arith_unit_1.sv:0$34 ($shift).
Removed top 1 bits (of 4) from port B of cell sync_arith_unit_1_rtl.
$sub$sync_arith_unit_1.sv:97$42 ($sub).
Removed top 1 bits (of 4) from port Y of cell sync_arith_unit_1_rtl.
$sub$sync_arith_unit_1.sv:97$42 ($sub).
Removed top 3 bits (of 4) from port A of cell sync_arith_unit_1_rtl.
$sub$sync_arith_unit_1.sv:97$42 ($sub).
Removed top 1 bits (of 2) from port B of cell sync_arith_unit_1_rtl.
$procmux$125_CMP0 ($eq).
Removed top 28 bits (of 32) from wire sync_arith_unit_1_rtl.
$shift$sync_arith_unit_1.sv:0$34_Y.
Removed top 1 bits (of 4) from wire sync_arith_unit_1_rtl.
$sub$sync_arith_unit_1.sv:97$42_Y.

3.10. Executing PEEPOPT pass (run peephole optimizers).

3.11. Executing OPT_CLEAN pass (remove unused cells and wires).
Finding unused cells or wires in module \sync_arith_unit_1_rtl..
Removed 0 unused cells and 2 unused wires.
<suppressed ~1 debug messages>

3.12. Executing ALUMACC pass (create $alu and $macc cells).
Extracting $alu and $macc cells in module sync_arith_unit_1_rtl:
  creating $macc model for $neg$sync_arith_unit_1.sv:0$30 ($neg).
  creating $macc model for $sub$sync_arith_unit_1.sv:97$42 ($sub).
  creating $alu model for $macc $sub$sync_arith_unit_1.sv:97$42.
  creating $alu model for $macc $neg$sync_arith_unit_1.sv:0$30.
  creating $alu model for $ge$sync_arith_unit_1.sv:57$15 ($ge): new $alu
  creating $alu model for $gt$sync_arith_unit_1.sv:44$12 ($gt): new $alu
  creating $alu model for $gt$sync_arith_unit_1.sv:75$24 ($gt): new $alu
  creating $alu cell for $gt$sync_arith_unit_1.sv:75$24: 
  $auto$alumacc.cc:485:replace_alu$215
  creating $alu cell for $gt$sync_arith_unit_1.sv:44$12: 
  $auto$alumacc.cc:485:replace_alu$220
  creating $alu cell for $ge$sync_arith_unit_1.sv:57$15: 
  $auto$alumacc.cc:485:replace_alu$225
  creating $alu cell for $neg$sync_arith_unit_1.sv:0$30: 
  $auto$alumacc.cc:485:replace_alu$234
  creating $alu cell for $sub$sync_arith_unit_1.sv:97$42: 
  $auto$alumacc.cc:485:replace_alu$237
  created 5 $alu and 0 $macc cells.

3.13. Executing SHARE pass (SAT-based resource sharing).

3.14. Executing OPT pass (performing simple optimizations).

3.14.1. Executing OPT_EXPR pass (perform const folding).
Optimizing module sync_arith_unit_1_rtl.

3.14.2. Executing OPT_MERGE pass (detect identical cells).
Finding identical cells in module `\sync_arith_unit_1_rtl'.
<suppressed ~3 debug messages>
Removed a total of 1 cells.

3.14.3. Executing OPT_MUXTREE pass (detect dead branches in mux trees).
Running muxtree optimizer on module \sync_arith_unit_1_rtl..
  Creating internal representation of mux trees.
  Evaluating internal representation of mux trees.
  Analyzing evaluation results.
Removed 0 multiplexer ports.
<suppressed ~4 debug messages>

3.14.4. Executing OPT_REDUCE pass (consolidate $*mux and $reduce_* inputs).
  Optimizing cells in module \sync_arith_unit_1_rtl.
Performed a total of 0 changes.

3.14.5. Executing OPT_MERGE pass (detect identical cells).
Finding identical cells in module `\sync_arith_unit_1_rtl'.
Removed a total of 0 cells.

3.14.6. Executing OPT_DFF pass (perform DFF optimizations).

3.14.7. Executing OPT_CLEAN pass (remove unused cells and wires).
Finding unused cells or wires in module \sync_arith_unit_1_rtl..
Removed 0 unused cells and 4 unused wires.
<suppressed ~1 debug messages>

3.14.8. Executing OPT_EXPR pass (perform const folding).
Optimizing module sync_arith_unit_1_rtl.

3.14.9. Rerunning OPT passes. (Maybe there is more to do..)

3.14.10. Executing OPT_MUXTREE pass (detect dead branches in mux trees).
Running muxtree optimizer on module \sync_arith_unit_1_rtl..
  Creating internal representation of mux trees.
  Evaluating internal representation of mux trees.
  Analyzing evaluation results.
Removed 0 multiplexer ports.
<suppressed ~4 debug messages>

3.14.11. Executing OPT_REDUCE pass (consolidate $*mux and $reduce_* inputs).
  Optimizing cells in module \sync_arith_unit_1_rtl.
Performed a total of 0 changes.

3.14.12. Executing OPT_MERGE pass (detect identical cells).
Finding identical cells in module `\sync_arith_unit_1_rtl'.
Removed a total of 0 cells.

3.14.13. Executing OPT_DFF pass (perform DFF optimizations).

3.14.14. Executing OPT_CLEAN pass (remove unused cells and wires).
Finding unused cells or wires in module \sync_arith_unit_1_rtl..

3.14.15. Executing OPT_EXPR pass (perform const folding).
Optimizing module sync_arith_unit_1_rtl.

3.14.16. Finished OPT passes. (There is nothing left to do.)

3.15. Executing MEMORY pass.

3.15.1. Executing OPT_MEM pass (optimize memories).
Performed a total of 0 transformations.

3.15.2. Executing OPT_MEM_PRIORITY pass (removing unnecessary memory 
write priority relations).
Performed a total of 0 transformations.

3.15.3. Executing OPT_MEM_FEEDBACK pass (finding memory read-to-write 
feedback paths).

3.15.4. Executing MEMORY_BMUX2ROM pass (converting muxes to ROMs).

3.15.5. Executing MEMORY_DFF pass (merging $dff cells to $memrd).

3.15.6. Executing OPT_CLEAN pass (remove unused cells and wires).
Finding unused cells or wires in module \sync_arith_unit_1_rtl..

3.15.7. Executing MEMORY_SHARE pass (consolidating $memrd/$memwr cells).

3.15.8. Executing OPT_MEM_WIDEN pass (optimize memories where all ports are wide).
Performed a total of 0 transformations.

3.15.9. Executing OPT_CLEAN pass (remove unused cells and wires).
Finding unused cells or wires in module \sync_arith_unit_1_rtl..

3.15.10. Executing MEMORY_COLLECT pass (generating $mem cells).

3.16. Executing OPT_CLEAN pass (remove unused cells and wires).
Finding unused cells or wires in module \sync_arith_unit_1_rtl..

3.17. Executing OPT pass (performing simple optimizations).

3.17.1. Executing OPT_EXPR pass (perform const folding).
Optimizing module sync_arith_unit_1_rtl.
<suppressed ~13 debug messages>

3.17.2. Executing OPT_MERGE pass (detect identical cells).
Finding identical cells in module `\sync_arith_unit_1_rtl'.
Removed a total of 0 cells.

3.17.3. Executing OPT_DFF pass (perform DFF optimizations).

3.17.4. Executing OPT_CLEAN pass (remove unused cells and wires).
Finding unused cells or wires in module \sync_arith_unit_1_rtl..
Removed 4 unused cells and 11 unused wires.
<suppressed ~5 debug messages>

3.17.5. Finished fast OPT passes.

3.18. Executing MEMORY_MAP pass (converting memories to logic and flip-flops).

3.19. Executing OPT pass (performing simple optimizations).

3.19.1. Executing OPT_EXPR pass (perform const folding).
Optimizing module sync_arith_unit_1_rtl.

3.19.2. Executing OPT_MERGE pass (detect identical cells).
Finding identical cells in module `\sync_arith_unit_1_rtl'.
Removed a total of 0 cells.

3.19.3. Executing OPT_MUXTREE pass (detect dead branches in mux trees).
Running muxtree optimizer on module \sync_arith_unit_1_rtl..
  Creating internal representation of mux trees.
  Evaluating internal representation of mux trees.
  Analyzing evaluation results.
Removed 0 multiplexer ports.
<suppressed ~2 debug messages>

3.19.4. Executing OPT_REDUCE pass (consolidate $*mux and $reduce_* inputs).
  Optimizing cells in module \sync_arith_unit_1_rtl.
    Consolidated identical input bits for $mux cell $procmux$119:
      Old ports: A={ $auto$rtlil.cc:2465:ReduceOr$233 
      $auto$rtlil.cc:2465:ReduceOr$233 $auto$rtlil.cc:2465:ReduceOr$233 
      $auto$rtlil.cc:2465:ReduceOr$233 }, B=4'0000, Y=$4\s_result[3:0]
      New ports: A=$auto$rtlil.cc:2465:ReduceOr$233, B=1'0, 
      Y=$4\s_result[3:0] [0]
      New connections: $4\s_result[3:0] [3:1] = { $4\s_result[3:0] 
      [0] $4\s_result[3:0] [0] $4\s_result[3:0] [0] }
  Optimizing cells in module \sync_arith_unit_1_rtl.
    Consolidated identical input bits for $mux cell $procmux$129:
      Old ports: A=$4\s_result[3:0], B=4'0001, Y=$3\s_result[3:0]
      New ports: A={ $4\s_result[3:0] [0] $4\s_result[3:0] [0] }, 
      B=2'01, Y=$3\s_result[3:0] [1:0]
      New connections: $3\s_result[3:0] [3:2] = { $3\s_result[3:0] 
      [1] $3\s_result[3:0] [1] }
  Optimizing cells in module \sync_arith_unit_1_rtl.
Performed a total of 2 changes.

3.19.5. Executing OPT_MERGE pass (detect identical cells).
Finding identical cells in module `\sync_arith_unit_1_rtl'.
Removed a total of 0 cells.

3.19.6. Executing OPT_SHARE pass.
    Found cells that share an operand and can be merged by moving the 
    $pmux $procmux$154 in front of them:
        $logic_or$sync_arith_unit_1.sv:75$25
        $logic_or$sync_arith_unit_1.sv:44$13

3.19.7. Executing OPT_DFF pass (perform DFF optimizations).

3.19.8. Executing OPT_CLEAN pass (remove unused cells and wires).
Finding unused cells or wires in module \sync_arith_unit_1_rtl..
Removed 0 unused cells and 2 unused wires.
<suppressed ~1 debug messages>

3.19.9. Executing OPT_EXPR pass (perform const folding).
Optimizing module sync_arith_unit_1_rtl.

3.19.10. Rerunning OPT passes. (Maybe there is more to do..)

3.19.11. Executing OPT_MUXTREE pass (detect dead branches in mux trees).
Running muxtree optimizer on module \sync_arith_unit_1_rtl..
  Creating internal representation of mux trees.
  Evaluating internal representation of mux trees.
  Analyzing evaluation results.
Removed 0 multiplexer ports.
<suppressed ~3 debug messages>

3.19.12. Executing OPT_REDUCE pass (consolidate $*mux and $reduce_* inputs).
  Optimizing cells in module \sync_arith_unit_1_rtl.
    New ctrl vector for $pmux cell $procmux$154: { $procmux$125_CMP 
    $procmux$150_CMP }
  Optimizing cells in module \sync_arith_unit_1_rtl.
Performed a total of 1 changes.

3.19.13. Executing OPT_MERGE pass (detect identical cells).
Finding identical cells in module `\sync_arith_unit_1_rtl'.
Removed a total of 0 cells.

3.19.14. Executing OPT_SHARE pass.

3.19.15. Executing OPT_DFF pass (perform DFF optimizations).

3.19.16. Executing OPT_CLEAN pass (remove unused cells and wires).
Finding unused cells or wires in module \sync_arith_unit_1_rtl..

3.19.17. Executing OPT_EXPR pass (perform const folding).
Optimizing module sync_arith_unit_1_rtl.

3.19.18. Rerunning OPT passes. (Maybe there is more to do..)

3.19.19. Executing OPT_MUXTREE pass (detect dead branches in mux trees).
Running muxtree optimizer on module \sync_arith_unit_1_rtl..
  Creating internal representation of mux trees.
  Evaluating internal representation of mux trees.
  Analyzing evaluation results.
Removed 0 multiplexer ports.
<suppressed ~3 debug messages>

3.19.20. Executing OPT_REDUCE pass (consolidate $*mux and $reduce_* inputs).
  Optimizing cells in module \sync_arith_unit_1_rtl.
Performed a total of 0 changes.

3.19.21. Executing OPT_MERGE pass (detect identical cells).
Finding identical cells in module `\sync_arith_unit_1_rtl'.
Removed a total of 0 cells.

3.19.22. Executing OPT_SHARE pass.

3.19.23. Executing OPT_DFF pass (perform DFF optimizations).

3.19.24. Executing OPT_CLEAN pass (remove unused cells and wires).
Finding unused cells or wires in module \sync_arith_unit_1_rtl..

3.19.25. Executing OPT_EXPR pass (perform const folding).
Optimizing module sync_arith_unit_1_rtl.

3.19.26. Finished OPT passes. (There is nothing left to do.)

3.20. Executing TECHMAP pass (map to technology primitives).

3.20.1. Executing Verilog-2005 frontend: /usr/bin/../share/yosys/techmap.v
Parsing Verilog input from `/usr/bin/../share/yosys/techmap.v' to AST 
representation.
Generating RTLIL representation for module `\_90_simplemap_bool_ops'.
Generating RTLIL representation for module `\_90_simplemap_reduce_ops'.
Generating RTLIL representation for module `\_90_simplemap_logic_ops'.
Generating RTLIL representation for module `\_90_simplemap_compare_ops'.
Generating RTLIL representation for module `\_90_simplemap_various'.
Generating RTLIL representation for module `\_90_simplemap_registers'.
Generating RTLIL representation for module `\_90_shift_ops_shr_shl_sshl_sshr'.
Generating RTLIL representation for module `\_90_shift_shiftx'.
Generating RTLIL representation for module `\_90_fa'.
Generating RTLIL representation for module `\_90_lcu'.
Generating RTLIL representation for module `\_90_alu'.
Generating RTLIL representation for module `\_90_macc'.
Generating RTLIL representation for module `\_90_alumacc'.
Generating RTLIL representation for module `\$__div_mod_u'.
Generating RTLIL representation for module `\$__div_mod_trunc'.
Generating RTLIL representation for module `\_90_div'.
Generating RTLIL representation for module `\_90_mod'.
Generating RTLIL representation for module `\$__div_mod_floor'.
Generating RTLIL representation for module `\_90_divfloor'.
Generating RTLIL representation for module `\_90_modfloor'.
Generating RTLIL representation for module `\_90_pow'.
Generating RTLIL representation for module `\_90_pmux'.
Generating RTLIL representation for module `\_90_demux'.
Generating RTLIL representation for module `\_90_lut'.
Successfully finished Verilog frontend.

3.20.2. Continuing TECHMAP pass.
Using template $paramod$78e969f2586efcf3a5b0b0440bcca0db83d5cca2\_90_alu 
for cells of type $alu.
Using template $paramod$constmap:caa849dc115b22349251b6d1fd2e89817490b7c3$
paramod$9e0cab9ff1a9072810db7158c6c18721eebe35d8\_90_shift_ops_shr_shl_sshl_sshr 
for cells of type $shr.
Using template $paramod$5fb3cea3e36078ed44b85aadf768a6588af6651e\_90_alu 
for cells of type $alu.
Using extmapper simplemap for cells of type $not.
Using extmapper simplemap for cells of type $logic_and.
Using extmapper simplemap for cells of type $logic_or.
Using template $paramod$3ef7d3dd227da7627a99c5e5a6a4deb817573e39\_90_alu 
for cells of type $alu.
Using template $paramod$constmap:b6d5011a111b4ca40e652509ef75e544f6e863e2$
paramod$7f1320bf706f65f3ab57d088c03383e114ba1a8e\_90_shift_shiftx for cells 
of type $shift.
Using extmapper simplemap for cells of type $and.
Using extmapper simplemap for cells of type $or.
Using extmapper simplemap for cells of type $logic_not.
Using extmapper simplemap for cells of type $sdff.
Using extmapper simplemap for cells of type $reduce_xnor.
Using extmapper simplemap for cells of type $reduce_or.
Using template $paramod$adbaf76fa5a3091a329503792521395f8ff4d1a4\_90_alu 
for cells of type $alu.
Using extmapper simplemap for cells of type $eq.
Using extmapper simplemap for cells of type $reduce_and.
Using template $paramod$c2e415ef15bc3ccd2723772353a6b450d3d76206\_90_pmux 
for cells of type $pmux.
Using template $paramod$c5c783b17ab1d780abfad8cfe6563a0a7b47a3b0\_90_pmux 
for cells of type $pmux.
Using extmapper simplemap for cells of type $ne.
Using extmapper simplemap for cells of type $xor.
Using template $paramod\_90_lcu\WIDTH=32'00000000000000000000000000000011 
for cells of type $lcu.
Using extmapper simplemap for cells of type $pos.
Using template $paramod\_90_lcu\WIDTH=32'00000000000000000000000000100000 
for cells of type $lcu.
Using template $paramod\_90_lcu\WIDTH=32'00000000000000000000000000000001 
for cells of type $lcu.
No more expansions possible.
<suppressed ~1217 debug messages>

3.21. Executing OPT pass (performing simple optimizations).

3.21.1. Executing OPT_EXPR pass (perform const folding).
Optimizing module sync_arith_unit_1_rtl.
<suppressed ~390 debug messages>

3.21.2. Executing OPT_MERGE pass (detect identical cells).
Finding identical cells in module `\sync_arith_unit_1_rtl'.
<suppressed ~207 debug messages>
Removed a total of 69 cells.

3.21.3. Executing OPT_DFF pass (perform DFF optimizations).

3.21.4. Executing OPT_CLEAN pass (remove unused cells and wires).
Finding unused cells or wires in module \sync_arith_unit_1_rtl..
Removed 11 unused cells and 394 unused wires.
<suppressed ~12 debug messages>

3.21.5. Finished fast OPT passes.

3.22. Executing ABC pass (technology mapping using ABC).

3.22.1. Extracting gate netlist of module `\sync_arith_unit_1_rtl' to 
`<abc-temp-dir>/input.blif'..
Extracted 167 gates and 179 wires to a netlist network with 10 inputs and 
8 outputs.

3.22.1.1. Executing ABC.
Running ABC command: "abc" -s -f <abc-temp-dir>/abc.script 2>&1
ABC: ABC command line: "source <abc-temp-dir>/abc.script".
ABC: 
ABC: + read_blif <abc-temp-dir>/input.blif 
ABC: + read_library <abc-temp-dir>/stdcells.genlib 
ABC: Entered genlib library with 13 gates from file "<abc-temp-dir>/
stdcells.genlib".
ABC: + strash 
ABC: + dretime 
ABC: + map 
ABC: + write_blif <abc-temp-dir>/output.blif 

3.22.1.2. Re-integrating ABC results.
ABC RESULTS:               AND cells:        1
ABC RESULTS:              NAND cells:        2
ABC RESULTS:               MUX cells:       13
ABC RESULTS:               NOT cells:       11
ABC RESULTS:              XNOR cells:        5
ABC RESULTS:               XOR cells:        6
ABC RESULTS:               NOR cells:        7
ABC RESULTS:                OR cells:       22
ABC RESULTS:             ORNOT cells:       11
ABC RESULTS:            ANDNOT cells:       38
ABC RESULTS:        internal signals:      161
ABC RESULTS:           input signals:       10
ABC RESULTS:          output signals:        8
Removing temp directory.

3.23. Executing OPT pass (performing simple optimizations).

3.23.1. Executing OPT_EXPR pass (perform const folding).
Optimizing module sync_arith_unit_1_rtl.
<suppressed ~7 debug messages>

3.23.2. Executing OPT_MERGE pass (detect identical cells).
Finding identical cells in module `\sync_arith_unit_1_rtl'.
Removed a total of 0 cells.

3.23.3. Executing OPT_DFF pass (perform DFF optimizations).

3.23.4. Executing OPT_CLEAN pass (remove unused cells and wires).
Finding unused cells or wires in module \sync_arith_unit_1_rtl..
Removed 1 unused cells and 115 unused wires.
<suppressed ~2 debug messages>

3.23.5. Finished fast OPT passes.

3.24. Executing HIERARCHY pass (managing design hierarchy).

3.24.1. Analyzing design hierarchy..
Top module:  \sync_arith_unit_1_rtl

3.24.2. Analyzing design hierarchy..
Top module:  \sync_arith_unit_1_rtl
Removed 0 unused modules.

3.25. Printing statistics.

=== sync_arith_unit_1_rtl ===

   Number of wires:                122
   Number of wire bits:            145
   Number of public wires:          15
   Number of public wire bits:      38
   Number of memories:               0
   Number of memory bits:            0
   Number of processes:              0
   Number of cells:                133
     $_ANDNOT_                      38
     $_AND_                          1
     $_MUX_                         13
     $_NAND_                         2
     $_NOR_                          7
     $_NOT_                         10
     $_ORNOT_                       11
     $_OR_                          22
     $_SDFF_PN0_                    18
     $_XNOR_                         5
     $_XOR_                          6

3.26. Executing CHECK pass (checking for obvious problems).
Checking module sync_arith_unit_1_rtl...
Found and reported 0 problems.

4. Executing ABC pass (technology mapping using ABC).

4.1. Extracting gate netlist of module `\sync_arith_unit_1_rtl' to `<abc-temp-dir>/
input.blif'..
Extracted 115 gates and 125 wires to a netlist network with 10 inputs and 8 outputs.

4.1.1. Executing ABC.
Running ABC command: "abc" -s -f <abc-temp-dir>/abc.script 2>&1
ABC: ABC command line: "source <abc-temp-dir>/abc.script".
ABC: 
ABC: + read_blif <abc-temp-dir>/input.blif 
ABC: + read_library <abc-temp-dir>/stdcells.genlib 
ABC: Entered genlib library with 7 gates from file "<abc-temp-dir>/stdcells.genlib".
ABC: + strash 
ABC: + &get -n 
ABC: + &fraig -x 
ABC: + &put 
ABC: + scorr 
ABC: Warning: The network is combinational (run "fraig" or "fraig_sweep").
ABC: + dc2 
ABC: + dretime 
ABC: + strash 
ABC: + &get -n 
ABC: + &dch -f 
ABC: + &nf 
ABC: + &put 
ABC: + write_blif <abc-temp-dir>/output.blif 

4.1.2. Re-integrating ABC results.
ABC RESULTS:                OR cells:       49
ABC RESULTS:               NOT cells:       27
ABC RESULTS:               XOR cells:        4
ABC RESULTS:               AND cells:       63
ABC RESULTS:        internal signals:      107
ABC RESULTS:           input signals:       10
ABC RESULTS:          output signals:        8
Removing temp directory.

5. Executing OPT_CLEAN pass (remove unused cells and wires).
Finding unused cells or wires in module \sync_arith_unit_1_rtl..
Removed 0 unused cells and 125 unused wires.
<suppressed ~1 debug messages>

6. Executing Verilog backend.

6.1. Executing BMUXMAP pass.

6.2. Executing DEMUXMAP pass.
Dumping module `\sync_arith_unit_1_rtl'.

7. Printing statistics.

=== sync_arith_unit_1_rtl ===

   Number of wires:                150
   Number of wire bits:            173
   Number of public wires:          15
   Number of public wire bits:      38
   Number of memories:               0
   Number of memory bits:            0
   Number of processes:              0
   Number of cells:                161
     $_AND_                         63
     $_NOT_                         27
     $_OR_                          49
     $_SDFF_PN0_                    18
     $_XOR_                          4

   Estimated number of transistors:        774+

End of script. Logfile hash: 8fff307165, CPU: user 0.38s system 0.01s, MEM: 28.73 MB 
peak
Yosys 0.34 (git sha1 4a1b5599258, gcc 13.2.1 -march=x86-64 -mtune=generic -O2 -fno-plt 
-fexceptions -fstack-clash-protection -fcf-protection -ffile-prefix-map=/build/yosys/
src=/usr/src/debug/yosys -fPIC -Os)
Time spent: 29% 2x abc (0 sec), 20% 28x opt_expr (0 sec), ...
 

```

## Raport z symulacji


```
exe_unit_w47.sv:37: sorry: constant selects in always_* processes are not currently supported (all bits will be included).
exe_unit_w47.sv:37: sorry: constant selects in always_* processes are not currently supported (all bits will be included).
exe_unit_w47.sv:37: sorry: constant selects in always_* processes are not currently supported (all bits will be included).
```

## Lista plików 

| **Nazwa**                   | **Opis**                                                        |
|-----------------------------|-----------------------------------------------------------------|
| makefile                    | Plik instrukcji kompilujących kod verilog i tworzący symulację  |
| signals.vcd                 | Dane sygnałów po symulacji dla programu GTKWave                 |
| exe_unit_w47_rtl.sv         | Kod źródłowy po syntezie logicznej Yosys                        |
| testbench.sv                | Moduł *testbench* do symulacji układu                           |
| exe_unit_w47.iveri.run      | Skompilowany przez Icarus Verilog kod źródłowy                  |
| exe_unit_w47.sv             | Kod źródłowy ALU (model)                                        |
| synth.log                   | Raport syntezy Yosys                                            |
| exe_unit_w47.iveri.log      | Raport symulacji Icarus Verilog                                 |

