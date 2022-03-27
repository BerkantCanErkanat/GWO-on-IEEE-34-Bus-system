function o = run34(x,l)
DSSObj = actxserver('OpenDSSEngine.DSS');
if ~DSSObj.Start(0)
    Disp('Unable to start the opendss engine');
    return;
end
DSSText = DSSObj.Text;
DSSCircuit = DSSObj.ActiveCircuit; 
DSSText.Command = 'Compile (C:\Program Files\OpenDSS\IEEETestCases\34Bus\ieee34Mod1.dss)';
DSSText.Command = 'solve';
y = ones(1,40)*0.95;
y1 = ones(1,40)*1.05;
if l == 0 %sadece bir kereligine cozdur
 DSSText.Command = 'solve';
 %sistemin ilk hali
 temp1=DSSCircuit.AllNodeVmagPUByPhase(1) ;
 temp2=DSSCircuit.AllNodeVmagPUByPhase(2) ;
 temp3=DSSCircuit.AllNodeVmagPUByPhase(3) ;
 figure (1)
 plot(temp1);
 hold on
 plot(temp2);
 hold on
 plot(temp3);
 hold on
 plot(y,'LineWidth',8);
 hold on
 plot(y1,'LineWidth',8);
 legend('PHASE A','PHASE B','PHASE C');
 xlabel('NODES');
 ylabel('Voltage mag pu');
 title('Bare system');
end
%hep sıfırdan compile ettigimiz icin alttaki load tanımı regtap islemleri
%hep yapılmalı
i = DSSCircuit.Loads.First;
%(0.2)*rand() + 1.1
while i > 0
    DSSCircuit.Loads.kw = DSSCircuit.Loads.kw * 1.1;
    i = DSSCircuit.Loads.Next;
end
DSSCircuit.RegControls.First;
DSSCircuit.RegControls.TapNumber=5;
DSSCircuit.RegControls.MaxTapChange=0;
DSSCircuit.RegControls.Next;
DSSCircuit.RegControls.TapNumber=5;
DSSCircuit.RegControls.MaxTapChange=0;
DSSCircuit.RegControls.Next;
DSSCircuit.RegControls.TapNumber=5;
DSSCircuit.RegControls.MaxTapChange=0;
DSSCircuit.RegControls.Next;
DSSCircuit.RegControls.TapNumber=5;
DSSCircuit.RegControls.MaxTapChange=0;
DSSCircuit.RegControls.Next;
DSSCircuit.RegControls.TapNumber=5;
DSSCircuit.RegControls.MaxTapChange=0;
DSSCircuit.RegControls.Next;
DSSCircuit.RegControls.TapNumber=5;
DSSCircuit.RegControls.MaxTapChange=0;
if l == 0 %sadece bir kereligine cozdur
 DSSText.Command = 'solve';
 %load farkını gor
 temp1=DSSCircuit.AllNodeVmagPUByPhase(1) ;
 temp2=DSSCircuit.AllNodeVmagPUByPhase(2) ;
 temp3=DSSCircuit.AllNodeVmagPUByPhase(3) ;
 figure (2)
 plot(temp1);
 hold on
 plot(temp2);
 hold on
 plot(temp3);
 hold on
 plot(y,'LineWidth',8);
 hold on
 plot(y1,'LineWidth',8);
 legend('PHASE A','PHASE B','PHASE C');
 xlabel('NODES');
 ylabel('Voltage mag pu');
  title('Extra Load Effect');
end
   if l == 5555
DSSText.Command='New Loadshape.MyIrrad npts=96 interval=0.25 mult=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.1 0.1 0.1 0.1 0.2 0.2 0.2 0.2 0.3 0.3 0.3 0.3 0.5 0.5 0.5 0.5 0.8 0.8 0.8 0.8 0.9 0.9 0.9 0.9 1 1 1 1 1 1 1 1 0.99 0.99 0.99 0.99 0.9 0.9 0.9 0.9 0.7 0.7 0.7 0.7 0.4 0.4 0.4 0.4 0.1 0.1 0.1 0.1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]';
DSSText.Command='New XYCurve.MyPvsT npts=4  xarray=[0  25  75  100]  yarray=[1.2 1.0 0.8  0.6] ';
DSSText.Command='New XYCurve.MyEff npts=4 xarray=[.1 .2 .4 1.0] yarray=[0.86 0.9 0.93 0.97]';
DSSText.Command='New PVSystem.PV1 phases=1 bus1=890.1 Pmpp=300 kV=4.160 kVA=400 effcurve=MyEff P-TCurve=MyPvsT daily=MyIrrad';
DSSText.Command='New PVSystem.PV2 phases=1 bus1=890.2 Pmpp=300 kV=4.160 kVA=400 effcurve=MyEff P-TCurve=MyPvsT daily=MyIrrad';
DSSText.Command='New PVSystem.PV3 phases=1 bus1=890.3 Pmpp=300 kV=4.160 kVA=400 effcurve=MyEff P-TCurve=MyPvsT daily=MyIrrad';
   end
    DSSCircuit.RegControls.First;
    DSSCircuit.RegControls.TapNumber=round(x(1));
    DSSCircuit.RegControls.Next;
    DSSCircuit.RegControls.TapNumber=round(x(2));
    DSSCircuit.RegControls.Next;
    DSSCircuit.RegControls.TapNumber=round(x(3));
    DSSCircuit.RegControls.Next;
    DSSCircuit.RegControls.TapNumber=round(x(4));
    DSSCircuit.RegControls.Next;
    DSSCircuit.RegControls.TapNumber=round(x(5));
    DSSCircuit.RegControls.Next;
    DSSCircuit.RegControls.TapNumber=round(x(6));
        DSSText.Command ='solve';
        temp1=DSSCircuit.AllNodeVmagPUByPhase(1) ;
        temp2=DSSCircuit.AllNodeVmagPUByPhase(2) ;
        temp3=DSSCircuit.AllNodeVmagPUByPhase(3) ;
        o=sum(abs(temp1-1).^2)+sum(abs(temp2-1).^2)+sum(abs(temp3-1).^2);
 if l == 4444 %son kez cızdır
 figure (3)
 plot(temp1);
 hold on
 plot(temp2);
 hold on
 plot(temp3);
  hold on
plot(y,'LineWidth',8);
 hold on
 plot(y1,'LineWidth',8);
 legend('PHASE A','PHASE B','PHASE C');
 xlabel('NODES');
 ylabel('Voltage mag pu');
 title('GWO reg tap algorithm');
 end
if l == 5555
 figure (4)
 plot(temp1);
 hold on
 plot(temp2);
 hold on
 plot(temp3);
  hold on
 plot(y,'LineWidth',8);
 hold on
 plot(y1,'LineWidth',8);
 legend('PHASE A','PHASE B','PHASE C');
 xlabel('NODES');
 ylabel('Voltage mag pu');
 title('PV to the system');
end
end