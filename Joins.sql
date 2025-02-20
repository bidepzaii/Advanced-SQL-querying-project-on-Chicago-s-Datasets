--Write and execute a SQL query to list the school names, community names and average attendance for communities with a hardship index of 98.
SELECT P.NAME_OF_SCHOOL, C.COMMUNITY_AREA_NAME, P.AVERAGE_STUDENT_ATTENDANCE
FROM CHICAGO_PUBLIC_SCHOOLS AS P 
LEFT JOIN CENSUS_DATA AS C 
ON P.COMMUNITY_AREA_NUMBER = C.COMMUNITY_AREA_NUMBER
WHERE C.HARDSHIP_INDEX = 98;

--Write and execute a SQL query to list all crimes that took place at a school. Include case number, crime type and community name.
SELECT R. CASE_NUMBER, R. PRIMARY_TYPE, C. COMMUNITY_AREA_NAME
FROM CHICAGO_CRIME_DATA as R LEFT JOIN CENSUS_DATA as C on R. COMMUNITY_AREA_NUMBER = C. COMMUNITY_AREA_NUMBER
WHERE R.LOCATION_DESCRIPTION LIKE 'SCHOOL%'