       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGRAM1.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.                                            
       FILE-CONTROL.                                                    
       DATA DIVISION.                                                   
       FILE SECTION.                                                    
       WORKING-STORAGE SECTION.                                         
       01 WS-STUDENT PIC A(20).                                         
       01 WS-ID PIC 9(4).                                               
       01 I PIC 9(4).                                                   
       PROCEDURE DIVISION.
           CALL 'Program4'
           CALL 'Program6'
      *     CALL 'Program3'                                             
      *     DISPLAY 'START'.                                            
      *     ACCEPT WS-STUDENT.                                          
      *     ACCEPT WS-ID. 
      *     CALL 'Program2' USING WS-ID, WS-STUDENT.                    
      *     DISPLAY 'Student Id : ' WS-ID
      *     DISPLAY 'Student Name : ' WS-STUDENT
       STOP RUN.    