
--Write the structure of a query to create or replace a stored procedure called UPDATE_LEADERS_SCORE that takes a in_School_ID parameter as an integer and a in_Leader_Score parameter as an integer. Don't forget to use the #SET TERMINATOR statement to use the @ for the CREATE statement terminator.
--Inside your stored procedure, write a SQL statement to update the Leaders_Score field in the CHICAGO_PUBLIC_SCHOOLS table for the school identified by in_School_ID to the value in the in_Leader_Score parameter.
--Inside your stored procedure, write a SQL IF statement to update the Leaders_Icon field in the CHICAGO_PUBLIC_SCHOOLS table for the school identified by in_School_ID using the following information.
--Update your stored procedure definition. Add a generic ELSE clause to the IF statement that rolls back the current work if the score did not fit any of the preceding categories.
--Update your stored procedure definition again. Add a statement to commit the current unit of work at the end of the procedure.

-- Set the statement terminator to @
--#SET TERMINATOR @

CREATE OR REPLACE PROCEDURE UPDATE_LEADERS_SCORE (
    IN in_School_ID INT, 
    IN in_Leader_Score INT
)
LANGUAGE SQL
MODIFIES SQL DATA 

BEGIN
    -- Update Leaders_Score
    UPDATE CHICAGO_PUBLIC_SCHOOLS
    SET Leaders_Score = in_Leader_Score
    WHERE School_ID = in_School_ID;

    -- Determine Leaders_Icon based on score
    IF in_Leader_Score > 0 AND in_Leader_Score < 20 THEN
        UPDATE CHICAGO_PUBLIC_SCHOOLS
        SET Leaders_Icon = 'Very weak'
        WHERE School_ID = in_School_ID;

    ELSEIF in_Leader_Score < 40 THEN
        UPDATE CHICAGO_PUBLIC_SCHOOLS
        SET Leaders_Icon = 'Weak'
        WHERE School_ID = in_School_ID;

    ELSEIF in_Leader_Score < 60 THEN
        UPDATE CHICAGO_PUBLIC_SCHOOLS
        SET Leaders_Icon = 'Average'
        WHERE School_ID = in_School_ID;

    ELSEIF in_Leader_Score < 80 THEN
        UPDATE CHICAGO_PUBLIC_SCHOOLS
        SET Leaders_Icon = 'Strong'
        WHERE School_ID = in_School_ID;

    ELSEIF in_Leader_Score <= 100 THEN
        UPDATE CHICAGO_PUBLIC_SCHOOLS
        SET Leaders_Icon = 'Very strong'
        WHERE School_ID = in_School_ID;
        
    ELSEIF in_Leader_Score > 100 THEN 
    ROLLBACK WORK;
    
    ELSE 
    COMMIT WORK;
	
    END IF;

END @
