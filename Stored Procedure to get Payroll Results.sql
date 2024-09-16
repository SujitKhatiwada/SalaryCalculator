CREATE OR ALTER PROCEDURE Sp_GetEmployeePayrollDetails
    @EmployeeId INT = NULL -- Optional parameter, if not provided returns details for all employees
AS
BEGIN
    SET NOCOUNT ON;

    -- Create a temporary table to store the results
    CREATE TABLE #PayrollResults
    (
        EmployeeId INT,
        EmployeeName NVARCHAR(100),
        GrossSalary DECIMAL(18,2),
        Deduction DECIMAL(18,2),
        Addition DECIMAL(18,2),
        NetSalary DECIMAL(18,2)
    );

    -- Insert payroll details for all employees or a specific employee if @EmployeeId is provided
    INSERT INTO #PayrollResults
    (
        EmployeeId,
        EmployeeName,
        GrossSalary,
        Deduction,
        Addition,
        NetSalary
    )
    SELECT 
        e.EmployeeId,
        e.Name AS EmployeeName,
        e.GrossSalary,
        -- Deduction Calculation (Income Tax + CPP + Insurance)
        (
            e.GrossSalary * 
            CASE 
                -- Adjust tax rate based on the number of dependents and gender
                WHEN e.Gender = 'M' THEN (e.IncomeTaxRate - ((e.NoOfDependents - 2) * 0.01))
                ELSE (e.IncomeTaxRate - ((e.NoOfDependents - 1) * 0.01))
            END / 100
        ) +
        (e.GrossSalary * e.CPPRate / 100) + 
        (e.GrossSalary * e.InsuranceRate / 100) AS Deduction,

        -- Additions Calculation (Allowance + Bonus)
        e.Allowance + e.Bonus AS Addition,

        -- Net Salary Calculation (Gross Salary - Deductions + Additions)
        (e.GrossSalary - (
            e.GrossSalary * 
            CASE 
                WHEN e.Gender = 'M' THEN (e.IncomeTaxRate - ((e.NoOfDependents - 2) * 0.01))
                ELSE (e.IncomeTaxRate - ((e.NoOfDependents - 1) * 0.01))
            END / 100
        ) - 
        (e.GrossSalary * e.CPPRate / 100) - 
        (e.GrossSalary * e.InsuranceRate / 100)) + 
        (e.Allowance + e.Bonus) AS NetSalary
    FROM 
        Employee e
    WHERE 
        (@EmployeeId IS NULL OR e.EmployeeId = @EmployeeId); -- Filter by EmployeeId if provided

    -- Select the results
    SELECT 
        EmployeeId,
        EmployeeName,
        GrossSalary,
        Deduction,
        Addition,
        NetSalary
    FROM 
        #PayrollResults;

    -- Clean up the temporary table
    DROP TABLE #PayrollResults;
END;