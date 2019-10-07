instr Loop1
	;;schedule call
	;;schedule call
	;;schedule call
	;;etc
endin

instr Loop1Repeat
	irepeatnum = p4
	indx = 0

	while (indx < irepeatnum) do
	schedule("Loop1", indx, 1) ;;or normal schedule call
	indx += 1
	od

	;;When you're done with a do-while you OD

endin
	schedule("Run1", 0, 0)