function plot_sens_withbound(t, Y_complex, k, params, idxparam, idxy,l,u)
figure, hold on
for i = 1:length(params)
    curr_sen = Y_complex(:,16*(i-1) + k)*params(i);
    if (max(abs(curr_sen))<u) &&(max(abs(curr_sen))>=l)
    plot(t, curr_sen, "-", 'DisplayName',idxy(k)+ "_{" + idxparam(i)+"}",LineWidth=2)
    end
end
%set(gca,'FontSize',20) 
ax=gca;
ax.FontSize=20;
xlabel("Time (hr)",'FontSize',24)
ylabel("Sensitivities of C_{P}",'FontSize',24)
legend('NumColumns',2, 'Location', 'best','FontSize',12)