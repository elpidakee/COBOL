       IDENTIFICATION DIVISION.
       PROGRAM-ID. ARRAYS.
       AUTHOR. Salamouras Sp..
       DATE-WRITTEN. 21-11-96.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. SAT.
       OBJECT-COMPUTER. SAT.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT FILE-IN ASSIGN TO "ARRAY.DAT"
               ORGANIZATION IS LINE SEQUENTIAL.
       DATA DIVISION.        
       FILE SECTION.
           FD  FILE-IN
               LABEL RECORD STANDARD.
           01  REC-IN.
               03 HMERA.
                  04 FILLER PIC 99.
                  04 RMM    PIC 99.
                  04 FILLER PIC 99.

               03 QTY      PIC 9(5).
               03 UPR      PIC 9(9).
               03 RCD      PIC 9.
                  88 VALID-RCD VALUES 1 THRU  2.
       WORKING-STORAGE SECTION.
       01  PINAKAS.
           02  FILLER PIC X(11) VALUE "IANOUARIOS".
           02  FILLER PIC X(11). 
           02  FILLER PIC X(11).
           02  FILLER PIC X(11).
           02  FILLER PIC X(11).
           02  FILLER PIC X(11).
           02  FILLER PIC X(11).
           02  FILLER PIC X(11).
           02  FILLER PIC X(11).
           02  FILLER PIC X(11).
           02  FILLER PIC X(11).
           02  FILLER PIC X(11).
       01  PIN-RDF REDEFINES PINAKAS.
           02  MHNAS   PIC X(11)   OCCURS  12 TIMES.

       01  IND     PIC 99.

       01  PINAX.
           02  POSA    OCCURS  12 TIMES.
               04  SQTY    PIC 9(7).
               04  SUPR    PIC 9(11).
               04  SCR     PIC 9(11).
               04  SDB     PIC 9(11).

       01  LINCOL.
           02 LIN PIC 99.
           02 COLMN PIC 99.
       01  TMP     PIC Z(9).
       01  TEMP    PIC X(11).
       01  PAVLES  PIC X(60) VALUE ALL "-".

       01  GTQTY   PIC 9(10).
       01  GTUPR   PIC 9(10).
       01  GTCR    PIC 9(10).
       01  GTDB    PIC 9(10).
       01  ZTM     PIC Z(10).
       PROCEDURE DIVISION.
       100-FIRST SECTION.
       200-FISRT-PARAGRAPH.
           DISPLAY SPACES UPON CRT.
           OPEN INPUT  FILE-IN.
       300-LOOP.
           READ FILE-IN AT END GO TO EMFANISH.
           IF RMM > 12 AND RMM < 1  GO TO 300-LOOP.
           IF NOT VALID-RCD GO TO 300-LOOP.
           ADD QTY TO SQTY ( RMM ).
           COMPUTE SUPR ( RMM ) = SUPR ( RMM ) + ( QTY * UPR ).
           IF RCD = 1
               COMPUTE SCR ( RMM ) = SCR ( RMM ) + ( QTY * UPR )
           ELSE
               COMPUTE SDB ( RMM ) = SDB ( RMM ) + ( QTY * UPR ).
           GO TO 300-LOOP.

       EMFANISH.
           DISPLAY SPACES UPON CRT.
           DISPLAY "AA MHNES POSOTHTES AXIES" AT 0101.
           DISPLAY "XEREOSI PISTOSI "  0130.
           DISPLAY PAVLES AT 0201.
           PERFORM DISP-SCR VARYING IND FROM 1 BY 1 UNTIL IND > 12.

           DISPLAY PAVLES AT 1501.

           DISPLAY "GENIKA SYNOLA  " AT 1601.

           MOVE GTQTY TO ZTM.
           DISPLAY ZTM   AT 1615.
           MOVE GTUPR TO ZTM.
           DISPLAY ZTM   AT 1625.
           MOVE GTCR TO ZTM.
           DISPLAY ZTM   AT 1636.
           MOVE GTDB TO ZTM.
           DISPLAY ZTM   AT 1647.

           PERFORM TELOS.

       DISP-SCR.
           COMPUTE LIN = IND + 2.
           MOVE 1 TO COLMN.
           DISPLAY IND AT LINCOL.

           MOVE 4 TO COLMN.
           MOVE MHNAS ( IND ) TO TEMP.
           DISPLAY TEMP AT LINCOL.

           MOVE 16 TO COLMN.
           MOVE SQTY ( IND ) TO TMP.
           DISPLAY TMP   AT LINCOL.

           MOVE 26 TO COLMN.
           MOVE SUPR ( IND ) TO TMP.
           DISPLAY TMP AT LINCOL.

           MOVE 37 TO COLMN.
           MOVE SCR ( IND )  TO TMP.
           DISPLAY TMP   AT LINCOL.

           MOVE 48 TO COLMN.
           MOVE SDB (IND ) TO TMP.
           DISPLAY TMP   AT LINCOL.

           ADD SQTY (IND) TO GTQTY.
           ADD SUPR (IND) TO GTUPR.
           ADD SCR (IND)  TO GTCR.
           ADD SDB (IND)  TO GTDB.

       TELOS.
           CLOSE FILE-IN.
           EXIT PROGRAM.