<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1" />
        <signal name="XLXN_2" />
        <signal name="XLXN_3" />
        <signal name="updown" />
        <signal name="clk" />
        <signal name="clear" />
        <signal name="q(3:0)" />
        <signal name="cntout(3:0)" />
        <signal name="cntout(0)" />
        <signal name="cntout(1)" />
        <signal name="cntout(2)" />
        <signal name="cntout(3)" />
        <signal name="q(0)" />
        <signal name="q(1)" />
        <signal name="q(2)" />
        <signal name="q(3)" />
        <port polarity="Input" name="updown" />
        <port polarity="Input" name="clk" />
        <port polarity="Input" name="clear" />
        <port polarity="Output" name="cntout(3:0)" />
        <blockdef name="counter4bit">
            <timestamp>2026-10-6T6:12:27</timestamp>
            <rect width="512" x="32" y="32" height="384" />
            <line x2="32" y1="80" y2="80" x1="0" />
            <line x2="32" y1="208" y2="208" x1="0" />
            <line x2="32" y1="304" y2="304" x1="0" />
            <line x2="544" y1="144" y2="144" style="linewidth:W" x1="576" />
        </blockdef>
        <blockdef name="ibuf">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="0" y2="-64" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
        </blockdef>
        <blockdef name="obuf">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="0" y2="-64" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
        </blockdef>
        <block symbolname="counter4bit" name="counter">
            <blockpin signalname="XLXN_1" name="up" />
            <blockpin signalname="XLXN_2" name="clk" />
            <blockpin signalname="XLXN_3" name="sclr" />
            <blockpin signalname="q(3:0)" name="q(3:0)" />
        </block>
        <block symbolname="ibuf" name="XLXI_2">
            <blockpin signalname="updown" name="I" />
            <blockpin signalname="XLXN_1" name="O" />
        </block>
        <block symbolname="ibuf" name="XLXI_3">
            <blockpin signalname="clk" name="I" />
            <blockpin signalname="XLXN_2" name="O" />
        </block>
        <block symbolname="ibuf" name="XLXI_4">
            <blockpin signalname="clear" name="I" />
            <blockpin signalname="XLXN_3" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_5">
            <blockpin signalname="q(0)" name="I" />
            <blockpin signalname="cntout(0)" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_6">
            <blockpin signalname="q(1)" name="I" />
            <blockpin signalname="cntout(1)" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_7">
            <blockpin signalname="q(2)" name="I" />
            <blockpin signalname="cntout(2)" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_8">
            <blockpin signalname="q(3)" name="I" />
            <blockpin signalname="cntout(3)" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1504" y="1056" name="counter" orien="R0">
        </instance>
        <instance x="1216" y="1168" name="XLXI_2" orien="R0" />
        <instance x="1216" y="1296" name="XLXI_3" orien="R0" />
        <instance x="1216" y="1392" name="XLXI_4" orien="R0" />
        <branch name="XLXN_1">
            <wire x2="1456" y1="1136" y2="1136" x1="1440" />
            <wire x2="1504" y1="1136" y2="1136" x1="1456" />
        </branch>
        <branch name="XLXN_2">
            <wire x2="1456" y1="1264" y2="1264" x1="1440" />
            <wire x2="1504" y1="1264" y2="1264" x1="1456" />
        </branch>
        <branch name="XLXN_3">
            <wire x2="1456" y1="1360" y2="1360" x1="1440" />
            <wire x2="1504" y1="1360" y2="1360" x1="1456" />
        </branch>
        <branch name="updown">
            <wire x2="1216" y1="1136" y2="1136" x1="1104" />
        </branch>
        <branch name="clk">
            <wire x2="1216" y1="1264" y2="1264" x1="1104" />
        </branch>
        <branch name="clear">
            <wire x2="1216" y1="1360" y2="1360" x1="1104" />
        </branch>
        <iomarker fontsize="28" x="1104" y="1136" name="updown" orien="R180" />
        <iomarker fontsize="28" x="1104" y="1264" name="clk" orien="R180" />
        <iomarker fontsize="28" x="1104" y="1360" name="clear" orien="R180" />
        <branch name="q(3:0)">
            <wire x2="2144" y1="1200" y2="1200" x1="2080" />
            <wire x2="2144" y1="1200" y2="1264" x1="2144" />
            <wire x2="2144" y1="1264" y2="1280" x1="2144" />
            <wire x2="2144" y1="1280" y2="1408" x1="2144" />
            <wire x2="2144" y1="1408" y2="1520" x1="2144" />
            <wire x2="2144" y1="1520" y2="1664" x1="2144" />
            <wire x2="2144" y1="1664" y2="1680" x1="2144" />
        </branch>
        <bustap x2="2240" y1="1280" y2="1280" x1="2144" />
        <branch name="cntout(3:0)">
            <wire x2="2752" y1="1216" y2="1216" x1="2672" />
            <wire x2="2672" y1="1216" y2="1280" x1="2672" />
            <wire x2="2672" y1="1280" y2="1408" x1="2672" />
            <wire x2="2672" y1="1408" y2="1520" x1="2672" />
            <wire x2="2672" y1="1520" y2="1664" x1="2672" />
            <wire x2="2672" y1="1664" y2="1712" x1="2672" />
        </branch>
        <bustap x2="2576" y1="1280" y2="1280" x1="2672" />
        <bustap x2="2576" y1="1408" y2="1408" x1="2672" />
        <bustap x2="2576" y1="1520" y2="1520" x1="2672" />
        <bustap x2="2576" y1="1664" y2="1664" x1="2672" />
        <iomarker fontsize="28" x="2752" y="1216" name="cntout(3:0)" orien="R0" />
        <branch name="cntout(0)">
            <wire x2="2576" y1="1280" y2="1280" x1="2496" />
        </branch>
        <branch name="cntout(1)">
            <wire x2="2576" y1="1408" y2="1408" x1="2496" />
        </branch>
        <branch name="cntout(2)">
            <wire x2="2576" y1="1520" y2="1520" x1="2496" />
        </branch>
        <branch name="cntout(3)">
            <wire x2="2576" y1="1664" y2="1664" x1="2496" />
        </branch>
        <instance x="2272" y="1312" name="XLXI_5" orien="R0" />
        <instance x="2272" y="1440" name="XLXI_6" orien="R0" />
        <instance x="2272" y="1552" name="XLXI_7" orien="R0" />
        <instance x="2272" y="1696" name="XLXI_8" orien="R0" />
        <bustap x2="2240" y1="1408" y2="1408" x1="2144" />
        <bustap x2="2240" y1="1520" y2="1520" x1="2144" />
        <bustap x2="2240" y1="1664" y2="1664" x1="2144" />
        <branch name="q(0)">
            <wire x2="2272" y1="1280" y2="1280" x1="2240" />
        </branch>
        <branch name="q(1)">
            <wire x2="2272" y1="1408" y2="1408" x1="2240" />
        </branch>
        <branch name="q(2)">
            <wire x2="2272" y1="1520" y2="1520" x1="2240" />
        </branch>
        <branch name="q(3)">
            <wire x2="2256" y1="1664" y2="1664" x1="2240" />
            <wire x2="2272" y1="1664" y2="1664" x1="2256" />
        </branch>
    </sheet>
</drawing>