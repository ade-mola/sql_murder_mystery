-- We found the murderer but he wasn't the mastermind. There is still a guilty party on the loose.
-- We go back into the 'interview' table to get the murderer's statement

SELECT * FROM interview
WHERE person_id = 67318

-- The murderer's statement proved useful. He gave details of the person who hired him.
-- He was hired by a woman with height between 65" and 67", has red hair, drives a Tesla Model S.
-- She also attend the SQL Symphony Concert thrice in December 2017

SELECT p.id, p.name,
	   dl.height, dl.hair_color, 
	   dl.car_model, dl.car_make, 
	   f.event_name, f.date
FROM person p
JOIN drivers_license dl
    ON p.license_id = dl.id
JOIN facebook_event_checkin f
    ON p.id = f.person_id
WHERE (dl.height BETWEEN 65 AND 67) AND dl.hair_color = 'red' 
      AND (dl.car_make = 'Tesla' AND dl.car_model = 'Model S')
	  AND f.event_name = 'SQL Symphony Concert' AND f.date LIKE '%201712%'


-- We found our second culprit! MIRANDA PRIESTLY was the brains behind the murder.
-- Next, we charge the suspects to court and have Judge Judy preside over their case.