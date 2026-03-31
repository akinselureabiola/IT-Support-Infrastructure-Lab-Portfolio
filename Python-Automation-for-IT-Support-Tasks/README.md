# Python Automation for IT Support Tasks

## Overview

I built this Python project to simulate a simple IT support scenario where repeated issues need to be analyzed.

In most IT support environments, we deal with a lot of recurring problems like password resets, login issues, VPN connection problems, etc. I wanted to see how I could use Python to quickly analyze these issues and spot patterns.

This project reads a list of IT support issues from a file, counts how often each one appears, and shows the results. It also saves the output into a file so it can be used as a simple report.

---

## Why I Built This

While working in IT support, I noticed that many issues come up again and again. Instead of going through tickets manually, I thought it would be useful to automate a basic way to:

- Identify the most common issues
- Understand what users struggle with the most
- Get a simple overview of recurring problems

This project is a small step towards using automation to support everyday IT tasks.

---

## How It Works

1. A text file (`support_issues.txt`) contains a list of issues (one per line)
2. The script reads all the issues from the file
3. It counts how many times each issue appears
4. The results are displayed in the terminal (sorted by frequency)
5. The results are also saved into a file (`results.txt`)

---

## Sample Input

```

Login issue
Password reset
Outlook not opening
Wi-Fi issue
Login issue
Password reset
VPN not connecting

```

---

## Sample Output

```

1. Password reset: 14
2. Login issue: 11
3. Wi-Fi issue: 9
4. VPN not connecting: 9
5. Shared mailbox access: 7
6. Outlook not opening: 6
7. MFA setup issue: 5

```

---

## Key Features

- Reads IT support issues from a file
- Counts repeated issues using Python
- Displays results in a ranked format
- Saves output into a file for reference

---

## Technologies Used

- Python
- `collections.Counter`

---

## What I Learned

While building this project, I improved my understanding of:

- Reading and processing files in Python
- Using `Counter` to analyze simple datasets
- Structuring code using functions
- Thinking about how automation can be applied in IT support

It also helped me connect Python with real support tasks instead of just learning it in theory.

---

## Possible Improvements

If I continue working on this, I would like to:

- Use a CSV file instead of a text file
- Add timestamps to analyze trends over time
- Visualize the data (charts or graphs)
- Connect it to real ticketing systems (like Jira or ServiceNow)

---

## How to Run

1. Make sure Python is installed
2. Place your `support_issues.txt` file in the same folder
3. Run:

```

python3 issue_analyzer.py

```

---

## Project Structure

```

Python-Automation-for-IT-Support-Tasks/
│
├── issue_analyzer.py
├── support_issues.txt
├── results.txt
└── README.md

```

---

## Final Note

This project is part of my learning process in IT support and automation. The idea is to keep building small, practical solutions that reflect real-world support scenarios.
