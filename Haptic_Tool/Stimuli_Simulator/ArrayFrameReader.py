import struct
import numpy as np


class ArrayFrameReader:
    """
    Reads binary frames describing a phased array.

    Each frame contains N transducer words.
    Each word encodes amplitude and phase.

    Supports:
        - 16-bit words
        - 32-bit words
    """

    def __init__(
        self,
        filepath,
        num_transducers=256,
        word_bits=32,            # 16 or 32
        amplitude_shift=0,
        amplitude_bits=16,
        phase_shift=16,
        phase_bits=16,
        endian="<",               # "<" little-endian, ">" big-endian
        amplitude_normalized = True,
        phase_in_degrees=False,
        phase_in_radians = False,
        phase_max=None
    ):

        self.filepath = filepath
        self.num_transducers = num_transducers
        self.word_bits = word_bits
        self.amplitude_shift = amplitude_shift
        self.amplitude_bits = amplitude_bits
        self.phase_shift = phase_shift
        self.phase_bits = phase_bits
        self.endian = endian
        self.phase_in_degrees = phase_in_degrees
        self.phase_in_radians = phase_in_radians
        self.phase_max = phase_max
        self.amplitude_normalized = amplitude_normalized

        if word_bits == 16:
            self.word_bytes = 2
            self.struct_type = "H"
        elif word_bits == 32:
            self.word_bytes = 4
            self.struct_type = "I"
        else:
            raise ValueError("word_bits must be 16 or 32")

        self.frame_bytes = self.word_bytes * num_transducers

        self.amp_mask = (1 << amplitude_bits) - 1
        self.phase_mask = (1 << phase_bits) - 1

    def decode_word(self, word):

        amplitude = (word >> self.amplitude_shift) & self.amp_mask
        phase = (word >> self.phase_shift) & self.phase_mask
        
        if self.amplitude_normalized:
            amplitude = amplitude / (2**self.amplitude_bits-1)
            
        if self.phase_in_degrees:
            if self.phase_max is None:
                phase = phase * 360.0 / (2 ** self.phase_bits)
            else:
                phase = phase * 360.0 / self.phase_max
        
        if self.phase_in_radians:
            if self.phase_max is None:
                phase = phase * 2*np.pi / (2 ** self.phase_bits)
            else:
                phase = phase * 2*np.pi / self.phase_max

        return amplitude, phase

    def frames(self):

        fmt = self.endian + str(self.num_transducers) + self.struct_type

        with open(self.filepath, "rb") as f:

            frame_index = 0

            while True:

                data = f.read(self.frame_bytes)

                if not data:
                    break

                if len(data) != self.frame_bytes:
                    raise ValueError("Incomplete frame detected")

                words = struct.unpack(fmt, data)

                amplitudes = np.zeros(self.num_transducers)
                phases = np.zeros(self.num_transducers)

                for i, word in enumerate(words):
                    amplitudes[i], phases[i] = self.decode_word(word)

                yield frame_index, amplitudes, phases

                frame_index += 1