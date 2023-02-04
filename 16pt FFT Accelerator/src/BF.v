/******************************************************************************
Copyright (c) 2022 SoC Design Laboratory, Konkuk University, South Korea
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are
met: redistributions of source code must retain the above copyright
notice, this list of conditions and the following disclaimer;
redistributions in binary form must reproduce the above copyright
notice, this list of conditions and the following disclaimer in the
documentation and/or other materials provided with the distribution;
neither the name of the copyright holders nor the names of its
contributors may be used to endorse or promote products derived from
this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

Authors: Uyong Lee (uyonglee@konkuk.ac.kr)

Revision History
2022.11.17: Started by Uyong Lee
*******************************************************************************/
module BF
(
    input signed [15:0] in_re0, //From REGA 2,14
    input signed [15:0] in_im0, //From REGA
    input signed [15:0] in_re1, //From REGB 3,13
    input signed [15:0] in_im1, //From REGB

    output signed [31:0] out0_BF,
    output signed [31:0] out1_BF
);
//Imag [31:16], Real [15:0]

wire signed [16:0] tmp_re0;
wire signed [16:0] tmp_im0;
wire signed [16:0] tmp_re1;
wire signed [16:0] tmp_im1;

assign tmp_re0 = in_re0 - in_re1; //real - real
assign tmp_re1 = in_re0 + in_re1; //real + real

assign tmp_im0 = in_im0 - in_im1; //imag - imag
assign tmp_im1 = in_im0 + in_im1; //imag + imag


assign out1_BF = {tmp_im1[16:1],tmp_re1[16:1]};
assign out0_BF = {tmp_im0[16:1],tmp_re0[16:1]};

endmodule