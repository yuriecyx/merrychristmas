%%%%%%%%%%%%%%%%%%%%%%%     Waveform Generator     %%%%%%%%%%%%%%%%%%%%%%%
% p: Pitch. Define the pitch of A4 as 69. Once the pitch goes up a semitone, p+1.
% n: Represents 1/n notes.
% fs: Sample rate
% return: the sine wave of sound
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function g_fin = key(p, n, fs)
    t = 0 : 1/fs : 2.5/n;           % Sample points. t_max is variable to adjust tempo. (personally I think 2.5/n is appropriate)   
    freq = 440 * 2^((p-69)/12);     % Calculate fundamental frequency by pitch.

%%%%%%%%%%%%%%%%%%%%%%%%%%   Timbre Synthesis   %%%%%%%%%%%%%%%%%%%%%%%%%%
% Reference: https://www.bilibili.com/video/BV19v411z7Yc
% P.S. I tried to simulate the tone of piano but somehow it sounds like a pipe organ lol. never mind :)
    
    % Fundamental wave
    g1 = sin(2*pi*freq*t);    
    % Harmonic waves:
    g2 = 0.260*( sin(2*pi*2*freq*t)*cos(2.5382) + cos(2*pi*2*freq*t)*sin(2.5382) );
    g3 = 0.182*( sin(2*pi*3*freq*t)*cos(-0.866) + cos(2*pi*3*freq*t)*sin(-0.866) );
    g4 = 0.121*( sin(2*pi*4*freq*t)*cos(3.553) + cos(2*pi*4*freq*t)*sin(3.553) ); 
    g5 = 0.144*( sin(2*pi*5*freq*t)*cos(0.777) + cos(2*pi*5*freq*t)*sin(0.777) );
    g6 = 0.136*( sin(2*pi*6*freq*t)*cos(1.593) + cos(2*pi*6*freq*t)*sin(1.593) );
    g7 = 0.016*( sin(2*pi*7*freq*t)*cos(4.9) + cos(2*pi*7*freq*t)*sin(4.9) );
    g8 = 0.054*( sin(2*pi*8*freq*t)*cos(-0.074) + cos(2*pi*8*freq*t)*sin(-0.074) );
    g9 = 0.092*( sin(2*pi*9*freq*t)*cos(0.2) + cos(2*pi*9*freq*t)*sin(0.2) );
    g10 = 0.052*( sin(2*pi*10*freq*t)*cos(-0.3) + cos(2*pi*10*freq*t)*sin(-0.3) );
    g0 = 0.437*( sin(2*pi*0.5*freq*t)*cos(0.2792) + cos(2*pi*0.5*freq*t)*sin(0.2792) ); % Add a low frequency for Bass
    % Combine all the harmonic waves together
    g = g0 + g1 + g2 + g3 + g4 + g5 + g6 + g7 + g8 + g9 + g10;  
    
    % Fitting the Envelope Curve of the sound wave
    x = [0 0.07 0.125 0.15 0.175 0.2 0.3 0.35 0.4 0.45 0.5] / 0.5 * (2.5/n);
    hh=[];
    for i = 1:length(x)
        hh = [hh t(length(0:1/fs:x(i)))];
    end
    if(n<1)
        y = [1.7 2 1.95 1.8 1.78 1.75 1.7 1.7 1.5 1.2 0.8];
    else
        y = [0.8 2 1.95 1.8 1.78 1.75 1.7 1.7 1.5 1.2 0.8];
    end
    fk = spline(hh, y, t);
    g = fk.*g / max(fk.*g);
    
    g(:,end)=[];                    % Delete the very last sample point to align different signal matrices
    g = g * 440/sqrt(freq);         % Volume Control
    
    % Separate Sound Channels
    if(p<21)
        g_fin = [g;0];
    elseif(g>108)
        g_fin = [0;g];
    else
        g_fin = [g * (108-p)/87;
                 g * (p-21)/87  ];
    end
    
    
    
        
   
    
    