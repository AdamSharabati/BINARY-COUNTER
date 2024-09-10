# Compile and simulate
quit -sim
vcom Binary_Counter.vhd
vsim b_counter

# Add signals to the waveform viewer
add wave -position insertpoint sim:/b_counter/*

# Set initial conditions
force rst 1
force shift 1
force Din 1
force clk 0

# Run for a clock cycle
run 10ns
force clk 1
run 10ns
force clk 0

# Create a procedure for toggling the clock and running for one cycle
proc clock_cycle {cycles} {
    for {set i 0} {$i < $cycles} {incr i} {
        force clk 1
        run 10ns
        force clk 0
        run 10ns
    }
}

# Perform 8 clock cycles with Din=1
clock_cycle 8

# Change Din to 0
force Din 0

# Perform 8 more clock cycles with Din=0
clock_cycle 8

# Change shift to 0
force shift 0

# Perform 8 more clock cycles with shift=0
clock_cycle 8
