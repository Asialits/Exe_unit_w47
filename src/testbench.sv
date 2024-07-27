`timescale 1ns/100ps
module testbench;

parameter M_BIT = 4;
parameter N_BIT = 2;

        logic             i_clk;
        logic             i_rsn;

        logic [M_BIT-1:0] i_argA_s;	
        logic [M_BIT-1:0] i_argB_s;
        logic [N_BIT-1:0] i_oper_s;
        
	logic [M_BIT-1:0] o_result_s, o_result_ss;

exe_unit_w47 	#(.MBIT(M_BIT), .NBIT(N_BIT))	exe_model	(.i_argA(i_argA_s), .i_argB(i_argB_s), .i_oper(i_oper_s), .o_result(o_result_s)	, .i_clk, .i_rsn);		
exe_unit_w47_rtl 				exe_synth 	(.i_argA(i_argA_s), .i_argB(i_argB_s), .i_oper(i_oper_s), .o_result(o_result_ss), .i_clk, .i_rsn);	

initial
        begin
                $dumpfile("signals.vcd");
                $dumpvars(0,testbench);
		
		
		
		i_clk = 0; i_rsn = 1;               
		i_oper_s = 'b00;
		i_argA_s = '1;  i_argB_s = 'b0010;
		i_clk = 0;
		#1 
		i_clk = 1;
		#1 
		i_clk = 0;
		i_argB_s = 'b0000;
		#1
		i_clk = 1;#1	
		i_clk= 0; i_argB_s = 'b1000;
		#1
		i_clk = 1;#1
		i_clk = 0; i_argB_s = 'b1010;
		#1
		i_clk = 1;#1				// end 00
		i_clk = 0; i_argB_s = 'b1010;	i_oper_s = 01; i_argA_s ='b1100; 
		#1
		i_clk = 1;#1
		i_clk = 0; i_argA_s = 'b1000;
		#1
		i_clk = 1;#1 
		i_clk = 0; i_argB_s = 'b0010; 	i_argA_s = 'b0000;
		#1
		i_clk = 1;#1
		i_clk = 0; i_argA_s = 'b0100; 
		#1
		i_clk = 1; #1
		i_clk = 0; i_argA_s = 'b0001;	i_argB_s = 'b1010;
		#1
		i_clk = 1;#1
		i_clk = 0; i_argA_s = 'b1010; 	i_argB_s = 'b0001; 
		#1
		i_clk = 1;#1				// end 01
		i_clk = 0; i_oper_s = 'b10; i_argA_s = '1; i_argB_s = 'b1000;  		
		#1 
		i_clk = 1;#1
		i_clk = 0; i_argB_s = 'b0000;
		#1
		i_clk = 1;#1
		i_clk = 0; i_argB_s = 'b0001;
		#1
		i_clk = 1;#1
                i_clk = 0; i_argB_s = 'b0010;
		#1
		i_clk = 1;#1
                i_clk = 0; i_argB_s = 'b0011;
		#1
		i_clk = 1;#1
                i_clk = 0; i_argB_s = 'b0100;
		#1				
		i_clk = 1;#1				// end 10
                i_clk = 0; i_argA_s = 'b0010; i_oper_s = 'b11;
		#1
		i_clk = 1;#1                            
                i_clk = 0; i_argA_s = 'b0000; 
                #1
		i_clk = 1;#1                                     
                i_clk = 0; i_argA_s = 'b1000;
                #1
		i_clk = 1;#1                                     
                i_clk = 0; i_argA_s = 'b1010;
                #1
		i_clk = 1;#1                                     
                i_clk = 0;
                #1
		i_clk = 1;#1
		i_clk = 0; i_rsn = 0; 
		#1





		
	
                $finish;
        end
endmodule



