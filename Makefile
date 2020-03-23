MAKE_RTL ?= add_rtl mul_rtl fma_rtl \
			ema_rtl div_rtl q2p_rtl

MAKE_WAVE ?= add_wave mul_wave fma_wave \
			 ema_wave div_wave q2p_wave

all: rtl wave


rtl: $(MAKE_RTL)


wave: $(MAKE_WAVE)


add_rtl:
	@rm -rf ./run/rtl/PositAdder
	@sbt 'runMain posit.make.MakePositAdder'
	@find ./run/rtl/PositAdder/* | grep -v "\.v" | xargs rm -f

mul_rtl:
	@rm -rf ./run/rtl/PositMultiplier
	@sbt 'runMain posit.make.MakePositMultiplier'
	@find ./run/rtl/PositMultiplier/* | grep -v "\.v" | xargs rm -f

fma_rtl:
	@rm -rf ./run/rtl/PositFMA
	@sbt 'runMain posit.make.MakePositFMA'
	@find ./run/rtl/PositFMA/* | grep -v "\.v" | xargs rm -f

ema_rtl:
	@rm -rf ./run/rtl/PositEMA
	@sbt 'runMain posit.make.MakePositEMA'
	@find ./run/rtl/PositEMA/* | grep -v "\.v" | xargs rm -f

div_rtl:
	@rm -rf ./run/rtl/PositDivisionSqrt
	@sbt 'runMain posit.make.MakePositDivisionSqrt'
	@find ./run/rtl/PositDivisionSqrt/* | grep -v "\.v" | xargs rm -f

q2p_rtl:
	@rm -rf ./run/rtl/QuireToPosit
	@sbt 'runMain posit.make.MakeQuireToPosit'
	@find ./run/rtl/QuireToPosit/* | grep -v "\.v" | xargs rm -f

add_wave:
	@rm -rf ./run/wave/PositAdder
	@sbt 'testOnly posit.wave.PositAdderSpec'
	@find ./run/wave/PositAdder/p*/* | grep "\.vcd" | xargs -i mv {} ./run/wave/PositAdder
	@rm -rf ./run/wave/PositAdder/p*

mul_wave:
	@rm -rf ./run/wave/PositMultiplier
	@sbt 'testOnly posit.wave.PositMulSpec'
	@find ./run/wave/PositMultiplier/p*/* | grep "\.vcd" | xargs -i mv {} ./run/wave/PositMultiplier
	@rm -rf ./run/wave/PositMultiplier/p*

fma_wave:
	@rm -rf ./run/wave/PositFMA
	@sbt 'testOnly posit.wave.PositFMASpec'
	@find ./run/wave/PositFMA/p*/* | grep "\.vcd" | xargs -i mv {} ./run/wave/PositFMA
	@rm -rf ./run/wave/PositFMA/p*

ema_wave:
	@rm -rf ./run/wave/PositEMA
	@sbt 'testOnly posit.wave.PositEMASpec'
	@find ./run/wave/PositEMA/P*/* | grep "\.vcd" | xargs -i mv {} ./run/wave/PositEMA
	@find ./run/wave/PositEMA/* | grep -v "\.vcd" | xargs rm -rf

div_wave:
	@rm -rf ./run/wave/PositDivisionSqrt
	@sbt 'testOnly posit.wave.PositDivSqrtSpec'
	@find ./run/wave/PositDivisionSqrt/p*/* | grep "\.vcd" | xargs -i mv {} ./run/wave/PositDivisionSqrt
	@rm -rf ./run/wave/PositDivisionSqrt/p*

q2p_wave:
	@rm -rf ./run/wave/QuireToPosit
	@sbt 'testOnly posit.wave.QuireToPositSpec'
	@find ./run/wave/QuireToPosit/Q*/* | grep "\.vcd" | xargs -i mv {} ./run/wave/QuireToPosit
	@find ./run/wave/QuireToPosit/* | grep -v "\.vcd" | xargs rm -rf


clean:
	@rm -rf ./run

.PHONY: all clean rtl $(MAKE_RTL) $(MAKE_WAVE)