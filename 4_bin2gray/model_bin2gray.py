def model_bin2gray(n):
    print(n)
    n = int(n,2)
    n ^= (n >> 1)

    return bin(n)[2:]

binary_value = '10'
gray_val = model_bin2gray(binary_value)
print(f"Binary: {binary_value} | Gray: {gray_val}")

"""
def binary_to_gray_op(n):
   n = int(n, 2)
   n ^= (n >> 1)

   return bin(n)[2:]

gray_val = input('Enter the binary number: ')
binary_val = binary_to_gray_op(gray_val)
print('Gray codeword is :', binary_val)
"""
