%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%                                         %%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%      We Wish You a Merry Christmas      %%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%                                         %%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%                 Yuriecyx                %%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%                2020/12/24               %%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%                                         %%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
clc;
fs=48000;   % Sample Rate

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  NOTES  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1/8 Notes:
C2_8 = key(36, 8, fs);  % do
D2_8 = key(38, 8, fs);  % re
E2_8 = key(40, 8, fs);  % mi
G2_8 = key(43, 8, fs);  % so
A2_8 = key(45, 8, fs);  % la
B2_8 = key(47, 8, fs);  % si
C3_8 = key(48, 8, fs);  % do
sC3_8 = key(49, 8, fs); % #do
D3_8 = key(50, 8, fs);  % re
sD3_8 = key(51, 8, fs); % #re
E3_8 = key(52, 8, fs);  % mi
sF3_8 = key(54, 8, fs); % #fa
G3_8 = key(55, 8, fs);  % so
A3_8 = key(57, 8, fs);  % la
B3_8 = key(59, 8, fs);  % si
C4_8 = key(60, 8, fs);
sC4_8 = key(61, 8, fs);
D4_8 = key(62, 8, fs);
sD4_8 = key(63, 8, fs);
E4_8 = key(64, 8, fs);
sF4_8 = key(66, 8, fs);
G4_8 = key(67, 8, fs);
A4_8 = key(69, 8, fs);
B4_8 = key(71, 8, fs);
C5_8 = key(72, 8, fs);
sC5_8 = key(73, 8, fs);
D5_8 = key(74, 8, fs);
sD5_8 = key(75, 8, fs);
E5_8 = key(76, 8, fs);
sF5_8 = key(78, 8, fs);
G5_8 = key(79, 8, fs);
A5_8 = key(81, 8, fs);
B5_8 = key(83, 8, fs);
C6_8 = key(84, 8, fs);

% 1/4 Notes:
B2_4 = key(47, 4, fs); 
C3_4 = key(48, 4, fs);
G3_4 = key(55, 4, fs);
A3_4 = key(57, 4, fs);
B3_4 = key(59, 4, fs);
C4_4 = key(60, 4, fs);
sC4_4 = key(61, 4, fs);
D4_4 = key(62, 4, fs);
sD4_4 = key(63, 4, fs);
E4_4 = key(64, 4, fs);
sF4_4 = key(66, 4, fs); 
G4_4 = key(67, 4, fs);
A4_4 = key(69, 4, fs);
B4_4 = key(71, 4, fs);
C5_4 = key(72, 4, fs);
sC5_4 = key(73, 4, fs);
D5_4 = key(74, 4, fs);
sD5_4 = key(75, 4, fs);
E5_4 = key(76, 4, fs);
sF5_4 = key(78, 4, fs);
G5_4 = key(79, 4, fs);
A5_4 = key(81, 4, fs);
B5_4 = key(83, 4, fs);
D6_4 = key(86, 4, fs);
E6_4 = key(88, 4, fs);
G6_4 = key(91, 4, fs);
B6_4 = key(95, 4, fs);
blk_4 = A4_4 * 0;       %1/4 rest

% 1/2 Notes:
G3_2 = key(55, 2, fs);
A3_2 = key(57, 2, fs);
B3_2 = key(59, 2, fs);
D4_2 = key(62, 2, fs);
sF4_2 = key(66, 2, fs);
G4_2 = key(67, 2, fs);
A4_2 = key(69, 2, fs);
B4_2 = key(71, 2, fs);
C5_2 = key(72, 2, fs);
D5_2 = key(74, 2, fs);
sF5_2 = key(78, 2, fs);
G5_2 = key(79, 2, fs);

% 3/8 Notes:
D4_83 = key(62, 8/3, fs);

% 3/4 Notes:
G1_43 = key(31, 4/3, fs);
G2_43 = key(43, 4/3, fs);
D3_43 = key(50, 4/3, fs);
G3_43 = key(55, 4/3, fs);
B3_43 = key(59, 4/3, fs);
B4_43 = key(71, 4/3, fs);

% 3/2 Notes
D5_32 = key(74, 2/3, fs);
G5_32 = key(79, 2/3, fs);

% 2/1 Notes
G1_0 = key(31, 0.5, fs);
G2_0 = key(43, 0.5, fs);
blk_0 = G1_0 * 0;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  MELODIES  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Piano score from https://www.gangqinpu.com/cchtml/8470.htm

