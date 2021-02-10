set language "SC"
set moduleName "Generator"
set portName0 "s"
set isMeta0 0
set portInterface0 [list "sc_fifo_out"]
set portData0 [list "int"]
set isClock0 0
set isReset0 0
set portAttribute0 [list $isClock0 $isReset0]
set port0 [list $portName0 $isMeta0 $portInterface0 $portData0 $portAttribute0]
lappend portList $port0
set module [list $moduleName $portList]
