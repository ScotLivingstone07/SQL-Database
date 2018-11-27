SELECT `Equipment`.`EquipmentID`, `Equipment`.`Make`, `Equipment`.`Model`, `Equipment`.`Description`
FROM `Equipment`
LEFT JOIN `slivingstone07`.`EquipmentLoan` ON `Equipment`.`EquipmentID` = `EquipmentLoan`.`EquipmentID`
WHERE ((`Equipment`.`Description` LIKE "%video%") OR (`Equipment`.`Type` LIKE "%video%") AND (`Equipment`.`Damaged` ="0") AND (`EquipmentLoan`.`Current` ="0"));

SELECT `Employee`.`EmployeeID`, `Employee`.`FirstName`, `Employee`.`LastName`
FROM `Employee`
LEFT JOIN `slivingstone07`.`Contract` ON `Employee`.`EmployeeID` = `Contract`.`EmployeeID`
WHERE (`Contract`.`DueFinish` LIKE "%2019%" );

SELECT Project.Title, SUM(Expense.Amount) AS "Expenses" FROM Project 
INNER JOIN Expense ON  Project.ProjectID = Expense.ProjectID GROUP BY Project.ProjectID;

SELECT Employee.FirstName, Employee.LastName, Employee.Email, Grade.Title FROM Employee INNER JOIN EmployeeSkill ON Employee.EmployeeID=EmployeeSkill.EmployeeID INNER JOIN Skill ON Skill.SkillID=EmployeeSkill.SkillID 
INNER JOIN Grade ON Grade.GradeID=Employee.GradeID 
WHERE Skill.Title LIKE "%video editing%" OR "%video writing%";

SELECT Project.Title, COUNT(Assignment.EmployeeID) AS "Number of Employees"  FROM Assignment 
INNER JOIN Project ON Assignment.ProjectID=Project.ProjectID INNER JOIN Employee  ON Assignment.EmployeeID=Employee.EmployeeID 
WHERE Employee.Current='1' AND Project.Internal='0'  
GROUP BY Project.ProjectID	
HAVING COUNT(Assignment.EmployeeID)>2;

SELECT `Employee`.`EmployeeID`, `Employee`.`FirstName`, `Employee`.`LastName`
FROM `Employee`
LEFT JOIN `slivingstone07`.`Assignment` ON `Employee`.`EmployeeID` = `Assignment`.`EmployeeID`
WHERE (`Assignment`.`ProjectID` IS NULL);

SELECT Skill.Title, COUNT(EmployeeSkill.EmployeeID) AS "NumberofSkilledEmployees" FROM Skill 
INNER JOIN EmployeeSkill ON  Skill.SkillID = EmployeeSkill.SkillID 
GROUP BY EmployeeSkill.EmployeeID;

SELECT Employee.EmployeeID, COUNT(EquipmentLoan.EmployeeID) AS "EquipmentLoans" FROM Employee 
INNER JOIN EquipmentLoan ON  Employee.EmployeeID = EquipmentLoan.EmployeeID
WHERE EquipmentLoan.Current = 1 
GROUP BY Employee.EmployeeID;

SELECT Employee.EmployeeID, COUNT(EquipmentLoan.EmployeeID) AS "AllTimeLoans" FROM Employee 
INNER JOIN EquipmentLoan ON  Employee.EmployeeID = EquipmentLoan.EmployeeID 
GROUP BY Employee.EmployeeID;

SELECT Payslip.EmployeeID, Payslip.PayslipID FROM Payslip 
LEFT JOIN Employee ON Employee.EmployeeID = Payslip.EmployeeID LEFT JOIN Contract ON Contract.EmployeeID = Payslip.EmployeeID 
WHERE Payslip.PayDay BETWEEN "2017-01-01" AND "2017-12-31" AND Contract.EmployeeID is null;





