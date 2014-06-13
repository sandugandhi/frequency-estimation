function [delta_freq,flag,ratio]= sincfreq(Fm,Vm,Vin,Avg_in,Vth,cyc)
% SYNTAX -----------------------------------------------------
% [delta_freq,flag,ratio]=sincfreq(Fm,Vm,Vin,Avg_in,Vth,cyc)
% where
%              Fm  = amplitude average of 3 phases 
%              Vm  = amplitude voltage of 3 phases 
%              Vth = schmitt threshold
%              cyc = cycles
%
% Author:   Sandesh Gandhi
%           c/o Power Anser Labs, IIT Bombay
% Update:   10th MAY 2008
%-------------------------------------------------------------   
%% Schmidt trigger
global inputvolt_length;global F0;global Fs;
global freqtable;global sinctable;
delta_freq=zeros(1,inputvolt_length);
flag=zeros(1,inputvolt_length);
ratio=zeros(1,inputvolt_length);
flag(1)=1;
p=2;
len=length(sinctable);
% low=0;
% high=len;
% range=low+1:high;

for n=20:inputvolt_length-20,
 if( Vin(p,n)>Vth | Vin(p,n)< (-Vth))
   if(Vin(p,n)*Avg_in(p,n+flag(n-1)*(cyc*(floor(abs(delta_freq(n-1))))))>0)
     flag(n)=-1;
   else
     flag(n)=1;
   end
 else
        flag(n)=flag(n-1);        
 end
   
   
   if(Vm(n)>0)
        ratio(n)=Fm(n)/Vm(n);
        if(ratio(n)<0.00005)
            k_freq=F0;
        else           
         I  =   binsearch(sinctable,flag(n)*ratio(n));   
         %I=I+low;
         k_freq = freqtable(I);
%              if(I > 1001 & I<(len-1001))
%               low=I-1000;
%               high=I+1000;
%              end
        end
        delta_freq(n)= (k_freq-F0)/cyc;
   else
       delta_freq(n)  =  delta_freq(n-1);
   end
   
end
    
