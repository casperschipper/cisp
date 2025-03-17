// Track incoming MIDI bytes
var byte1 = null;
var byte2 = null;
var byte3 = null;

// MIDI channel to filter (1-based)
var filterChannel = 1;

// Set the MIDI channel to filter
function setChannel(channel) {
    if (channel >= 1 && channel <= 16) {
        filterChannel = channel;
        post("Filtering for MIDI channel: " + channel + "\n");
    } else {
        post("Invalid channel. Please use a value between 1 and 16.\n");
    }
}

declareattribute("ch", null, "setChannel");

// Handle incoming MIDI bytes
function msg_int(data) {
    if (byte1 === null) {
        // First byte (status byte)
        byte1 = data;
    } else if (byte2 === null) {
        // Second byte (data byte 1)
        byte2 = data;
    } else {
        // Third byte (data byte 2)
        byte3 = data;

        // Process the complete MIDI message
        processMidiMessage(byte1, byte2, byte3);

        // Reset bytes for the next message
        byte1 = null;
        byte2 = null;
        byte3 = null;
    }
}

// Process a complete MIDI message
function processMidiMessage(byte1, byte2, byte3) {
    var status = byte1 & 0xF0; // Extract the status bits
    var channel = (byte1 & 0x0F) + 1; // Extract the channel (1-based)

    if (status >= 0x80 && status <= 0xEF && channel === filterChannel) {
        // Pass the MIDI message if it matches the filter channel
        outlet(0, byte1, byte2, byte3);
    }
}
