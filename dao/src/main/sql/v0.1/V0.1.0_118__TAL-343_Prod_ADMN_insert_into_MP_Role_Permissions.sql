DECLARE
  role_id         NUMBER;
  role_name       VARCHAR(100);
  permission_id   NUMBER;
  permission_name VARCHAR(200);
  u_no number;
BEGIN

delete 
FROM DBO_MP.ROLE_PERMISSIONS
WHERE role_id IN
  (SELECT ROLE_ID
  FROM dbo_mp.user_role
  WHERE role_name IN ('Production Admin')
  )
  AND permission_id in (select permission_id from DBO_MP.permissions where Name like '%Talent%');
  
FOR rec1 IN
  (SELECT ROLE_ID AS role_id,
    ROLE_NAME     AS role_name
  FROM dbo_mp.user_role
  WHERE role_name IN ('Production Admin')
  )
  LOOP
    FOR rec2 IN
    (SELECT permission_id AS permission_id,
      name                AS permission_name
    FROM DBO_MP.PERMISSIONS where name in 
    ('Talent.TalentGrid.VIEW',
    'Talent.TalentGrid.UPDATE',
    'Talent.TalentGrid.CREATE',
    'Talent.TalentGrid.DELETE',
    'Talent.RepGrid.VIEW',
    'Talent.RepGrid.UPDATE',
    'Talent.RepGrid.CREATE',
    'Talent.RepGrid.DELETE',
    'Talent.RepCompGrid.VIEW',
    'Talent.RepCompGrid.UPDATE',
    'Talent.RepCompGrid.CREATE',
    'Talent.RepCompGrid.DELETE',    
    'Talent.CreateEdit.Personal.VIEW',
    'Talent.CreateEdit.Personal.UPDATE',
    'Talent.CreateEdit.Personal.CREATE',
    'Talent.CreateEdit.Personal.DELETE',
    'Talent.CreateEdit.Representation.VIEW',
    'Talent.CreateEdit.Representation.UPDATE',
    'Talent.CreateEdit.Representation.CREATE',
    'Talent.CreateEdit.Representation.DELETE',
    'Talent.CreateEdit.Contact.VIEW',
    'Talent.CreateEdit.Contact.UPDATE',
    'Talent.CreateEdit.Contact.CREATE',
    'Talent.CreateEdit.Contact.DELETE',
    'Talent.CreateEdit.Teams.VIEW',
    'Talent.CreateEdit.Teams.UPDATE',
    'Talent.CreateEdit.Teams.CREATE',
    'Talent.CreateEdit.Teams.DELETE',    
    'Talent.TalentDetails.Rep.VIEW', 
    'Talent.TalentDetails.Contact.VIEW', 'Talent.TalentDetails.Star.VIEW',    
    'Talent.TalentDetails.Timeline.VIEW',
    'Talent.TalentDetails.Lists.VIEW',
    'Talent.TalentDetails.Lists.UPDATE',
    'Talent.TalentDetails.Lists.CREATE',
    'Talent.TalentDetails.Lists.DELETE',
	'Talent.TalentDetails.Submissions.VIEW',
    'Talent.RepDetails.Clients.VIEW',
    'Talent.RepDetails.Clients.UPDATE',
    'Talent.RepDetails.Clients.CREATE',
    'Talent.RepDetails.Clients.DELETE',
	'Talent.RepDetails.Submission.VIEW',
	'Talent.RepDetails.Submission.UPDATE',
    'Talent.RepDetails.Submission.CREATE',
    'Talent.RepDetails.Submission.DELETE',	
    'Talent.RepCompDetails.Reps.VIEW',
    'Talent.RepCompDetails.Reps.UPDATE',
    'Talent.RepCompDetails.Reps.CREATE',
    'Talent.RepCompDetails.Reps.DELETE'
    )
    )
    LOOP
      IF rec1.role_name = 'Production Admin' THEN
        INSERT
        INTO DBO_MP.ROLE_PERMISSIONS
          (
            ROLE_PERMISSION_ID,
            ROLE_ID,
            PERMISSION_ID,
            LAST_UPDATE_TS,
            LAST_UPDATE_USER
          )
          VALUES
          (
            DBO_MP.SEQ_ROLE_PERMISSION_ID.nextval,
            rec1.role_id,
            rec2.permission_id,
            systimestamp,
            'flyway'
          );
      END IF;
    END LOOP;
  END LOOP;
END;