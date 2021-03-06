000000 IDENTIFICATION DIVISION.
000000 PROGRAM-ID. test5.
000000 ENVIRONMENT DIVISION.
000000 CONFIGURATION SECTION.
000000 INPUT-OUTPUT SECTION.
000000 FILE-CONTROL.
000000     SELECT MHTRMA ASSIGN TO DISK
000000                   ORGANIZATION IS INDEXED
000000                   ACCESS IS SEQUENTIAL
000000                   RECORD KEY IS A-A.
000000 DATA DIVISION.
000000 FILE SECTION.
000000 FD  MHTRMA        RECORD CONTAINS  72 CHARACTERS
000000                   LABEL RECORD STANDARD
000000                   DATA RECORD IS RMA
000000                   VALUE OF FILE-ID IS "MHTRWA.DAT".
000000 01  RMA.
000000     02 A-A        PIC 9(4).
000000     02 EPWN       PIC X(20).
000000     02 ONOM       PIC X(15).
000000     02 ONP        PIC X(10).
000000     02 CLASS1      PIC X(3).
000000     02 THL2       PIC 9(11).
000000     02 KATAST.
000000        03  APOYS  PIC 9(3).
000000        03  ATRIM  PIC 9(2).
000000        03  BTRIM  PIC 9(2).
000000        03  CTRIM  PIC 9(2).
000000        03  GRAPTA PIC 9(2).
000000*
000000*
000000 WORKING-STORAGE SECTION.
000000 77     RECIN      PIC X(4).
000000 77     RECOUT     PIC X(4).
000000 77     TEL-W      PIC 9(2).
       01  WS-EOF PIC A(1).      
000000*
      *
       LINKAGE SECTION.
          01 LS-STUDENT-ID PIC 9(4).
          01 LS-STUDENT-NAME PIC A(20).


000000 PROCEDURE DIVISION USING LS-STUDENT-ID, LS-STUDENT-NAME. 
000000 ARXH.
           OPEN INPUT MHTRMA.
           CLOSE MHTRMA.    
000000     OPEN OUTPUT  MHTRMA.
000000     MOVE LS-STUDENT-ID TO A-A.
           MOVE LS-STUDENT-NAME TO EPWN.
000000     WRITE RMA INVALID KEY GO TO TELOS.
000000 TELOS.
000000     CLOSE MHTRMA.
000000     DISPLAY "TO ARXEIO DIMIOYRGIQHKE".
000000     EXIT PROGRAM.
000000*


