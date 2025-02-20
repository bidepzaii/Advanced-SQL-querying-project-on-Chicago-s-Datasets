--Write and execute a SQL statement to create a view showing the columns listed in the following table, with new column names as shown in the second column.

CREATE VIEW PUBLIC_SCHOOL AS 
SELECT NAME_OF_SCHOOL AS School_Name, SAFETY_ICON AS Safety_Rating,
FAMILY_INVOLVEMENT_ICON AS Family_Rating, ENVIRONMENT_ICON AS Environment_Rating, 
INSTRUCTION_ICON AS Instruction_Rating, LEADERS_ICON AS Leaders_Rating, TEACHERS_ICON AS Teachers_Rating
FROM CHICAGO_PUBLIC_SCHOOLS;
