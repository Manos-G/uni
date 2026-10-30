<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="a0" />
        <signal name="a1" />
        <signal name="C" />
        <signal name="S" />
        <port polarity="Input" name="a0" />
        <port polarity="Input" name="a1" />
        <port polarity="Output" name="C" />
        <port polarity="Output" name="S" />
        <blockdef name="xor2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="60" y1="-128" y2="-128" x1="0" />
            <line x2="208" y1="-96" y2="-96" x1="256" />
            <arc ex="44" ey="-144" sx="48" sy="-48" r="56" cx="16" cy="-96" />
            <arc ex="64" ey="-144" sx="64" sy="-48" r="56" cx="32" cy="-96" />
            <line x2="64" y1="-144" y2="-144" x1="128" />
            <line x2="64" y1="-48" y2="-48" x1="128" />
            <arc ex="128" ey="-144" sx="208" sy="-96" r="88" cx="132" cy="-56" />
            <arc ex="208" ey="-96" sx="128" sy="-48" r="88" cx="132" cy="-136" />
        </blockdef>
        <blockdef name="and2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="144" ey="-144" sx="144" sy="-48" r="48" cx="144" cy="-96" />
            <line x2="64" y1="-48" y2="-48" x1="144" />
            <line x2="144" y1="-144" y2="-144" x1="64" />
            <line x2="64" y1="-48" y2="-144" x1="64" />
        </blockdef>
        <block symbolname="and2" name="XLXI_2">
            <blockpin signalname="a0" name="I0" />
            <blockpin signalname="a1" name="I1" />
            <blockpin signalname="C" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_1">
            <blockpin signalname="a0" name="I0" />
            <blockpin signalname="a1" name="I1" />
            <blockpin signalname="S" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <iomarker fontsize="28" x="2256" y="992" name="C" orien="R0" />
        <iomarker fontsize="28" x="2256" y="784" name="S" orien="R0" />
        <iomarker fontsize="28" x="1456" y="816" name="a0" orien="R180" />
        <iomarker fontsize="28" x="1456" y="752" name="a1" orien="R180" />
        <instance x="1744" y="1088" name="XLXI_2" orien="R0" />
        <instance x="1744" y="880" name="XLXI_1" orien="R0" />
        <branch name="a0">
            <wire x2="1568" y1="816" y2="816" x1="1456" />
            <wire x2="1744" y1="816" y2="816" x1="1568" />
            <wire x2="1568" y1="816" y2="1024" x1="1568" />
            <wire x2="1744" y1="1024" y2="1024" x1="1568" />
        </branch>
        <branch name="a1">
            <wire x2="1600" y1="752" y2="752" x1="1456" />
            <wire x2="1744" y1="752" y2="752" x1="1600" />
            <wire x2="1600" y1="752" y2="960" x1="1600" />
            <wire x2="1744" y1="960" y2="960" x1="1600" />
        </branch>
        <branch name="C">
            <wire x2="2256" y1="992" y2="992" x1="2000" />
        </branch>
        <branch name="S">
            <wire x2="2256" y1="784" y2="784" x1="2000" />
        </branch>
    </sheet>
</drawing>