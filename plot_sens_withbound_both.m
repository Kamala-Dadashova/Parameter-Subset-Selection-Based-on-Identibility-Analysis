function plot_sens_withbound_both(t, Y_sen, Y_complex, k, params, idxparam, idxy,l,u)
figure, hold on
%cmap = ["r", "g", "b", "c", "m", "#0072BD", "#D95319", "#7E2F8E", "#A2142F", "#77AC30"];
cmap = ["r", "g", "b", "c", "m", "#0072BD", "#D95319", "#7E2F8E", "#A2142F", "#77AC30"];

k1 = 1;
for i = 1:length(params)
    curr_sen = Y_complex(:,16*(i-1) + k)*params(i);
    if (max(abs(curr_sen))<u) &&(max(abs(curr_sen))>=l)
    plot(t, curr_sen, "-k", 'DisplayName',idxy(k)+ "_{" + idxparam(i)+"}",LineWidth=2);
    plot(t, Y_sen(:,16*i + k)*params(i), "--", 'DisplayName',idxy(k)+ "_{" + idxparam(i)+"}",'Color',cmap(k1), LineWidth=2);
    k1 = k1 +1;
    %h2=plot(t, Y_sen(:,16*i + k)*params(i), "--",LineWidth=2);
    end
end
set(gca,'FontSize',20) 
ax=gca;
ax.FontSize=20;
xlabel("Time (hr)", 'FontSize',24)
ylabel("Sensitivities of C_{P}",'FontSize',24)
legend('NumColumns',2, 'Orientation','horizontal', 'Location', 'best','FontSize',12)
%legend(h1,'NumColumns',2,'Orientation','horizontal', 'Location', 'best','FontSize',12)