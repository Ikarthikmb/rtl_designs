def model_bin2gray(n):
    l = len(n)
    n = int(n,2)
    n ^= (n >> 1)

    return bin(n)[2:]

binary_value = '110'
gray_val = model_bin2gray(binary_value)
print(f"Binary: {binary_value} | Gray: {gray_val}")
