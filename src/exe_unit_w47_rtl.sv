/* Generated by Yosys 0.34 (git sha1 4a1b5599258, gcc 13.2.1 -march=x86-64 -mtune=generic -O2 -fno-plt -fexceptions -fstack-clash-protection -fcf-protection -ffile-prefix-map=/build/yosys/src=/usr/src/debug/yosys -fPIC -Os) */

module exe_unit_w47_rtl(i_argA, i_argB, i_oper, i_clk, i_rsn, o_result, o_status);
  wire _000_;
  wire _001_;
  wire _002_;
  wire _003_;
  wire _004_;
  wire _005_;
  wire _006_;
  wire _007_;
  wire _008_;
  wire _009_;
  wire _010_;
  wire _011_;
  wire _012_;
  wire _013_;
  wire _014_;
  wire _015_;
  wire _016_;
  wire _017_;
  wire _018_;
  wire _019_;
  wire _020_;
  wire _021_;
  wire _022_;
  wire _023_;
  wire _024_;
  wire _025_;
  wire _026_;
  wire _027_;
  wire _028_;
  wire _029_;
  wire _030_;
  wire _031_;
  wire _032_;
  wire _033_;
  wire _034_;
  wire _035_;
  wire _036_;
  wire _037_;
  wire _038_;
  wire _039_;
  wire _040_;
  wire _041_;
  wire _042_;
  wire _043_;
  wire _044_;
  wire _045_;
  wire _046_;
  wire _047_;
  wire _048_;
  wire _049_;
  wire _050_;
  wire _051_;
  wire _052_;
  wire _053_;
  wire _054_;
  wire _055_;
  wire _056_;
  wire _057_;
  wire _058_;
  wire _059_;
  wire _060_;
  wire _061_;
  wire _062_;
  wire _063_;
  wire _064_;
  wire _065_;
  wire _066_;
  wire _067_;
  wire _068_;
  wire _069_;
  wire _070_;
  wire _071_;
  wire _072_;
  wire _073_;
  wire _074_;
  wire _075_;
  wire _076_;
  wire _077_;
  wire _078_;
  wire _079_;
  wire _080_;
  wire _081_;
  wire _082_;
  wire _083_;
  wire _084_;
  wire _085_;
  wire _086_;
  wire _087_;
  wire _088_;
  wire _089_;
  wire _090_;
  wire _091_;
  wire _092_;
  wire _093_;
  wire _094_;
  wire _095_;
  wire _096_;
  wire _097_;
  wire _098_;
  wire _099_;
  wire _100_;
  wire _101_;
  wire _102_;
  wire _103_;
  wire _104_;
  wire _105_;
  wire _106_;
  wire _107_;
  wire _108_;
  wire _109_;
  wire _110_;
  wire _111_;
  wire _112_;
  wire _113_;
  wire _114_;
  wire _115_;
  wire _116_;
  wire _117_;
  wire _118_;
  wire _119_;
  wire ERROR;
  wire NEG;
  wire ODD;
  wire ZERO;
  wire [31:0] i;
  input [3:0] i_argA;
  wire [3:0] i_argA;
  input [3:0] i_argB;
  wire [3:0] i_argB;
  input i_clk;
  wire i_clk;
  input [1:0] i_oper;
  wire [1:0] i_oper;
  input i_rsn;
  wire i_rsn;
  output [3:0] o_result;
  reg [3:0] o_result;
  output [3:0] o_status;
  reg [3:0] o_status = 4'h0;
  wire [3:0] s_result;
  assign _039_ = ~i_oper[1];
  assign _040_ = ~i_oper[0];
  assign _041_ = ~i_argA[0];
  assign _042_ = ~i_argB[0];
  assign _043_ = ~i_argB[1];
  assign _044_ = ~i_argB[2];
  assign _045_ = ~i_argB[3];
  assign _046_ = ~i_argA[2];
  assign _047_ = ~i_argA[1];
  assign _048_ = ~i_argA[3];
  assign _049_ = i_oper[1] | _040_;
  assign _050_ = _044_ & i_argA[2];
  assign _051_ = i_argB[2] | _046_;
  assign _052_ = _043_ & i_argA[1];
  assign _053_ = i_argB[1] | _047_;
  assign _054_ = _041_ & i_argB[0];
  assign _055_ = i_argA[0] | _042_;
  assign _056_ = _053_ & _054_;
  assign _057_ = _052_ | _055_;
  assign _058_ = i_argB[2] & _046_;
  assign _059_ = _044_ | i_argA[2];
  assign _060_ = i_argB[1] & _047_;
  assign _061_ = _043_ | i_argA[1];
  assign _062_ = _059_ & _061_;
  assign _063_ = _058_ | _060_;
  assign _064_ = _057_ & _062_;
  assign _065_ = _056_ | _063_;
  assign _066_ = _051_ & _065_;
  assign _067_ = _050_ | _064_;
  assign _068_ = _045_ | i_argA[3];
  assign _069_ = _041_ | _068_;
  assign _070_ = i_argB[3] | i_argA[3];
  assign _071_ = _042_ | _070_;
  assign _072_ = _069_ & _071_;
  assign _073_ = _042_ & i_argA[3];
  assign _074_ = i_argA[0] | i_argA[3];
  assign _075_ = ~_074_;
  assign _076_ = i_argB[3] & i_argA[3];
  assign _077_ = _073_ | _076_;
  assign _078_ = _075_ | _077_;
  assign _079_ = _066_ & _072_;
  assign _080_ = _067_ & _078_;
  assign _081_ = _049_ | _080_;
  assign _082_ = _079_ | _081_;
  assign _083_ = i_oper[1] & i_oper[0];
  assign _084_ = i_argB[2] | i_argB[3];
  assign _085_ = ~_084_;
  assign _086_ = i_oper[1] & _040_;
  assign _087_ = _085_ & _086_;
  assign _088_ = i_argB[0] | i_argB[1];
  assign _089_ = _087_ & _088_;
  assign _090_ = _083_ | _089_;
  assign _091_ = i_argA[0] & _090_;
  assign _092_ = _039_ & _040_;
  assign _093_ = i_oper[1] | i_oper[0];
  assign _094_ = i_argB[0] & _092_;
  assign _095_ = _091_ | _094_;
  assign _096_ = ~_095_;
  assign _097_ = _082_ & _096_;
  assign s_result[0] = ~_097_;
  assign _098_ = _047_ | _068_;
  assign _099_ = _043_ | _070_;
  assign _100_ = _098_ & _099_;
  assign _101_ = _043_ & i_argA[3];
  assign _102_ = i_argA[1] | i_argA[3];
  assign _103_ = ~_102_;
  assign _104_ = _101_ | _103_;
  assign _105_ = _076_ | _104_;
  assign _106_ = _066_ & _100_;
  assign _107_ = _067_ & _105_;
  assign _108_ = _049_ | _107_;
  assign _109_ = _106_ | _108_;
  assign _110_ = i_argA[0] & i_argA[3];
  assign _111_ = i_argA[1] ^ _110_;
  assign _112_ = _083_ & _111_;
  assign _113_ = _042_ | i_argB[1];
  assign _114_ = i_argB[1] & _092_;
  assign _115_ = i_argA[1] & _113_;
  assign _116_ = _087_ & _115_;
  assign _117_ = _112_ | _114_;
  assign _118_ = _116_ | _117_;
  assign _119_ = ~_118_;
  assign _000_ = _109_ & _119_;
  assign s_result[1] = ~_000_;
  assign _001_ = _046_ | i_argA[3];
  assign _002_ = _045_ | _001_;
  assign _003_ = _044_ | i_argB[3];
  assign _004_ = _044_ | _070_;
  assign _005_ = _002_ & _004_;
  assign _006_ = _066_ & _005_;
  assign _007_ = _048_ | _003_;
  assign _008_ = _001_ & _007_;
  assign _009_ = _067_ & _008_;
  assign _010_ = _049_ | _009_;
  assign _011_ = _006_ | _010_;
  assign _012_ = i_argB[2] & _092_;
  assign _013_ = i_argA[0] | i_argA[1];
  assign _014_ = i_argA[3] & _013_;
  assign _015_ = i_argB[0] | _043_;
  assign _016_ = i_argA[3] & _083_;
  assign _017_ = i_argA[2] ^ _014_;
  assign _018_ = _083_ & _017_;
  assign _019_ = i_argA[2] & _015_;
  assign _020_ = _087_ & _019_;
  assign _021_ = _012_ | _020_;
  assign _022_ = _018_ | _021_;
  assign _023_ = ~_022_;
  assign _024_ = _011_ & _023_;
  assign s_result[2] = ~_024_;
  assign _025_ = _073_ | _101_;
  assign _026_ = _087_ & _025_;
  assign _027_ = i_argB[3] | _093_;
  assign _028_ = _016_ | _026_;
  assign _029_ = ~_028_;
  assign _030_ = _027_ & _029_;
  assign NEG = ~_030_;
  assign _031_ = _097_ & _000_;
  assign _032_ = _024_ & _030_;
  assign ZERO = _031_ & _032_;
  assign _033_ = _084_ & _086_;
  assign _034_ = i_argA[2] | _013_;
  assign _035_ = ~_034_;
  assign _036_ = _016_ & _035_;
  assign ERROR = _033_ | _036_;
  assign _037_ = _097_ ^ _000_;
  assign _038_ = _024_ ^ _030_;
  assign ODD = _037_ ^ _038_;
  always @(posedge i_clk, negedge i_rsn)
    if (!i_rsn) o_result[0] <= 1'h0;
    else o_result[0] <= s_result[0];
  always @(posedge i_clk, negedge i_rsn)
    if (!i_rsn) o_result[1] <= 1'h0;
    else o_result[1] <= s_result[1];
  always @(posedge i_clk, negedge i_rsn)
    if (!i_rsn) o_result[2] <= 1'h0;
    else o_result[2] <= s_result[2];
  always @(posedge i_clk, negedge i_rsn)
    if (!i_rsn) o_result[3] <= 1'h0;
    else o_result[3] <= NEG;
  always @(posedge i_clk, negedge i_rsn)
    if (!i_rsn) o_status[0] <= 1'h0;
    else o_status[0] <= NEG;
  always @(posedge i_clk, negedge i_rsn)
    if (!i_rsn) o_status[1] <= 1'h0;
    else o_status[1] <= ZERO;
  always @(posedge i_clk, negedge i_rsn)
    if (!i_rsn) o_status[2] <= 1'h0;
    else o_status[2] <= ODD;
  always @(posedge i_clk, negedge i_rsn)
    if (!i_rsn) o_status[3] <= 1'h0;
    else o_status[3] <= ERROR;
  assign i = 32'd4;
  assign s_result[3] = NEG;
endmodule
