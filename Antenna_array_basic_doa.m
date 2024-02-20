>> clear
>> L=8;K=50;d=1;M=3;
>> sigma=1;snr=30;
>> inr1=30; inr2=30;
>> sigma0=sigma*10^(snr/20);
>> sigma1=sigma*10^(inr1/20);
>> sigma2 =sigma*10^(inr2/20);
>> theta0 = 80; theta1 = 60; theta2 = 100;
>> a0 = exp(1i*2*pi*d*sin(theta0*pi/180)*(0:L-1)'); 
>> a1 = exp(1i*2*pi*d*sin(theta1*pi/180)*(0:L-1)');
>> a2 = exp(1i*2*pi*d*sin(theta2*pi/180)*(0:L-1)');
>> st0=(randn(1,K)+1i*randn(1,K))/sqrt(2)*sigma0;
>> st1=(randn(1,K)+1i*randn(1,K))/sqrt(2)*sigma1;
>> st2=(randn(1,K)+1i*randn(1,K))/sqrt(2)*sigma2;
>> nt =(randn(L,K)+1i*randn(L,K))/sqrt(2)*sigma;
>> xt = a0*st0+a1*st1+a2*st2+nt;
>> sRxx = xt*xt'/ K;
>> Rxx = sigma0^2*(a0*a0')+sigma1^2*(a1*a1')+sigma2^2*(a2*a2')+sigma^2*eye(L);
>> w_smi = sRxx\a0/(a0'*(sRxx\a0));
>> w_mpdr = Rxx\a0/(a0'*(Rxx\a0));
>> doa = 0:0.1:180;
>> bp_smi  = zeros(1,length(doa));
>> bp_mpdr = zeros(1,length(doa));
>> for m=1:length(doa)
am = exp(1i*2*pi*sin(doa(m)*pi/180)*[0:L-1]'); 
bp_mpdr(m)=abs(w_mpdr'*am);
bp_smi(m)=abs(w_smi'*am);
end
>> figure;hold on;grid on;
>> plot(doa,10*log(bp_mpdr),'b-');plot(doa,10*log(bp_smi),'rd-');
>> xlabel('angle'); ylabel('Power in dB');
>> title ('DOA_antenna_array')
>> 
