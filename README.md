# Salary Calculator using HTML, CSS, JS, and Bootstrap

## Overview

The **Salary Calculator** is a web-based application designed to help employees estimate their net salary by considering various income components and deductions. This tool allows users to input their gross salary, bonuses, allowances, and various tax rates to compute their net income. It features input validation, dynamic results, and a user-friendly interface.

## Features

- **Input Form**: Collects employee details including name, gross salary, bonus, allowance, and percentages for income tax, employment insurance (EI), and Canada Pension Plan (CPP).
- **Validation**: Ensures all fields are correctly filled, displaying a single error message for invalid input.
- **Dynamic Calculations**: Computes total deductions, additions, and net salary based on the provided data.
- **Animated Loader**: Shows a loading animation during calculation to enhance user experience.
- **Responsive Design**: Utilizes Bootstrap for a clean and responsive layout that adapts to various screen sizes.
- **Error Handling**: Displays a single, prominent error message in a styled rectangular box if input validation fails.
- **Footer**: Includes copyright information dynamically updated to the current year.

## Calculation Logic

1. **Inputs**:
   - **Employee Name**: Name of the employee (string).
   - **Gross Salary**: Total salary before deductions (numeric).
   - **Bonus**: Additional income (numeric).
   - **Allowance**: Additional financial benefits (numeric).
   - **Income Tax %**: Percentage of income tax applied (numeric).
   - **Employment Insurance %**: Percentage for employment insurance (numeric).
   - **Canada Pension Plan %**: Percentage for CPP (numeric).
   - **Gender**: Employee's gender (Male/Female).
   - **Number of Dependents**: Number of dependents (Two/Three/Four).

2. **Validation**:
   - Ensures all fields are filled and contain valid values.
   - Displays an error message if validation fails.

3. **Tax Calculation**:
   - **Income Tax**: Adjusted based on gender and number of dependents:
     - **Male**:
       - 3 dependents: 1% reduction.
       - 4 dependents: 2% reduction.
     - **Female**:
       - 2 dependents: 1% reduction.
       - 3 dependents: 2% reduction.
       - 4 dependents: 3% reduction.
   - **Deductions**:
     - Calculated as: `Gross Salary * (Income Tax % + CPP % + EI %) / 100`
   - **Additions**:
     - Sum of bonus and allowance.
   - **Net Salary**:
     - Calculated as: `(Gross Salary - Total Deductions) + Total Additions`

4. **User Interaction**:
   - Displays a loader for 2 seconds while calculations are processed.
   - Hides the result table until the loading animation completes.

## Technologies Used

- **HTML/CSS**: For page structure and styling.
- **JavaScript**: For form validation, calculations, and dynamic updates.
- **Bootstrap**: For responsive design and styling.

## Usage

1. Enter the required fields: Employee Name, Gross Salary, Bonus, Allowance, and tax rates.
2. Select Gender and Number of Dependents.
3. Click the "Calculate" button to process the inputs.
4. Review the net salary and other calculated values in the results table.

Feel free to customize this project according to your needs or extend its functionality.
