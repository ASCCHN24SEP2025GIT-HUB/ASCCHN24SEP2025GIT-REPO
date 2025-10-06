# 🐍 LAB 1 : Working with Python

---

### :rocket: Objectives

- **Practice class design and function implementation**
- **Work with lists, strings, and control structures**
- **Apply loops and conditionals in real-world problems**

---

### :bulb: 1. Function Overloading (Python Style)

Create a function `add()` that can handle different data types and numbers of arguments.  
Use Python’s flexible argument handling (`*args`, `isinstance()`, etc.).

The function should behave as follows:

```python
add(10, 20)         # → 30
add(10, 20, 30)     # → 60
add(10.5, 20.1)     # → 30.6
add("Hello", 20)    # → "Hello 20"
```

Implement the function, call it with each case, and print the results.

---

### :dart: 2. Student Class

Define a class `Student` with these attributes:

- `student_id` : integer
- `student_name` : string
- `city` : string
- `marks1` : integer
- `marks2` : integer
- `marks3` : integer
- `fee_per_month` : float
- `is_eligible_for_scholarship` : boolean

#### :gear: Methods

- Setter and getter methods for all attributes
- `get_annual_fee()` → returns `fee_per_month * 12`
- `get_total_marks()` → returns the sum of the three marks
- `get_average()` → returns the average of the marks
- `get_result()` → returns `"pass"` if all marks > 60, otherwise `"fail"`

#### :test_tube: Test Script

- Create three `Student` objects
- Assign data using setter methods
- Print:
  - The name of the student with the highest total marks
  - The name and monthly fee of the student with the lowest fee
  - Each student’s name, total marks, average, result, and scholarship status

---

### :triangular_ruler: 3. Multiplication Table

Write three functions that display a multiplication table for a given number:

- Using a `for` loop
- Using a `while` loop
- Simulating a do-while loop (use `while True` and `break`)

**Example (input: 2):**
```
2 x 1 = 2
2 x 2 = 4
...
2 x 10 = 20
```

---

### :brain: 4. Word Count

Write a function that accepts a string and returns the number of words in it.

**Example:**
```python
Input: "Sum of 12 and 20 is 32"
Output: 6
```

---

### :gear: 5. String Methods

Create small examples to demonstrate each of the following Python string features:

- **Indexing** (`text[index]`)
- **Membership test** (`'word' in text`)
- **len(text)**
- **find()**
- **Equality (`==`)**
- **Case-insensitive equality** (`text.lower() == other.lower()`)
- **join()**
- **rfind()**
- **Slicing** (`text[start:end]`)
- **lower()**
- **upper()**
- **strip()**

Show output and short comments explaining each example.

---

### :shield: 6. ArrayStore Class

Define a class `ArrayStore` that works with a list of integers.

#### Methods

- Accept 10 integers and store them in a list
- Display all elements using both `while` and `for` loops
- Sort the list in ascending order
- Accept a number and return how many times it appears
- Insert a number at a specific position
- Return a new list containing only unique elements

**Example:**
```python
Input: [9, 2, 2, 9, 10, 9]
Output: [9, 2, 10]
```