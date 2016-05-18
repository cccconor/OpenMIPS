`timescale 1ns / 1ps
//******************************************************************************
//      一、实现流水线暂停机制
//      输出信号stall是一个宽度为6的信号
//      1.stall[0]表示取指地址PC是否保持不变，为1表示保持不变
//      2.stall[1]表示流水线取指阶段是否暂停，为1表示暂停
//      3.stall[2]表示流水线译码阶段是否暂停，为1表示暂停
//      4.stall[3]表示流水线执行阶段是否暂停，为1表示暂停
//      5.stall[4]表示流水线访存阶段是否暂停，为1表示暂停
//      6.stall[5]表示流水线取指阶段是否暂停，为1表示暂停
//      PC、IF/ID、ID/EX、EX/MEM、MEM/WB五个模块均接收全部六位stall信号
//      二、依据异常类型，给出新的取指地址(异常处理例程入口地址)，同时决定是否要清除
//  流水线
//
//******************************************************************************

`include "defines.v"

module ctrl(
    input wire rst,
    input wire stallreq_from_id,        //来自译码阶段的暂停请求
    input wire stallreq_from_ex,        //来自执行阶段的暂停请求
    output reg[5:0] stall,

    //异常相关
    input wire[31:0] excepttype_i,      //最终的异常类型，来自MEM模块
    input wire[`RegBus] cp0_epc_i,      //EPC寄存器的最新值，来自MEM模块
    output reg[`InstAddrBus] new_pc,    //异常处理入口地址
    output reg flush
    );

    always @ ( * ) begin
        if(rst == `RstEnable) begin
            stall <= 6'b000000;
            flush <= 1'b0;
            new_pc <= `ZeroWord;
        end else if(excepttype_i != `ZeroWord) begin    //不为0，表示发生异常
            flush <= 1'b1;
            stall <= 6'b000000;
            case(excepttype_i)
                32'h0000_0001:begin                     //中断
                    new_pc <= 32'h0000_0020;
                end
                32'h0000_0008:begin                     //系统调用异常syscall
                    new_pc <= 32'h0000_0040;
                end
                32'h0000_000a:begin                     //无效指令异常
                    new_pc <= 32'h0000_0040;
                end
                32'h0000_000d:begin                     //自陷异常
                    new_pc <= 32'h0000_0040;
                end
                32'h0000_000c:begin                     //溢出异常
                    new_pc <= 32'h0000_0040;
                end
                32'h0000_000e:begin                     //异常返回指令eret
                    new_pc <= cp0_epc_i;
                end
                default:begin
                end
            endcase
        end else if(stallreq_from_ex == `Stop) begin
            stall <= 6'b001111;
            flush <= 1'b0;
        end else if(stallreq_from_id == `Stop) begin
            stall <= 6'b000111;
            flush <= 1'b0;
        end else begin
            stall <= 6'b000000;
            flush <= 1'b0;
            new_pc <= `ZeroWord;
        end
    end
endmodule
