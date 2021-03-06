function myplotgraph(Signal,fignum,color)
%% Description: Plots the graph of input signal
%----------------------------------------------------------------
% Note: The required files in the main should be store in the
% same directory as main.m
% The required files and their description is given as follows:
% SYNTAX 
% Signal= input signal
% fignum= figure number
% Author:   Sandesh Gandhi & Chetan Tonde
%           c/o Power Anser Labs, IIT Bombay
%   Updated         : 10th MAY 2008
%----------------------------------------------------------------
global h;global Fs;global inputvolt_length;global time_stamp;
[rows len]=size(Signal);
len=len-100; %reduce the display length to 38 cycles
if nargin==3
figure(fignum);hold on;h=plot(time_stamp(1:len),Signal(1,1:len)',color);
else
figure(fignum);hold on;h=plot(time_stamp(1:len),Signal(1,1:len)','k-');
end

if (rows>1)
    hold on;h=plot(time_stamp(1:len),Signal(2,1:len)','k--');
        if (rows>2)
    hold on;h=plot(time_stamp(1:len),Signal(3,1:len)','k-.');
        end
end
xlabel('Time (s)');
grid on;

switch(fignum)
    case(1)
title('Frequency variation of R phase');
disp('Saving figure 1...frequency plot');
%saveas(h,'data/mykinputfreq.fig');
%saveas(h,'data/mykinputfreq.eps');
    case(2)
title('Synthesized shifted voltage')
ylabel('Voltage');
%disp('Saving figure 2...synthesized shifted voltage');
%saveas(h,'data/synVk.fig');
%saveas(h,'data/synVk.eps');
    case(3)
title('Average voltage of original signal');
ylabel('Average voltage');
%disp('Saving figure 3... moving average voltage');
%saveas(h,'data/avgvolt.fig');
%saveas(h,'data/avgvolt.eps'); 
    case(4)
title('Vk(2,:)/10 and Avg volt(2,:)');
ylabel('voltage and avg volt (volts)');
%disp('Saving figure 4 ... k avg ');
%saveas(h,'data/v_avg.fig');
%saveas(h,'data/v_avg.eps');
    case(5)
title('Vm/10 and Fm plot');
ylabel('Vm/10 and Fm magnitude (volts)');
%saving figures
%disp('Saving figure 5...Vm and Fm');
%saveas(h,'data/VmandFm.fig');
%saveas(h,'data/VmandFm.eps');     
    case(6)
    case(7)
title('Our algo Frequency');
ylabel('Frequency');
%saving figures
%disp('Saving figure 7... our proposed algo freq');
%saveas(h,'data/ouralgofreq.fig');
%saveas(h,'data/ouralgofreq.eps');
    case(8)
title('imag(newVkpos(2,:))/10 and imag(newavgpos(2,:))');
ylabel('voltage and avg volt (volts)');
%saving figures
%disp('Saving figure 8 ...newv_avg Schmitt analysis ');
%saveas(h,'data/newv_avg.fig');
%saveas(h,'data/newv_avg.eps');
    case(9)    
    case(10)
title('modified_Algo(black)');
ylabel('Frequency');
%saving figures
%disp('Saving figure 10... new system freq');
%saveas(h,'data/modalgo.fig');
%saveas(h,'data/modalgo.eps'); 

    case(11)
title('Phadke-Thorp freq(g)');
ylabel('Frequency');
%saving figures
%disp('Saving figure 11 Phadke-Thorp frequency...');
%saveas(h,'data/pthorp.fig');
%saveas(h,'data/pthorp.eps');   
    case(12)
title(' Frequency calculated by ZCD ');
ylabel('Frequency');
%saving figures
%disp('Saving figure 12... ZCD frequency');
%saveas(h,'data/zcd.fig');
%saveas(h,'data/zcd.eps');    
    case(13)
title('PLL');
ylabel('Frequency');
%saving figures
%disp('Saving figure 13... PLL frequency');
%saveas(h,'data/pll.fig');
%saveas(h,'data/pll.eps');
   
    case(14)
title('old Generated voltage for k estimation');
ylabel('Voltage');
%saving figures
%disp('Saving figure 14 old  k_estim input voltage...');
%saveas(h,'data/oldkvoltages.fig');
%saveas(h,'data/oldkvoltages.eps');    
    case(15)
title('Generated voltage for k estimation');
ylabel('Voltage');
%saving figures
%disp('Saving figure 15  k_estim input voltage...');
%saveas(h,'data/kvoltages.fig');
%saveas(h,'data/kvoltages.eps');
    case(16)
title('k avg sample number');
ylabel('k average voltage');
%saving figures
%disp('Saving figure 16 ... k avg ');
%saveas(h,'data/kavgvolt.fig');
%saveas(h,'data/kavgvolt.eps');    
    case(17)
 title('kVm/100 and kFm plot');
 ylabel('magnitude plot');
 % saving figures
 %disp('Saving figure 17 ...kVm/100 and kFm plot');
 %saveas(h,'data/kVmkFm.fig');
 %saveas(h,'data/kVmkFm.eps');    
    case(18)
title('original k=df/dt value plot');
ylabel('Rate Hz/sec');
%saving figures
%disp('Saving figure 18 ... original k value plot');
%saveas(h,'data/kvalue.fig');
saveas(h,'data/kvalue.eps');    
    case(19)
title('real(kVk(2,:))/100 and real(kAvg volt(2,:))');
ylabel('kvoltage and k avg volt');
%saving figures
%disp('Saving figure 19 ... k avg ');
%saveas(h,'data/kv_avg.fig');
%saveas(h,'data/kv_avg.eps');    
    case(20)
        
    otherwise
            disp('Nothing to Display');
end
hold off;