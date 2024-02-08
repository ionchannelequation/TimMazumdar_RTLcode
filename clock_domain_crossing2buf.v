module clock_domain_crossing(
    input wire clkA,
    input wire clkB,
    input wire rstA,
    input wire rstB,
    input wire [3:0] ctrl_in,
    output reg [3:0] ctrl_out
);

reg [3:0] ctrl_buf1;
reg [3:0] ctrl_buf2;

// Synchronize ctrl_in to clkB domain
always @(posedge clkA or negedge rstA)
begin
    if (!rstA)
        ctrl_buf1 <= 4'b0;
    else
        ctrl_buf1 <= ctrl_in;
end

// Double-buffered synchronization
always @(posedge clkB or negedge rstB)
begin
    if (!rstB)
        ctrl_buf2 <= 4'b0;
    else
        ctrl_buf2 <= ctrl_buf1;
end

always @(posedge clkB or negedge rstB)
begin
    if (!rstB)
        ctrl_out <= 4'b0;
    else
        ctrl_out <= ctrl_buf2;
end

endmodule
