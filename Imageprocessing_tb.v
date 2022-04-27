`timescale 1ns/1ps
`include "Imageprocessing.v"

module ImageProcessing_tb;
    reg clk;
    wire[7:0] R;
    wire[7:0] G;
    wire[7:0] B;
    integer C= 0;
    initial clk =1'b0;
    always begin 
        #10 clk = ~clk;
    end
    initial begin #4993960 $finish;
    end


    //  To run a particular module  : (IMAGE_BRIGHTNESS_INCREASE, IMAGE_BRIGHTNESS_DECREASE,IMAGE_invert,IMAGE_grayscale)
    // uncomment that particular module

    // IMAGE_invert #(.HEIGHT1(408),.WIDTH1(612),.INFILE1("testimage.hex")) M1(
    //     .clk(clk),
    //     .R(R),
    //     .G(G),
    //     .B(B)
    // );
    
    
    // IMAGE_grayscale #(.HEIGHT1(408),.WIDTH1(612),.INFILE1("testimage.hex")) M1(  .clk(clk),
    //     .R(R),
    //     .G(G),
    //     .B(B)
    // );

     IMAGE_BRIGHTNESS_INCREASE #(.HEIGHT1(408),.WIDTH1(612),.INFILE1("testimage.hex")) M1(  .clk(clk),
        .R(R),
        .G(G),
        .B(B),
        .v(8'b0010_0101) // brightness is increased by v
    );

    //      IMAGE_BRIGHTNESS_DECREASE #(.HEIGHT1(408),.WIDTH1(612),.INFILE1("testimage.hex")) M1(  .clk(clk),
    //     .R(R),
    //     .G(G),
    //     .B(B),
    //     .v(8'b0001_0101) // brightness is decreased by v
    // );

    //  THRESHOLD #(.HEIGHT1(408),.WIDTH1(612),.THRESHOLD(90),.INFILE1("testimage.hex")) M1(
    //     .clk(clk),
    //     .R(R),
    //     .G(G),
    //     .B(B)
    // );

        IMAGE_WRITE #(.OUTFILE("output.hex"),.HEIGHT(408),.WIDTH(612)) M2(
        .clk(clk),
        .R(R),
        .G(G),
        .B(B)
    );
       
endmodule