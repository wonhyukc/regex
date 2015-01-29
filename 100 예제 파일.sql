   1: -- ===========================================================
   2: -- Default Constraints
   3: -- How to script out Default Constraints in SQL Server 2005
   4: -- ===========================================================
   5:
   6: -- view results in text, to make copying and pasting easier
   7: -- drop default constraints
   8: SELECT
   9:     'ALTER TABLE ' +
  10:     QuoteName(OBJECT_NAME(sc.id)) +
  11:     CHAR(10) +
  12:     ' DROP CONSTRAINT ' +
  13:     QuoteName(OBJECT_NAME(sc.cdefault))
  14: FROM
  15:     syscolumns sc
  16:     INNER JOIN
  17:     sysobjects as so on sc.cdefault = so.id
  18:     INNER JOIN
  19:     syscomments as sm on sc.cdefault = sm.id
  20: WHERE
  21:     OBJECTPROPERTY(so.id, N'IsDefaultCnst') = 1
  22:
  23: -- create default constraints
  24: SELECT
  25:     'ALTER TABLE ' +
  26:     QuoteName(OBJECT_NAME(sc.id)) +
  27:     'WITH NOCHECK ADD CONSTRAINT ' +
  28:     QuoteName(OBJECT_NAME(sc.cdefault))+
  29:     ' DEFAULT ' +
  30:     sm.text +
  31:     ' FOR ' + QuoteName(sc.name)
  32:     + CHAR(13)+CHAR(10)
  33: FROM
  34:     syscolumns sc
  35:     INNER JOIN
  36:     sysobjects as so on sc.cdefault = so.id
  37:     INNER JOIN
  38:     syscomments as sm on sc.cdefault = sm.id
  39: WHERE
  40:     OBJECTPROPERTY(so.id, N'IsDefaultCnst') = 1