% Part0: Bar1-7 (Prelude)
part0_l = [blk_0 G1_0+G2_0 G2_8 D3_8 B3_8 D3_8 B3_8 D3_8 G2_8 D3_8 B3_8 D3_8 B3_8 D3_8];  % Bass Clef
part0_h = [G4_4+G5_4 D4_4+D5_4 E4_4+E5_4 B3_4+B4_4 D4_4+D5_4 A3_4+A4_4 B3_4+B4_4 G3_4+G4_4 0.8*(D6_4+G6_4) D6_4+0.5*G6_4 B5_4+E6_4 G5_4+B5_4 A5_4+D6_4 A5_4+0.5*D6_4 G5_4+B5_4 0.7*(D5_32+G5_32) D4_4]; % Treble Clef
% Gradually weaken the last chord of prelude
part0_h(:, 480001:570000) = 0.85 * part0_h(:, 480001:570000);
part0_h(:, 570001:576000) = 0.7 * part0_h(:, 570001:576000);
part0_h(:, 576001:582000) = 0.6 * part0_h(:, 576001:582000);
part0_h(:, 582001:588000) = 0.5 * part0_h(:, 582001:588000);
part0_h(:, 588001:594000) = 0.4 * part0_h(:, 588001:594000);
part0_h(:, 594001:600000) = 0.35 * part0_h(:, 594001:600000);
part0_h(:, 600001:606000) = 0.3 * part0_h(:, 600001:606000);
part0_h(:, 606001:612000) = 0.25 * part0_h(:, 606001:612000);
part0_h(:, 612001:618000) = 0.2 * part0_h(:, 612001:618000);
part0_h(:, 618001:624000) = 0.15 * part0_h(:, 618001:624000);
part0_h(:, 624001:630000) = 0.1 * part0_h(:, 624001:630000);

% Part1: Bar8-15
part1_l = [G2_8 D3_8 B3_8 D3_8 B3_8 D3_8 C3_8 G3_8 C4_8 G3_8 C4_8 G3_8 A2_8 E3_8 A3_8 B3_8 sC4_8 A3_8 D2_8 A2_8 D3_8 E3_8 sF3_8 D3_8 B2_8 sF3_8 B3_8 sD4_8 sF4_4 E2_8 B2_8 E3_8 G3_8 B3_4 C3_8 G3_8 C4_4 D3_8 D2_8 G2_8 D3_8 G3_8 A3_8 B3_4];
part1_h = [B3_4+D4_4+G4_4 B3_8+G4_8 A4_8 G4_8 sF4_8 E4_4 E4_4 E4_4 A4_4 A4_8 B4_8 A4_8 G4_8 sF4_4 D4_4 D4_4 B4_4 B4_8 C5_8 B4_8 A4_8 G4_4 E4_4 D4_8 D4_8 E4_4 A4_4 C4_4+D4_4+sF4_4 B3_2+D4_2+G4_2 D5_4];


% Part2: Bar16-23
part2_l = [G2_8 D3_8 G3_8 A3_8 B3_8 G3_8 C3_8 G3_8 C4_8 D4_8 E4_8 C4_8 A2_8 E3_8 A3_8 B3_8 sC4_4 D3_8 A3_8 D4_8 E4_8 sF4_8 D4_8 B2_8 sD3_8 sF3_8 B3_8 sD4_8 sF4_8 E2_8 B2_8 E3_8 G3_8 B3_4 C3_8 G3_8 C4_4 D3_8 D2_8 G2_8 D3_8 G3_8 A3_8 B3_4];
part2_h = [B4_4+D5_4+G5_4 B4_8+G5_8 A5_8 G5_8 sF5_8 C5_4+E5_4 C5_4+E5_4 C5_4+E5_4 sC5_4+E5_4+A5_4 A5_8 B5_8 A5_8 G5_8 sF5_4 D5_4 D5_4 B5_4 B5_8 C6_8 B5_8 A5_8 G5_4 E5_4 D5_8 D5_8 E5_4 A5_4 C5_4+D5_4+sF5_4 B4_2+D5_2+G5_2 D4_4];

