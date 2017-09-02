% clc,close all, clear all,
clc,clear all,

%         try
%          run([log, '_Node', num2str(i), '_CR_NET_RX']);
%        catch
%          disp(['Failed to run script: ', log, '_Node', num2str(i), '_CR_NET_RX']);
%        end_try_catch
%      end
%      throughput(i,j) = 8*sum(net_rx_bytes)/t;
%      clear net_rx*;


%graphics_toolkit qt

try
run(['cornet_3d_demo_node_1_cognitive_radio_net_rx']);
plot_cognitive_radio_net_rx
catch
disp(['Failed to run script: node1_CR_NET_RX']);
end_try_catch



clear,
try
run(['cornet_3d_demo_node_2_cognitive_radio_net_rx']);
plot_cognitive_radio_net_rx
catch
disp(['Failed to run script: node2_CR_NET_RX']);
end_try_catch



