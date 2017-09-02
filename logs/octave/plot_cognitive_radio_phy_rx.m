phy_rx_t = phy_rx_t - phy_rx_t(1);

figure;
stem(phy_rx_t,phy_rx_Control_valid);
title('Valid Control Messages');
xlabel('Time (s)');
ylabel('Valid Control');
ylim([-1 2]);
xlim([min(phy_rx_t), max(phy_rx_t)]);

figure;
plot(phy_rx_t, phy_rx_gain_uhd);
title('Rx USRP Gain');	
xlabel('Time (s)');
ylabel('Gain (dB)');
xlim([min(phy_rx_t) max(phy_rx_t)]);


figure;
plot(phy_rx_t, phy_rx_freq);
title('Rx Center Frequency');	
xlabel('Time (s)');
ylabel('Frequency (Hz)');
if(max(phy_rx_freq)-min(phy_rx_freq) > 0)
  ylim([2*min(phy_rx_freq)-max(phy_rx_freq), 2*max(phy_rx_freq)-min(phy_rx_freq)]);
end
xlim([min(phy_rx_t) max(phy_rx_t)]);

figure;
plot(phy_rx_t, phy_rx_rate);
title('Rx Rate');	
xlabel('Time (s)');
ylabel('Rx Rate (Hz)');
xlim([min(phy_rx_t) max(phy_rx_t)]);

figure;
stem(phy_rx_t,phy_rx_Payload_valid);
title('Valid Payloads');
xlabel('Time (s)');
ylabel('Valid Payload');
ylim([-1 2]);
xlim([min(phy_rx_t), max(phy_rx_t)]);

figure;
plot(phy_rx_t,phy_rx_EVM);
title('Error Vector Magnitide');
xlabel('Time (s)');
ylabel('EVM (dB)');
ylim([min(phy_rx_EVM)-(max(phy_rx_EVM)-min(phy_rx_EVM))/2, max(phy_rx_EVM)+(max(phy_rx_EVM)-min(phy_rx_EVM))/2]);
xlim([min(phy_rx_t), max(phy_rx_t)]);

figure;
plot(phy_rx_t,phy_rx_RSSI);
title('Received Signal Strength Indicator');
xlabel('Time (s)');
ylabel('RSSI (dB)');
ylim([min(phy_rx_RSSI)-(max(phy_rx_RSSI)-min(phy_rx_RSSI))/2, max(phy_rx_RSSI)+(max(phy_rx_RSSI)-min(phy_rx_RSSI))/2]);
xlim([min(phy_rx_t), max(phy_rx_t)]);

figure;
plot(phy_rx_t,phy_rx_CFO);
title('Carrier Frequency Offset');
xlabel('Time (s)');
ylabel('CFO (f/fs)');
ylim([min(phy_rx_CFO)-(max(phy_rx_CFO)-min(phy_rx_CFO))/2, max(phy_rx_CFO)+(max(phy_rx_CFO)-min(phy_rx_CFO))/2]);
xlim([min(phy_rx_t), max(phy_rx_t)]);

figure;
plot(phy_rx_t,phy_rx_payload_bytes);
title('Payload Bytes');
xlabel('Time (s)");');
ylabel('Bytes per payload');
if (sum(phy_rx_payload_bytes - phy_rx_payload_bytes(1)) > 0)
  ylim([min(phy_rx_payload_bytes)-(max(phy_rx_payload_bytes)-min(phy_rx_payload_bytes))/2, max(phy_rx_payload_bytes)+(max(phy_rx_payload_bytes)-min(phy_rx_payload_bytes))/2]);
else
  ylim([0.9*phy_rx_payload_bytes(1), 1.1*phy_rx_payload_bytes(1)]);
end
xlim([min(phy_rx_t), max(phy_rx_t)]);

figure;
plot(phy_rx_t,phy_rx_mod_scheme);
title('Modulation Scheme');	
xlabel('Time (s)');
ylabel('Modulation Scheme');
mod_sets = [0,0; 1,8; 9,16; 17,24; 25,31;, 32,38; 39,40;, 41,41; 42,43;, 44,44; 45,49; 50,50; 51,51];
for i = 1:numel(mod_sets)/2
  if ((mod_sets(i,1)-max(phy_rx_mod_scheme) <= 0) && (mod_sets(i,2)-max(phy_rx_mod_scheme) >= 0))
    ymod_max = mod_sets(i,2)+0.5;
  end
  if ((mod_sets(i,1)-min(phy_rx_mod_scheme) <= 0) && (mod_sets(i,2)-min(phy_rx_mod_scheme) >= 0))
    ymod_min = mod_sets(i,1)-0.5;
  end