% Part3: Bar24-31
part3_l = [G2_8 D3_8 G3_8 A3_8 B3_8 G3_8 D2_8 A2_8 D3_8 E3_8 sF3_8 D3_8 A2_8 E3_8 A3_8 B3_8 sC4_8 A3_8 D2_8 A2_8 D3_8 E3_8 sF3_8 D3_8 G2_8 D3_8 G3_8 A3_8 B3_8 G3_8 B2_8 sF3_8 B3_2 C3_8 G3_8 C4_4 D3_8 D2_8 G2_8 D3_8 G3_8 A3_8 B3_4];
part3_h = [B3_4+G4_4 G4_4 G4_4 A3_2+sF4_2 sF4_4 G4_4 sF4_4 E4_4 D4_2 D4_4+A4_4 D4_4+B4_4 D4_4+A4_4 D4_4+G4_4 D4_4+sF4_4+D5_4 D4_4+0.2*sF4_4 D4_8 D4_8 C4_4+E4_4 C4_4+A4_4 C4_4+D4_4+sF4_4 B3_2+D4_2+G4_2 D5_4];

% Part4: Bar32-39
part4_l = [G2_8 D3_8 G3_8 A3_8 B3_8 G3_8 C3_8 G3_8 C4_8 D4_8 E4_8 C4_8 A2_8 E3_8 A3_8 B3_8 sC4_8 A3_8 D3_8 A3_8 D4_8 E4_8 sF4_8 D4_8 B2_8  sF3_8 B3_8 sD4_8 sF4_4 E2_8 B2_8 E3_8 G3_8 B3_4 A2_8 E3_8 A3_4 D3_8 D2_8 G2_8 D3_8 G3_8 A3_8 B3_4];
part4_h =[B4_4+D5_4+G5_4 B4_8+G5_8 A5_8 G5_8 sF5_8 C5_4+E5_4 C5_4+E5_4 C5_4+E5_4 sC5_4+E5_4+A5_4 A5_8 B5_8 A5_8 G5_8 sF5_4 D5_4 D5_4 sD5_4+1.5*B5_4 B5_8 C6_8 B5_8 A5_8 G5_4 E5_4 D5_8 D5_8 E5_4 A5_4 C5_4+D5_4+sF5_4 B4_2+D5_2+G5_2 D4_4]; % Slightly adjust the intensity of high-frequency notes

% Part5: Bar40-47
part5_l = [G2_8 D3_8 G3_8 A3_8 B3_8 G3_8 D3_8 A3_8 D4_8 E4_8 sF4_8 D4_8 A2_8 E3_8 A3_8 B3_8 sC4_8 A3_8 D2_8 A2_8 D3_8 E3_8 sF3_8 D3_8 G2_8 D3_8 G3_8 A3_8 B3_8 G3_8 B2_8 sF3_8 B3_8 sF3_8 B2_4 C2_8 G2_8 C3_4 D3_8 D2_8 G2_8 D3_8 G3_8 A3_8 B3_8 G3_8];
part5_h = [G4_4 G4_4 G4_4 sF4_2 sF4_4 G4_4 sF4_4 E4_4 D4_2 D4_4+A4_4 D4_4+B4_4 D4_4+A4_4 D4_4+G4_4 D5_4 D4_4 D4_8 D4_8 C4_4+E4_4 C4_4+A4_4 C4_4+D4_4+sF4_4 B3_2+D4_2+G4_2 D5_4];

% Part6: Bar48-55
part6_l = [G2_8 D3_8 G3_8 A3_8 B3_8 G3_8 D2_8 A2_8 D3_8 E3_8 sF3_8 D3_8 A2_8 E3_8 A3_8 B3_8 sC4_8 A3_8 D2_8 A2_8 D3_8 E3_8 sF3_8 D3_8 G2_8 D3_8 G3_8 A3_8 B3_8 G3_8 B2_8 sF3_8 B3_8 D4_83 C3_8 G3_8 C4_4 D3_8 D2_8 G2_8 D3_8 G3_8 A3_8 B3_4];
part6_h = [B4_4+D5_4+G5_4 B4_4+G5_4 B4_4+G5_4 A4_2+sF5_2 A4_4+sF5_4 G5_4 sF5_4 E5_4 D5_2 D5_4+A5_4 D5_4+B5_4 D5_4+A5_4 D5_4+G5_4 D6_4 D5_4 D5_8 D5_8 C5_4+E5_4 C5_4+A5_4 C5_4+D5_4+sF5_4 B4_2+D5_2+G5_2 D4_4];

