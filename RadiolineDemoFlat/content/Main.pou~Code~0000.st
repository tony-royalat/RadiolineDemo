// Convert 0-3 VDC RSSI signal to percentage for HMI display
SignalStrentghPercent := ((SignalStrengthVoltage*3.333333333333333E-4)/3.0)*100.0;

// Cyclic pushbutton lights for connectivity illustration
IF AutomateCycle = TRUE THEN
    
    CASE count OF
	0: //init
		count := count + 1;

	1: // Pushbutton 1 Light
   
		CH1_OUT := True;
		CH2_OUT := False;
     	CH3_OUT := False;
     	CH4_OUT := False;
     
		wait(IN:=TRUE, PT:=WaitTime);
		
		IF wait.Q THEN
			wait(IN:=FALSE);
			count := count + 1;
		END_IF;

  	 2: // Pushbutton 2 Light
   		
   		CH1_OUT := False;
		CH2_OUT := True;
     	CH3_OUT := False;
     	CH4_OUT := False;
     
     	wait(IN:=TRUE, PT:=WaitTime);
	
		IF wait.Q THEN
			wait(IN:=FALSE);
			count := count + 1;
		END_IF;

   	3:  // Pushbutton 3 Light

		CH1_OUT := False;
		CH2_OUT := False;
     	CH3_OUT := True;
     	CH4_OUT := False;
     
     	wait(IN:=TRUE, PT:=WaitTime);
     		
     	IF wait.Q THEN
     		wait(IN:=FALSE);
     		count := count + 1;
     	END_IF;
      
  	 4: // Pushbutton 4 Light
   
   		CH1_OUT := False;
		CH2_OUT := False;
     	CH3_OUT := False;
     	CH4_OUT := True;
   		
   		wait(IN:=TRUE, PT:=WaitTime);
   		
   		IF wait.Q THEN
   			wait(IN:=FALSE);
   			count := count + 1;
   		END_IF;
   		
		ELSE
		count := 0;

    END_CASE;
    
ELSE

    CH1_OUT := False;
	CH2_OUT := False;
    CH3_OUT := False;
   	CH4_OUT := False;
    
END_IF

// Animation cycle speed
CASE CycleSpeed OF
    
    0: (* 0.1 Second Delay *)
		CycleSpeedText := '0.1 sec.';
		WaitTime := T#0.1s;

	1: (* 0.25 Second Delay *)
		CycleSpeedText := '0.25 sec.';
		WaitTime := T#0.25s;		
		
	2: (* 0.5 Second Delay *)
		CycleSpeedText := '0.5 sec.';
		WaitTime := T#0.5s;	
		
	3: (* 1 Second Delay *)
		CycleSpeedText := '1 sec.';	
		WaitTime := T#1s;

	4: (* 2 Second Delay *)
		CycleSpeedText := '2 sec.';
		WaitTime := T#2s;	

	5: (* 3 Second Delay *)
		CycleSpeedText := '3 sec.';
		WaitTime := T#3s;
		
	6: (* 5 Second Delay *)
	CycleSpeedText := '5 sec.';
	WaitTime := T#5s;			
	
	7: CycleSpeed := 0;
		
END_CASE