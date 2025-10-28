# === Default Configuration ===
BOARD_FQBN ?= arduino:avr:uno
PORT ?= /dev/ttyACM0
BUILD_DIR ?= build

ifndef SKETCH
$(error You must provide a sketch folder, e.g. `make SKETCH=examples/Blink`)
endif

# === Targets ===
compile:
	arduino-cli compile --fqbn $(BOARD_FQBN) --build-path $(BUILD_DIR) $(SKETCH)

upload:
	arduino-cli upload -p $(PORT) --fqbn $(BOARD_FQBN) --input-dir $(BUILD_DIR) $(SKETCH)

clean:
	rm -rf $(BUILD_DIR)

info:
	arduino-cli board list