% Part7: Bar56-63
part7_l = [G2_8 D3_8 G3_8 A3_8 B3_8 G3_8 C3_8 G3_8 C4_8 D4_8 E4_8 C4_8 A2_8 E3_8 A3_8 B3_8 sC4_8 A3_8 D2_8 A2_8 D3_8 E3_8 sF3_8 D3_8 B2_8 sF3_8 B3_8 sD4_8 sF4_4 E2_8 B2_8 E3_8 G3_8 B3_4 C3_8 G3_8 C4_4 D3_8 D2_8 G2_8 D3_8 G3_8 A3_8 B3_4];
part7_h = [B3_4+D4_4+G4_4 G4_8 A4_8 G4_8 sF4_8 E4_4 E4_4 E4_4 A4_4 A4_8 B4_8 A4_8 G4_8 sF4_4 D4_4 D4_4 sD4_4+B4_4 B4_8 C5_8 B4_8 A4_8 G4_4 E4_4 D4_8 D4_8 E4_4 A4_4 C4_4+D4_4+sF4_4 B3_2+D4_2+G4_2 D5_4];

% Part8: Bar64-70
part8_l =  [G3_8 D4_8 G4_8 A4_8 B4_8 G4_8 C4_8 G4_8 C5_8 D5_8 E5_8 C5_8 A3_8 E4_8 A4_8 B4_8 sC5_8 A4_8 D3_8 A3_8 D4_8 E4_8 sF4_8 D4_8 B3_8 sF4_8 B4_8 sD5_8 sF5_4 E3_8 B3_8 E4_8 G4_8 B4_4 A2_8 E3_8 A3_4 D3_8 D2_8];
part8_h = [B4_4+D5_4+G5_4 B4_8+G5_8 A5_8 G5_8 sF5_8 C5_4+E5_4 C5_4+E5_4 C5_4+E5_4 sC5_4+E5_4+A5_4 A5_8 B5_8 A5_8 G5_8 sF5_4 D5_4 D5_4 sD5_4+1.5*B5_4 B5_8 C6_8 B5_8 A5_8 G5_4 E5_4 D5_8 D5_8 E5_4 A5_4 C5_4+D5_4+sF5_4];  % Slightly adjust the intensity of high-frequency notes

% Part9£ºBar71-75 (Ending)
part9_l = [G2_8 D3_8 G3_8 A3_8 B3_8 E4_8 B3_8 G3_8 G2_8 D3_8 G3_8 A3_8 B3_8 G3_8 B3_8 G3_8 G2_8 D3_8 G3_8 A3_8 B3_8 D4_8 G4_8 B4_8 D5_8 G5_8 A5_8 D5_8 B5_4 D5_4 G3_2+D4_2 G1_43+G2_43 ];
part9_h = [G4_4+B4_4+D5_4+G5_4 G4_4+0.5*B4_4+D5_4+0.2*G5_4 G4_4+E5_4 G4_4+B4_4 G4_4+D5_4 G4_4+A4_4 B4_4 G4_4 G6_4 D6_4 E6_4 B5_4 D6_4 A5_4 B5_4 G5_4 G4_2+C5_2+D5_2+G5_2 D3_43+G3_43+B3_43 ]; % Slightly adjust the intensity of high-frequency notes

% Concatenate all parts together 
XMas = [1.5*part0_l+part0_h part1_l+part1_h part2_l+part2_h part3_l+part3_h part4_l+part4_h part5_l+part5_h part6_l+part6_h part7_l+part7_h part8_l+part8_h 1.5*part9_l+0.8*part9_h];

% Gradually weaken the very last chord to end the song
XMas(:, 6930001:6933000) = 0.9 * XMas(:, 6930001:6933000);
XMas(:, 6933001:6936000) = 0.8 * XMas(:, 6933001:6936000);
XMas(:, 6936001:6939000) = 0.7 * XMas(:, 6936001:6939000);
XMas(:, 6939001:6942000) = 0.6 * XMas(:, 6939001:6942000);
XMas(:, 6942001:6945000) = 0.5 * XMas(:, 6942001:6945000);
XMas(:, 6945001:6948000) = 0.4 * XMas(:, 6945001:6948000);
XMas(:, 6948001:6951000) = 0.3 * XMas(:, 6948001:6951000);
XMas(:, 6951001:6954000) = 0.2 * XMas(:, 6951001:6954000);
XMas(:, 6954001:6957000) = 0.1 * XMas(:, 6954001:6957000);
XMas(:, 6957001:6960000) = 0.05 * XMas(:, 6957001:6960000);

% Limit amplitude to avoid distortion
XMas = XMas/max(max(XMas));

% Play!
sound(XMas, fs); 

% Save the audio file
% audiowrite('MerryXMas.wav', XMas', fs);