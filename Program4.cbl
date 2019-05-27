       $SET SQL(dbman=ODBC)   
       program-id. Program4 as "Program4".
       environment division.
       configuration section.
       data division.
       working-storage section.
       EXEC SQL INCLUDE SQLCA END-EXEC                                
       EXEC SQL BEGIN DECLARE SECTION END-EXEC
       01 svr          pic x(32) value "elpida".
       01 usr-pass     pic x(64) value "HR.hr".
       01 DESCR pic x(10) value "test66".
       EXEC SQL END DECLARE SECTION END-EXEC.         
       procedure division.
          EXEC SQL                                     
              CONNECT TO :svr USER :usr-pass           
          END-EXEC                                     
          if sqlcode not = 0                           
               display "Error: cannot connect "        
               display sqlcode                         
               display sqlerrmc                        
               stop run                                
          end-if 
         
          EXEC SQL
           INSERT INTO [SalesLT].[DemoTable]
                   ([Description])
             VALUES
                   (:DESCR)
           END-EXEC
          if sqlcode not = 0                           
               display "Error: cannot insert "     
               display sqlcode                         
               display sqlerrmc                        
               stop run                                
          end-if           
           EXEC SQL
               commit transaction
           END-EXEC
           if sqlcode not = 0
                display "Error: commit "
                display sqlcode
                display sqlerrmc
                stop run
           end-if
          
          
          EXEC SQL                                     
              DISCONNECT CURRENT                       
          END-EXEC                                     
          if sqlcode not = 0                           
               display "Error: cannot disconnect "     
               display sqlcode                         
               display sqlerrmc                        
               stop run                                
          end-if                                       
           goback.
       end program Program4.
