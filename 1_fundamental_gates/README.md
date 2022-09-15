# Fundamental gates

### AND gate

![Untitled](img/Untitled.png)

Equation:

```verilog
Y = A & B
```

Truth Table:

| A | B | Output |
| --- | --- | --- |
| 0 | 0 | 0 |
| 0 | 1 | 0 |
| 1 | 0 | 0 |
| 1 | 1 | 1 |

### NAND gate

![Untitled](img/Untitled1.png)

Equation:

```verilog
Y = ~(A & B)
```

Truth Table:

| A | B | Output |
| --- | --- | --- |
| 0 | 0 | 1 |
| 0 | 1 | 1 |
| 1 | 0 | 1 |
| 1 | 1 | 0 |

### OR gate

![Untitled](img/Untitled2.png)

Equation:

```verilog
Y = A | B
```

Truth Table:

| A | B | Output |
| --- | --- | --- |
| 0 | 0 | 0 |
| 0 | 1 | 1 |
| 1 | 0 | 1 |
| 1 | 1 | 1 |

### NOR gate

![Untitled](img/Untitled3.png)

Equation:

```verilog
Y = ~(A | B)
```

Truth Table:

| A | B | Output |
| --- | --- | --- |
| 0 | 0 | 1 |
| 0 | 1 | 0 |
| 1 | 0 | 0 |
| 1 | 1 | 0 |

### XOR gate

![Untitled](img/Untitled4.png)

Equation:

```verilog
Y = A XOR B
```

Truth Table:

| A | B | Output |
| --- | --- | --- |
| 0 | 0 | 0 |
| 0 | 1 | 1 |
| 1 | 0 | 1 |
| 1 | 1 | 0 |

### XNOR gate

![Untitled](img/Untitled5.png)

Equation:

```verilog
Y = ~(A XOR B)
```

Truth Table:

| A | B | Output |
| --- | --- | --- |
| 0 | 0 | 1 |
| 0 | 1 | 0 |
| 1 | 0 | 0 |
| 1 | 1 | 1 |

### Inverter

![Untitled](img/Untitled6.png)

Equation:

```verilog
Y = ~A
```

Truth Table:

| A | Output |
| --- | --- |
| 0 | 1 |
| 1 | 0 |

### Buffer

![Untitled](img/Untitled7.png)

Equation:

```verilog
Y = A
```

Truth Table:

| A | Output |
| --- | --- |
| 0 | 0 |
| 1 | 1 |

## Output

![Untitled](img/Untitled8.png)
