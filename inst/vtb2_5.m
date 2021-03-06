function vtb2_5(m,m0,e,z,rmin,rmax)

%VTB2_5 Rotating unbalance.
% VTB2_5(m,m0,e,zeta,rmin,rmax) plots the displacement and phase of 
% a system with rotating unbalance between the frequency 
% ratios rmin and rmax.  The mass of the system is m and the damping
% ratio is zeta.  The paramaters of the unbalance are the mass m0 and
% eccentricity e.
clf

r=rmin:(rmax-rmin)/1000:rmax;
Xn=sqrt((r.^4)./((1-r.^2).^2+(2*z*r).^2));%(2.51)
X=Xn.*m0*e/m;%(2.51)
phi=atan2(2*z*r,1-r.^2);%(2.52)
grid('on')

subplot(2,1,1)

xlabel('Frequency Ratio')
ylabel('Normalized Displacement Magnitude')
title('Normalized Displacement Magnitude versus Frequency Ratio')
axis([rmin rmax min(20*log10(Xn(:,20))) 20*log10(max(max(Xn)))*1.1]);
plot(r,20*log10(Xn))

axis('auto');
subplot(2,1,2)
xlabel('Frequency Ratio')
ylabel('Phase')
title('Phase versus Frequency Ratio')
plot(r,phi)
