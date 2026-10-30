<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1" />
        <signal name="sum" />
        <signal name="x" />
        <signal name="y" />
        <signal name="XLXN_7" />
        <signal name="XLXN_9" />
        <signal name="dn" />
        <signal name="cout" />
        <port polarity="Output" name="sum" />
        <port polarity="Input" name="x" />
        <port polarity="Input" name="y" />
        <port polarity="Input" name="dn" />
        <port polarity="Output" name="cout" />
        <blockdef name="half_adder">
            <timestamp>2026-10-13T6:30:55</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
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
        <block symbolname="half_adder" name="XLXI_1">
            <blockpin signalname="XLXN_1" name="a1" />
            <blockpin signalname="dn" name="a0" />
            <blockpin signalname="sum" name="S" />
            <blockpin signalname="XLXN_7" name="C" />
        </block>
        <block symbolname="half_adder" name="XLXI_2">
            <blockpin signalname="x" name="a1" />
            <blockpin signalname="y" name="a0" />
            <blockpin signalname="XLXN_1" name="S" />
            <blockpin signalname="XLXN_9" name="C" />
        </block>
        <block symbolname="or2" name="XLXI_3">
            <blockpin signalname="XLXN_9" name="I0" />
            <blockpin signalname="XLXN_7" name="I1" />
            <blockpin signalname="cout" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1472" y="1248" name="XLXI_1" orien="R0">
        </instance>
        <instance x="976" y="1248" name="XLXI_2" orien="R0">
        </instance>
        <branch name="XLXN_1">
            <wire x2="1472" y1="1152" y2="1152" x1="1360" />
        </branch>
        <branch name="sum">
            <wire x2="1872" y1="1152" y2="1152" x1="1856" />
            <wire x2="2240" y1="1152" y2="1152" x1="1872" />
        </branch>
        <branch name="x">
            <wire x2="976" y1="1152" y2="1152" x1="880" />
        </branch>
        <branch name="y">
            <wire x2="976" y1="1216" y2="1216" x1="880" />
        </branch>
        <iomarker fontsize="28" x="880" y="1152" name="x" orien="R180" />
        <iomarker fontsize="28" x="880" y="1216" name="y" orien="R180" />
        <instance x="1952" y="1472" name="XLXI_3" orien="R0" />
        <branch name="XLXN_7">
            <wire x2="1888" y1="1216" y2="1216" x1="1856" />
            <wire x2="1888" y1="1216" y2="1344" x1="1888" />
            <wire x2="1952" y1="1344" y2="1344" x1="1888" />
        </branch>
        <branch name="XLXN_9">
            <wire x2="1408" y1="1216" y2="1216" x1="1360" />
            <wire x2="1408" y1="1216" y2="1408" x1="1408" />
            <wire x2="1952" y1="1408" y2="1408" x1="1408" />
        </branch>
        <branch name="dn">
            <wire x2="1456" y1="1312" y2="1312" x1="880" />
            <wire x2="1456" y1="1216" y2="1312" x1="1456" />
            <wire x2="1472" y1="1216" y2="1216" x1="1456" />
        </branch>
        <iomarker fontsize="28" x="880" y="1312" name="dn" orien="R180" />
        <branch name="cout">
            <wire x2="2224" y1="1376" y2="1376" x1="2208" />
            <wire x2="2240" y1="1376" y2="1376" x1="2224" />
        </branch>
        <iomarker fontsize="28" x="2240" y="1376" name="cout" orien="R0" />
        <iomarker fontsize="28" x="2240" y="1152" name="sum" orien="R0" />
    </sheet>
</drawing>