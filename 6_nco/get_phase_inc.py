def get_phase_inc(frequency, sampling_frequency):
  """Calculates the phase increment for an NCO.

  Args:
    frequency: The desired frequency of the output waveform.
    sampling_frequency: The clock frequency of the NCO.

  Returns:
    The phase increment.
  """

  phase_inc = (frequency * 2**8) / sampling_frequency
  return phase_inc


def round_phase_inc(phase_inc):
  """Rounds the phase increment to the nearest integer.

  Args:
    phase_inc: The phase increment in floating point.

  Returns:
    The phase increment in binary.
  """

  phase_inc_rounded = round(phase_inc)
  phase_inc_binary = hex(phase_inc_rounded)
  return phase_inc_binary

# Calculate the phase increment for a 500 Hz sine wave with a sampling frequency of 100 MHz.
#phase_inc = get_phase_inc(500, 100000000)
phase_inc = get_phase_inc(100, 100000000)
print(phase_inc)

# Round the phase increment to the nearest integer.
phase_inc_rounded = round_phase_inc(phase_inc)

# Print the rounded phase increment.
print(phase_inc_rounded)

