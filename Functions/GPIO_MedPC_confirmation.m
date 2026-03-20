GPIO_file = uigetfile(".csv", "Import traces");
GPIO = readtable(GPIO_file, "ReadVariableNames", false);

GPIO2 = GPIO(strcmp(GPIO.Var2, "GPIO-2"),:)
threshold = 10000
GPIO2_low = GPIO2.Var3 < threshold
timestamps = GPIO2.Var1
onset = timestamps(diff([0, GPIO2_low']) == 1)

Ex_LED = GPIO(strcmp(GPIO.Var2, "EX-LED"),:)
recording_start = Ex_LED.Var1(2)
onset_corrected = onset -recording_start