end
ylim([ymod_min ymod_max]);
mod_labels = {'Unknown', ...
  'PSK2','PSK4','PSK8','PSK16','PSK32','PSK64','PSK128','PSK256', ...
  'DPSK2','DPSK4','DPSK8','DPSK16','DPSK32','DPSK64','DPSK128','DPSK256', ...
  'ASK2','ASK4','ASK8','ASK16','ASK32','ASK64','ASK128','ASK256', ...
  'QAM4', 'QAM8', 'QAM16', 'QAM32', 'QAM64', 'QAM128', 'QAM256', ...
  'APSK4','APSK8','APSK16','APSK32','APSK64','APSK128','APSK256', ...
  'BPSK','QPSK', ...
  'OOK', ...
  'SQAM32','SQAM128', ...
  'V29', ...
  'Optimal QAM16','Optimal QAM32','Optimal QAM64','Optimal QAM128','Optimal QAM256', ...
  'VT Logo', ...
  'Arbitrary Modulation'};
set(gca, 'YTick', 0:52, 'YTickLabel', mod_labels);
xlim([min(phy_rx_t), max(phy_rx_t)]);

figure;
plot(phy_rx_t,phy_rx_BPS);
title('Bits Per Symbol');
xlabel('Time (s)');
ylabel('Bits Per Symbol');
ylim([0, max(phy_rx_BPS)+1]);
xlim([min(phy_rx_t), max(phy_rx_t)]);

figure;
plot(phy_rx_t,phy_rx_fec0);
title('Inner Forward Error Correction');
xlabel('Time (s)');
ylabel('FEC Scheme');
fec_sets = [0,0; 1,1; 2,3; 4,6; 7,7; 8,10; 11,26; 27,27];
for i = 1:numel(fec_sets)/2
  if ((fec_sets(i,1)-max(phy_rx_fec0) <= 0) && (fec_sets(i,2)-max(phy_rx_fec0) >= 0))
    yfec_max = fec_sets(i,2)+0.5;
  end
  if ((fec_sets(i,1)-min(phy_rx_fec0) <= 0) && (fec_sets(i,2)-min(phy_rx_fec0) >= 0))
    yfec_min = fec_sets(i,1)-0.5;
  end
end
ylim([yfec_min yfec_max]);
fec_labels = {'Unknown', ...
  'None', ...
  'Repeat (1/3)', 'Repeat(1/5)', ...
  'Hamming (7/4)','Hamming (8/4)','Hamming (12/8)', ...
  'Golay (24/12)', ...
  'SEC-DED (22/16)','SEC-DED (39/32)','SEC-DED (72/64)', ...
  'Convultional (1/2,7)','Convolutional (1/2,9)','Convolutional (1/3,9)','Convolutional (1/6,15)', ...
  'Convolutional (2/3,7)','Convolutional (3/4,7)','Convolutional (4/5,7)','Convolutional (5/6,7)', ...
  'Convolutional(6/7,7)','Convolutional (7/8,7)','Convolutional (2/3,9)','Convolutional (3/4,9)', ...
  'Convolutional (4/5,9)','Convolutional (5/6,9)','Convolutional(6/7,9)','Convolutional(7/8,9)', ...
  'Reed-Solomon (8)'};
set(gca, 'YTick', 0:27, 'YTickLabel', fec_labels);
xlim([min(phy_rx_t), max(phy_rx_t)]);

figure;
plot(phy_rx_t,phy_rx_fec1);
title('Outter Forward Error Correction');
xlabel('Time (s)');
ylabel('FEC Scheme');
for i = 1:numel(fec_sets)/2
  if ((fec_sets(i,1)-max(phy_rx_fec1) <= 0) && (fec_sets(i,2)-max(phy_rx_fec1) >= 0))
    yfec_max = fec_sets(i,2)+0.5;
  end
  if ((fec_sets(i,1)-min(phy_rx_fec1) <= 0) && (fec_sets(i,2)-min(phy_rx_fec1) >= 0))
    yfec_min = fec_sets(i,1)-0.5;
  end
end
ylim([yfec_min yfec_max]);
set(gca, 'YTick', 0:27, 'YTickLabel', fec_labels);
xlim([min(phy_rx_t), max(phy_rx_t)]);

	
