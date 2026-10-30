<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_5" />
        <signal name="XLXN_6" />
        <signal name="XLXN_7" />
        <signal name="XLXN_8" />
        <signal name="XLXN_9" />
        <signal name="XLXN_10" />
        <signal name="XLXN_11" />
        <signal name="XLXN_12" />
        <signal name="XLXN_13" />
        <signal name="XLXN_14" />
        <signal name="XLXN_15" />
        <signal name="XLXN_16" />
        <signal name="XLXN_17" />
        <signal name="XLXN_18" />
        <signal name="XLXN_21" />
        <signal name="XLXN_22" />
        <signal name="XLXN_23" />
        <signal name="XLXN_24" />
        <signal name="XLXN_25" />
        <signal name="XLXN_26" />
        <signal name="XLXN_27" />
        <signal name="XLXN_19" />
        <signal name="Q(0)" />
        <signal name="Q(1)" />
        <signal name="XLXN_34" />
        <signal name="Q(1:0)" />
        <port polarity="Input" name="XLXN_21" />
        <port polarity="Input" name="XLXN_22" />
        <port polarity="Input" name="XLXN_23" />
        <port polarity="Input" name="XLXN_24" />
        <port polarity="Input" name="XLXN_25" />
        <port polarity="Input" name="XLXN_26" />
        <port polarity="Output" name="Q(1:0)" />
        <blockdef name="fulladder">
            <timestamp>2026-9-30T11:11:23</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
        </blockdef>
        <blockdef name="fdc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <rect width="256" x="64" y="-320" height="256" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="192" y1="-64" y2="-32" x1="192" />
            <line x2="64" y1="-32" y2="-32" x1="192" />
        </blockdef>
        <blockdef name="m2_1">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="96" y1="-64" y2="-192" x1="96" />
            <line x2="96" y1="-96" y2="-64" x1="256" />
            <line x2="256" y1="-160" y2="-96" x1="256" />
            <line x2="256" y1="-192" y2="-160" x1="96" />
            <line x2="96" y1="-32" y2="-32" x1="176" />
            <line x2="176" y1="-80" y2="-32" x1="176" />
            <line x2="96" y1="-32" y2="-32" x1="0" />
            <line x2="256" y1="-128" y2="-128" x1="320" />
            <line x2="96" y1="-96" y2="-96" x1="0" />
            <line x2="96" y1="-160" y2="-160" x1="0" />
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
        <block symbolname="fulladder" name="XLXI_1">
            <blockpin signalname="XLXN_10" name="cou" />
            <blockpin signalname="XLXN_7" name="dn" />
            <blockpin signalname="XLXN_9" name="sum" />
            <blockpin signalname="XLXN_5" name="x" />
            <blockpin signalname="XLXN_8" name="y" />
        </block>
        <block symbolname="fdc" name="XLXI_2">
            <blockpin signalname="XLXN_13" name="C" />
            <blockpin signalname="XLXN_14" name="CLR" />
            <blockpin signalname="XLXN_16" name="D" />
            <blockpin signalname="XLXN_18" name="Q" />
        </block>
        <block symbolname="fdc" name="XLXI_3">
            <blockpin signalname="XLXN_13" name="C" />
            <blockpin signalname="XLXN_14" name="CLR" />
            <blockpin signalname="XLXN_17" name="D" />
            <blockpin signalname="XLXN_34" name="Q" />
        </block>
        <block symbolname="m2_1" name="XLXI_5">
            <blockpin signalname="XLXN_9" name="D0" />
            <blockpin signalname="XLXN_5" name="D1" />
            <blockpin signalname="XLXN_12" name="S0" />
            <blockpin signalname="XLXN_16" name="O" />
        </block>
        <block symbolname="m2_1" name="XLXI_6">
            <blockpin signalname="XLXN_10" name="D0" />
            <blockpin signalname="XLXN_8" name="D1" />
            <blockpin signalname="XLXN_12" name="S0" />
            <blockpin signalname="XLXN_17" name="O" />
        </block>
        <block symbolname="ibuf" name="XLXI_8">
            <blockpin signalname="XLXN_24" name="I" />
            <blockpin signalname="XLXN_7" name="O" />
        </block>
        <block symbolname="ibuf" name="XLXI_9">
            <blockpin signalname="XLXN_25" name="I" />
            <blockpin signalname="XLXN_8" name="O" />
        </block>
        <block symbolname="ibuf" name="XLXI_10">
            <blockpin signalname="XLXN_26" name="I" />
            <blockpin signalname="XLXN_5" name="O" />
        </block>
        <block symbolname="ibuf" name="XLXI_11">
            <blockpin signalname="XLXN_23" name="I" />
            <blockpin signalname="XLXN_12" name="O" />
        </block>
        <block symbolname="ibuf" name="XLXI_12">
            <blockpin signalname="XLXN_22" name="I" />
            <blockpin signalname="XLXN_13" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_22">
            <blockpin signalname="XLXN_18" name="I" />
            <blockpin signalname="Q(0)" name="O" />
        </block>
        <block symbolname="ibuf" name="XLXI_24">
            <blockpin signalname="XLXN_21" name="I" />
            <blockpin signalname="XLXN_14" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_25">
            <blockpin signalname="XLXN_34" name="I" />
            <blockpin signalname="Q(1)" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="800" y="832" name="XLXI_1" orien="R0">
        </instance>
        <instance x="1984" y="896" name="XLXI_2" orien="R0" />
        <instance x="1984" y="1296" name="XLXI_3" orien="R0" />
        <instance x="1488" y="1136" name="XLXI_6" orien="R0" />
        <instance x="1488" y="816" name="XLXI_5" orien="R0" />
        <instance x="384" y="704" name="XLXI_10" orien="R0" />
        <instance x="384" y="768" name="XLXI_9" orien="R0" />
        <instance x="384" y="832" name="XLXI_8" orien="R0" />
        <branch name="XLXN_5">
            <wire x2="704" y1="672" y2="672" x1="608" />
            <wire x2="800" y1="672" y2="672" x1="704" />
            <wire x2="704" y1="672" y2="912" x1="704" />
            <wire x2="1248" y1="912" y2="912" x1="704" />
            <wire x2="1248" y1="720" y2="912" x1="1248" />
            <wire x2="1488" y1="720" y2="720" x1="1248" />
        </branch>
        <branch name="XLXN_7">
            <wire x2="800" y1="800" y2="800" x1="608" />
        </branch>
        <instance x="384" y="1120" name="XLXI_11" orien="R0" />
        <instance x="384" y="1296" name="XLXI_12" orien="R0" />
        <instance x="384" y="1440" name="XLXI_24" orien="R0" />
        <instance x="2464" y="672" name="XLXI_22" orien="R0" />
        <branch name="XLXN_8">
            <wire x2="624" y1="736" y2="736" x1="608" />
            <wire x2="800" y1="736" y2="736" x1="624" />
            <wire x2="624" y1="736" y2="1040" x1="624" />
            <wire x2="1488" y1="1040" y2="1040" x1="624" />
        </branch>
        <branch name="XLXN_9">
            <wire x2="1328" y1="672" y2="672" x1="1184" />
            <wire x2="1328" y1="656" y2="672" x1="1328" />
            <wire x2="1488" y1="656" y2="656" x1="1328" />
        </branch>
        <branch name="XLXN_10">
            <wire x2="1328" y1="736" y2="736" x1="1184" />
            <wire x2="1328" y1="736" y2="976" x1="1328" />
            <wire x2="1488" y1="976" y2="976" x1="1328" />
        </branch>
        <branch name="XLXN_12">
            <wire x2="1040" y1="1088" y2="1088" x1="608" />
            <wire x2="1040" y1="1088" y2="1104" x1="1040" />
            <wire x2="1472" y1="1104" y2="1104" x1="1040" />
            <wire x2="1488" y1="1104" y2="1104" x1="1472" />
            <wire x2="1488" y1="784" y2="784" x1="1472" />
            <wire x2="1472" y1="784" y2="1104" x1="1472" />
        </branch>
        <branch name="XLXN_13">
            <wire x2="1296" y1="1264" y2="1264" x1="608" />
            <wire x2="1856" y1="1264" y2="1264" x1="1296" />
            <wire x2="1296" y1="1168" y2="1264" x1="1296" />
            <wire x2="1984" y1="1168" y2="1168" x1="1296" />
            <wire x2="1856" y1="768" y2="1264" x1="1856" />
            <wire x2="1984" y1="768" y2="768" x1="1856" />
        </branch>
        <branch name="XLXN_14">
            <wire x2="1984" y1="1408" y2="1408" x1="608" />
            <wire x2="2432" y1="1408" y2="1408" x1="1984" />
            <wire x2="1984" y1="864" y2="928" x1="1984" />
            <wire x2="2432" y1="928" y2="928" x1="1984" />
            <wire x2="2432" y1="928" y2="1408" x1="2432" />
            <wire x2="1984" y1="1264" y2="1408" x1="1984" />
        </branch>
        <branch name="XLXN_16">
            <wire x2="1888" y1="688" y2="688" x1="1808" />
            <wire x2="1888" y1="640" y2="688" x1="1888" />
            <wire x2="1984" y1="640" y2="640" x1="1888" />
        </branch>
        <branch name="XLXN_17">
            <wire x2="1888" y1="1008" y2="1008" x1="1808" />
            <wire x2="1888" y1="1008" y2="1040" x1="1888" />
            <wire x2="1984" y1="1040" y2="1040" x1="1888" />
        </branch>
        <branch name="XLXN_18">
            <wire x2="2464" y1="640" y2="640" x1="2368" />
        </branch>
        <branch name="XLXN_21">
            <wire x2="384" y1="1408" y2="1408" x1="352" />
        </branch>
        <iomarker fontsize="28" x="352" y="1408" name="XLXN_21" orien="R180" />
        <branch name="XLXN_22">
            <wire x2="384" y1="1264" y2="1264" x1="352" />
        </branch>
        <iomarker fontsize="28" x="352" y="1264" name="XLXN_22" orien="R180" />
        <branch name="XLXN_23">
            <wire x2="384" y1="1088" y2="1088" x1="352" />
        </branch>
        <iomarker fontsize="28" x="352" y="1088" name="XLXN_23" orien="R180" />
        <branch name="XLXN_24">
            <wire x2="384" y1="800" y2="800" x1="352" />
        </branch>
        <iomarker fontsize="28" x="352" y="800" name="XLXN_24" orien="R180" />
        <branch name="XLXN_25">
            <wire x2="384" y1="736" y2="736" x1="352" />
        </branch>
        <iomarker fontsize="28" x="352" y="736" name="XLXN_25" orien="R180" />
        <branch name="XLXN_26">
            <wire x2="384" y1="672" y2="672" x1="352" />
        </branch>
        <iomarker fontsize="28" x="352" y="672" name="XLXN_26" orien="R180" />
        <bustap x2="2880" y1="656" y2="656" x1="2976" />
        <bustap x2="2880" y1="752" y2="752" x1="2976" />
        <branch name="Q(0)">
            <wire x2="2784" y1="640" y2="640" x1="2688" />
            <wire x2="2784" y1="640" y2="656" x1="2784" />
            <wire x2="2880" y1="656" y2="656" x1="2784" />
        </branch>
        <instance x="2576" y="880" name="XLXI_25" orien="R0" />
        <branch name="Q(1)">
            <wire x2="2832" y1="848" y2="848" x1="2800" />
            <wire x2="2832" y1="752" y2="848" x1="2832" />
            <wire x2="2880" y1="752" y2="752" x1="2832" />
        </branch>
        <branch name="XLXN_34">
            <wire x2="2464" y1="1040" y2="1040" x1="2368" />
            <wire x2="2464" y1="848" y2="1040" x1="2464" />
            <wire x2="2576" y1="848" y2="848" x1="2464" />
        </branch>
        <branch name="Q(1:0)">
            <wire x2="2880" y1="944" y2="1040" x1="2880" />
            <wire x2="2896" y1="1040" y2="1040" x1="2880" />
            <wire x2="2976" y1="944" y2="944" x1="2880" />
            <wire x2="2976" y1="560" y2="560" x1="2896" />
            <wire x2="2976" y1="560" y2="656" x1="2976" />
            <wire x2="2976" y1="656" y2="752" x1="2976" />
            <wire x2="2976" y1="752" y2="944" x1="2976" />
        </branch>
        <iomarker fontsize="28" x="2896" y="1040" name="Q(1:0)" orien="R0" />
    </sheet>
</drawing>