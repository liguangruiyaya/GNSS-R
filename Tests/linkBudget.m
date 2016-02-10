clear; close all; clc

parameters;
Gr=3.7;             % Receiver gain [dB]
Glna=33;            % LNA gain [dB]
R=20200000;         % Distance [m]

Gr=db2pow(Gr);      % Receiver gain []
% Glna=db2pow(Glna);  % LNA gain []
Pr=EIRP*Gr*(lambda/4/pi/R)^2;   % Received power [W]
Pr=pow2db(Pr);      % Received power [dBW], typical -160 dBW

B=2e6;              % Bandwidth [Hz]
F=3;                % Noise figure [dB]
T0=290;             % Reference noise temperature [K]

N=pow2db(noisepow(B,F,T0));     % Noise power [dBW]
N0=N-pow2db(B);     % Noise density [dBW/Hz]

SNR=Pr-N;           % Signal-to-noise ratio [dB]
CN0=Pr-N0;          % Carrier-to-noise-density ratio [dB-Hz]
