.main clear;

vlog TestbenchFiltro.v;
vlog Paso_Banda_synthesis.v;

vsim -L Unisim -gui TestbenchFiltro glbl;

add wave -position insertpoint \
sim:/TestbenchFiltro/*;

config wave -signalnamewidth 1

run -all;
