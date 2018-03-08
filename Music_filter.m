%Plot Original 30 second sample 
[song,Fs] = audioread (‘original.wav’);

%Plot Original in time domain  (-1 to make the length same)
t=0:1/Fs:(length(song)-1)/Fs; 
plot (t,song);
title('Time Plot Original') 
xlabel('Time (seconds)') 
ylabel('Amplitude')

%Plot Orinal in frequency domain 
fourier=abs(fft(song)); 
f = 0:Fs/(length(song)-1):Fs; 
plot (f,fourier);
title('Frequency Plot Original') 
xlabel('Frequency (Hz)') 
ylabel('Magnitude')

%Create Stop Filter with 6 poles 
order = 6; 
range = [300 3000]/(Fs/2); 
[b,a] = butter(order, range, 'stop'); 

%Filter out voice 
new_song=filter(b,a,song); 

%sound(new_song,Fs)

%Create Filtered Audio File 
wavwrite(new_song, Fs, 'intramurals');

%Plot Filtered in time domain 
x=0:1/Fs:(length(song)-1)/Fs; 
y=new_song; 
figure(3) 
plot (x,y) 
title('Filter Time Plot') 
xlabel('Time (seconds)') 
ylabel('Amplitude')

%Plot Filtered in frequency domain 
x=-pi:(2*pi)/length(new_song):pi-(2*pi)/length(new_song); 
y=fft(new_song); 
figure(4) 
plot (x,abs(fftshift(y))) 
title('Frequency Plot Filtered') 
xlabel('Frequency (Hz)') 
ylabel('Magnitude')