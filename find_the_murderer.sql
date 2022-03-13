-- We start by checking the 'crime_scene_report' table to get details of the murder narrowing down to 'SQL City'
-- and on 2018-01-15

SELECT *
FROM crime_scene_report
WHERE city = 'SQL City'
  AND date = '20180115';

-- Result from query showed there were two witnesses. One witness lives in the last house on 'Northwestern Dr'
-- Second witness is named 'Annabel' and lives on 'Franklin Ave'
-- Next, we get the information of the witnesses from the 'person' table

SELECT *
FROM person
WHERE (name LIKE '%Annabel%' and address_street_name LIKE 'Franklin Ave')
   OR address_street_name LIKE 'Northwestern Dr'
ORDER BY address_street_name, address_number DESC;

-- Having gotten the identities of our witnesses, we search the 'interview' table to get their statements with their IDs

SELECT *
FROM interview
WHERE person_id = 16371
   OR person_id = 14887

-- From the witnesses statements, we know the culprit is a GOLD member of the gym,
-- has a membership id that includes '48Z', plate number also include 'H42W',
-- and went to the gym on '2018-01-09' 

    WITH cte_person AS
    (
        SELECT * FROM person p
        JOIN drivers_license dl
        ON p.license_id = dl.id
    )

SELECT cp.*
FROM get_fit_now_member m
         JOIN cte_person cp
              ON m.person_id = cp.id
         JOIN get_fit_now_check_in ci
              ON m.id = ci.membership_id
WHERE m.membership_status = 'gold'
  and ci.check_in_date = '20180109'
  and m.id like '%48Z%'
  and cp.plate_number like '%H42W%';

-- Finally! The murderer has been unmasked and his name is JEREMY BOWERS!