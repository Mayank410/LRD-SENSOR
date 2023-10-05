
module ldr_sensor(
    input wire clk,             // Clock input
    output reg [7:0] ldr_data,  // LDR sensor data output
    output reg sunlight         // Sunlight signal output
);

reg [7:0] ldr_value;  // LDR sensor reading
reg [4:0] hour = 0;   // Simulated time of day (0-23)

// Hysteresis parameters
parameter LIGHT_TO_DARK_THRESHOLD = 200;
parameter DARK_TO_LIGHT_THRESHOLD = 100;

always @(posedge clk) begin
    hour <= hour + 1;
    if (hour >= 24) begin
        hour <= 0; // Reset hour at midnight
    end

    // Replace this logic with your LDR sensor reading logic
    // Simulate varying light intensity based on the time of day
    if (hour >= 5 && hour < 7) begin
        // Morning (5 AM to 7 AM) - Low light intensity
        ldr_value <= $random % 50; // Random value between 0 and 49
        sunlight <= 1'b0; // Low sunlight in the morning
    end else if (hour >= 17 && hour < 19) begin
        // Evening (5 PM to 7 PM) - Low light intensity
        ldr_value <= $random % 50; // Random value between 0 and 49
        sunlight <= 1'b0; // Low sunlight in the evening
    end else begin
        // Afternoon (7 AM to 5 PM) - High light intensity
        ldr_value <= $random % 100 + 150; // Random value between 150 and 249
        sunlight <= 1'b1; // High sunlight during the day
    end
end

assign ldr_data = ldr_value;

endmodule
