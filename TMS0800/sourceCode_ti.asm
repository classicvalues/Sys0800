//-----------------------------------------------------------------------------------
// Generated by AsmGenerator.exe from 'http://files.righto.com/calculator/sourceCode.js' on 8/26/2019 12:08 AM for use in https://github.com/zpekic/Sys0800
//-----------------------------------------------------------------------------------
//Add * after the last binary digit of instruction to generate breakpoint for TMS0800
//-----------------------------------------------------------------------------------

//-----------------------------------------------------------------------------------
// This file has been manually modified to include "*" breakpoint at start of operation. Re-running AsmGenerator may overwrite this file and clear them
//-----------------------------------------------------------------------------------

// TI calculator simulator
// Ken Shirriff, http://righto.com/ti
// Based on patent US3934233
// Code transcribed by Phil Mainwaring
//
// This file holds the source and object code to be executed.

0 0000 0000 0000	10 11000 1111 .CLEAR   ZFA    ALL    ; Power on, clear flags
0 0000 0001 0001	10 10111 1111          ZFB    ALL   
0 0000 0010 0002	11 10000 1111          AKA    ALL    ; Clear A and C
0 0000 0011 0003	11 10010 1111          AKC    ALL   
0 0000 0100 0004	00 00000 0101          BET    RJ     ; Reset condition latch
0 0000 0101 0005	11 01101 1011 .RJ      CAK    MANT1  ; Right justify A, maybe add minu...
0 0000 0110 0006	01 00001 0011          BILT   ZERO   ; Mantissa is zero?
0 0000 0111 0007	10 11010 0110 .S       TFA    SIGN  
0 0000 1000 0008	00 00000 1100          BIZ    RJ1    ; A is positive
0 0000 1001 0009	11 11100 1000          SAKAH  OV1    ; Minus sign is hex 14
0 0000 1010 000A	11 11100 1000          SAKAH  OV1   
0 0000 1011 000B	00 00000 1100          BET    RJ1    ; Reset condition latch
0 0000 1100 000C	11 01101 0010 .RJ1     CAK    LSD1   ; Right justify the display
0 0000 1101 000D	00 00001 0101          BIGE   DPTPOS
0 0000 1110 000E	11 01101 1101          CAK    EXP1  
0 0000 1111 000F	01 00001 0101          BILT   DPTPOS
0 0001 0000 0010	11 10111 1100          SRLA   MANT   ; Shift A mantissa right
0 0001 0001 0011	11 01001 1101          SAKA   EXP1   ; Decrement A exponent
0 0001 0010 0012	00 00000 1100          BET    RJ1   
0 0001 0011 0013	11 10000 1111 .ZERO    AKA    ALL    ; A is zero, clear entire register
0 0001 0100 0014	10 11000 0110          ZFA    SIGN   ; Clear A sign flag
0 0001 0101 0015	11 10011 1111 .DPTPOS  EXAB   ALL    ; Compute decimal point position...
0 0001 0110 0016	11 10000 1011          AKA    MANT1 
0 0001 0111 0017	11 00001 1011          AAKA   MANT1 
0 0001 1000 0018	11 10011 1100          EXAB   MANT   ; B mantissa is 2
0 0001 1001 0019	11 00011 1110          ABOA   EXP    ; Restore A exponent
0 0001 1010 001A	11 01001 1101 .DP1     SAKA   EXP1   ; Shift B (2) left by A exponent...
0 0001 1011 001B	01 00001 1110          BILT   DP2   
0 0001 1100 001C	11 10101 1100          SLLB   MANT  
0 0001 1101 001D	00 00001 1010          BET    DP1   
0 0001 1110 001E	11 00011 1110 .DP2     ABOA   EXP   
0 0001 1111 001F	10 11001 1000          TFB    F10   
0 0010 0000 0020	01 00010 1001          BIO    ID1   
0 0010 0001 0021	10 10101 0000 .LOCK    SYNC          ; Debounce: wait for no key for a few cycles...
0 0010 0010 0022	10 10110 0000          SCAN         
0 0010 0011 0023	01 00010 0001          BID    LOCK  
0 0010 0100 0024	10 10101 0000          SYNC         
0 0010 0101 0025	10 10110 0000          SCAN         
0 0010 0110 0026	01 00010 0001          BID    LOCK  
0 0010 0111 0027	11 00110 1110          ACKB   EXP   
0 0010 1000 0028	11 10010 1110 .IDLE    AKC    EXP    ; Idle loop entry
0 0010 1001 0029	10 10111 1000 .ID1     ZFB    F10   
0 0010 1010 002A	10 10010 0111 .ID2     WAITNO ID3    ; Wait for key press or timeout
0 0010 1011 002B	10 10101 0000 .ID4     SYNC         
0 0010 1100 002C	10 10110 0000          SCAN         
0 0010 1101 002D	01 00110 1000          BID    KEY    ; Key down
0 0010 1110 002E	11 11101 1101 .FD1     ACKC   EXP1  
0 0010 1111 002F	11 01111 0001          CCK    TIM4   ; Check number of timeouts
0 0011 0000 0030	01 00011 0100          BILT   FD3   
0 0011 0001 0031	11 10010 1110          AKC    EXP   
0 0011 0010 0032	10 10101 0000          SYNC         
0 0011 0011 0033	10 10001 0001          WAITDK ID5    ; Turn off display, wait for DK
0 0011 0100 0034	10 11001 0101 .FD3     TFB    F5     ; Test overflow
0 0011 0101 0035	00 00010 1010          BIZ    ID2   
0 0011 0110 0036	10 10011 1000          SFB    F10   
0 0011 0111 0037	11 10010 1100          AKC    MANT  
0 0011 1000 0038	11 01011 1011          SCKC   MANT1 
0 0011 1001 0039	00 00011 1010          BET    FD5    ; Reset condition latch
0 0011 1010 003A	11 00110 1100 .FD5     ACKB   MANT  
0 0011 1011 003B	11 11101 1101          ACKC   EXP1  
0 0011 1100 003C	10 10010 1000          WAITNO FD4   
0 0011 1101 003D	10 10011 0001*.MINKEY  SFB    OP2    ; MINUS = flags II, III
0 0011 1110 003E	10 11010 0011          TFA    F3     ; If CD is clear...
0 0011 1111 003F	00 00100 1101          BIZ    PLSKEY ; perform subtract operation
0 0100 0000 0040	10 11010 0100          TFA    F4     ; Or EQ is clear...
0 0100 0001 0041	01 00100 1101          BIO    PLSKEY ; perform subtract operation
0 0100 0010 0042	10 11010 0000          TFA    OP1    ; Or not after multi/div...
0 0100 0011 0043	00 00100 1101          BIZ    PLSKEY ; perform subtract operation
0 0100 0100 0044	10 10111 0001          ZFB    OP2    ; Minus key as sign after mult or divide
0 0100 0101 0045	10 10100 0110          SFA    SIGN   ; Set sign to minus
0 0100 0110 0046	11 10000 1111          AKA    ALL    ; Clear A
0 0100 0111 0047	10 10100 0111          SFA    F9     ; Set ST flag (sign temp) for unary minus
0 0100 1000 0048	11 00001 0000          AAKA   DPT7   ; Set A exponent to 7
0 0100 1001 0049	10 11000 0011          ZFA    F3     ; Clear CD
0 0100 1010 004A	00 00000 0111          BET    S      ; Update display
0 0100 1011 004B	10 10011 0001*.DIVKEY  SFB    OP2    ; DIV = flags II, III
0 0100 1100 004C	10 10011 0000*.MLTKEY  SFB    OP1    ; MULT = flags I, III
0 0100 1101 004D	10 10011 0010*.PLSKEY  SFB    OP3    ; PLUS = flag III
0 0100 1110 004E	10 11010 0011          TFA    F3     ; Clear display flag
0 0100 1111 004F	01 00101 0010          BIO    KS1   
0 0101 0000 0050	10 11010 0100          TFA    F4     ; Equal flag
0 0101 0001 0051	00 00101 0110          BIZ    KS2   
0 0101 0010 0052	10 11000 0100 .KS1     ZFA    F4    
0 0101 0011 0053	10 10100 0101          SFA    F5    
0 0101 0100 0054	00 00101 0110          BET    KS2   
0 0101 0101 0055	10 10100 0100 .EQLKEY  SFA    F4     ; F4 (EQ) flag set for equals
0 0101 0110 0056	11 01101 1011 .KS2     CAK    MANT1 
0 0101 0111 0057	01 01001 1110          BILT   KS6    ; A mantissa == 0?
0 0101 1000 0058	11 01101 1000 .KS3     CAK    OV1    ; Left justify A...
0 0101 1001 0059	00 10010 1011          BIGE   KS4    ; Digit has reached left?
0 0101 1010 005A	11 10100 1100          SLLA   MANT   ; Shift mantissa left
0 0101 1011 005B	11 00001 1101          AAKA   EXP1   ; Increment exponent
0 0101 1100 005C	00 00101 1000          BET    KS3   
0 0101 1101 005D	10 10100 1000 .DPTKEY  SFA    F10    ; Decimal point key...
0 0101 1110 005E	10 11000 0111          ZFA    F9     ; Set DPT flag, clear ST flag
0 0101 1111 005F	10 11010 0011          TFA    F3    
0 0110 0000 0060	00 00001 0101          BIZ    DPTPOS
0 0110 0001 0061	10 11000 0011          ZFA    F3    
0 0110 0010 0062	00 00001 0011          BET    ZERO  
0 0110 0011 0063	10 11010 0011 .CEKEY   TFA    F3    
0 0110 0100 0064	01 00001 0101          BIO    DPTPOS
0 0110 0101 0065	10 10100 0011          SFA    F3    
0 0110 0110 0066	10 11000 1000          ZFA    F10   
0 0110 0111 0067	00 00001 0011          BET    ZERO  
0 0110 1000 0068	11 00100 1110 .KEY     ABOC   EXP    ; Process key down...
0 0110 1001 0069	10 11001 0101          TFB    F5     ; Test overflow
0 0110 1010 006A	01 00010 0001          BIO    LOCK   ; overflow never gets cleared???
0 0110 1011 006B	10 10101 0000          SYNC          ; Wait to debounce key
0 0110 1100 006C	10 10101 0000          SYNC         
0 0110 1101 006D	10 10110 0000          SCAN         
0 0110 1110 006E	00 00010 1000          BIU    IDLE  
0 0110 1111 006F	11 10001 1111          AKB    ALL   
0 0111 0000 0070	10 10101 0000          SYNC         
0 0111 0001 0071	10 00000 0000          BKO    CLEAR  ; Clear key pressed?
0 0111 0010 0072	10 00101 0101          BKO    EQLKEY ; Equal key pressed?
0 0111 0011 0073	10 00100 1101          BKO    PLSKEY ; Plus key pressed?
0 0111 0100 0074	10 00011 1101          BKO    MINKEY ; Minus key pressed?
0 0111 0101 0075	10 00100 1100          BKO    MLTKEY ; Mult key pressed?
0 0111 0110 0076	10 00100 1011          BKO    DIVKEY ; Divide key pressed?
0 0111 0111 0077	10 00110 0011          BKO    CEKEY  ; CE key pressed?
0 0111 1000 0078	10 00101 1101          BKO    DPTKEY ; Decimal point key pressed?
0 0111 1001 0079	10 00111 1110          BKO    ZERKEY ; Zero key pressed?
0 0111 1010 007A	11 10011 1111          EXAB   ALL    ; Process digit key...
0 0111 1011 007B	11 11010 0010          AKCN   LSD1   ; Count key position into A
0 0111 1100 007C	11 10011 1111          EXAB   ALL   
0 0111 1101 007D	01 00001 0101          BIC    DPTPOS ; No key pressed
0 0111 1110 007E	10 11010 0011 .ZERKEY  TFA    F3     ; Clear display flag
0 0111 1111 007F	00 01000 0011          BIZ    NUM1  
0 1000 0000 0080	10 11000 0110 .CD      ZFA    SIGN  
0 1000 0001 0081	11 10000 1111 .CD1     AKA    ALL   
0 1000 0010 0082	10 11000 0011          ZFA    F3    
0 1000 0011 0083	10 11010 0110 .NUM1    TFA    SIGN   ; Number: Digit is in B...
0 1000 0100 0084	00 01001 0100          BIZ    NUM3   ; Branch if A SIGN clear
0 1000 0101 0085	11 11011 1000          AAKAH  OV1    ; Test for 15 in OV1?
0 1000 0110 0086	11 11011 1000          AAKAH  OV1   
0 1000 0111 0087	11 11100 1000          SAKAH  OV1   
0 1000 1000 0088	11 11100 1000          SAKAH  OV1   
0 1000 1001 0089	01 00001 0101          BIC    DPTPOS ; Borrow set if OV1 == 15?
0 1000 1010 008A	10 11010 0111 .NUM2    TFA    F9     ; Test ST (sign temp) flag
0 1000 1011 008B	00 01001 1000          BIZ    NUM4  
0 1000 1100 008C	10 11010 1000          TFA    F10   
0 1000 1101 008D	01 01001 0010          BIO    NUM7  
0 1000 1110 008E	11 10011 1111          EXAB   ALL   
0 1000 1111 008F	11 01101 1011          CAK    MANT1 
0 1001 0000 0090	11 10011 1111          EXAB   ALL   
0 1001 0001 0091	01 00001 0101          BILT   DPTPOS
0 1001 0010 0092	10 11000 0111 .NUM7    ZFA    F9     ; Clear ST flag
0 1001 0011 0093	00 01001 1100          BET    NUM6  
0 1001 0100 0094	11 01101 1010 .NUM3    CAK    MSD1  
0 1001 0101 0095	00 00001 0101          BIGE   DPTPOS
0 1001 0110 0096	11 01101 0000          CAK    DPT7  
0 1001 0111 0097	00 00001 0101          BIGE   DPTPOS
0 1001 1000 0098	10 11010 1000 .NUM4    TFA    F10   
0 1001 1001 0099	00 01001 1011          BIZ    NUM5  
0 1001 1010 009A	11 00001 1101          AAKA   EXP1  
0 1001 1011 009B	11 10100 1100 .NUM5    SLLA   MANT  
0 1001 1100 009C	11 00011 0010 .NUM6    ABOA   LSD1  
0 1001 1101 009D	00 00001 0101          BET    DPTPOS
0 1001 1110 009E	11 10000 1110 .KS6     AKA    EXP   
0 1001 1111 009F	10 11000 0110          ZFA    SIGN  
0 1010 0000 00A0	11 00001 0000          AAKA   DPT7  
0 1010 0001 00A1	10 11000 1010 .KS7     ZFA    FD     ; Zeros temp(num) and dpt flag
0 1010 0010 00A2	10 11010 0101          TFA    F5     ; Post flag
0 1010 0011 00A3	01 01111 1101          BIO    POST  
0 1010 0100 00A4	10 11010 0010          TFA    OP3   
0 1010 0101 00A5	00 01111 1101          BIZ    POST  
0 1010 0110 00A6	11 00110 1111          ACKB   ALL   
0 1010 0111 00A7	10 11001 0011          TFB    F3     ; Constant flag
0 1010 1000 00A8	00 01010 1101          BIZ    KS8   
0 1010 1001 00A9	10 10111 0011          ZFB    F3    
0 1010 1010 00AA	11 10011 1111          EXAB   ALL   
0 1010 1011 00AB	11 00100 1111          ABOC   ALL   
0 1010 1100 00AC	10 11111 0110          EXF    SIGN  
0 1010 1101 00AD	10 11010 0000 .KS8     TFA    OP1   
0 1010 1110 00AE	01 01100 1111          BIO    MLTDIV
0 1010 1111 00AF	10 11001 0110 .ADDSUB  TFB    SIGN   ; Add / subtract...
0 1011 0000 00B0	00 01011 0010          BIZ    AS1    ; Copy B sign to TEMP...
0 1011 0001 00B1	10 10100 0101          SFA    F5    
0 1011 0010 00B2	10 11010 0001 .AS1     TFA    OP2    ; Flip B sign for subtract...
0 1011 0011 00B3	00 01011 0101          BIZ    AS2   
0 1011 0100 00B4	10 11011 0110          FFB    SIGN  
0 1011 0101 00B5	11 01100 1110 .AS2     CAB    EXP    ; Make sure A exponent >= B exponent...
0 1011 0110 00B6	00 01011 1001          BIGE   AS3   
0 1011 0111 00B7	11 10011 1111          EXAB   ALL    ; Exchange if A exponent smaller
0 1011 1000 00B8	10 11111 0110          EXF    SIGN   ; And exchange the signs
0 1011 1001 00B9	11 01001 1101 .AS3     SAKA   EXP1   ; Shift A right until exponents equal...
0 1011 1010 00BA	11 01100 1110          CAB    EXP    ; Infinite loop if B EXP == 0?
0 1011 1011 00BB	01 01011 1110          BILT   AS4   
0 1011 1100 00BC	11 10111 1100          SRLA   MANT  
0 1011 1101 00BD	00 01011 1001          BET    AS3   
0 1011 1110 00BE	11 00001 1101 .AS4     AAKA   EXP1   ; Exponents now equal
0 1011 1111 00BF	00 01100 0000          BET    AS5    ; Reset condition
0 1100 0000 00C0	11 01100 1100 .AS5     CAB    MANT   ; Make sure A >= B...
0 1100 0001 00C1	00 01100 0100          BIGE   AS6   
0 1100 0010 00C2	11 10011 1111          EXAB   ALL    ; If not, exchange exponents
0 1100 0011 00C3	10 11111 0110          EXF    SIGN   ; and exchange signs
0 1100 0100 00C4	10 11101 0110 .AS6     CF     SIGN  
0 1100 0101 00C5	00 01100 1000          BIE    AS7    ; If signs equal, add...
0 1100 0110 00C6	11 00111 1100          SABA   MANT   ; Otherwise subtract
0 1100 0111 00C7	00 01100 1001          BET    AS8   
0 1100 1000 00C8	11 00000 1100 .AS7     AABA   MANT   ; Add mantissas
0 1100 1001 00C9	10 10111 0110 .AS8     ZFB    SIGN   ; Restore B sign from TEMP flag...
0 1100 1010 00CA	10 11010 0101          TFA    F5    
0 1100 1011 00CB	00 01111 1101          BIZ    POST  
0 1100 1100 00CC	10 10011 0110          SFB    SIGN  
0 1100 1101 00CD	10 11000 0101          ZFA    F5     ; And clear TEMP
0 1100 1110 00CE	00 01111 1101          BET    POST   ; Done add/sub
0 1100 1111 00CF	10 11101 0110 .MLTDIV  CF     SIGN   ; Mult / div operation...
0 1101 0000 00D0	10 11000 0110          ZFA    SIGN   ; Positive result if signs the same
0 1101 0001 00D1	00 01101 0011          BIE    MD1   
0 1101 0010 00D2	10 10100 0110          SFA    SIGN   ; A, B signs different: negative result
0 1101 0011 00D3	10 11010 0001 .MD1     TFA    OP2   
0 1101 0100 00D4	01 01110 0100          BIC    DIV   
0 1101 0101 00D5	11 00010 1111          AAKC   ALL    ; Copy A to C
0 1101 0110 00D6	11 10000 1100          AKA    MANT   ; Clear A mantissa
0 1101 0111 00D7	11 00000 1110          AABA   EXP    ; Add A and B exponents
0 1101 1000 00D8	11 01011 0010 .M1      SCKC   LSD1   ; Repeat least-significant-digit of C times...
0 1101 1001 00D9	01 01101 1100          BILT   M2    
0 1101 1010 00DA	11 00000 1100          AABA   MANT   ; Add B to A
0 1101 1011 00DB	00 01101 1000          BET    M1    
0 1101 1100 00DC	11 11001 1100 .M2      SRLC   MANT   ; Shift C right
0 1101 1101 00DD	11 01111 1011          CCK    MANT1  ; Is C zero?
0 1101 1110 00DE	01 01111 1100          BILT   MD2    ; Multiply done
0 1101 1111 00DF	11 10111 1100          SRLA   MANT   ; Shift A right
0 1110 0000 00E0	11 01001 1101          SAKA   EXP1   ; And decrease exponent
0 1110 0001 00E1	00 01101 1000          BIGE   M1     ; Repeat the addition loop for the next C digit
0 1110 0010 00E2	10 10011 0101          SFB    F5     ; Set overflow to indicate exponent negative
0 1110 0011 00E3	00 01101 1000          BET    M1     ; But keep going
0 1110 0100 00E4	11 01111 1011 .DIV     CCK    MANT1  ; Divide code: A / B...
0 1110 0101 00E5	01 01111 1010          BILT   ERR    ; Divide by zero
0 1110 0110 00E6	11 00010 1111          AAKC   ALL    ; C / B, result goes in A...
0 1110 0111 00E7	11 10000 1100 .D1      AKA    MANT   ; Clear A mantissa
0 1110 1000 00E8	11 01111 1011          CCK    MANT1 
0 1110 1001 00E9	01 01111 1100          BILT   MD2    ; Answer zero
0 1110 1010 00EA	11 00111 1110          SABA   EXP   
0 1110 1011 00EB	00 01110 1101          BIGE   D2    
0 1110 1100 00EC	10 10011 0101          SFB    F5    
0 1110 1101 00ED	11 01110 1100 .D2      CCB    MANT   ; Repeatedly subtract B from C...
0 1110 1110 00EE	01 01111 0010          BILT   D3     ; Can\'t subtract any more
0 1110 1111 00EF	11 01010 1100          SCBC   MANT   ; Subtract B from C
0 1111 0000 00F0	11 00001 0010          AAKA   LSD1   ; And increment quotient in A
0 1111 0001 00F1	00 01110 1101          BET    D2    
0 1111 0010 00F2	11 01101 1010 .D3      CAK    MSD1   ; Value in A\'s most significant digit?
0 1111 0011 00F3	00 01111 1100          BIGE   MD2    ; Divide done
0 1111 0100 00F4	11 10110 1100          SLLC   MANT   ; Shift C left
0 1111 0101 00F5	11 10100 1100          SLLA   MANT   ; Shift A left
0 1111 0110 00F6	11 00001 1101          AAKA   EXP1   ; Increment exponent
0 1111 0111 00F7	00 01110 1101          BINC   D2     ; If negative exponent becomes zero...
0 1111 1000 00F8	10 10111 0101          ZFB    F5     ; Clear the overflow
0 1111 1001 00F9	00 01110 1101          BET    D2     ; And keep going
0 1111 1010 00FA	10 10011 0101 .ERR     SFB    F5     ; Divide by zero - Set overflow
0 1111 1011 00FB	00 00001 0011          BET    ZERO  
0 1111 1100 00FC	11 00100 1111 .MD2     ABOC   ALL    ; Done: move B to C
0 1111 1101 00FD	11 10001 1110 .POST    AKB    EXP    ; Post-operation normalization...
0 1111 1110 00FE	11 10001 0000          AKB    DPT7   ; Set B exponent to 7
0 1111 1111 00FF	11 01101 1000          CAK    OV1    ; Is A overflow (top digit) set?
1 0000 0000 0100	01 10000 1000          BILT   P1     ; Branch if zero
1 0000 0001 0101	11 10111 1100          SRLA   MANT  
1 0000 0010 0102	11 01001 1101          SAKA   EXP1  
1 0000 0011 0103	00 10000 1000          BIGE   P1    
1 0000 0100 0104	10 10011 0101          SFB    F5    
1 0000 0101 0105	11 00000 1110 .OVF     AABA   EXP   
1 0000 0110 0106	11 00001 1101          AAKA   EXP1  
1 0000 0111 0107	01 10011 1001          BIC    OVF1  
1 0000 1000 0108	10 11001 0101 .P1      TFB    F5     ; Test BF overflow
1 0000 1001 0109	01 10000 0101          BIO    OVF   
1 0000 1010 010A	11 01101 1011          CAK    MANT1  ; Is A mantissa zero?
1 0000 1011 010B	01 10001 0010          BILT   P3     ; Branch if zero?
1 0000 1100 010C	11 01101 1010 .P2      CAK    MSD1   ; Left-justify A...
1 0000 1101 010D	00 10001 0100          BIGE   P4    
1 0000 1110 010E	11 10100 1100          SLLA   MANT  
1 0000 1111 010F	11 00001 1101          AAKA   EXP1   ; Incrementing exponent each shift
1 0001 0000 0110	00 10000 1100          BET    P2    
1 0001 0001 0111	00 00010 1011 .ID5     BET    ID4    ; Random branch destination from WAITDK
1 0001 0010 0112	11 00011 1110 .P3      ABOA   EXP    ; A is zero; set A exponent to 7
1 0001 0011 0113	10 11000 0110          ZFA    SIGN   ; And clear the sign
1 0001 0100 0114	10 11001 0010 .P4      TFB    OP3    ; In middle of operation?
1 0001 0101 0115	00 10001 1101          BIZ    P7     ; Branch if operation completed
1 0001 0110 0116	10 10011 0011          SFB    F3     ; Set BF CONST
1 0001 0111 0117	11 00010 1111 .P5      AAKC   ALL    ; Copy A to C
1 0001 1000 0118	10 11101 0110          CF     SIGN   ; Flip B SIGN if A and B SIGN different...
1 0001 1001 0119	00 10001 1011          BIE    P6    
1 0001 1010 011A	10 11011 0110          FFB    SIGN  
1 0001 1011 011B	10 11111 1001 .P6      EXF    OPFGS  ; Move BF op flags to AF
1 0001 1100 011C	10 10111 1001          ZFB    OPFGS  ; and clear B op flags
1 0001 1101 011D	10 10100 0011 .P7      SFA    F3     ; Set AF CD
1 0001 1110 011E	10 11000 0101          ZFA    F5     ; Clear AF POST/TEMP
1 0001 1111 011F	11 01100 1110          CAB    EXP    ; Shift A right until exponent <= 7...
1 0010 0000 0120	01 00000 0101          BILT   RJ     ; Branch if done
1 0010 0001 0121	11 00111 1110          SABA   EXP    ; Subtract 7 from A exponent
1 0010 0010 0122	11 01101 1101 .P8      CAK    EXP1   ; Shift A right until exponent 0...
1 0010 0011 0123	01 10010 1001          BILT   P9     ; Add 7 back to exponent when done...
1 0010 0100 0124	11 01001 1101          SAKA   EXP1   ; otherwise 
1 0010 0101 0125	11 10111 1100          SRLA   MANT  
1 0010 0110 0126	00 10010 0010          BET    P8     ; keep looping
1 0010 0111 0127	00 00010 1011 .ID3     BET    ID4   
1 0010 1000 0128	00 00001 0101 .FD4     BET    DPTPOS ; Random WAITNO jump destination
1 0010 1001 0129	11 00001 0000 .P9      AAKA   DPT7   ; Add 7 to A exponent
1 0010 1010 012A	00 00000 0101          BET    RJ     ; Branch
1 0010 1011 012B	10 11010 0110 .KS4     TFA    SIGN   ; A negative?
1 0010 1100 012C	00 10011 0110          BIZ    KS9   
1 0010 1101 012D	11 10000 1000          AKA    OV1    ; 1 -> OV1
1 0010 1110 012E	11 01001 1000          SAKA   OV1    ; 0 -> OV1 ?
1 0010 1111 012F	11 01101 1011          CAK    MANT1 
1 0011 0000 0130	01 01001 1110          BILT   KS6   
1 0011 0001 0131	11 01101 1010 .KS5     CAK    MSD1  
1 0011 0010 0132	00 01010 0001          BIGE   KS7   
1 0011 0011 0133	11 10100 1100          SLLA   MANT  
1 0011 0100 0134	11 00001 1101          AAKA   EXP1  
1 0011 0101 0135	00 10011 0001          BET    KS5   
1 0011 0110 0136	11 10111 1100 .KS9     SRLA   MANT  
1 0011 0111 0137	11 01001 1101          SAKA   EXP1  
1 0011 1000 0138	00 01010 0001          BET    KS7   
1 0011 1001 0139	10 11010 0110 .OVF1    TFA    SIGN  
1 0011 1010 013A	00 00001 0101          BIZ    DPTPOS
1 0011 1011 013B	11 11100 1000          SAKAH  OV1   
1 0011 1100 013C	11 11100 1000          SAKAH  OV1   
1 0011 1101 013D	01 00001 0101          BILT   DPTPOS ; Will this ever be true???
//var objectCode = [
//1423, 1407, 1807, 1839, 5, 1755, 531, 1446,
//12, 1992, 1992, 12, 1746, 21, 1757, 533,
//1916, 1693, 12, 1807, 1414, 1855, 1803, 1563,
//1852, 1598, 1693, 542, 1884, 26, 1598, 1432,
//553, 1360, 1376, 545, 1360, 1376, 545, 1646,
//1838, 1400, 1319, 1360, 1376, 616, 2013, 1777,
//564, 1838, 1360, 1297, 1429, 42, 1336, 1836,
//1723, 58, 1644, 2013, 1320, 1329, 1443, 77,
//1444, 589, 1440, 77, 1393, 1350, 1807, 1351,
//1552, 1411, 7, 1329, 1328, 1330, 1443, 594,
//1444, 86, 1412, 1349, 86, 1348, 1755, 670,
//1752, 299, 1868, 1565, 88, 1352, 1415, 1443,
//21, 1411, 19, 1443, 533, 1347, 1416, 19,
//1614, 1429, 545, 1360, 1360, 1376, 40, 1823,
//1360, 1024, 1109, 1101, 1085, 1100, 1099, 1123,
//1117, 1150, 1855, 1954, 1855, 533, 1443, 131,
//1414, 1807, 1411, 1446, 148, 1976, 1976, 1992,
//1992, 533, 1447, 152, 1448, 658, 1855, 1755,
//1855, 533, 1415, 156, 1754, 21, 1744, 21,
//1448, 155, 1565, 1868, 1586, 21, 1806, 1414,
//1552, 1418, 1445, 765, 1442, 253, 1647, 1427,
//173, 1395, 1855, 1615, 1526, 1440, 719, 1430,
//178, 1349, 1441, 181, 1462, 1742, 185, 1855,
//1526, 1693, 1742, 702, 1916, 185, 1565, 192,
//1740, 196, 1855, 1526, 1494, 200, 1660, 201,
//1548, 1398, 1445, 253, 1334, 1413, 253, 1494,
//1414, 211, 1350, 1441, 740, 1583, 1804, 1550,
//1714, 732, 1548, 216, 1948, 1787, 764, 1916,
//1693, 216, 1333, 216, 1787, 762, 1583, 1804,
//1787, 764, 1662, 237, 1333, 1772, 754, 1708,
//1554, 237, 1754, 252, 1900, 1868, 1565, 237,
//1397, 237, 1333, 19, 1615, 1822, 1808, 1752,
//776, 1916, 1693, 264, 1333, 1550, 1565, 825,
//1429, 773, 1755, 786, 1754, 276, 1868, 1565,
//268, 43, 1598, 1414, 1426, 285, 1331, 1583,
//1494, 283, 1462, 1529, 1401, 1347, 1413, 1742,
//517, 1662, 1757, 809, 1693, 1916, 290, 43,
//21, 1552, 5, 1446, 310, 1800, 1688, 1755,
//670, 1754, 161, 1868, 1565, 305, 1916, 1693,
//161, 1446, 21, 1992, 1992, 533,
//];