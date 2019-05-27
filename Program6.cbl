       $SET SQL(dbman=ODBC)    
       IDENTIFICATION DIVISION.
       PROGRAM-ID. TESTALL. 
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION. 
       INPUT-OUTPUT SECTION. 
       FILE-CONTROL. 
       DATA DIVISION.  
       FILE SECTION.  
       WORKING-STORAGE SECTION. 
       01 DISP-RATE PIC $$$,$$$,$$9.99. 
       01 DISP-COM PIC Z.99.  
       01 DISP-CODE PIC ----9. 
       01 FAKE-CHAR PIC X.  
       01 ANSS PIC X. 
       01 COM-NULL-IND PIC S9(4) COMP. 
       01 REC-IN.
           02 WSID PIC 9(18).
           02 DESCR PIC x(20).
       
       EXEC SQL 
         INCLUDE SQLCA 
       END-EXEC. 
      
       01 svr          pic x(32) value "elpida".
       01 usr-pass     pic x(64) value "HR.hr".
     
       PROCEDURE DIVISION.
       000-CONN.
         EXEC SQL                                     
              CONNECT TO :svr USER :usr-pass           
          END-EXEC                                     
          if sqlcode not = 0                           
               display "Error: cannot connect "        
               display sqlcode                         
               display sqlerrmc                        
               stop run                                
          end-if.                                       
       100-MAIN.
      * declare cursor for select 
           EXEC SQL
               DECLARE c1 CURSOR FOR
               SELECT ID, Description 
                 FROM SalesLT.DemoTable;
           END-EXEC
      * open cursor
           EXEC SQL
               OPEN c1
           END-EXEC 
      * loop until no more data
           PERFORM UNTIL SQLCODE NOT = ZERO 
               EXEC SQL
                     FETCH C1 INTO 
                       :REC-IN 
               END-EXEC
               if sqlcode not = 0  AND SQLCODE NOT = 100                
                   DISPLAY 'Error: Could not perform fetch'
                   DISPLAY SQLERRML
                   DISPLAY SQLERRMC
                   EXEC SQL DISCONNECT ALL END-EXEC
                   STOP RUN                             
               end-if  
               IF SQLCODE NOT = 100
                   DISPLAY WSID, " ", DESCR
               END-IF    
           END-PERFORM.  
      
       CLOSE-LOOP.
      * close the cursor 
           EXEC SQL 
               CLOSE C1 
           END-EXEC. 
      
       100-EXIT. 
           EXIT PROGRAM.
