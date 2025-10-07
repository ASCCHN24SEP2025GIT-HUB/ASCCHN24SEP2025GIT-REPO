### :snake: LAB 2: Python Object-Oriented Practice

---

#### :rocket: Objectives

- **Understand class design, attributes, methods, and relationships**
- **Practice writing Python functions and classes for real-world problems**

---

#### :bulb: 1. Identify Classes, Attributes, Methods, and Relationships

A company wants to build an application to manage its meeting rooms.

There are two types of meeting rooms:
- **With Zoom calling facility**
- **Without Zoom calling facility**

---

#### :dart: Requirements

All meeting rooms have:
- `room_id` (unique identifier)
- `capacity`
- `floor_location`

Meeting rooms with Zoom also have:
- `zoom_device_id`
- `zoom_account_id`

Employees can book meeting rooms by providing:
- `employee_id`
- `meeting_date`
- `meeting_time`
- `duration`

All bookings should be stored and retrievable by date.

---

#### :bulb: Hint

- Use classes to represent meeting rooms and bookings.
- Think about inheritance for Zoom-enabled rooms and methods for booking retrieval.

---

#### :brain: 2. Welcome Message Function

Write a function that accepts a name as a parameter and returns a simple welcome message.

```python
def welcome_message(name):
    return f"Welcome, {name}!"
```

---

#### :bulb: Hint

- Use string formatting (e.g., f-strings) to insert the name into a greeting message.

---

#### :triangular_ruler: 3. Largest Number Function

Write a function that accepts three numbers and returns the largest one.

```python
def largest_number(a, b, c):
    return max(a, b, c)
```

---

#### :bulb: Hint

- Use Python’s built-in comparison operators or the `max()` function.

---

#### :test_tube: 4. Print Digits in Words

Write a function that accepts a three-digit number and prints its digits in words.

```python
def print_digits_in_words(number):
    words = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
    for digit in str(number):
        print(words[int(digit)])
```

---

#### :bulb: Hint

- Store word equivalents of digits (0–9) in a list and map each digit to its corresponding word using iteration.

---

#### :shield: Note

- Use Python naming conventions (`snake_case` for variables and methods, `CamelCase` for class names).
- Include simple print statements to validate your outputs.

---