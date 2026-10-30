<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1" />
        <signal name="XLXN_3" />
        <signal name="dn" />
        <signal name="y" />
        <signal name="x" />
        <signal name="XLXN_10" />
        <signal name="sum" />
        <signal name="cou" />
        <port polarity="Input" name="dn" />
        <port polarity="Input" name="y" />
        <port polarity="Input" name="x" />
        <port polarity="Output" name="sum" />
        <port polarity="Output" name="cou" />
        <blockdef name="halfadder">
            <timestamp>2026-9-30T11:3:23</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
        </blockdef>
        <blockdef name="or2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="192" ey="-96" sx="112" sy="-48" r="88" cx="116" cy="-136" />
            <arc ex="48" ey="-144" sx="48" sy="-48" r="56" cx="16" cy="-96" />
            <line x2="48" y1="-144" y2="-144" x1="112" />
            <arc ex="112" ey="-144" sx="192" sy="-96" r="88" cx="116" cy="-56" />
            <line x2="48" y1="-48" y2="-48" x1="112" />
        </blockdef>
        <block symbolname="halfadder" name="XLXI_1">
            <blockpin signalname="y" name="a0" />
            <blockpin signalname="x" name="a1" />
            <blockpin signalname="XLXN_3" name="c" />
            <blockpin signalname="XLXN_1" name="s" />
        </block>
        <block symbolname="halfadder" name="XLXI_2">
            <blockpin signalname="dn" name="a0" />
            <blockpin signalname="XLXN_1" name="a1" />
            <blockpin signalname="XLXN_10" name="c" />
            <blockpin signalname="sum" name="s" />
        </block>
        <block symbolname="or2" name="XLXI_4">
            <blockpin signalname="XLXN_3" name="I0" />
            <blockpin signalname="XLXN_10" name="I1" />
            <blockpin signalname="cou" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1504" y="1424" name="XLXI_2" orien="R0">
        </instance>
        <instance x="2064" y="1792" name="XLXI_4" orien="R0" />
        <instance x="944" y="1424" name="XLXI_1" orien="R0">
        </instance>
        <branch name="XLXN_1">
            <wire x2="1504" y1="1328" y2="1328" x1="1328" />
        </branch>
        <branch name="XLXN_3">
            <wire x2="1376" y1="1392" y2="1392" x1="1328" />
            <wire x2="1376" y1="1392" y2="1728" x1="1376" />
            <wire x2="2064" y1="1728" y2="1728" x1="1376" />
        </branch>
        <branch name="dn">
            <wire x2="1424" y1="1584" y2="1584" x1="656" />
            <wire x2="1424" y1="1392" y2="1584" x1="1424" />
            <wire x2="1504" y1="1392" y2="1392" x1="1424" />
        </branch>
        <branch name="y">
            <wire x2="944" y1="1392" y2="1392" x1="672" />
        </branch>
        <branch name="x">
            <wire x2="944" y1="1328" y2="1328" x1="672" />
        </branch>
        <branch name="XLXN_10">
            <wire x2="1968" y1="1392" y2="1392" x1="1888" />
            <wire x2="1968" y1="1392" y2="1664" x1="1968" />
            <wire x2="2064" y1="1664" y2="1664" x1="1968" />
        </branch>
        <branch name="sum">
            <wire x2="2320" y1="1328" y2="1328" x1="1888" />
        </branch>
        <iomarker fontsize="28" x="672" y="1328" name="x" orien="R180" />
        <iomarker fontsize="28" x="672" y="1392" name="y" orien="R180" />
        <iomarker fontsize="28" x="656" y="1584" name="dn" orien="R180" />
        <iomarker fontsize="28" x="2320" y="1328" name="sum" orien="R0" />
        <branch name="cou">
            <wire x2="2352" y1="1696" y2="1696" x1="2320" />
        </branch>
        <iomarker fontsize="28" x="2352" y="1696" name="cou" orien="R0" />
    </sheet>
</drawing>