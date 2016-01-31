<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="6.4">
<drawing>
<settings>
<setting alwaysvectorfont="yes"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="yes" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="50" name="dxf" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="14" fill="9" visible="no" active="no"/>
<layer number="52" name="bDocu" color="13" fill="9" visible="no" active="no"/>
<layer number="53" name="tGND_GNDA" color="7" fill="9" visible="no" active="no"/>
<layer number="54" name="bGND_GNDA" color="1" fill="9" visible="no" active="no"/>
<layer number="56" name="wert" color="7" fill="1" visible="no" active="no"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
<layer number="100" name="Muster" color="7" fill="1" visible="no" active="no"/>
<layer number="250" name="Descript" color="3" fill="1" visible="no" active="no"/>
<layer number="251" name="SMDround" color="12" fill="11" visible="no" active="no"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="NaN">
<description>&lt;b&gt;NaN Library&lt;/b&gt;
&lt;p&gt;Lots of random crap.</description>
<packages>
<package name="0402_YAGEO">
<description>&lt;b&gt;0402&lt;/b&gt;
&lt;p&gt;
Yageo reflow footprint dimensions</description>
<smd name="1" x="0" y="0.5" dx="0.6" dy="0.5" layer="1" thermals="no"/>
<smd name="2" x="0" y="-0.5" dx="0.6" dy="0.5" layer="1" thermals="no"/>
<rectangle x1="-0.26" y1="-0.51" x2="0.26" y2="0.51" layer="51"/>
</package>
<package name="SOT-89-ROUND">
<description>SOT-89-3, TO-243AA</description>
<wire x1="-2.3" y1="-1.25" x2="-2.3" y2="1.25" width="0.127" layer="51"/>
<wire x1="-2.3" y1="1.25" x2="2.3" y2="1.25" width="0.127" layer="51"/>
<wire x1="2.3" y1="1.25" x2="2.3" y2="-1.25" width="0.127" layer="51"/>
<wire x1="2.3" y1="-1.25" x2="-2.3" y2="-1.25" width="0.127" layer="51"/>
<wire x1="-2.25" y1="-1.5" x2="-2.5" y2="-1.5" width="0.25" layer="21"/>
<wire x1="-2.5" y1="-1.5" x2="-2.5" y2="1.5" width="0.25" layer="21"/>
<wire x1="-2.5" y1="1.5" x2="-1.5" y2="1.5" width="0.25" layer="21"/>
<wire x1="1.5" y1="1.5" x2="2.5" y2="1.5" width="0.25" layer="21"/>
<wire x1="2.5" y1="1.5" x2="2.5" y2="-1.5" width="0.25" layer="21"/>
<wire x1="2.5" y1="-1.5" x2="2.25" y2="-1.5" width="0.25" layer="21"/>
<smd name="1" x="-1.5" y="-2" dx="1" dy="1.5" layer="1" thermals="no"/>
<smd name="3" x="1.5" y="-2" dx="1" dy="1.5" layer="1" roundness="1" thermals="no"/>
<smd name="2@2" x="0" y="0.75" dx="2.2" dy="4" layer="1" roundness="100" thermals="no"/>
<rectangle x1="-1.78" y1="-2.25" x2="-1.22" y2="-1.25" layer="51"/>
<rectangle x1="-0.28" y1="-2.25" x2="0.28" y2="-1.25" layer="51"/>
<rectangle x1="1.22" y1="-2.25" x2="1.78" y2="-1.25" layer="51"/>
<rectangle x1="-0.9" y1="1.25" x2="0.9" y2="2" layer="51"/>
<smd name="2@1" x="0" y="-1.75" dx="1" dy="2" layer="1" roundness="1" thermals="no"/>
</package>
<package name="VREG-V78W-500">
<wire x1="-6" y1="2.3" x2="6" y2="2.3" width="0.25" layer="21"/>
<wire x1="6" y1="2.3" x2="6" y2="-5.8" width="0.25" layer="21"/>
<wire x1="6" y1="-5.8" x2="-6" y2="-5.8" width="0.25" layer="21"/>
<wire x1="-6" y1="-5.8" x2="-6" y2="2.3" width="0.25" layer="21"/>
<pad name="VOUT" x="2.54" y="0" drill="1" diameter="1.8" thermals="no"/>
<pad name="GND" x="0" y="0" drill="1" diameter="1.8" thermals="no"/>
<pad name="VIN" x="-2.54" y="0" drill="1" diameter="1.8" thermals="no"/>
<rectangle x1="-5.75" y1="-5.55" x2="5.75" y2="2.1" layer="51" rot="R180"/>
</package>
<package name="VREG-V78W-500R">
<wire x1="-6" y1="-1.25" x2="6" y2="-1.25" width="0.25" layer="21"/>
<wire x1="6" y1="-1.25" x2="6" y2="-2.5" width="0.25" layer="21"/>
<wire x1="6" y1="-18" x2="6" y2="-19.25" width="0.25" layer="21"/>
<wire x1="6" y1="-19.25" x2="4.75" y2="-19.25" width="0.25" layer="21"/>
<wire x1="-4.75" y1="-19.25" x2="-6" y2="-19.25" width="0.25" layer="21"/>
<wire x1="-6" y1="-19.25" x2="-6" y2="-18" width="0.25" layer="21"/>
<wire x1="-6" y1="-2.5" x2="-6" y2="-1.25" width="0.25" layer="21"/>
<pad name="VOUT" x="-2.54" y="0" drill="1" diameter="1.8" thermals="no"/>
<pad name="GND" x="0" y="0" drill="1" diameter="1.8" thermals="no"/>
<pad name="VIN" x="2.54" y="0" drill="1" diameter="1.8" thermals="no"/>
<rectangle x1="-5.75" y1="-19" x2="5.75" y2="-1.5" layer="51"/>
</package>
<package name="VREG-OKI-78SR-H">
<pad name="1" x="2.54" y="0" drill="1" shape="square" thermals="no"/>
<pad name="2" x="0" y="0" drill="1" shape="square" thermals="no"/>
<pad name="3" x="-2.54" y="0" drill="1" shape="square" thermals="no"/>
<wire x1="-5.4" y1="-1.4" x2="5.4" y2="-1.4" width="0.25" layer="21"/>
<wire x1="5.4" y1="-1.4" x2="5.4" y2="-0.2" width="0.25" layer="21"/>
<wire x1="5.4" y1="14.2" x2="5.4" y2="15.4" width="0.25" layer="21"/>
<wire x1="5.4" y1="15.4" x2="4.2" y2="15.4" width="0.25" layer="21"/>
<wire x1="-4.2" y1="15.4" x2="-5.4" y2="15.4" width="0.25" layer="21"/>
<wire x1="-5.4" y1="15.4" x2="-5.4" y2="14.2" width="0.25" layer="21"/>
<wire x1="-5.4" y1="-0.2" x2="-5.4" y2="-1.4" width="0.25" layer="21"/>
<rectangle x1="-2.8575" y1="-0.3175" x2="-2.2225" y2="0.3175" layer="51"/>
<rectangle x1="-0.3175" y1="-0.3175" x2="0.3175" y2="0.3175" layer="51"/>
<rectangle x1="2.2225" y1="-0.3175" x2="2.8575" y2="0.3175" layer="51"/>
<wire x1="-5.2" y1="-1.3" x2="-5.2" y2="15.2" width="0.25" layer="51"/>
<wire x1="-5.2" y1="15.2" x2="5.2" y2="15.2" width="0.25" layer="51"/>
<wire x1="5.2" y1="15.2" x2="5.2" y2="-1.3" width="0.25" layer="51"/>
<wire x1="5.2" y1="-1.3" x2="-5.2" y2="-1.3" width="0.25" layer="51"/>
</package>
<package name="M2_SCREW_UNTENTED">
<pad name="P$1" x="0" y="0" drill="2.05" diameter="4.2" thermals="no"/>
</package>
<package name="M8_SCREW_UNTENTED">
<pad name="P$1" x="0" y="0" drill="8.05" diameter="13.1" thermals="no"/>
<polygon width="0" layer="18">
<vertex x="-8.1" y="0" curve="-90"/>
<vertex x="0" y="8.1" curve="-90"/>
<vertex x="8.1" y="0" curve="-90"/>
<vertex x="0" y="-8.1" curve="-90"/>
</polygon>
</package>
<package name="M4_SCREW_UNTENTED">
<pad name="P$1" x="0" y="0" drill="4.05" diameter="8.2" thermals="no"/>
</package>
<package name="M8_SCREW_HALF">
<wire x1="0" y1="-4" x2="4" y2="0" width="0" layer="20" curve="90"/>
<wire x1="4" y1="0" x2="0" y2="4" width="0" layer="20" curve="90"/>
<wire x1="0" y1="4" x2="-1" y2="4" width="0" layer="20"/>
<wire x1="0" y1="-4" x2="-1" y2="-4" width="0" layer="20"/>
<wire x1="-1" y1="-4" x2="-1" y2="-8" width="0" layer="20"/>
<wire x1="-1" y1="4" x2="-1" y2="8" width="0" layer="20"/>
<smd name="P$1" x="6" y="0" dx="1" dy="1" layer="1" thermals="no" cream="no"/>
<polygon width="0" layer="1">
<vertex x="0" y="4.2" curve="-90"/>
<vertex x="4.2" y="0" curve="-90"/>
<vertex x="0" y="-4.2"/>
<vertex x="-0.8" y="-4.2"/>
<vertex x="-0.8" y="-7"/>
<vertex x="0" y="-7" curve="90"/>
<vertex x="7" y="0" curve="90"/>
<vertex x="0" y="8"/>
<vertex x="-0.8" y="7"/>
<vertex x="-0.8" y="4.2"/>
</polygon>
<polygon width="0" layer="29" pour="hatch">
<vertex x="0" y="4.2" curve="-90"/>
<vertex x="4.2" y="0" curve="-90"/>
<vertex x="0" y="-4.2"/>
<vertex x="-0.8" y="-4.2"/>
<vertex x="-0.8" y="-8"/>
<vertex x="0" y="-8" curve="90"/>
<vertex x="8" y="0" curve="90"/>
<vertex x="0" y="8"/>
<vertex x="-0.8" y="8"/>
<vertex x="-0.8" y="4.2"/>
</polygon>
<polygon width="0" layer="16">
<vertex x="0" y="4.2" curve="-90"/>
<vertex x="4.2" y="0" curve="-90"/>
<vertex x="0" y="-4.2"/>
<vertex x="-0.8" y="-4.2"/>
<vertex x="-0.8" y="-8"/>
<vertex x="0" y="-8" curve="90"/>
<vertex x="8" y="0" curve="90"/>
<vertex x="0" y="8"/>
<vertex x="-0.8" y="8"/>
<vertex x="-0.8" y="4.2"/>
</polygon>
<polygon width="0" layer="30">
<vertex x="0" y="4.2" curve="-90"/>
<vertex x="4.2" y="0" curve="-90"/>
<vertex x="0" y="-4.2"/>
<vertex x="-0.8" y="-4.2"/>
<vertex x="-0.8" y="-8"/>
<vertex x="0" y="-8" curve="90"/>
<vertex x="8" y="0" curve="90"/>
<vertex x="0" y="8"/>
<vertex x="-0.8" y="8"/>
<vertex x="-0.8" y="4.2"/>
</polygon>
<polygon width="0" layer="30" pour="hatch">
<vertex x="0" y="4.2" curve="-90"/>
<vertex x="4.2" y="0" curve="-90"/>
<vertex x="0" y="-4.2"/>
<vertex x="-0.8" y="-4.2"/>
<vertex x="-0.8" y="-8"/>
<vertex x="0" y="-8" curve="90"/>
<vertex x="8" y="0" curve="90"/>
<vertex x="0" y="8"/>
<vertex x="-0.8" y="8"/>
<vertex x="-0.8" y="4.2"/>
</polygon>
<polygon width="0" layer="1">
<vertex x="0" y="4.2" curve="-90"/>
<vertex x="4.2" y="0" curve="-90"/>
<vertex x="0" y="-4.2"/>
<vertex x="-0.8" y="-4.2"/>
<vertex x="-0.8" y="-8"/>
<vertex x="0" y="-8" curve="90"/>
<vertex x="8" y="0" curve="90"/>
<vertex x="0" y="8"/>
<vertex x="-0.8" y="8"/>
<vertex x="-0.8" y="4.2"/>
</polygon>
</package>
<package name="M2.5_SCREW_TENTED">
<pad name="P$1" x="0" y="0" drill="2.55" diameter="5.2" stop="no" thermals="no"/>
<circle x="0" y="0" radius="2.4" width="0.5" layer="21"/>
<circle x="0" y="0" radius="2.4" width="0.5" layer="22"/>
</package>
<package name="M2.5_SCREW_UNTENTED">
<pad name="P$1" x="0" y="0" drill="2.55" diameter="5.2" thermals="no"/>
</package>
<package name="M3_SCREW_UNTENTED">
<pad name="P$1" x="0" y="0" drill="3.05" diameter="6.2" thermals="no"/>
</package>
<package name="M2_NUT">
<pad name="P$1" x="0" y="0" drill="2.05" diameter="4.2" stop="no" thermals="no"/>
<polygon width="0.2" layer="1">
<vertex x="-2.31" y="0"/>
<vertex x="-1.155" y="2"/>
<vertex x="1.155" y="2"/>
<vertex x="2.31" y="0"/>
<vertex x="1.155" y="-2"/>
<vertex x="-1.155" y="-2"/>
</polygon>
<polygon width="0.4" layer="29">
<vertex x="-2.31" y="0"/>
<vertex x="-1.155" y="2"/>
<vertex x="1.155" y="2"/>
<vertex x="2.31" y="0"/>
<vertex x="1.155" y="-2"/>
<vertex x="-1.155" y="-2"/>
</polygon>
</package>
<package name="M5_SCREW_UNTENTED">
<pad name="P$1" x="0" y="0" drill="5.05" diameter="10.2" thermals="no"/>
</package>
<package name="M6_SCREW_UNTENTED">
<pad name="P$1" x="0" y="0" drill="6.05" diameter="11.7" thermals="no"/>
</package>
<package name="4MM_PIN">
<pad name="1" x="0" y="0" drill="4" thermals="no"/>
<circle x="0" y="0" radius="4.1" width="0" layer="1"/>
<circle x="0" y="0" radius="4.2" width="0" layer="29"/>
<circle x="0" y="0" radius="4.1" width="0" layer="42"/>
</package>
<package name="MOLEX_SOLARSPEC">
<pad name="1" x="0" y="0" drill="5.15" diameter="8" thermals="no"/>
</package>
<package name="SWITCH_PTS-525">
<wire x1="-3" y1="2.75" x2="-2.75" y2="3" width="0.25" layer="21"/>
<wire x1="-2.75" y1="3" x2="2.75" y2="3" width="0.25" layer="21"/>
<wire x1="2.75" y1="3" x2="3" y2="2.75" width="0.25" layer="21"/>
<wire x1="3" y1="0.5" x2="3" y2="-0.5" width="0.25" layer="21"/>
<wire x1="-3" y1="-2.75" x2="-2.75" y2="-3" width="0.25" layer="21"/>
<wire x1="-2.75" y1="-3" x2="2.75" y2="-3" width="0.25" layer="21"/>
<wire x1="2.75" y1="-3" x2="3" y2="-2.75" width="0.25" layer="21"/>
<wire x1="-3" y1="0.5" x2="-3" y2="-0.5" width="0.25" layer="21"/>
<smd name="1@1" x="-2.85" y="1.85" dx="2.3" dy="1.1" layer="1" thermals="no"/>
<smd name="1@2" x="2.85" y="1.85" dx="2.3" dy="1.1" layer="1" thermals="no"/>
<smd name="2@1" x="-2.85" y="-1.85" dx="2.3" dy="1.1" layer="1" thermals="no"/>
<smd name="2@2" x="2.85" y="-1.85" dx="2.3" dy="1.1" layer="1" thermals="no"/>
<rectangle x1="-3.2" y1="-2.1" x2="3.2" y2="-1.6" layer="51"/>
<rectangle x1="-3.2" y1="1.6" x2="3.2" y2="2.1" layer="51"/>
<rectangle x1="-2.625" y1="-2.625" x2="2.625" y2="2.625" layer="51"/>
</package>
<package name="0402_LED">
<wire x1="-0.1" y1="0.55" x2="0.1" y2="0.55" width="0.1" layer="51"/>
<wire x1="0" y1="0.5" x2="-0.1" y2="0.35" width="0.1" layer="51"/>
<wire x1="-0.1" y1="0.35" x2="0" y2="0.35" width="0.1" layer="51"/>
<wire x1="0" y1="0.35" x2="0.1" y2="0.35" width="0.1" layer="51"/>
<wire x1="0.1" y1="0.35" x2="0" y2="0.5" width="0.1" layer="51"/>
<wire x1="0" y1="0.35" x2="0" y2="0.25" width="0.1" layer="51"/>
<wire x1="0" y1="0.35" x2="0" y2="0.65" width="0.1" layer="51"/>
<wire x1="-0.3" y1="0.4" x2="-0.2" y2="0.5" width="0.01" layer="51" curve="90"/>
<wire x1="-0.2" y1="0.5" x2="0.2" y2="0.5" width="0.01" layer="51"/>
<wire x1="0.2" y1="0.5" x2="0.3" y2="0.4" width="0.01" layer="51" curve="90"/>
<wire x1="0.3" y1="0.4" x2="0.3" y2="-0.4" width="0.01" layer="51"/>
<wire x1="0.3" y1="-0.4" x2="0.2" y2="-0.5" width="0.01" layer="51" curve="90"/>
<wire x1="0.2" y1="-0.5" x2="-0.2" y2="-0.5" width="0.01" layer="51"/>
<wire x1="-0.2" y1="-0.5" x2="-0.3" y2="-0.4" width="0.01" layer="51" curve="90"/>
<wire x1="-0.3" y1="-0.4" x2="-0.3" y2="0.4" width="0.01" layer="51"/>
<smd name="A" x="0" y="-0.5" dx="0.6" dy="0.5" layer="1" thermals="no"/>
<smd name="C" x="0" y="0.5" dx="0.6" dy="0.5" layer="1" thermals="no"/>
<polygon width="0" layer="51">
<vertex x="-0.3" y="0.03"/>
<vertex x="-0.2" y="0.03"/>
<vertex x="-0.2" y="0.1"/>
<vertex x="0.2" y="0.1"/>
<vertex x="0.2" y="0.03"/>
<vertex x="0.3" y="0.03"/>
<vertex x="0.3" y="-0.1"/>
<vertex x="-0.3" y="-0.1"/>
</polygon>
</package>
<package name="1206_LITE-ON_RM">
<smd name="A" x="-1.7" y="0" dx="1" dy="1.6" layer="1" thermals="no"/>
<smd name="K" x="1.7" y="0" dx="1" dy="1.6" layer="1" thermals="no"/>
<text x="2.4" y="-0.8" size="1.6" layer="21" font="vector" ratio="15">K</text>
<rectangle x1="-1.6" y1="-0.8" x2="1.6" y2="0.8" layer="51"/>
<rectangle x1="-0.75" y1="-0.8" x2="0.75" y2="0.8" layer="52"/>
<hole x="0" y="0" drill="2.2"/>
</package>
<package name="XLAMP_XM-L_ALT_OUTLINE">
<wire x1="-2.75" y1="2.25" x2="-3" y2="2.25" width="0.25" layer="21"/>
<wire x1="3" y1="2" x2="2.75" y2="2" width="0.25" layer="21"/>
<wire x1="2.75" y1="2" x2="2.75" y2="-1.75" width="0.25" layer="21"/>
<wire x1="2.75" y1="-1.75" x2="3" y2="-1.75" width="0.25" layer="21"/>
<wire x1="3" y1="-1.75" x2="3.25" y2="-1.75" width="0.25" layer="21"/>
<wire x1="-3.25" y1="-1.75" x2="-3" y2="-1.75" width="0.25" layer="21"/>
<wire x1="-3" y1="-1.75" x2="-2.75" y2="-1.75" width="0.25" layer="21"/>
<wire x1="-2.75" y1="-1.75" x2="-2.75" y2="2" width="0.25" layer="21"/>
<wire x1="-2.45" y1="2.45" x2="2.45" y2="2.45" width="0.127" layer="51"/>
<wire x1="2.45" y1="2.45" x2="2.45" y2="0" width="0.127" layer="51"/>
<wire x1="2.45" y1="0" x2="2.45" y2="-2.45" width="0.127" layer="51"/>
<wire x1="2.45" y1="-2.45" x2="-2.45" y2="-2.45" width="0.127" layer="51"/>
<wire x1="-2.45" y1="-2.45" x2="-2.45" y2="2.45" width="0.127" layer="51"/>
<wire x1="2" y1="0.5" x2="2" y2="-0.5" width="0.127" layer="51"/>
<wire x1="1.5" y1="0" x2="2.45" y2="0" width="0.127" layer="51"/>
<circle x="0" y="0" radius="2.236" width="0.127" layer="51"/>
<smd name="C" x="-2.4" y="0" dx="1" dy="4.8" layer="1" stop="no" thermals="no" cream="no"/>
<smd name="A" x="2.4" y="0" dx="1" dy="4.8" layer="1" stop="no" thermals="no" cream="no"/>
<smd name="T" x="0" y="0" dx="2.782" dy="4.8" layer="1" stop="no" thermals="no" cream="no"/>
<rectangle x1="-2.5" y1="-2.5" x2="-1.55" y2="-1.7" layer="51"/>
<rectangle x1="1.55" y1="-2.5" x2="2.5" y2="-1.7" layer="51"/>
<rectangle x1="-2.5" y1="2" x2="-2" y2="2.5" layer="51"/>
<rectangle x1="2" y1="2" x2="2.5" y2="2.5" layer="51"/>
<rectangle x1="-2.5" y1="-2.5" x2="-1.8" y2="2.5" layer="29"/>
<rectangle x1="1.8" y1="-2.5" x2="2.5" y2="2.5" layer="29"/>
<rectangle x1="-2.35" y1="-2.35" x2="-1.95" y2="2.35" layer="31"/>
<rectangle x1="1.95" y1="-2.35" x2="2.35" y2="2.35" layer="31"/>
<rectangle x1="-1.5" y1="-2.5" x2="1.5" y2="2.5" layer="29"/>
<rectangle x1="-1.35" y1="-2.35" x2="1.35" y2="2.35" layer="31"/>
<wire x1="-2.75" y1="-1.75" x2="-2.75" y2="-2.25" width="0.25" layer="21"/>
<wire x1="-3.25" y1="-2.25" x2="-3.25" y2="-1.75" width="0.25" layer="21"/>
<wire x1="-2.75" y1="-2.25" x2="-3" y2="-2.25" width="0.25" layer="21"/>
<wire x1="-3" y1="-2.25" x2="-3.25" y2="-2.25" width="0.25" layer="21"/>
<wire x1="3.25" y1="-1.75" x2="3.25" y2="-2.25" width="0.25" layer="21"/>
<wire x1="2.75" y1="-2.25" x2="2.75" y2="-1.75" width="0.25" layer="21"/>
<wire x1="3.25" y1="-2.25" x2="3" y2="-2.25" width="0.25" layer="21"/>
<wire x1="3" y1="-2.25" x2="2.75" y2="-2.25" width="0.25" layer="21"/>
<wire x1="-2.75" y1="2.25" x2="-2.75" y2="2" width="0.25" layer="21"/>
<wire x1="-2.75" y1="2" x2="-3" y2="2" width="0.25" layer="21"/>
<wire x1="-3" y1="2" x2="-3" y2="2.25" width="0.25" layer="21"/>
<wire x1="3" y1="2.25" x2="3" y2="2" width="0.25" layer="21"/>
<wire x1="3" y1="2.25" x2="2.75" y2="2.25" width="0.25" layer="21"/>
<wire x1="2.75" y1="2.25" x2="2.75" y2="2" width="0.25" layer="21"/>
<wire x1="-3" y1="-1.75" x2="-3" y2="-2.25" width="0.25" layer="21"/>
<wire x1="3" y1="-1.75" x2="3" y2="-2.25" width="0.25" layer="21"/>
</package>
<package name="SMD_PIN_3">
<wire x1="-3.75" y1="3.75" x2="-3.75" y2="3.625" width="0.127" layer="21"/>
<wire x1="-3.75" y1="3.625" x2="-3.75" y2="3.5" width="0.127" layer="21"/>
<wire x1="-3.75" y1="3.5" x2="-3.75" y2="1.5" width="0.127" layer="21"/>
<wire x1="-3.75" y1="1.5" x2="-3.75" y2="1.375" width="0.127" layer="21"/>
<wire x1="-3.75" y1="1.375" x2="-3.75" y2="1.25" width="0.127" layer="21"/>
<wire x1="-3.75" y1="1.25" x2="-3.75" y2="-1.25" width="0.127" layer="21"/>
<wire x1="-3.75" y1="-1.25" x2="-3.75" y2="-3.75" width="0.127" layer="21"/>
<wire x1="-3.75" y1="-3.75" x2="3.75" y2="-3.75" width="0.127" layer="21"/>
<wire x1="3.75" y1="-3.75" x2="3.75" y2="-1.25" width="0.127" layer="21"/>
<wire x1="3.75" y1="-1.25" x2="3.75" y2="1.25" width="0.127" layer="21"/>
<wire x1="3.75" y1="1.25" x2="3.75" y2="1.375" width="0.127" layer="21"/>
<wire x1="3.75" y1="1.375" x2="3.75" y2="1.5" width="0.127" layer="21"/>
<wire x1="3.75" y1="1.5" x2="3.75" y2="3.5" width="0.127" layer="21"/>
<wire x1="3.75" y1="3.5" x2="3.75" y2="3.625" width="0.127" layer="21"/>
<wire x1="3.75" y1="3.625" x2="3.75" y2="3.75" width="0.127" layer="21"/>
<wire x1="3.75" y1="3.75" x2="3.625" y2="3.75" width="0.127" layer="21"/>
<wire x1="3.625" y1="3.75" x2="3.5" y2="3.75" width="0.127" layer="21"/>
<wire x1="3.5" y1="3.75" x2="-3.5" y2="3.75" width="0.127" layer="21"/>
<wire x1="-3.5" y1="3.75" x2="-3.625" y2="3.75" width="0.127" layer="21"/>
<wire x1="-3.625" y1="3.75" x2="-3.75" y2="3.75" width="0.127" layer="21"/>
<wire x1="-3.75" y1="4" x2="3.75" y2="4" width="0.127" layer="21"/>
<wire x1="3.75" y1="4" x2="3.75" y2="3.75" width="0.127" layer="21"/>
<wire x1="-3.75" y1="4" x2="-3.75" y2="3.75" width="0.127" layer="21"/>
<wire x1="-3.75" y1="4" x2="-3.75" y2="4.25" width="0.127" layer="21"/>
<wire x1="-3.75" y1="4.25" x2="3.75" y2="4.25" width="0.127" layer="21"/>
<wire x1="3.75" y1="4.25" x2="3.75" y2="4" width="0.127" layer="21"/>
<wire x1="-3.75" y1="1.25" x2="-3.625" y2="1.25" width="0.127" layer="21"/>
<wire x1="-3.625" y1="1.25" x2="-3.5" y2="1.25" width="0.127" layer="21"/>
<wire x1="-3.5" y1="1.25" x2="-3.75" y2="1.5" width="0.127" layer="21"/>
<wire x1="3.5" y1="1.25" x2="3.625" y2="1.25" width="0.127" layer="21"/>
<wire x1="3.625" y1="1.25" x2="3.75" y2="1.25" width="0.127" layer="21"/>
<wire x1="3.5" y1="1.25" x2="3.75" y2="1.5" width="0.127" layer="21"/>
<wire x1="3.5" y1="3.75" x2="3.75" y2="3.5" width="0.127" layer="21"/>
<wire x1="-3.75" y1="3.5" x2="-3.5" y2="3.75" width="0.127" layer="21"/>
<wire x1="-3.75" y1="3.625" x2="-3.625" y2="3.75" width="0.127" layer="21"/>
<wire x1="3.625" y1="3.75" x2="3.75" y2="3.625" width="0.127" layer="21"/>
<wire x1="3.625" y1="1.25" x2="3.75" y2="1.375" width="0.127" layer="21"/>
<wire x1="-3.75" y1="1.375" x2="-3.625" y2="1.25" width="0.127" layer="21"/>
<wire x1="-3.5" y1="1.25" x2="3.5" y2="1.25" width="0.127" layer="21"/>
<wire x1="-3.75" y1="-1.25" x2="3.75" y2="-1.25" width="0.127" layer="21"/>
<smd name="GND" x="0" y="2.5" dx="7" dy="2" layer="1" roundness="30" thermals="no"/>
<smd name="VDD" x="0" y="0" dx="7" dy="2" layer="1" thermals="no"/>
<smd name="DATA" x="0" y="-2.5" dx="7" dy="2" layer="1" thermals="no"/>
</package>
<package name="SOT-563">
<wire x1="-0.8" y1="0.6" x2="0.8" y2="0.6" width="0.1" layer="51"/>
<wire x1="0.8" y1="0.6" x2="0.8" y2="-0.6" width="0.1" layer="51"/>
<wire x1="0.8" y1="-0.6" x2="-0.8" y2="-0.6" width="0.1" layer="51"/>
<wire x1="-0.8" y1="-0.6" x2="-0.8" y2="0.6" width="0.1" layer="51"/>
<smd name="1" x="-0.5" y="-0.7" dx="0.3" dy="0.5" layer="1" thermals="no"/>
<smd name="2" x="0" y="-0.7" dx="0.3" dy="0.5" layer="1" thermals="no"/>
<smd name="3" x="0.5" y="-0.7" dx="0.3" dy="0.5" layer="1" thermals="no"/>
<smd name="4" x="0.5" y="0.7" dx="0.3" dy="0.5" layer="1" thermals="no"/>
<smd name="5" x="0" y="0.7" dx="0.3" dy="0.5" layer="1" thermals="no"/>
<smd name="6" x="-0.5" y="0.7" dx="0.3" dy="0.5" layer="1" thermals="no"/>
<rectangle x1="-0.6" y1="-0.8" x2="-0.4" y2="-0.6" layer="51"/>
<rectangle x1="-0.1" y1="-0.8" x2="0.1" y2="-0.6" layer="51"/>
<rectangle x1="0.4" y1="-0.8" x2="0.6" y2="-0.6" layer="51"/>
<rectangle x1="0.4" y1="0.6" x2="0.6" y2="0.8" layer="51"/>
<rectangle x1="-0.1" y1="0.6" x2="0.1" y2="0.8" layer="51"/>
<rectangle x1="-0.6" y1="0.6" x2="-0.4" y2="0.8" layer="51"/>
<wire x1="-0.9" y1="0.8" x2="-1" y2="0.8" width="0.25" layer="21"/>
<wire x1="-1" y1="0.8" x2="-1" y2="-0.7" width="0.25" layer="21"/>
<wire x1="-1" y1="-0.7" x2="-0.9" y2="-0.8" width="0.25" layer="21"/>
<wire x1="0.9" y1="0.8" x2="1" y2="0.8" width="0.25" layer="21"/>
<wire x1="1" y1="0.8" x2="1" y2="-0.8" width="0.25" layer="21"/>
<wire x1="1" y1="-0.8" x2="0.9" y2="-0.8" width="0.25" layer="21"/>
</package>
<package name="POWER-DI123">
<wire x1="-1.6875" y1="1" x2="-1.6875" y2="1.125" width="0.25" layer="21"/>
<wire x1="-1.6875" y1="1.125" x2="1.6875" y2="1.125" width="0.25" layer="21"/>
<wire x1="-1.6875" y1="-1" x2="-1.6875" y2="-1.125" width="0.25" layer="21"/>
<wire x1="-1.6875" y1="-1.125" x2="1.6875" y2="-1.125" width="0.25" layer="21"/>
<smd name="K" x="-0.95" y="0" dx="2.2" dy="1.4" layer="1" thermals="no"/>
<smd name="A" x="1.6" y="0" dx="0.9" dy="1.4" layer="1" thermals="no"/>
<rectangle x1="-1.5" y1="-0.965" x2="1.5" y2="0.965" layer="51"/>
<rectangle x1="-1.95" y1="-0.625" x2="1.95" y2="0.625" layer="51"/>
</package>
<package name="IKON_SMILEY">
<wire x1="-5.715" y1="3.175" x2="-5.715" y2="-3.175" width="0.127" layer="51"/>
<wire x1="-5.715" y1="-3.175" x2="5.715" y2="-3.175" width="0.127" layer="51"/>
<wire x1="5.715" y1="-3.175" x2="5.715" y2="3.175" width="0.127" layer="51"/>
<wire x1="5.715" y1="3.175" x2="-5.715" y2="3.175" width="0.127" layer="51"/>
<circle x="-2.4003" y="1.8542" radius="0.81" width="0.127" layer="21"/>
<circle x="2.2225" y="1.8669" radius="1.016" width="0.127" layer="21"/>
<polygon width="0.127" layer="21">
<vertex x="-2.9464" y="2.3876"/>
<vertex x="-2.8194" y="2.5146"/>
<vertex x="-2.6416" y="2.5146"/>
<vertex x="-2.5908" y="2.5654"/>
<vertex x="-2.413" y="2.5654"/>
<vertex x="-2.3876" y="2.5908"/>
<vertex x="-2.2352" y="2.5908"/>
<vertex x="-2.2098" y="2.5654"/>
<vertex x="-2.1336" y="2.5654"/>
<vertex x="-2.032" y="2.4638"/>
<vertex x="-1.9558" y="2.4638"/>
<vertex x="-1.8542" y="2.3622"/>
<vertex x="-1.8542" y="2.3368"/>
<vertex x="-1.7018" y="2.1844"/>
<vertex x="-1.6764" y="1.9558"/>
<vertex x="-1.7018" y="1.7018"/>
<vertex x="-1.7526" y="1.4732"/>
<vertex x="-1.8796" y="1.3462"/>
<vertex x="-2.032" y="1.2192"/>
<vertex x="-2.286" y="1.1176"/>
<vertex x="-2.54" y="1.1684"/>
<vertex x="-2.7432" y="1.1938"/>
<vertex x="-2.8956" y="1.3208"/>
<vertex x="-3.0734" y="1.524"/>
<vertex x="-3.1242" y="1.8034"/>
<vertex x="-3.0988" y="2.0828"/>
<vertex x="-2.9972" y="2.286"/>
<vertex x="-2.9464" y="2.3622"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="1.27" y="2.0574"/>
<vertex x="1.397" y="2.3622"/>
<vertex x="1.651" y="2.6162"/>
<vertex x="2.0066" y="2.794"/>
<vertex x="2.4384" y="2.794"/>
<vertex x="2.8956" y="2.5654"/>
<vertex x="3.1496" y="2.1082"/>
<vertex x="3.1242" y="1.5494"/>
<vertex x="2.8448" y="1.1176"/>
<vertex x="2.286" y="0.9144"/>
<vertex x="1.7526" y="1.0414"/>
<vertex x="1.4224" y="1.3716"/>
<vertex x="1.27" y="1.778"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-3.2004" y="-1.9558"/>
<vertex x="-3.3274" y="-1.6256"/>
<vertex x="-3.4036" y="-1.2954"/>
<vertex x="-3.4544" y="-0.9398"/>
<vertex x="-3.4544" y="-0.6858"/>
<vertex x="-3.4036" y="-0.6096"/>
<vertex x="-3.3528" y="-0.5588"/>
<vertex x="-2.9972" y="-0.5588"/>
<vertex x="-2.8956" y="-0.5842"/>
<vertex x="-2.7686" y="-0.6604"/>
<vertex x="-2.7178" y="-0.7366"/>
<vertex x="-2.7178" y="-0.762"/>
<vertex x="-2.7432" y="-0.889"/>
<vertex x="-2.9464" y="-1.3208"/>
<vertex x="-3.1242" y="-1.7526"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-2.4384" y="-0.9144"/>
<vertex x="-2.5908" y="-1.1684"/>
<vertex x="-2.9464" y="-1.8796"/>
<vertex x="-3.0226" y="-2.0828"/>
<vertex x="-3.0226" y="-2.1336"/>
<vertex x="-2.9972" y="-2.1844"/>
<vertex x="-2.921" y="-2.2352"/>
<vertex x="-2.6924" y="-2.286"/>
<vertex x="-2.3622" y="-2.286"/>
<vertex x="-2.3114" y="-2.2606"/>
<vertex x="-2.3114" y="-2.2098"/>
<vertex x="-2.3368" y="-1.9812"/>
<vertex x="-2.3876" y="-1.651"/>
<vertex x="-2.413" y="-1.3462"/>
<vertex x="-2.4384" y="-1.0922"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-2.0574" y="-2.1844"/>
<vertex x="-1.8796" y="-1.6256"/>
<vertex x="-1.7272" y="-1.27"/>
<vertex x="-1.5748" y="-0.7874"/>
<vertex x="-1.5748" y="-0.762"/>
<vertex x="-1.6764" y="-0.7366"/>
<vertex x="-1.9304" y="-0.7366"/>
<vertex x="-2.0828" y="-0.7874"/>
<vertex x="-2.1844" y="-0.8382"/>
<vertex x="-2.2352" y="-0.889"/>
<vertex x="-2.2606" y="-0.9906"/>
<vertex x="-2.2606" y="-1.1938"/>
<vertex x="-2.2098" y="-1.5748"/>
<vertex x="-2.0828" y="-2.2352"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-1.27" y="-0.889"/>
<vertex x="-1.397" y="-1.0414"/>
<vertex x="-1.524" y="-1.27"/>
<vertex x="-1.6256" y="-1.4986"/>
<vertex x="-1.7018" y="-1.7272"/>
<vertex x="-1.7526" y="-1.8542"/>
<vertex x="-1.8034" y="-2.0574"/>
<vertex x="-1.8288" y="-2.2606"/>
<vertex x="-1.8288" y="-2.4384"/>
<vertex x="-1.778" y="-2.5146"/>
<vertex x="-1.6764" y="-2.5654"/>
<vertex x="-1.5748" y="-2.5908"/>
<vertex x="-1.3462" y="-2.5908"/>
<vertex x="-1.1176" y="-2.54"/>
<vertex x="-0.9144" y="-2.4384"/>
<vertex x="-1.016" y="-2.1082"/>
<vertex x="-1.143" y="-1.6764"/>
<vertex x="-1.2446" y="-1.2954"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="0.0762" y="-1.1938"/>
<vertex x="-0.0508" y="-1.6002"/>
<vertex x="-0.2032" y="-2.0574"/>
<vertex x="-0.3048" y="-2.3876"/>
<vertex x="-0.3302" y="-2.5146"/>
<vertex x="-0.3302" y="-2.5908"/>
<vertex x="-0.254" y="-2.6416"/>
<vertex x="-0.127" y="-2.6924"/>
<vertex x="-0.0254" y="-2.7178"/>
<vertex x="0.1524" y="-2.7178"/>
<vertex x="0.3048" y="-2.667"/>
<vertex x="0.4064" y="-2.5908"/>
<vertex x="0.4064" y="-2.5146"/>
<vertex x="0.381" y="-2.286"/>
<vertex x="0.3048" y="-1.9558"/>
<vertex x="0.1016" y="-1.1938"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-0.127" y="-1.016"/>
<vertex x="-0.2794" y="-0.8636"/>
<vertex x="-0.381" y="-0.7874"/>
<vertex x="-0.4826" y="-0.7366"/>
<vertex x="-0.635" y="-0.7366"/>
<vertex x="-0.7366" y="-0.7874"/>
<vertex x="-0.8636" y="-0.9144"/>
<vertex x="-0.9144" y="-1.0922"/>
<vertex x="-0.9144" y="-1.4478"/>
<vertex x="-0.8636" y="-1.7526"/>
<vertex x="-0.7366" y="-2.2098"/>
<vertex x="-0.6096" y="-2.4892"/>
<vertex x="-0.4826" y="-2.0066"/>
<vertex x="-0.2794" y="-1.4224"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="0.2794" y="-0.9906"/>
<vertex x="0.5334" y="-0.8382"/>
<vertex x="0.6858" y="-0.762"/>
<vertex x="0.7874" y="-0.7366"/>
<vertex x="0.889" y="-0.7874"/>
<vertex x="0.9398" y="-0.8382"/>
<vertex x="0.9652" y="-0.9906"/>
<vertex x="0.9652" y="-1.3208"/>
<vertex x="0.9398" y="-1.524"/>
<vertex x="0.889" y="-1.8542"/>
<vertex x="0.7874" y="-2.2352"/>
<vertex x="0.7112" y="-2.4892"/>
<vertex x="0.6604" y="-2.5908"/>
<vertex x="0.635" y="-2.3622"/>
<vertex x="0.5334" y="-1.8542"/>
<vertex x="0.4318" y="-1.4986"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="1.3208" y="-1.2446"/>
<vertex x="1.27" y="-1.4478"/>
<vertex x="1.1938" y="-1.651"/>
<vertex x="1.0414" y="-2.1082"/>
<vertex x="0.9652" y="-2.3114"/>
<vertex x="0.9144" y="-2.5654"/>
<vertex x="0.9906" y="-2.6416"/>
<vertex x="1.143" y="-2.6924"/>
<vertex x="1.3208" y="-2.7178"/>
<vertex x="1.524" y="-2.7178"/>
<vertex x="1.6002" y="-2.667"/>
<vertex x="1.6256" y="-2.5654"/>
<vertex x="1.6256" y="-2.3114"/>
<vertex x="1.5748" y="-2.0066"/>
<vertex x="1.4986" y="-1.7272"/>
<vertex x="1.397" y="-1.4224"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="1.905" y="-2.3622"/>
<vertex x="2.1844" y="-2.0828"/>
<vertex x="2.4384" y="-1.6256"/>
<vertex x="2.5146" y="-1.3716"/>
<vertex x="2.54" y="-1.0668"/>
<vertex x="2.4384" y="-0.8128"/>
<vertex x="2.3114" y="-0.7112"/>
<vertex x="2.159" y="-0.6604"/>
<vertex x="2.0066" y="-0.6604"/>
<vertex x="1.8542" y="-0.7112"/>
<vertex x="1.6764" y="-0.8128"/>
<vertex x="1.5494" y="-0.9144"/>
<vertex x="1.524" y="-0.9906"/>
<vertex x="1.5494" y="-1.1176"/>
<vertex x="1.6764" y="-1.3208"/>
<vertex x="1.8034" y="-1.4732"/>
<vertex x="1.905" y="-1.6002"/>
<vertex x="1.9812" y="-1.7526"/>
<vertex x="1.9812" y="-2.1336"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="2.8448" y="-0.7366"/>
<vertex x="2.7686" y="-1.016"/>
<vertex x="2.4892" y="-1.9812"/>
<vertex x="2.4384" y="-2.1336"/>
<vertex x="2.4384" y="-2.1844"/>
<vertex x="2.5146" y="-2.2098"/>
<vertex x="2.6416" y="-2.2098"/>
<vertex x="2.8448" y="-2.159"/>
<vertex x="3.048" y="-2.0828"/>
<vertex x="3.2512" y="-1.9558"/>
<vertex x="3.3528" y="-1.8542"/>
<vertex x="3.3528" y="-1.7526"/>
<vertex x="3.2766" y="-1.5494"/>
<vertex x="3.175" y="-1.3208"/>
<vertex x="3.0734" y="-1.143"/>
<vertex x="2.9972" y="-0.9906"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="3.6068" y="-1.524"/>
<vertex x="3.7338" y="-1.1684"/>
<vertex x="3.7846" y="-0.9398"/>
<vertex x="3.81" y="-0.7366"/>
<vertex x="3.7846" y="-0.5842"/>
<vertex x="3.7592" y="-0.5334"/>
<vertex x="3.6068" y="-0.508"/>
<vertex x="3.429" y="-0.508"/>
<vertex x="3.2512" y="-0.5588"/>
<vertex x="3.175" y="-0.635"/>
<vertex x="3.175" y="-0.7112"/>
<vertex x="3.2258" y="-0.8382"/>
<vertex x="3.3274" y="-0.9906"/>
<vertex x="3.4544" y="-1.1938"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="4.1656" y="-0.4064"/>
<vertex x="4.3688" y="-0.762"/>
<vertex x="4.4704" y="-1.016"/>
<vertex x="4.4704" y="-1.143"/>
<vertex x="4.3942" y="-1.2446"/>
<vertex x="4.2672" y="-1.2954"/>
<vertex x="4.064" y="-1.2954"/>
<vertex x="3.9878" y="-1.27"/>
<vertex x="3.9624" y="-1.2192"/>
<vertex x="3.9878" y="-1.0668"/>
<vertex x="4.0386" y="-0.8636"/>
<vertex x="4.1148" y="-0.6096"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="4.826" y="-0.6096"/>
<vertex x="4.7752" y="-0.4318"/>
<vertex x="4.7498" y="-0.254"/>
<vertex x="4.699" y="-0.2032"/>
<vertex x="4.5212" y="-0.2032"/>
<vertex x="4.4704" y="-0.254"/>
<vertex x="4.4196" y="-0.3302"/>
<vertex x="4.4704" y="-0.381"/>
<vertex x="4.572" y="-0.4572"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="4.9022" y="0.1016"/>
<vertex x="5.207" y="-0.1524"/>
<vertex x="5.1054" y="-0.2794"/>
<vertex x="4.9784" y="-0.381"/>
<vertex x="4.9784" y="-0.2286"/>
<vertex x="4.953" y="-0.0762"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="5.2832" y="0.2032"/>
<vertex x="5.0546" y="0.5842"/>
<vertex x="5.0038" y="0.635"/>
<vertex x="4.953" y="0.5842"/>
<vertex x="4.9022" y="0.4318"/>
<vertex x="4.9276" y="0.3302"/>
<vertex x="5.0292" y="0.2794"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="5.0292" y="0.8382"/>
<vertex x="5.2578" y="0.9398"/>
<vertex x="5.2832" y="0.9398"/>
<vertex x="5.3086" y="0.889"/>
<vertex x="5.3086" y="0.7112"/>
<vertex x="5.2832" y="0.635"/>
<vertex x="5.08" y="0.8128"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="5.1562" y="1.143"/>
<vertex x="5.0038" y="1.2192"/>
<vertex x="4.953" y="1.2192"/>
<vertex x="4.953" y="1.1176"/>
<vertex x="4.9784" y="1.016"/>
<vertex x="5.08" y="1.1176"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="4.9276" y="1.3716"/>
<vertex x="4.8006" y="1.3716"/>
<vertex x="4.8006" y="1.3208"/>
<vertex x="4.8514" y="1.3716"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="4.6482" y="1.2446"/>
<vertex x="4.6736" y="1.2954"/>
<vertex x="4.699" y="1.27"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-3.6068" y="-0.5588"/>
<vertex x="-3.7338" y="-0.6604"/>
<vertex x="-3.8862" y="-0.8636"/>
<vertex x="-3.9878" y="-1.0668"/>
<vertex x="-4.0386" y="-1.27"/>
<vertex x="-4.0386" y="-1.4478"/>
<vertex x="-3.9624" y="-1.5748"/>
<vertex x="-3.9116" y="-1.651"/>
<vertex x="-3.7846" y="-1.7526"/>
<vertex x="-3.683" y="-1.8034"/>
<vertex x="-3.6068" y="-1.8288"/>
<vertex x="-3.5052" y="-1.8288"/>
<vertex x="-3.5052" y="-1.6764"/>
<vertex x="-3.556" y="-1.397"/>
<vertex x="-3.5814" y="-1.1176"/>
<vertex x="-3.6068" y="-0.7874"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-4.2164" y="-1.1684"/>
<vertex x="-4.318" y="-0.7874"/>
<vertex x="-4.3434" y="-0.6096"/>
<vertex x="-4.3688" y="-0.381"/>
<vertex x="-4.318" y="-0.3048"/>
<vertex x="-4.0132" y="-0.3048"/>
<vertex x="-3.8862" y="-0.3302"/>
<vertex x="-3.81" y="-0.3556"/>
<vertex x="-3.8354" y="-0.4318"/>
<vertex x="-3.9624" y="-0.6604"/>
<vertex x="-4.1656" y="-1.0414"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-4.4958" y="-0.2794"/>
<vertex x="-4.572" y="-0.3302"/>
<vertex x="-4.6736" y="-0.4318"/>
<vertex x="-4.7752" y="-0.5588"/>
<vertex x="-4.7752" y="-0.6858"/>
<vertex x="-4.7244" y="-0.8128"/>
<vertex x="-4.5212" y="-1.016"/>
<vertex x="-4.4704" y="-1.0414"/>
<vertex x="-4.445" y="-0.9906"/>
<vertex x="-4.4704" y="-0.7874"/>
<vertex x="-4.4958" y="-0.5588"/>
<vertex x="-4.5085" y="-0.4191"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-4.8768" y="-0.4064"/>
<vertex x="-4.699" y="-0.2032"/>
<vertex x="-4.6228" y="-0.127"/>
<vertex x="-4.699" y="-0.0508"/>
<vertex x="-4.8768" y="0.0508"/>
<vertex x="-4.9276" y="0.0254"/>
<vertex x="-4.9276" y="-0.2032"/>
<vertex x="-4.9022" y="-0.4064"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-5.0546" y="0.1016"/>
<vertex x="-5.1562" y="0.0762"/>
<vertex x="-5.2324" y="0.0254"/>
<vertex x="-5.2324" y="-0.0508"/>
<vertex x="-5.207" y="-0.127"/>
<vertex x="-5.1054" y="-0.2794"/>
<vertex x="-5.08" y="-0.3048"/>
<vertex x="-5.08" y="0.0254"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-5.0546" y="0.3048"/>
<vertex x="-5.1054" y="0.4572"/>
<vertex x="-5.1308" y="0.5588"/>
<vertex x="-5.1816" y="0.4572"/>
<vertex x="-5.2324" y="0.3302"/>
<vertex x="-5.2578" y="0.2032"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-5.1816" y="0.7112"/>
<vertex x="-5.3086" y="0.7874"/>
<vertex x="-5.3594" y="0.6604"/>
<vertex x="-5.3848" y="0.4318"/>
<vertex x="-5.2832" y="0.635"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-5.2324" y="0.9144"/>
<vertex x="-5.0038" y="0.9906"/>
<vertex x="-5.0546" y="0.8382"/>
<vertex x="-5.08" y="0.8128"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-5.1943" y="1.0795"/>
<vertex x="-5.08" y="1.1938"/>
<vertex x="-4.9911" y="1.1303"/>
<vertex x="-5.1562" y="1.0922"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-4.9022" y="1.27"/>
<vertex x="-4.7498" y="1.2446"/>
<vertex x="-4.8514" y="1.1684"/>
</polygon>
</package>
<package name="IKON_MAHAL-TENGWAR">
<wire x1="-4.318" y1="2.794" x2="4.572" y2="2.794" width="0.127" layer="51"/>
<wire x1="4.572" y1="2.794" x2="4.572" y2="-2.032" width="0.127" layer="51"/>
<wire x1="4.572" y1="-2.032" x2="-4.318" y2="-2.032" width="0.127" layer="51"/>
<wire x1="-4.318" y1="-2.032" x2="-4.318" y2="2.794" width="0.127" layer="51"/>
<polygon width="0.127" layer="21">
<vertex x="-3.937" y="-0.381"/>
<vertex x="-1.143" y="-0.381"/>
<vertex x="-0.889" y="-0.127"/>
<vertex x="-3.683" y="-0.127"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-3.937" y="0.889"/>
<vertex x="-3.8862" y="0.889"/>
<vertex x="-3.8354" y="0.9398"/>
<vertex x="-3.7846" y="0.9398"/>
<vertex x="-3.7338" y="0.9906"/>
<vertex x="-3.683" y="0.9906"/>
<vertex x="-3.556" y="1.1176"/>
<vertex x="-3.556" y="-0.0508"/>
<vertex x="-3.683" y="-0.0508"/>
<vertex x="-3.81" y="-0.1778"/>
<vertex x="-3.81" y="0.762"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-3.4544" y="0.635"/>
<vertex x="-3.2766" y="0.8382"/>
<vertex x="-3.1242" y="0.9652"/>
<vertex x="-2.9718" y="1.016"/>
<vertex x="-2.54" y="1.016"/>
<vertex x="-2.413" y="0.889"/>
<vertex x="-2.3368" y="0.7874"/>
<vertex x="-2.286" y="0.635"/>
<vertex x="-2.286" y="0.5334"/>
<vertex x="-2.3368" y="0.2794"/>
<vertex x="-2.413" y="0.1016"/>
<vertex x="-2.54" y="-0.0254"/>
<vertex x="-2.4384" y="0.2032"/>
<vertex x="-2.4384" y="0.381"/>
<vertex x="-2.4892" y="0.4826"/>
<vertex x="-2.54" y="0.6096"/>
<vertex x="-2.6416" y="0.6858"/>
<vertex x="-2.7178" y="0.7366"/>
<vertex x="-2.7686" y="0.7366"/>
<vertex x="-2.9972" y="0.762"/>
<vertex x="-3.0226" y="0.762"/>
<vertex x="-3.1496" y="0.7366"/>
<vertex x="-3.2512" y="0.7112"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-2.1844" y="0.635"/>
<vertex x="-2.0066" y="0.8382"/>
<vertex x="-1.8542" y="0.9652"/>
<vertex x="-1.7018" y="1.016"/>
<vertex x="-1.27" y="1.016"/>
<vertex x="-1.143" y="0.889"/>
<vertex x="-1.0668" y="0.7874"/>
<vertex x="-1.016" y="0.635"/>
<vertex x="-1.016" y="0.5334"/>
<vertex x="-1.0668" y="0.2794"/>
<vertex x="-1.143" y="0.1016"/>
<vertex x="-1.27" y="-0.0254"/>
<vertex x="-1.1684" y="0.2032"/>
<vertex x="-1.1684" y="0.381"/>
<vertex x="-1.2192" y="0.4826"/>
<vertex x="-1.27" y="0.6096"/>
<vertex x="-1.3716" y="0.6858"/>
<vertex x="-1.4478" y="0.7366"/>
<vertex x="-1.4986" y="0.7366"/>
<vertex x="-1.7272" y="0.762"/>
<vertex x="-1.7526" y="0.762"/>
<vertex x="-1.8796" y="0.7366"/>
<vertex x="-1.9812" y="0.7112"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-2.667" y="1.778"/>
<vertex x="-2.54" y="1.905"/>
<vertex x="-2.413" y="1.778"/>
<vertex x="-2.54" y="1.651"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-2.3368" y="2.159"/>
<vertex x="-2.2098" y="2.286"/>
<vertex x="-2.0828" y="2.159"/>
<vertex x="-2.2098" y="2.032"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-2.0066" y="1.778"/>
<vertex x="-1.8796" y="1.905"/>
<vertex x="-1.7526" y="1.778"/>
<vertex x="-1.8796" y="1.651"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-0.4318" y="1.778"/>
<vertex x="-0.3048" y="1.905"/>
<vertex x="-0.1778" y="1.778"/>
<vertex x="-0.3048" y="1.651"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-0.1016" y="2.159"/>
<vertex x="0.0254" y="2.286"/>
<vertex x="0.1524" y="2.159"/>
<vertex x="0.0254" y="2.032"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="0.2286" y="1.778"/>
<vertex x="0.3556" y="1.905"/>
<vertex x="0.4826" y="1.778"/>
<vertex x="0.3556" y="1.651"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="0.254" y="0.7874"/>
<vertex x="0.3556" y="0.7874"/>
<vertex x="0.4318" y="0.8636"/>
<vertex x="0.4318" y="0.9398"/>
<vertex x="0.3302" y="1.016"/>
<vertex x="0.0508" y="1.016"/>
<vertex x="-0.0254" y="0.9906"/>
<vertex x="-0.2032" y="0.8636"/>
<vertex x="-0.2286" y="0.8128"/>
<vertex x="-0.2794" y="0.762"/>
<vertex x="-0.3302" y="0.6858"/>
<vertex x="-0.381" y="0.635"/>
<vertex x="-0.4064" y="0.5588"/>
<vertex x="-0.4572" y="0.4572"/>
<vertex x="-0.508" y="0.381"/>
<vertex x="-0.5334" y="0.2794"/>
<vertex x="-0.5334" y="-0.127"/>
<vertex x="-0.4318" y="-0.254"/>
<vertex x="-0.3048" y="-0.381"/>
<vertex x="0.0508" y="-0.381"/>
<vertex x="0.2286" y="-0.3302"/>
<vertex x="0.4572" y="-0.2032"/>
<vertex x="0.635" y="-0.0254"/>
<vertex x="0.6858" y="0.0508"/>
<vertex x="0.2794" y="-0.1016"/>
<vertex x="0.1016" y="-0.1016"/>
<vertex x="-0.0762" y="-0.0762"/>
<vertex x="-0.2032" y="0.0508"/>
<vertex x="-0.254" y="0.1778"/>
<vertex x="-0.2794" y="0.2794"/>
<vertex x="-0.3048" y="0.4826"/>
<vertex x="-0.2794" y="0.6096"/>
<vertex x="-0.2032" y="0.762"/>
<vertex x="-0.0762" y="0.8636"/>
<vertex x="0.0254" y="0.889"/>
<vertex x="0.127" y="0.8636"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="0.635" y="2.286"/>
<vertex x="0.7874" y="2.3622"/>
<vertex x="1.016" y="2.54"/>
<vertex x="1.016" y="-0.0254"/>
<vertex x="1.143" y="0"/>
<vertex x="1.0922" y="-0.127"/>
<vertex x="0.9398" y="-0.254"/>
<vertex x="0.7366" y="-0.3556"/>
<vertex x="0.762" y="-0.1524"/>
<vertex x="0.762" y="2.1844"/>
<vertex x="0.6096" y="2.159"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="1.524" y="0.635"/>
<vertex x="1.5494" y="0.762"/>
<vertex x="1.651" y="0.889"/>
<vertex x="1.905" y="1.016"/>
<vertex x="4.191" y="1.016"/>
<vertex x="3.9116" y="0.762"/>
<vertex x="1.7272" y="0.762"/>
<vertex x="1.6256" y="0.7112"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="2.5908" y="0.6604"/>
<vertex x="2.413" y="0.5588"/>
<vertex x="2.2606" y="0.4318"/>
<vertex x="2.1082" y="0.2794"/>
<vertex x="1.9812" y="0.1016"/>
<vertex x="1.8796" y="-0.0254"/>
<vertex x="1.778" y="-0.254"/>
<vertex x="1.7526" y="-0.4318"/>
<vertex x="1.7272" y="-0.635"/>
<vertex x="1.7272" y="-0.9652"/>
<vertex x="1.7526" y="-1.1176"/>
<vertex x="1.8288" y="-1.3208"/>
<vertex x="1.9304" y="-1.4732"/>
<vertex x="2.1082" y="-1.6256"/>
<vertex x="2.2606" y="-1.7272"/>
<vertex x="2.4638" y="-1.778"/>
<vertex x="2.6162" y="-1.8034"/>
<vertex x="2.8194" y="-1.8034"/>
<vertex x="3.0226" y="-1.778"/>
<vertex x="3.2766" y="-1.6764"/>
<vertex x="3.5306" y="-1.5494"/>
<vertex x="3.7084" y="-1.397"/>
<vertex x="3.8354" y="-1.1938"/>
<vertex x="3.8608" y="-1.0414"/>
<vertex x="3.8608" y="-0.9144"/>
<vertex x="3.81" y="-0.8382"/>
<vertex x="3.7084" y="-0.762"/>
<vertex x="3.6068" y="-0.762"/>
<vertex x="3.556" y="-0.8128"/>
<vertex x="3.5306" y="-0.9144"/>
<vertex x="3.556" y="-1.2192"/>
<vertex x="3.5306" y="-1.3462"/>
<vertex x="3.4798" y="-1.4224"/>
<vertex x="3.3782" y="-1.524"/>
<vertex x="3.2004" y="-1.6002"/>
<vertex x="2.8702" y="-1.6002"/>
<vertex x="2.7432" y="-1.5748"/>
<vertex x="2.54" y="-1.4986"/>
<vertex x="2.3876" y="-1.3716"/>
<vertex x="2.2098" y="-1.1938"/>
<vertex x="2.1336" y="-1.0414"/>
<vertex x="2.0828" y="-0.889"/>
<vertex x="2.032" y="-0.6096"/>
<vertex x="2.0574" y="-0.3048"/>
<vertex x="2.1082" y="-0.127"/>
<vertex x="2.1844" y="0.127"/>
<vertex x="2.286" y="0.3048"/>
<vertex x="2.3368" y="0.4064"/>
<vertex x="2.4892" y="0.5842"/>
<vertex x="2.7178" y="0.7366"/>
</polygon>
</package>
<package name="IKON_AULE-TENGWAR">
<wire x1="-2.667" y1="-2.54" x2="2.667" y2="-2.54" width="0.127" layer="51"/>
<wire x1="2.667" y1="-2.54" x2="2.667" y2="2.54" width="0.127" layer="51"/>
<wire x1="2.667" y1="2.54" x2="-2.667" y2="2.54" width="0.127" layer="51"/>
<wire x1="-2.667" y1="2.54" x2="-2.667" y2="-2.54" width="0.127" layer="51"/>
<polygon width="0.127" layer="21">
<vertex x="-0.254" y="0.127"/>
<vertex x="-0.2032" y="0.1778"/>
<vertex x="-0.1016" y="0.2286"/>
<vertex x="0.0254" y="0.254"/>
<vertex x="2.159" y="0.254"/>
<vertex x="2.413" y="0.508"/>
<vertex x="0.127" y="0.508"/>
<vertex x="0.0254" y="0.4826"/>
<vertex x="-0.0762" y="0.4318"/>
<vertex x="-0.127" y="0.381"/>
<vertex x="-0.1778" y="0.3048"/>
<vertex x="-0.2286" y="0.254"/>
<vertex x="-0.254" y="0.1778"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="0.9398" y="0.254"/>
<vertex x="0.762" y="0.127"/>
<vertex x="0.6096" y="0"/>
<vertex x="0.3556" y="-0.254"/>
<vertex x="0.2032" y="-0.4572"/>
<vertex x="0.1524" y="-0.508"/>
<vertex x="0.0762" y="-0.6604"/>
<vertex x="0.0254" y="-0.8128"/>
<vertex x="-0.0254" y="-0.9906"/>
<vertex x="-0.0254" y="-1.5494"/>
<vertex x="0" y="-1.6764"/>
<vertex x="0.0762" y="-1.8288"/>
<vertex x="0.127" y="-1.905"/>
<vertex x="0.254" y="-2.032"/>
<vertex x="0.381" y="-2.1336"/>
<vertex x="0.508" y="-2.2098"/>
<vertex x="0.6604" y="-2.2606"/>
<vertex x="0.8128" y="-2.286"/>
<vertex x="0.9652" y="-2.286"/>
<vertex x="1.143" y="-2.2606"/>
<vertex x="1.3208" y="-2.1844"/>
<vertex x="1.4986" y="-2.0828"/>
<vertex x="1.7272" y="-1.9304"/>
<vertex x="1.8796" y="-1.8034"/>
<vertex x="2.0066" y="-1.651"/>
<vertex x="2.032" y="-1.4478"/>
<vertex x="1.9812" y="-1.3462"/>
<vertex x="1.905" y="-1.2954"/>
<vertex x="1.8288" y="-1.3208"/>
<vertex x="1.7526" y="-1.3716"/>
<vertex x="1.7272" y="-1.4732"/>
<vertex x="1.7272" y="-1.5748"/>
<vertex x="1.7018" y="-1.8542"/>
<vertex x="1.6002" y="-1.9558"/>
<vertex x="1.2954" y="-2.1082"/>
<vertex x="1.0414" y="-2.1082"/>
<vertex x="0.7874" y="-2.0066"/>
<vertex x="0.4826" y="-1.7018"/>
<vertex x="0.4064" y="-1.5748"/>
<vertex x="0.3302" y="-1.397"/>
<vertex x="0.2794" y="-1.143"/>
<vertex x="0.2794" y="-0.8382"/>
<vertex x="0.381" y="-0.508"/>
<vertex x="0.5588" y="-0.1778"/>
<vertex x="0.762" y="0.0762"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="1.27" y="0.889"/>
<vertex x="2.2606" y="2.032"/>
<vertex x="2.3368" y="2.286"/>
<vertex x="2.2606" y="2.286"/>
<vertex x="2.159" y="2.2098"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-2.1082" y="0.2286"/>
<vertex x="-1.905" y="0.4064"/>
<vertex x="-1.6764" y="0.508"/>
<vertex x="-1.4224" y="0.5334"/>
<vertex x="-1.1176" y="0.4826"/>
<vertex x="-0.8382" y="0.3556"/>
<vertex x="-0.7366" y="0.254"/>
<vertex x="-0.6858" y="0.1016"/>
<vertex x="-0.6604" y="-0.0508"/>
<vertex x="-0.6858" y="-0.2032"/>
<vertex x="-0.762" y="-0.4064"/>
<vertex x="-0.9906" y="-0.762"/>
<vertex x="-0.9906" y="-0.7112"/>
<vertex x="-1.016" y="-0.6858"/>
<vertex x="-0.889" y="-0.5588"/>
<vertex x="-0.889" y="-0.1016"/>
<vertex x="-1.1684" y="0.1778"/>
<vertex x="-1.397" y="0.254"/>
<vertex x="-1.5748" y="0.254"/>
<vertex x="-1.7526" y="0.2286"/>
<vertex x="-1.9558" y="0.1778"/>
<vertex x="-2.0828" y="0.127"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-2.1082" y="0.2286"/>
<vertex x="-2.286" y="0"/>
<vertex x="-2.413" y="-0.2032"/>
<vertex x="-2.4384" y="-0.3556"/>
<vertex x="-2.4384" y="-0.635"/>
<vertex x="-2.3368" y="-0.762"/>
<vertex x="-2.1844" y="-0.889"/>
<vertex x="-1.8796" y="-0.9906"/>
<vertex x="-1.651" y="-1.016"/>
<vertex x="-1.4478" y="-1.016"/>
<vertex x="-1.3462" y="-0.9906"/>
<vertex x="-1.016" y="-0.7874"/>
<vertex x="-1.0668" y="-0.7112"/>
<vertex x="-1.397" y="-0.7874"/>
<vertex x="-1.7272" y="-0.7874"/>
<vertex x="-1.8796" y="-0.7366"/>
<vertex x="-2.1336" y="-0.4826"/>
<vertex x="-2.159" y="-0.2794"/>
<vertex x="-2.159" y="-0.1016"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-1.905" y="1.27"/>
<vertex x="-1.778" y="1.397"/>
<vertex x="-1.651" y="1.27"/>
<vertex x="-1.778" y="1.143"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-1.5748" y="1.651"/>
<vertex x="-1.4478" y="1.778"/>
<vertex x="-1.3208" y="1.651"/>
<vertex x="-1.4478" y="1.524"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-1.2446" y="1.27"/>
<vertex x="-1.1176" y="1.397"/>
<vertex x="-0.9906" y="1.27"/>
<vertex x="-1.1176" y="1.143"/>
</polygon>
</package>
<package name="IKON_LEARNING_10MIL">
<wire x1="-4.318" y1="-4.318" x2="-4.318" y2="4.318" width="0.254" layer="21"/>
<wire x1="-4.318" y1="4.318" x2="4.318" y2="4.318" width="0.254" layer="21"/>
<wire x1="4.318" y1="4.318" x2="4.318" y2="-4.318" width="0.254" layer="21"/>
<wire x1="4.318" y1="-4.318" x2="-4.318" y2="-4.318" width="0.254" layer="21"/>
<polygon width="0.127" layer="21">
<vertex x="-3.8735" y="2.7305"/>
<vertex x="-3.8735" y="3.8735"/>
<vertex x="-2.7305" y="3.8735"/>
<vertex x="-2.7305" y="2.7305"/>
<vertex x="-3.81" y="2.7305"/>
<vertex x="-3.7465" y="2.7305"/>
<vertex x="-3.7465" y="3.7465"/>
<vertex x="-2.8575" y="3.7465"/>
<vertex x="-2.8575" y="2.8575"/>
<vertex x="-3.8735" y="2.8575"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-4.1275" y="2.3495"/>
<vertex x="-2.3495" y="2.3495"/>
<vertex x="-2.3495" y="4.1275"/>
<vertex x="-1.9685" y="4.1275"/>
<vertex x="-1.9685" y="4.0005"/>
<vertex x="-2.2225" y="4.0005"/>
<vertex x="-2.2225" y="3.6195"/>
<vertex x="-1.9685" y="3.6195"/>
<vertex x="-1.9685" y="3.4925"/>
<vertex x="-2.2225" y="3.4925"/>
<vertex x="-2.2225" y="3.1115"/>
<vertex x="-1.7145" y="3.1115"/>
<vertex x="-1.7145" y="2.3495"/>
<vertex x="-1.3335" y="2.3495"/>
<vertex x="-1.3335" y="3.1115"/>
<vertex x="-1.2065" y="3.1115"/>
<vertex x="-1.2065" y="2.8575"/>
<vertex x="-0.9525" y="2.8575"/>
<vertex x="-0.9525" y="2.7305"/>
<vertex x="-1.2065" y="2.7305"/>
<vertex x="-1.2065" y="1.8415"/>
<vertex x="-0.9525" y="1.8415"/>
<vertex x="-0.9525" y="1.7145"/>
<vertex x="-1.4605" y="1.7145"/>
<vertex x="-1.4605" y="1.4605"/>
<vertex x="-1.5875" y="1.4605"/>
<vertex x="-1.5875" y="1.8415"/>
<vertex x="-1.3335" y="1.8415"/>
<vertex x="-1.3335" y="2.2225"/>
<vertex x="-2.159" y="2.2225"/>
<vertex x="-2.159" y="2.3495"/>
<vertex x="-1.8415" y="2.3495"/>
<vertex x="-1.8415" y="2.9845"/>
<vertex x="-2.2225" y="2.9845"/>
<vertex x="-2.2225" y="2.2225"/>
<vertex x="-4.1275" y="2.2225"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-1.5875" y="3.3655"/>
<vertex x="-1.4605" y="3.3655"/>
<vertex x="-1.4605" y="3.2385"/>
<vertex x="-1.5875" y="3.2385"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-1.5875" y="3.7465"/>
<vertex x="-1.5875" y="4.1275"/>
<vertex x="-0.6985" y="4.1275"/>
<vertex x="-0.6985" y="4.0005"/>
<vertex x="-1.4605" y="4.0005"/>
<vertex x="-1.4605" y="3.7465"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-0.3175" y="4.1275"/>
<vertex x="-0.1905" y="4.1275"/>
<vertex x="-0.1905" y="4.0005"/>
<vertex x="-0.3175" y="4.0005"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-0.5715" y="3.8735"/>
<vertex x="-0.4445" y="3.8735"/>
<vertex x="-0.4445" y="3.4925"/>
<vertex x="-0.9525" y="3.4925"/>
<vertex x="-0.9525" y="3.2385"/>
<vertex x="-1.0795" y="3.2385"/>
<vertex x="-1.0795" y="3.6195"/>
<vertex x="-0.5715" y="3.6195"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="0.1905" y="3.8735"/>
<vertex x="0.3175" y="3.8735"/>
<vertex x="0.3175" y="3.4925"/>
<vertex x="0.0635" y="3.4925"/>
<vertex x="0.0635" y="3.2385"/>
<vertex x="-0.0635" y="3.2385"/>
<vertex x="-0.0635" y="3.6195"/>
<vertex x="0.1905" y="3.6195"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-0.5715" y="3.1115"/>
<vertex x="-0.1905" y="3.1115"/>
<vertex x="-0.1905" y="2.9845"/>
<vertex x="-0.5715" y="2.9845"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-0.3175" y="2.6035"/>
<vertex x="-0.1905" y="2.6035"/>
<vertex x="-0.1905" y="2.4765"/>
<vertex x="-0.3175" y="2.4765"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="0.6985" y="3.8735"/>
<vertex x="1.0795" y="3.8735"/>
<vertex x="1.0795" y="3.7465"/>
<vertex x="0.8255" y="3.7465"/>
<vertex x="0.8255" y="3.2385"/>
<vertex x="0.4445" y="3.2385"/>
<vertex x="0.4445" y="3.3655"/>
<vertex x="0.6985" y="3.3655"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="1.4605" y="4.1275"/>
<vertex x="1.5875" y="4.1275"/>
<vertex x="1.5875" y="4.0005"/>
<vertex x="1.4605" y="4.0005"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-0.8255" y="2.6035"/>
<vertex x="-0.6985" y="2.6035"/>
<vertex x="-0.6985" y="2.3495"/>
<vertex x="-0.4445" y="2.3495"/>
<vertex x="-0.4445" y="1.8415"/>
<vertex x="-0.1905" y="1.8415"/>
<vertex x="-0.1905" y="1.7145"/>
<vertex x="-0.5715" y="1.7145"/>
<vertex x="-0.5715" y="2.2225"/>
<vertex x="-0.8255" y="2.2225"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-0.0635" y="2.0955"/>
<vertex x="0.0635" y="2.0955"/>
<vertex x="0.0635" y="1.9685"/>
<vertex x="-0.0635" y="1.9685"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="0.1905" y="2.8575"/>
<vertex x="0.3175" y="2.8575"/>
<vertex x="0.3175" y="2.3495"/>
<vertex x="0.5715" y="2.3495"/>
<vertex x="0.5715" y="1.9685"/>
<vertex x="0.4445" y="1.9685"/>
<vertex x="0.4445" y="2.2225"/>
<vertex x="0.1905" y="2.2225"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="0.6985" y="2.8575"/>
<vertex x="0.8255" y="2.8575"/>
<vertex x="0.8255" y="2.4765"/>
<vertex x="0.6985" y="2.4765"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="1.9685" y="4.1275"/>
<vertex x="2.3495" y="4.1275"/>
<vertex x="2.3495" y="2.413"/>
<vertex x="2.2225" y="2.413"/>
<vertex x="2.2225" y="2.9845"/>
<vertex x="1.9685" y="2.9845"/>
<vertex x="1.9685" y="3.1115"/>
<vertex x="2.2225" y="3.1115"/>
<vertex x="2.2225" y="4.0005"/>
<vertex x="1.9685" y="4.0005"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="1.7145" y="3.8735"/>
<vertex x="1.8415" y="3.8735"/>
<vertex x="1.8415" y="3.4925"/>
<vertex x="1.7145" y="3.4925"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="1.2065" y="3.3655"/>
<vertex x="1.5875" y="3.3655"/>
<vertex x="1.5875" y="2.8575"/>
<vertex x="1.8415" y="2.8575"/>
<vertex x="1.8415" y="2.413"/>
<vertex x="1.7145" y="2.413"/>
<vertex x="1.7145" y="2.7305"/>
<vertex x="1.4605" y="2.7305"/>
<vertex x="1.4605" y="3.2385"/>
<vertex x="1.2065" y="3.2385"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="1.2065" y="2.6035"/>
<vertex x="1.3335" y="2.6035"/>
<vertex x="1.3335" y="2.4765"/>
<vertex x="1.2065" y="2.4765"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="2.7305" y="3.8735"/>
<vertex x="3.8735" y="3.8735"/>
<vertex x="3.8735" y="2.7305"/>
<vertex x="2.7305" y="2.7305"/>
<vertex x="2.7305" y="3.81"/>
<vertex x="2.8575" y="3.81"/>
<vertex x="2.8575" y="2.8575"/>
<vertex x="3.7465" y="2.8575"/>
<vertex x="3.7465" y="3.7465"/>
<vertex x="2.7305" y="3.7465"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="0.9525" y="2.0955"/>
<vertex x="1.3335" y="2.0955"/>
<vertex x="1.3335" y="1.9685"/>
<vertex x="0.9525" y="1.9685"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="1.4605" y="1.8415"/>
<vertex x="1.5875" y="1.8415"/>
<vertex x="1.5875" y="1.7145"/>
<vertex x="1.4605" y="1.7145"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="1.4605" y="2.3495"/>
<vertex x="4.1275" y="2.3495"/>
<vertex x="4.1275" y="1.9685"/>
<vertex x="4.0005" y="1.9685"/>
<vertex x="4.0005" y="2.2225"/>
<vertex x="3.6195" y="2.2225"/>
<vertex x="3.6195" y="1.8415"/>
<vertex x="3.8735" y="1.8415"/>
<vertex x="3.8735" y="1.7145"/>
<vertex x="3.4925" y="1.7145"/>
<vertex x="3.4925" y="2.2225"/>
<vertex x="3.1115" y="2.2225"/>
<vertex x="3.1115" y="1.5875"/>
<vertex x="3.3655" y="1.5875"/>
<vertex x="3.3655" y="1.4605"/>
<vertex x="2.4765" y="1.4605"/>
<vertex x="2.4765" y="1.5875"/>
<vertex x="2.7305" y="1.5875"/>
<vertex x="2.7305" y="1.8415"/>
<vertex x="2.9845" y="1.8415"/>
<vertex x="2.9845" y="2.2225"/>
<vertex x="2.6035" y="2.2225"/>
<vertex x="2.6035" y="1.9685"/>
<vertex x="2.4765" y="1.9685"/>
<vertex x="2.4765" y="2.2225"/>
<vertex x="2.0955" y="2.2225"/>
<vertex x="2.0955" y="1.7145"/>
<vertex x="1.9685" y="1.7145"/>
<vertex x="1.9685" y="1.9685"/>
<vertex x="1.7145" y="1.9685"/>
<vertex x="1.7145" y="2.2225"/>
<vertex x="1.4605" y="2.2225"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="4.0005" y="1.5875"/>
<vertex x="4.1275" y="1.5875"/>
<vertex x="4.1275" y="1.2065"/>
<vertex x="4.0005" y="1.2065"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="3.2385" y="1.0795"/>
<vertex x="3.8735" y="1.0795"/>
<vertex x="3.8735" y="0.6985"/>
<vertex x="3.4925" y="0.6985"/>
<vertex x="3.4925" y="0.9525"/>
<vertex x="3.2385" y="0.9525"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="4.0005" y="0.5715"/>
<vertex x="4.1275" y="0.5715"/>
<vertex x="4.1275" y="0.4445"/>
<vertex x="4.0005" y="0.4445"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="4.0005" y="0.0635"/>
<vertex x="4.1275" y="0.0635"/>
<vertex x="4.1275" y="-0.0635"/>
<vertex x="4.0005" y="-0.0635"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="4.0005" y="-0.4445"/>
<vertex x="4.1275" y="-0.4445"/>
<vertex x="4.1275" y="-1.0795"/>
<vertex x="3.8735" y="-1.0795"/>
<vertex x="3.8735" y="-1.4605"/>
<vertex x="4.1275" y="-1.4605"/>
<vertex x="4.1275" y="-1.8415"/>
<vertex x="4.0005" y="-1.8415"/>
<vertex x="4.0005" y="-1.5875"/>
<vertex x="3.2385" y="-1.5875"/>
<vertex x="3.2385" y="-1.4605"/>
<vertex x="3.4925" y="-1.4605"/>
<vertex x="3.4925" y="-1.0795"/>
<vertex x="3.2385" y="-1.0795"/>
<vertex x="3.2385" y="-0.9525"/>
<vertex x="3.7465" y="-0.9525"/>
<vertex x="3.7465" y="-0.6985"/>
<vertex x="4.0005" y="-0.6985"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="2.9845" y="-1.2065"/>
<vertex x="3.1115" y="-1.2065"/>
<vertex x="3.1115" y="-1.3335"/>
<vertex x="2.9845" y="-1.3335"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="2.9845" y="-1.7145"/>
<vertex x="3.1115" y="-1.7145"/>
<vertex x="3.1115" y="-1.8415"/>
<vertex x="2.9845" y="-1.8415"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="3.2385" y="-1.9685"/>
<vertex x="3.8735" y="-1.9685"/>
<vertex x="3.8735" y="-2.2225"/>
<vertex x="4.1275" y="-2.2225"/>
<vertex x="4.1275" y="-2.6035"/>
<vertex x="4.0005" y="-2.6035"/>
<vertex x="4.0005" y="-2.3495"/>
<vertex x="3.7465" y="-2.3495"/>
<vertex x="3.7465" y="-2.0955"/>
<vertex x="3.2385" y="-2.0955"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="3.7465" y="-2.7305"/>
<vertex x="3.8735" y="-2.7305"/>
<vertex x="3.8735" y="-2.8575"/>
<vertex x="3.7465" y="-2.8575"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="3.4925" y="-2.9845"/>
<vertex x="3.6195" y="-2.9845"/>
<vertex x="3.6195" y="-3.1115"/>
<vertex x="3.4925" y="-3.1115"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="4.1275" y="-4.1275"/>
<vertex x="4.1275" y="-3.4925"/>
<vertex x="2.8575" y="-3.4925"/>
<vertex x="2.8575" y="-3.2385"/>
<vertex x="2.4765" y="-3.2385"/>
<vertex x="2.4765" y="-3.3655"/>
<vertex x="2.7305" y="-3.3655"/>
<vertex x="2.7305" y="-4.1275"/>
<vertex x="3.6195" y="-4.1275"/>
<vertex x="3.6195" y="-4.0005"/>
<vertex x="3.1115" y="-4.0005"/>
<vertex x="3.1115" y="-3.6195"/>
<vertex x="3.7465" y="-3.6195"/>
<vertex x="3.7465" y="-3.8735"/>
<vertex x="4.0005" y="-3.8735"/>
<vertex x="4.0005" y="-4.1275"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="2.2225" y="-2.8575"/>
<vertex x="2.8575" y="-2.8575"/>
<vertex x="2.8575" y="-2.2225"/>
<vertex x="2.2225" y="-2.2225"/>
<vertex x="2.2225" y="-2.794"/>
<vertex x="2.3495" y="-2.794"/>
<vertex x="2.3495" y="-2.3495"/>
<vertex x="2.7305" y="-2.3495"/>
<vertex x="2.7305" y="-2.7305"/>
<vertex x="2.2225" y="-2.7305"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="2.6035" y="-1.4605"/>
<vertex x="2.6035" y="-1.8415"/>
<vertex x="2.2225" y="-1.8415"/>
<vertex x="2.2225" y="-1.7145"/>
<vertex x="2.4765" y="-1.7145"/>
<vertex x="2.4765" y="-1.4605"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="2.2225" y="-3.4925"/>
<vertex x="2.3495" y="-3.4925"/>
<vertex x="2.3495" y="-3.6195"/>
<vertex x="2.2225" y="-3.6195"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-0.0635" y="-1.4605"/>
<vertex x="1.0795" y="-1.4605"/>
<vertex x="1.0795" y="-1.5875"/>
<vertex x="0.3175" y="-1.5875"/>
<vertex x="0.3175" y="-1.8415"/>
<vertex x="0.1905" y="-1.8415"/>
<vertex x="0.1905" y="-1.5875"/>
<vertex x="-0.0635" y="-1.5875"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="0.4445" y="-1.9685"/>
<vertex x="0.8255" y="-1.9685"/>
<vertex x="0.8255" y="-2.0955"/>
<vertex x="0.4445" y="-2.0955"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="0.1905" y="-2.2225"/>
<vertex x="0.3175" y="-2.2225"/>
<vertex x="0.3175" y="-2.4765"/>
<vertex x="0.8255" y="-2.4765"/>
<vertex x="0.8255" y="-2.7305"/>
<vertex x="1.0795" y="-2.7305"/>
<vertex x="1.0795" y="-2.9845"/>
<vertex x="1.8415" y="-2.9845"/>
<vertex x="1.8415" y="-3.7465"/>
<vertex x="2.0955" y="-3.7465"/>
<vertex x="2.0955" y="-3.8735"/>
<vertex x="1.8415" y="-3.8735"/>
<vertex x="1.8415" y="-4.1275"/>
<vertex x="1.7145" y="-4.1275"/>
<vertex x="1.7145" y="-3.8735"/>
<vertex x="1.4605" y="-3.8735"/>
<vertex x="1.4605" y="-3.1115"/>
<vertex x="0.4445" y="-3.1115"/>
<vertex x="0.4445" y="-2.8575"/>
<vertex x="0.0635" y="-2.8575"/>
<vertex x="0.0635" y="-3.2385"/>
<vertex x="0.3175" y="-3.2385"/>
<vertex x="0.3175" y="-3.3655"/>
<vertex x="0.0635" y="-3.3655"/>
<vertex x="0.0635" y="-3.6195"/>
<vertex x="-0.0635" y="-3.6195"/>
<vertex x="-0.0635" y="-3.3655"/>
<vertex x="-0.3175" y="-3.3655"/>
<vertex x="-0.3175" y="-3.2385"/>
<vertex x="-0.0635" y="-3.2385"/>
<vertex x="-0.0635" y="-2.4765"/>
<vertex x="0.1905" y="-2.4765"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="0.1905" y="-3.7465"/>
<vertex x="0.3175" y="-3.7465"/>
<vertex x="0.3175" y="-3.8735"/>
<vertex x="0.1905" y="-3.8735"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="0.4445" y="-4.0005"/>
<vertex x="0.5715" y="-4.0005"/>
<vertex x="0.5715" y="-4.1275"/>
<vertex x="0.4445" y="-4.1275"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="0.4445" y="-3.4925"/>
<vertex x="1.0795" y="-3.4925"/>
<vertex x="1.0795" y="-4.0005"/>
<vertex x="1.3335" y="-4.0005"/>
<vertex x="1.3335" y="-4.1275"/>
<vertex x="0.9525" y="-4.1275"/>
<vertex x="0.9525" y="-3.8735"/>
<vertex x="0.6985" y="-3.8735"/>
<vertex x="0.6985" y="-3.6195"/>
<vertex x="0.4445" y="-3.6195"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="1.7145" y="-1.9685"/>
<vertex x="1.8415" y="-1.9685"/>
<vertex x="1.8415" y="-2.0955"/>
<vertex x="1.7145" y="-2.0955"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="1.2065" y="-2.2225"/>
<vertex x="1.5875" y="-2.2225"/>
<vertex x="1.5875" y="-2.6035"/>
<vertex x="1.4605" y="-2.6035"/>
<vertex x="1.4605" y="-2.3495"/>
<vertex x="1.2065" y="-2.3495"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="1.5875" y="-1.8415"/>
<vertex x="1.5875" y="-1.5875"/>
<vertex x="2.0955" y="-1.5875"/>
<vertex x="2.0955" y="-1.2065"/>
<vertex x="1.9685" y="-1.2065"/>
<vertex x="1.9685" y="-1.4605"/>
<vertex x="1.5875" y="-1.4605"/>
<vertex x="1.5875" y="-1.0795"/>
<vertex x="1.8415" y="-1.0795"/>
<vertex x="1.8415" y="-0.8255"/>
<vertex x="2.4765" y="-0.8255"/>
<vertex x="2.4765" y="-1.0795"/>
<vertex x="2.6035" y="-1.0795"/>
<vertex x="2.6035" y="-0.4445"/>
<vertex x="2.3495" y="-0.4445"/>
<vertex x="2.3495" y="-0.0635"/>
<vertex x="2.6035" y="-0.0635"/>
<vertex x="2.6035" y="0.1905"/>
<vertex x="2.8575" y="0.1905"/>
<vertex x="2.8575" y="0.3175"/>
<vertex x="2.6035" y="0.3175"/>
<vertex x="2.6035" y="0.5715"/>
<vertex x="2.4765" y="0.5715"/>
<vertex x="2.4765" y="0.0635"/>
<vertex x="2.2225" y="0.0635"/>
<vertex x="2.2225" y="-0.1905"/>
<vertex x="1.9685" y="-0.1905"/>
<vertex x="1.9685" y="-0.4445"/>
<vertex x="1.4605" y="-0.4445"/>
<vertex x="1.4605" y="-0.5715"/>
<vertex x="1.7145" y="-0.5715"/>
<vertex x="1.7145" y="-0.9525"/>
<vertex x="0.8255" y="-0.9525"/>
<vertex x="0.8255" y="-0.4445"/>
<vertex x="0.6985" y="-0.4445"/>
<vertex x="0.6985" y="-0.9525"/>
<vertex x="0.4445" y="-0.9525"/>
<vertex x="0.4445" y="-1.0795"/>
<vertex x="1.4605" y="-1.0795"/>
<vertex x="1.4605" y="-1.8415"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="3.1115" y="-0.8255"/>
<vertex x="3.1115" y="-0.5715"/>
<vertex x="3.3655" y="-0.5715"/>
<vertex x="3.3655" y="-0.0635"/>
<vertex x="3.6195" y="-0.0635"/>
<vertex x="3.6195" y="0.0635"/>
<vertex x="3.3655" y="0.0635"/>
<vertex x="3.3655" y="0.5715"/>
<vertex x="3.1115" y="0.5715"/>
<vertex x="3.1115" y="0.8255"/>
<vertex x="2.7305" y="0.8255"/>
<vertex x="2.7305" y="0.6985"/>
<vertex x="2.9845" y="0.6985"/>
<vertex x="2.9845" y="0.4445"/>
<vertex x="3.2385" y="0.4445"/>
<vertex x="3.2385" y="-0.1905"/>
<vertex x="2.7305" y="-0.1905"/>
<vertex x="2.7305" y="-0.3175"/>
<vertex x="2.9845" y="-0.3175"/>
<vertex x="2.9845" y="-0.8255"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-0.5715" y="-3.7465"/>
<vertex x="-0.4445" y="-3.7465"/>
<vertex x="-0.4445" y="-3.8735"/>
<vertex x="-0.5715" y="-3.8735"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-0.8255" y="-4.0005"/>
<vertex x="-0.6985" y="-4.0005"/>
<vertex x="-0.6985" y="-4.1275"/>
<vertex x="-0.8255" y="-4.1275"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-3.8735" y="-2.7305"/>
<vertex x="-2.7305" y="-2.7305"/>
<vertex x="-2.7305" y="-3.8735"/>
<vertex x="-3.8735" y="-3.8735"/>
<vertex x="-3.8735" y="-2.794"/>
<vertex x="-3.683" y="-2.794"/>
<vertex x="-3.7465" y="-2.794"/>
<vertex x="-3.7465" y="-3.7465"/>
<vertex x="-2.8575" y="-3.7465"/>
<vertex x="-2.8575" y="-2.8575"/>
<vertex x="-3.8735" y="-2.8575"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-0.5715" y="-1.7145"/>
<vertex x="-0.4445" y="-1.7145"/>
<vertex x="-0.4445" y="-1.8415"/>
<vertex x="-0.5715" y="-1.8415"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="2.2225" y="1.3335"/>
<vertex x="2.3495" y="1.3335"/>
<vertex x="2.3495" y="1.2065"/>
<vertex x="2.2225" y="1.2065"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="2.4765" y="1.0795"/>
<vertex x="2.6035" y="1.0795"/>
<vertex x="2.6035" y="0.9525"/>
<vertex x="2.4765" y="0.9525"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="2.2225" y="0.8255"/>
<vertex x="2.3495" y="0.8255"/>
<vertex x="2.3495" y="0.6985"/>
<vertex x="2.2225" y="0.6985"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="1.4605" y="0.8255"/>
<vertex x="1.5875" y="0.8255"/>
<vertex x="1.5875" y="0.5715"/>
<vertex x="2.0955" y="0.5715"/>
<vertex x="2.0955" y="0.1905"/>
<vertex x="1.8415" y="0.1905"/>
<vertex x="1.8415" y="-0.0635"/>
<vertex x="1.7145" y="-0.0635"/>
<vertex x="1.7145" y="0.4445"/>
<vertex x="1.4605" y="0.4445"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="1.7145" y="0.9525"/>
<vertex x="1.8415" y="0.9525"/>
<vertex x="1.8415" y="1.5875"/>
<vertex x="1.7145" y="1.5875"/>
<vertex x="1.7145" y="1.3335"/>
<vertex x="1.4605" y="1.3335"/>
<vertex x="1.4605" y="1.2065"/>
<vertex x="1.7145" y="1.2065"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="0.9525" y="1.0795"/>
<vertex x="1.3335" y="1.0795"/>
<vertex x="1.3335" y="0.9525"/>
<vertex x="0.9525" y="0.9525"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-4.1275" y="1.8415"/>
<vertex x="-4.0005" y="1.8415"/>
<vertex x="-4.0005" y="1.7145"/>
<vertex x="-4.1275" y="1.7145"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-2.8575" y="2.0955"/>
<vertex x="-2.7305" y="2.0955"/>
<vertex x="-2.7305" y="1.9685"/>
<vertex x="-2.8575" y="1.9685"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-2.6035" y="1.8415"/>
<vertex x="-2.4765" y="1.8415"/>
<vertex x="-2.4765" y="1.7145"/>
<vertex x="-2.6035" y="1.7145"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-3.1115" y="1.8415"/>
<vertex x="-2.9845" y="1.8415"/>
<vertex x="-2.9845" y="1.7145"/>
<vertex x="-3.1115" y="1.7145"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-4.1275" y="1.0795"/>
<vertex x="-4.0005" y="1.0795"/>
<vertex x="-4.0005" y="0.9525"/>
<vertex x="-4.1275" y="0.9525"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-3.8735" y="0.5715"/>
<vertex x="-3.7465" y="0.5715"/>
<vertex x="-3.7465" y="0.4445"/>
<vertex x="-3.8735" y="0.4445"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-2.6035" y="0.8255"/>
<vertex x="-2.4765" y="0.8255"/>
<vertex x="-2.4765" y="0.6985"/>
<vertex x="-2.6035" y="0.6985"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-2.0955" y="1.5875"/>
<vertex x="-1.9685" y="1.5875"/>
<vertex x="-1.9685" y="1.4605"/>
<vertex x="-2.0955" y="1.4605"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-1.5875" y="1.0795"/>
<vertex x="-1.4605" y="1.0795"/>
<vertex x="-1.4605" y="0.9525"/>
<vertex x="-1.5875" y="0.9525"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-0.0635" y="1.5875"/>
<vertex x="0.0635" y="1.5875"/>
<vertex x="0.0635" y="1.4605"/>
<vertex x="-0.0635" y="1.4605"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="0.1905" y="1.3335"/>
<vertex x="0.3175" y="1.3335"/>
<vertex x="0.3175" y="1.2065"/>
<vertex x="0.1905" y="1.2065"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="0.4445" y="1.0795"/>
<vertex x="0.5715" y="1.0795"/>
<vertex x="0.5715" y="0.9525"/>
<vertex x="0.4445" y="0.9525"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="0.1905" y="0.8255"/>
<vertex x="0.3175" y="0.8255"/>
<vertex x="0.3175" y="0.6985"/>
<vertex x="0.1905" y="0.6985"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-0.5715" y="0.3175"/>
<vertex x="-0.4445" y="0.3175"/>
<vertex x="-0.4445" y="0.1905"/>
<vertex x="-0.5715" y="0.1905"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-1.3335" y="0.8255"/>
<vertex x="-1.2065" y="0.8255"/>
<vertex x="-1.2065" y="0.5715"/>
<vertex x="-0.9525" y="0.5715"/>
<vertex x="-0.9525" y="0.4445"/>
<vertex x="-1.2065" y="0.4445"/>
<vertex x="-1.2065" y="-0.1905"/>
<vertex x="-0.8255" y="-0.1905"/>
<vertex x="-0.8255" y="0.0635"/>
<vertex x="-0.6985" y="0.0635"/>
<vertex x="-0.6985" y="-0.1905"/>
<vertex x="-0.0635" y="-0.1905"/>
<vertex x="-0.0635" y="0.5715"/>
<vertex x="0.0635" y="0.5715"/>
<vertex x="0.0635" y="0.3175"/>
<vertex x="0.4445" y="0.3175"/>
<vertex x="0.4445" y="0.5715"/>
<vertex x="1.0795" y="0.5715"/>
<vertex x="1.0795" y="0.0635"/>
<vertex x="1.3335" y="0.0635"/>
<vertex x="1.3335" y="-0.3175"/>
<vertex x="0.9525" y="-0.3175"/>
<vertex x="0.9525" y="-0.0635"/>
<vertex x="0.6985" y="-0.0635"/>
<vertex x="0.6985" y="0.1905"/>
<vertex x="0.0635" y="0.1905"/>
<vertex x="0.0635" y="-0.1905"/>
<vertex x="0.3175" y="-0.1905"/>
<vertex x="0.3175" y="-0.8255"/>
<vertex x="0.1905" y="-0.8255"/>
<vertex x="0.1905" y="-0.3175"/>
<vertex x="-0.4445" y="-0.3175"/>
<vertex x="-0.4445" y="-0.5715"/>
<vertex x="-0.6985" y="-0.5715"/>
<vertex x="-0.6985" y="-0.9525"/>
<vertex x="-0.3175" y="-0.9525"/>
<vertex x="-0.3175" y="-0.6985"/>
<vertex x="-0.1905" y="-0.6985"/>
<vertex x="-0.1905" y="-0.9525"/>
<vertex x="0.0635" y="-0.9525"/>
<vertex x="0.0635" y="-1.0795"/>
<vertex x="-0.1905" y="-1.0795"/>
<vertex x="-0.1905" y="-1.3335"/>
<vertex x="-0.3175" y="-1.3335"/>
<vertex x="-0.3175" y="-1.0795"/>
<vertex x="-1.0795" y="-1.0795"/>
<vertex x="-1.0795" y="-0.6985"/>
<vertex x="-0.8255" y="-0.6985"/>
<vertex x="-0.8255" y="-0.3175"/>
<vertex x="-1.3335" y="-0.3175"/>
<vertex x="-1.3335" y="-0.0635"/>
<vertex x="-1.7145" y="-0.0635"/>
<vertex x="-1.7145" y="-0.4445"/>
<vertex x="-1.4605" y="-0.4445"/>
<vertex x="-1.4605" y="-0.5715"/>
<vertex x="-1.9685" y="-0.5715"/>
<vertex x="-1.9685" y="-0.8255"/>
<vertex x="-2.0955" y="-0.8255"/>
<vertex x="-2.0955" y="-0.4445"/>
<vertex x="-1.8415" y="-0.4445"/>
<vertex x="-1.8415" y="-0.0635"/>
<vertex x="-2.0955" y="-0.0635"/>
<vertex x="-2.0955" y="0.0635"/>
<vertex x="-1.8415" y="0.0635"/>
<vertex x="-1.8415" y="0.5715"/>
<vertex x="-1.7145" y="0.5715"/>
<vertex x="-1.7145" y="0.3175"/>
<vertex x="-1.3335" y="0.3175"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="0.4445" y="1.5875"/>
<vertex x="1.0795" y="1.5875"/>
<vertex x="1.0795" y="1.4605"/>
<vertex x="0.4445" y="1.4605"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-1.0795" y="1.3335"/>
<vertex x="-0.4445" y="1.3335"/>
<vertex x="-0.4445" y="1.0795"/>
<vertex x="0.0635" y="1.0795"/>
<vertex x="0.0635" y="0.9525"/>
<vertex x="-0.1905" y="0.9525"/>
<vertex x="-0.1905" y="0.6985"/>
<vertex x="-0.5715" y="0.6985"/>
<vertex x="-0.5715" y="0.9525"/>
<vertex x="-1.0795" y="0.9525"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-3.6195" y="1.5875"/>
<vertex x="-3.2385" y="1.5875"/>
<vertex x="-3.2385" y="1.4605"/>
<vertex x="-3.4925" y="1.4605"/>
<vertex x="-3.4925" y="1.2065"/>
<vertex x="-3.8735" y="1.2065"/>
<vertex x="-3.8735" y="1.3335"/>
<vertex x="-3.6195" y="1.3335"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-3.1115" y="1.3335"/>
<vertex x="-2.2225" y="1.3335"/>
<vertex x="-2.2225" y="1.0795"/>
<vertex x="-1.9685" y="1.0795"/>
<vertex x="-1.9685" y="0.9525"/>
<vertex x="-2.3495" y="0.9525"/>
<vertex x="-2.3495" y="1.2065"/>
<vertex x="-2.9845" y="1.2065"/>
<vertex x="-2.9845" y="0.6985"/>
<vertex x="-3.1115" y="0.6985"/>
<vertex x="-3.1115" y="0.9525"/>
<vertex x="-3.3655" y="0.9525"/>
<vertex x="-3.3655" y="1.0795"/>
<vertex x="-3.1115" y="1.0795"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-3.1115" y="0.3175"/>
<vertex x="-2.4765" y="0.3175"/>
<vertex x="-2.4765" y="0.1905"/>
<vertex x="-2.7305" y="0.1905"/>
<vertex x="-2.7305" y="-0.1905"/>
<vertex x="-2.2225" y="-0.1905"/>
<vertex x="-2.2225" y="-0.3175"/>
<vertex x="-2.7305" y="-0.3175"/>
<vertex x="-2.7305" y="-0.5715"/>
<vertex x="-2.9845" y="-0.5715"/>
<vertex x="-2.9845" y="-1.0795"/>
<vertex x="-3.1115" y="-1.0795"/>
<vertex x="-3.1115" y="-0.8255"/>
<vertex x="-3.3655" y="-0.8255"/>
<vertex x="-3.3655" y="-0.6985"/>
<vertex x="-3.1115" y="-0.6985"/>
<vertex x="-3.1115" y="-0.4445"/>
<vertex x="-2.8575" y="-0.4445"/>
<vertex x="-2.8575" y="-0.0635"/>
<vertex x="-3.1115" y="-0.0635"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-2.6035" y="-0.6985"/>
<vertex x="-2.4765" y="-0.6985"/>
<vertex x="-2.4765" y="-0.8255"/>
<vertex x="-2.6035" y="-0.8255"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-3.3655" y="-0.1905"/>
<vertex x="-3.2385" y="-0.1905"/>
<vertex x="-3.2385" y="-0.3175"/>
<vertex x="-3.3655" y="-0.3175"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-3.4925" y="-0.0635"/>
<vertex x="-3.4925" y="0.0635"/>
<vertex x="-4.1275" y="0.0635"/>
<vertex x="-4.1275" y="-0.0635"/>
<vertex x="-3.8735" y="-0.0635"/>
<vertex x="-3.8735" y="-0.5715"/>
<vertex x="-3.4925" y="-0.5715"/>
<vertex x="-3.4925" y="-0.4445"/>
<vertex x="-3.7465" y="-0.4445"/>
<vertex x="-3.7465" y="-0.0635"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-4.1275" y="-0.6985"/>
<vertex x="-4.0005" y="-0.6985"/>
<vertex x="-4.0005" y="-1.0795"/>
<vertex x="-4.1275" y="-1.0795"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-1.8415" y="-0.9525"/>
<vertex x="-1.7145" y="-0.9525"/>
<vertex x="-1.7145" y="-1.5875"/>
<vertex x="-1.9685" y="-1.5875"/>
<vertex x="-1.9685" y="-1.8415"/>
<vertex x="-2.2225" y="-1.8415"/>
<vertex x="-2.2225" y="-2.7305"/>
<vertex x="-1.8415" y="-2.7305"/>
<vertex x="-1.8415" y="-1.9685"/>
<vertex x="-1.3335" y="-1.9685"/>
<vertex x="-1.3335" y="-1.2065"/>
<vertex x="-1.2065" y="-1.2065"/>
<vertex x="-1.2065" y="-1.4605"/>
<vertex x="-0.9525" y="-1.4605"/>
<vertex x="-0.9525" y="-1.5875"/>
<vertex x="-1.2065" y="-1.5875"/>
<vertex x="-1.2065" y="-2.2225"/>
<vertex x="-0.8255" y="-2.2225"/>
<vertex x="-0.8255" y="-1.9685"/>
<vertex x="-0.6985" y="-1.9685"/>
<vertex x="-0.6985" y="-2.2225"/>
<vertex x="-0.1905" y="-2.2225"/>
<vertex x="-0.1905" y="-2.3495"/>
<vertex x="-0.4445" y="-2.3495"/>
<vertex x="-0.4445" y="-2.6035"/>
<vertex x="-0.6985" y="-2.6035"/>
<vertex x="-0.6985" y="-2.9845"/>
<vertex x="-0.4445" y="-2.9845"/>
<vertex x="-0.4445" y="-3.1115"/>
<vertex x="-1.0795" y="-3.1115"/>
<vertex x="-1.0795" y="-2.7305"/>
<vertex x="-0.8255" y="-2.7305"/>
<vertex x="-0.8255" y="-2.3495"/>
<vertex x="-1.3335" y="-2.3495"/>
<vertex x="-1.3335" y="-2.0955"/>
<vertex x="-1.7145" y="-2.0955"/>
<vertex x="-1.7145" y="-2.4765"/>
<vertex x="-1.4605" y="-2.4765"/>
<vertex x="-1.4605" y="-3.2385"/>
<vertex x="-1.2065" y="-3.2385"/>
<vertex x="-1.2065" y="-3.4925"/>
<vertex x="-0.9525" y="-3.4925"/>
<vertex x="-0.9525" y="-3.6195"/>
<vertex x="-1.2065" y="-3.6195"/>
<vertex x="-1.2065" y="-4.1275"/>
<vertex x="-1.3335" y="-4.1275"/>
<vertex x="-1.3335" y="-3.8735"/>
<vertex x="-1.7145" y="-3.8735"/>
<vertex x="-1.7145" y="-4.1275"/>
<vertex x="-1.8415" y="-4.1275"/>
<vertex x="-1.8415" y="-3.7465"/>
<vertex x="-1.3335" y="-3.7465"/>
<vertex x="-1.3335" y="-3.3655"/>
<vertex x="-1.5875" y="-3.3655"/>
<vertex x="-1.5875" y="-3.1115"/>
<vertex x="-1.8415" y="-3.1115"/>
<vertex x="-1.8415" y="-2.8575"/>
<vertex x="-2.2225" y="-2.8575"/>
<vertex x="-2.2225" y="-4.1275"/>
<vertex x="-2.3495" y="-4.1275"/>
<vertex x="-2.3495" y="-2.3495"/>
<vertex x="-4.1275" y="-2.3495"/>
<vertex x="-4.1275" y="-2.2225"/>
<vertex x="-3.8735" y="-2.2225"/>
<vertex x="-3.8735" y="-1.2065"/>
<vertex x="-3.4925" y="-1.2065"/>
<vertex x="-3.4925" y="-1.3335"/>
<vertex x="-3.7465" y="-1.3335"/>
<vertex x="-3.7465" y="-2.2225"/>
<vertex x="-3.1115" y="-2.2225"/>
<vertex x="-3.1115" y="-1.9685"/>
<vertex x="-2.7305" y="-1.9685"/>
<vertex x="-2.7305" y="-2.2225"/>
<vertex x="-2.3495" y="-2.2225"/>
<vertex x="-2.3495" y="-1.8415"/>
<vertex x="-2.7305" y="-1.8415"/>
<vertex x="-2.7305" y="-1.905"/>
<vertex x="-2.8575" y="-1.905"/>
<vertex x="-2.8575" y="-1.2065"/>
<vertex x="-2.413" y="-1.2065"/>
<vertex x="-2.413" y="-1.3335"/>
<vertex x="-2.7305" y="-1.3335"/>
<vertex x="-2.7305" y="-1.7145"/>
<vertex x="-2.3495" y="-1.7145"/>
<vertex x="-2.3495" y="-1.2065"/>
<vertex x="-1.8415" y="-1.2065"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-3.3655" y="-1.4605"/>
<vertex x="-3.2385" y="-1.4605"/>
<vertex x="-3.2385" y="-1.8415"/>
<vertex x="-3.3655" y="-1.8415"/>
</polygon>
</package>
<package name="IKON_LEARNING_20MIL">
<wire x1="-8.636" y1="8.636" x2="-8.636" y2="-8.636" width="0.508" layer="21"/>
<wire x1="-8.636" y1="-8.636" x2="8.636" y2="-8.636" width="0.508" layer="21"/>
<wire x1="8.636" y1="-8.636" x2="8.636" y2="8.636" width="0.508" layer="21"/>
<wire x1="8.636" y1="8.636" x2="-8.636" y2="8.636" width="0.508" layer="21"/>
<polygon width="0.254" layer="21">
<vertex x="-7.747" y="7.747"/>
<vertex x="-5.461" y="7.747"/>
<vertex x="-5.461" y="5.461"/>
<vertex x="-7.747" y="5.461"/>
<vertex x="-7.747" y="7.62"/>
<vertex x="-7.493" y="7.62"/>
<vertex x="-7.493" y="5.715"/>
<vertex x="-5.715" y="5.715"/>
<vertex x="-5.715" y="7.493"/>
<vertex x="-7.747" y="7.493"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="-4.699" y="8.255"/>
<vertex x="-3.937" y="8.255"/>
<vertex x="-3.937" y="8.001"/>
<vertex x="-4.445" y="8.001"/>
<vertex x="-4.445" y="7.239"/>
<vertex x="-3.937" y="7.239"/>
<vertex x="-3.937" y="6.985"/>
<vertex x="-4.445" y="6.985"/>
<vertex x="-4.445" y="6.223"/>
<vertex x="-3.429" y="6.223"/>
<vertex x="-3.429" y="4.826"/>
<vertex x="-3.683" y="4.826"/>
<vertex x="-3.683" y="5.969"/>
<vertex x="-4.445" y="5.969"/>
<vertex x="-4.445" y="4.699"/>
<vertex x="-2.667" y="4.699"/>
<vertex x="-2.667" y="6.223"/>
<vertex x="-2.413" y="6.223"/>
<vertex x="-2.413" y="5.715"/>
<vertex x="-1.905" y="5.715"/>
<vertex x="-1.905" y="5.461"/>
<vertex x="-2.413" y="5.461"/>
<vertex x="-2.413" y="3.683"/>
<vertex x="-1.905" y="3.683"/>
<vertex x="-1.905" y="3.429"/>
<vertex x="-2.921" y="3.429"/>
<vertex x="-2.921" y="2.921"/>
<vertex x="-3.175" y="2.921"/>
<vertex x="-3.175" y="3.683"/>
<vertex x="-2.667" y="3.683"/>
<vertex x="-2.667" y="4.445"/>
<vertex x="-8.255" y="4.445"/>
<vertex x="-8.255" y="4.699"/>
<vertex x="-4.699" y="4.699"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="-3.175" y="6.731"/>
<vertex x="-2.921" y="6.731"/>
<vertex x="-2.921" y="6.477"/>
<vertex x="-3.175" y="6.477"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="-3.175" y="8.255"/>
<vertex x="-1.397" y="8.255"/>
<vertex x="-1.397" y="8.001"/>
<vertex x="-2.921" y="8.001"/>
<vertex x="-2.921" y="7.493"/>
<vertex x="-3.175" y="7.493"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="-0.635" y="8.255"/>
<vertex x="-0.381" y="8.255"/>
<vertex x="-0.381" y="8.001"/>
<vertex x="-0.635" y="8.001"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="-1.143" y="7.747"/>
<vertex x="-0.889" y="7.747"/>
<vertex x="-0.889" y="6.985"/>
<vertex x="-1.905" y="6.985"/>
<vertex x="-1.905" y="6.477"/>
<vertex x="-2.159" y="6.477"/>
<vertex x="-2.159" y="7.239"/>
<vertex x="-1.143" y="7.239"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="0.381" y="7.747"/>
<vertex x="0.635" y="7.747"/>
<vertex x="0.635" y="6.985"/>
<vertex x="0.127" y="6.985"/>
<vertex x="0.127" y="6.477"/>
<vertex x="-0.127" y="6.477"/>
<vertex x="-0.127" y="7.239"/>
<vertex x="0.381" y="7.239"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="-1.143" y="6.223"/>
<vertex x="-0.381" y="6.223"/>
<vertex x="-0.381" y="5.969"/>
<vertex x="-1.143" y="5.969"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="1.397" y="7.747"/>
<vertex x="2.159" y="7.747"/>
<vertex x="2.159" y="7.493"/>
<vertex x="1.651" y="7.493"/>
<vertex x="1.651" y="6.477"/>
<vertex x="0.889" y="6.477"/>
<vertex x="0.889" y="6.731"/>
<vertex x="1.397" y="6.731"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="2.921" y="8.255"/>
<vertex x="3.175" y="8.255"/>
<vertex x="3.175" y="8.001"/>
<vertex x="2.921" y="8.001"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="3.937" y="8.255"/>
<vertex x="4.699" y="8.255"/>
<vertex x="4.699" y="4.699"/>
<vertex x="8.255" y="4.699"/>
<vertex x="8.255" y="3.937"/>
<vertex x="8.001" y="3.937"/>
<vertex x="8.001" y="4.445"/>
<vertex x="7.239" y="4.445"/>
<vertex x="7.239" y="3.683"/>
<vertex x="7.747" y="3.683"/>
<vertex x="7.747" y="3.429"/>
<vertex x="6.985" y="3.429"/>
<vertex x="6.985" y="4.445"/>
<vertex x="6.223" y="4.445"/>
<vertex x="6.223" y="3.175"/>
<vertex x="6.731" y="3.175"/>
<vertex x="6.731" y="2.921"/>
<vertex x="4.953" y="2.921"/>
<vertex x="4.953" y="3.175"/>
<vertex x="5.461" y="3.175"/>
<vertex x="5.461" y="3.683"/>
<vertex x="5.969" y="3.683"/>
<vertex x="5.969" y="4.445"/>
<vertex x="5.207" y="4.445"/>
<vertex x="5.207" y="3.937"/>
<vertex x="4.953" y="3.937"/>
<vertex x="4.953" y="4.445"/>
<vertex x="4.191" y="4.445"/>
<vertex x="4.191" y="3.429"/>
<vertex x="3.937" y="3.429"/>
<vertex x="3.937" y="3.937"/>
<vertex x="3.429" y="3.937"/>
<vertex x="3.429" y="4.445"/>
<vertex x="2.921" y="4.445"/>
<vertex x="2.921" y="4.699"/>
<vertex x="3.429" y="4.699"/>
<vertex x="3.429" y="5.461"/>
<vertex x="2.921" y="5.461"/>
<vertex x="2.921" y="6.477"/>
<vertex x="2.413" y="6.477"/>
<vertex x="2.413" y="6.731"/>
<vertex x="3.175" y="6.731"/>
<vertex x="3.175" y="5.715"/>
<vertex x="3.683" y="5.715"/>
<vertex x="3.683" y="4.699"/>
<vertex x="4.445" y="4.699"/>
<vertex x="4.445" y="5.969"/>
<vertex x="3.937" y="5.969"/>
<vertex x="3.937" y="6.223"/>
<vertex x="4.445" y="6.223"/>
<vertex x="4.445" y="8.001"/>
<vertex x="3.937" y="8.001"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="3.429" y="7.747"/>
<vertex x="3.683" y="7.747"/>
<vertex x="3.683" y="6.985"/>
<vertex x="3.429" y="6.985"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="5.461" y="7.747"/>
<vertex x="7.747" y="7.747"/>
<vertex x="7.747" y="5.461"/>
<vertex x="5.461" y="5.461"/>
<vertex x="5.461" y="7.62"/>
<vertex x="5.715" y="7.62"/>
<vertex x="5.715" y="5.715"/>
<vertex x="7.493" y="5.715"/>
<vertex x="7.493" y="7.493"/>
<vertex x="5.461" y="7.493"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="-1.651" y="5.207"/>
<vertex x="-1.397" y="5.207"/>
<vertex x="-1.397" y="4.699"/>
<vertex x="-0.889" y="4.699"/>
<vertex x="-0.889" y="3.683"/>
<vertex x="-0.381" y="3.683"/>
<vertex x="-0.381" y="3.429"/>
<vertex x="-1.143" y="3.429"/>
<vertex x="-1.143" y="4.445"/>
<vertex x="-1.651" y="4.445"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="-0.635" y="5.207"/>
<vertex x="-0.381" y="5.207"/>
<vertex x="-0.381" y="4.953"/>
<vertex x="-0.635" y="4.953"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="-8.255" y="3.683"/>
<vertex x="-8.001" y="3.683"/>
<vertex x="-8.001" y="3.429"/>
<vertex x="-8.255" y="3.429"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="-8.255" y="2.159"/>
<vertex x="-8.001" y="2.159"/>
<vertex x="-8.001" y="1.905"/>
<vertex x="-8.255" y="1.905"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="-7.747" y="1.143"/>
<vertex x="-7.493" y="1.143"/>
<vertex x="-7.493" y="0.889"/>
<vertex x="-7.747" y="0.889"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="-7.747" y="2.667"/>
<vertex x="-7.239" y="2.667"/>
<vertex x="-7.239" y="3.175"/>
<vertex x="-6.477" y="3.175"/>
<vertex x="-6.477" y="2.921"/>
<vertex x="-6.985" y="2.921"/>
<vertex x="-6.985" y="2.413"/>
<vertex x="-7.747" y="2.413"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="-6.223" y="3.683"/>
<vertex x="-5.969" y="3.683"/>
<vertex x="-5.969" y="3.429"/>
<vertex x="-6.223" y="3.429"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="-5.715" y="4.191"/>
<vertex x="-5.461" y="4.191"/>
<vertex x="-5.461" y="3.937"/>
<vertex x="-5.715" y="3.937"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="-5.207" y="3.683"/>
<vertex x="-4.953" y="3.683"/>
<vertex x="-4.953" y="3.429"/>
<vertex x="-5.207" y="3.429"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="-4.191" y="3.175"/>
<vertex x="-3.937" y="3.175"/>
<vertex x="-3.937" y="2.921"/>
<vertex x="-4.191" y="2.921"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="-6.223" y="2.667"/>
<vertex x="-4.445" y="2.667"/>
<vertex x="-4.445" y="2.159"/>
<vertex x="-3.937" y="2.159"/>
<vertex x="-3.937" y="1.905"/>
<vertex x="-4.699" y="1.905"/>
<vertex x="-4.699" y="2.413"/>
<vertex x="-5.969" y="2.413"/>
<vertex x="-5.969" y="1.397"/>
<vertex x="-6.223" y="1.397"/>
<vertex x="-6.223" y="1.905"/>
<vertex x="-6.731" y="1.905"/>
<vertex x="-6.731" y="2.159"/>
<vertex x="-6.223" y="2.159"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="-5.207" y="1.651"/>
<vertex x="-4.953" y="1.651"/>
<vertex x="-4.953" y="1.397"/>
<vertex x="-5.207" y="1.397"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="0.381" y="5.715"/>
<vertex x="0.635" y="5.715"/>
<vertex x="0.635" y="4.699"/>
<vertex x="1.143" y="4.699"/>
<vertex x="1.143" y="3.937"/>
<vertex x="0.889" y="3.937"/>
<vertex x="0.889" y="4.445"/>
<vertex x="0.381" y="4.445"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="1.397" y="5.715"/>
<vertex x="1.651" y="5.715"/>
<vertex x="1.651" y="4.953"/>
<vertex x="1.397" y="4.953"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="2.413" y="5.207"/>
<vertex x="2.667" y="5.207"/>
<vertex x="2.667" y="4.953"/>
<vertex x="2.413" y="4.953"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="-0.127" y="4.191"/>
<vertex x="0.127" y="4.191"/>
<vertex x="0.127" y="3.937"/>
<vertex x="-0.127" y="3.937"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="1.905" y="4.191"/>
<vertex x="2.667" y="4.191"/>
<vertex x="2.667" y="3.937"/>
<vertex x="1.905" y="3.937"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="2.921" y="3.683"/>
<vertex x="3.175" y="3.683"/>
<vertex x="3.175" y="3.429"/>
<vertex x="2.921" y="3.429"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="3.429" y="3.175"/>
<vertex x="3.683" y="3.175"/>
<vertex x="3.683" y="1.905"/>
<vertex x="3.429" y="1.905"/>
<vertex x="3.429" y="2.413"/>
<vertex x="2.921" y="2.413"/>
<vertex x="2.921" y="2.667"/>
<vertex x="3.429" y="2.667"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="4.445" y="2.667"/>
<vertex x="4.699" y="2.667"/>
<vertex x="4.699" y="2.413"/>
<vertex x="4.445" y="2.413"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="8.001" y="3.175"/>
<vertex x="8.255" y="3.175"/>
<vertex x="8.255" y="2.413"/>
<vertex x="8.001" y="2.413"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="6.477" y="2.159"/>
<vertex x="7.747" y="2.159"/>
<vertex x="7.747" y="1.397"/>
<vertex x="6.985" y="1.397"/>
<vertex x="6.985" y="1.905"/>
<vertex x="6.477" y="1.905"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="8.001" y="1.143"/>
<vertex x="8.255" y="1.143"/>
<vertex x="8.255" y="0.889"/>
<vertex x="8.001" y="0.889"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="8.001" y="0.127"/>
<vertex x="8.255" y="0.127"/>
<vertex x="8.255" y="-0.127"/>
<vertex x="8.001" y="-0.127"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="4.953" y="2.159"/>
<vertex x="5.207" y="2.159"/>
<vertex x="5.207" y="1.905"/>
<vertex x="4.953" y="1.905"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="4.445" y="1.651"/>
<vertex x="4.699" y="1.651"/>
<vertex x="4.699" y="1.397"/>
<vertex x="4.445" y="1.397"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="1.905" y="2.159"/>
<vertex x="2.667" y="2.159"/>
<vertex x="2.667" y="1.905"/>
<vertex x="1.905" y="1.905"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="-0.127" y="3.175"/>
<vertex x="0.127" y="3.175"/>
<vertex x="0.127" y="2.921"/>
<vertex x="-0.127" y="2.921"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="0.889" y="3.175"/>
<vertex x="2.159" y="3.175"/>
<vertex x="2.159" y="2.921"/>
<vertex x="0.889" y="2.921"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="0.381" y="2.667"/>
<vertex x="0.635" y="2.667"/>
<vertex x="0.635" y="2.413"/>
<vertex x="0.381" y="2.413"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="0.889" y="2.159"/>
<vertex x="1.143" y="2.159"/>
<vertex x="1.143" y="1.905"/>
<vertex x="0.889" y="1.905"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="0.381" y="1.651"/>
<vertex x="0.635" y="1.651"/>
<vertex x="0.635" y="1.397"/>
<vertex x="0.381" y="1.397"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="-3.175" y="2.159"/>
<vertex x="-2.921" y="2.159"/>
<vertex x="-2.921" y="1.905"/>
<vertex x="-3.175" y="1.905"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="-2.159" y="2.667"/>
<vertex x="-0.889" y="2.667"/>
<vertex x="-0.889" y="2.159"/>
<vertex x="0.127" y="2.159"/>
<vertex x="0.127" y="1.905"/>
<vertex x="-0.381" y="1.905"/>
<vertex x="-0.381" y="1.397"/>
<vertex x="-1.143" y="1.397"/>
<vertex x="-1.143" y="1.905"/>
<vertex x="-2.159" y="1.905"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="-0.127" y="1.143"/>
<vertex x="0.127" y="1.143"/>
<vertex x="0.127" y="0.635"/>
<vertex x="0.889" y="0.635"/>
<vertex x="0.889" y="1.143"/>
<vertex x="2.159" y="1.143"/>
<vertex x="2.159" y="0.127"/>
<vertex x="2.667" y="0.127"/>
<vertex x="2.667" y="-0.635"/>
<vertex x="1.905" y="-0.635"/>
<vertex x="1.905" y="-0.127"/>
<vertex x="1.397" y="-0.127"/>
<vertex x="1.397" y="0.381"/>
<vertex x="0.127" y="0.381"/>
<vertex x="0.127" y="-0.381"/>
<vertex x="0.635" y="-0.381"/>
<vertex x="0.635" y="-1.651"/>
<vertex x="0.381" y="-1.651"/>
<vertex x="0.381" y="-0.635"/>
<vertex x="-0.889" y="-0.635"/>
<vertex x="-0.889" y="-1.143"/>
<vertex x="-1.397" y="-1.143"/>
<vertex x="-1.397" y="-1.905"/>
<vertex x="-0.635" y="-1.905"/>
<vertex x="-0.635" y="-1.397"/>
<vertex x="-0.381" y="-1.397"/>
<vertex x="-0.381" y="-1.905"/>
<vertex x="0.127" y="-1.905"/>
<vertex x="0.127" y="-2.159"/>
<vertex x="-0.381" y="-2.159"/>
<vertex x="-0.381" y="-2.667"/>
<vertex x="-0.635" y="-2.667"/>
<vertex x="-0.635" y="-2.159"/>
<vertex x="-2.159" y="-2.159"/>
<vertex x="-2.159" y="-1.397"/>
<vertex x="-1.651" y="-1.397"/>
<vertex x="-1.651" y="-0.635"/>
<vertex x="-2.667" y="-0.635"/>
<vertex x="-2.667" y="-0.127"/>
<vertex x="-3.429" y="-0.127"/>
<vertex x="-3.429" y="-0.889"/>
<vertex x="-2.921" y="-0.889"/>
<vertex x="-2.921" y="-1.143"/>
<vertex x="-3.937" y="-1.143"/>
<vertex x="-3.937" y="-1.651"/>
<vertex x="-4.191" y="-1.651"/>
<vertex x="-4.191" y="-0.889"/>
<vertex x="-3.683" y="-0.889"/>
<vertex x="-3.683" y="-0.127"/>
<vertex x="-4.191" y="-0.127"/>
<vertex x="-4.191" y="0.127"/>
<vertex x="-3.683" y="0.127"/>
<vertex x="-3.683" y="1.143"/>
<vertex x="-3.429" y="1.143"/>
<vertex x="-3.429" y="0.635"/>
<vertex x="-2.667" y="0.635"/>
<vertex x="-2.667" y="1.651"/>
<vertex x="-2.413" y="1.651"/>
<vertex x="-2.413" y="1.143"/>
<vertex x="-1.905" y="1.143"/>
<vertex x="-1.905" y="0.889"/>
<vertex x="-2.413" y="0.889"/>
<vertex x="-2.413" y="-0.381"/>
<vertex x="-1.651" y="-0.381"/>
<vertex x="-1.651" y="0.127"/>
<vertex x="-1.397" y="0.127"/>
<vertex x="-1.397" y="-0.381"/>
<vertex x="-0.127" y="-0.381"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="-1.143" y="0.635"/>
<vertex x="-0.889" y="0.635"/>
<vertex x="-0.889" y="0.381"/>
<vertex x="-1.143" y="0.381"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="2.921" y="1.651"/>
<vertex x="3.175" y="1.651"/>
<vertex x="3.175" y="1.143"/>
<vertex x="4.191" y="1.143"/>
<vertex x="4.191" y="0.381"/>
<vertex x="3.683" y="0.381"/>
<vertex x="3.683" y="-0.127"/>
<vertex x="3.429" y="-0.127"/>
<vertex x="3.429" y="0.889"/>
<vertex x="2.921" y="0.889"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="5.461" y="1.651"/>
<vertex x="6.223" y="1.651"/>
<vertex x="6.223" y="1.143"/>
<vertex x="6.731" y="1.143"/>
<vertex x="6.731" y="0.127"/>
<vertex x="7.239" y="0.127"/>
<vertex x="7.239" y="-0.127"/>
<vertex x="6.731" y="-0.127"/>
<vertex x="6.731" y="-1.143"/>
<vertex x="6.223" y="-1.143"/>
<vertex x="6.223" y="-1.651"/>
<vertex x="5.969" y="-1.651"/>
<vertex x="5.969" y="-0.635"/>
<vertex x="5.461" y="-0.635"/>
<vertex x="5.461" y="-0.381"/>
<vertex x="6.477" y="-0.381"/>
<vertex x="6.477" y="0.889"/>
<vertex x="5.969" y="0.889"/>
<vertex x="5.969" y="1.397"/>
<vertex x="5.461" y="1.397"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="4.953" y="1.143"/>
<vertex x="5.207" y="1.143"/>
<vertex x="5.207" y="0.635"/>
<vertex x="5.715" y="0.635"/>
<vertex x="5.715" y="0.381"/>
<vertex x="5.207" y="0.381"/>
<vertex x="5.207" y="-0.127"/>
<vertex x="4.699" y="-0.127"/>
<vertex x="4.699" y="-0.889"/>
<vertex x="5.207" y="-0.889"/>
<vertex x="5.207" y="-2.159"/>
<vertex x="4.953" y="-2.159"/>
<vertex x="4.953" y="-1.651"/>
<vertex x="3.683" y="-1.651"/>
<vertex x="3.683" y="-2.159"/>
<vertex x="3.175" y="-2.159"/>
<vertex x="3.175" y="-2.921"/>
<vertex x="3.937" y="-2.921"/>
<vertex x="3.937" y="-2.413"/>
<vertex x="4.191" y="-2.413"/>
<vertex x="4.191" y="-3.175"/>
<vertex x="3.175" y="-3.175"/>
<vertex x="3.175" y="-3.683"/>
<vertex x="2.921" y="-3.683"/>
<vertex x="2.921" y="-2.159"/>
<vertex x="0.889" y="-2.159"/>
<vertex x="0.889" y="-1.905"/>
<vertex x="1.397" y="-1.905"/>
<vertex x="1.397" y="-0.889"/>
<vertex x="1.651" y="-0.889"/>
<vertex x="1.651" y="-1.905"/>
<vertex x="3.429" y="-1.905"/>
<vertex x="3.429" y="-1.143"/>
<vertex x="2.921" y="-1.143"/>
<vertex x="2.921" y="-0.889"/>
<vertex x="3.937" y="-0.889"/>
<vertex x="3.937" y="-0.381"/>
<vertex x="4.445" y="-0.381"/>
<vertex x="4.445" y="0.127"/>
<vertex x="4.953" y="0.127"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="8.001" y="-0.889"/>
<vertex x="8.255" y="-0.889"/>
<vertex x="8.255" y="-2.159"/>
<vertex x="7.747" y="-2.159"/>
<vertex x="7.747" y="-2.921"/>
<vertex x="8.255" y="-2.921"/>
<vertex x="8.255" y="-3.683"/>
<vertex x="8.001" y="-3.683"/>
<vertex x="8.001" y="-3.175"/>
<vertex x="6.477" y="-3.175"/>
<vertex x="6.477" y="-2.921"/>
<vertex x="6.985" y="-2.921"/>
<vertex x="6.985" y="-2.159"/>
<vertex x="6.477" y="-2.159"/>
<vertex x="6.477" y="-1.905"/>
<vertex x="7.493" y="-1.905"/>
<vertex x="7.493" y="-1.397"/>
<vertex x="8.001" y="-1.397"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="5.969" y="-2.413"/>
<vertex x="6.223" y="-2.413"/>
<vertex x="6.223" y="-2.667"/>
<vertex x="5.969" y="-2.667"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="5.969" y="-3.429"/>
<vertex x="6.223" y="-3.429"/>
<vertex x="6.223" y="-3.683"/>
<vertex x="5.969" y="-3.683"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="4.953" y="-2.921"/>
<vertex x="5.207" y="-2.921"/>
<vertex x="5.207" y="-3.683"/>
<vertex x="4.445" y="-3.683"/>
<vertex x="4.445" y="-3.429"/>
<vertex x="4.953" y="-3.429"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="6.477" y="-3.937"/>
<vertex x="7.747" y="-3.937"/>
<vertex x="7.747" y="-4.445"/>
<vertex x="8.255" y="-4.445"/>
<vertex x="8.255" y="-5.207"/>
<vertex x="8.001" y="-5.207"/>
<vertex x="8.001" y="-4.699"/>
<vertex x="7.493" y="-4.699"/>
<vertex x="7.493" y="-4.191"/>
<vertex x="6.477" y="-4.191"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="7.493" y="-5.461"/>
<vertex x="7.747" y="-5.461"/>
<vertex x="7.747" y="-5.715"/>
<vertex x="7.493" y="-5.715"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="6.985" y="-5.969"/>
<vertex x="7.239" y="-5.969"/>
<vertex x="7.239" y="-6.223"/>
<vertex x="6.985" y="-6.223"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="-0.127" y="-2.921"/>
<vertex x="2.159" y="-2.921"/>
<vertex x="2.159" y="-3.175"/>
<vertex x="0.635" y="-3.175"/>
<vertex x="0.635" y="-3.683"/>
<vertex x="0.381" y="-3.683"/>
<vertex x="0.381" y="-3.175"/>
<vertex x="-0.127" y="-3.175"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="3.429" y="-3.937"/>
<vertex x="3.683" y="-3.937"/>
<vertex x="3.683" y="-4.191"/>
<vertex x="3.429" y="-4.191"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="2.413" y="-4.445"/>
<vertex x="3.175" y="-4.445"/>
<vertex x="3.175" y="-5.207"/>
<vertex x="2.921" y="-5.207"/>
<vertex x="2.921" y="-4.699"/>
<vertex x="2.413" y="-4.699"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="4.445" y="-4.445"/>
<vertex x="5.715" y="-4.445"/>
<vertex x="5.715" y="-5.715"/>
<vertex x="4.445" y="-5.715"/>
<vertex x="4.445" y="-4.572"/>
<vertex x="4.699" y="-4.572"/>
<vertex x="4.699" y="-5.461"/>
<vertex x="5.461" y="-5.461"/>
<vertex x="5.461" y="-4.699"/>
<vertex x="4.445" y="-4.699"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="8.255" y="-8.255"/>
<vertex x="8.255" y="-6.985"/>
<vertex x="5.715" y="-6.985"/>
<vertex x="5.715" y="-6.477"/>
<vertex x="4.953" y="-6.477"/>
<vertex x="4.953" y="-6.731"/>
<vertex x="5.461" y="-6.731"/>
<vertex x="5.461" y="-8.255"/>
<vertex x="7.239" y="-8.255"/>
<vertex x="7.239" y="-8.001"/>
<vertex x="6.223" y="-8.001"/>
<vertex x="6.223" y="-7.239"/>
<vertex x="7.493" y="-7.239"/>
<vertex x="7.493" y="-7.747"/>
<vertex x="8.001" y="-7.747"/>
<vertex x="8.001" y="-8.255"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="4.445" y="-6.985"/>
<vertex x="4.699" y="-6.985"/>
<vertex x="4.699" y="-7.239"/>
<vertex x="4.445" y="-7.239"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="4.191" y="-7.493"/>
<vertex x="4.191" y="-7.747"/>
<vertex x="3.683" y="-7.747"/>
<vertex x="3.683" y="-8.255"/>
<vertex x="3.429" y="-8.255"/>
<vertex x="3.429" y="-7.747"/>
<vertex x="2.921" y="-7.747"/>
<vertex x="2.921" y="-6.223"/>
<vertex x="0.889" y="-6.223"/>
<vertex x="0.889" y="-5.715"/>
<vertex x="0.127" y="-5.715"/>
<vertex x="0.127" y="-6.477"/>
<vertex x="0.635" y="-6.477"/>
<vertex x="0.635" y="-6.731"/>
<vertex x="0.127" y="-6.731"/>
<vertex x="0.127" y="-7.239"/>
<vertex x="-0.127" y="-7.239"/>
<vertex x="-0.127" y="-6.731"/>
<vertex x="-0.635" y="-6.731"/>
<vertex x="-0.635" y="-6.477"/>
<vertex x="-0.127" y="-6.477"/>
<vertex x="-0.127" y="-4.953"/>
<vertex x="0.381" y="-4.953"/>
<vertex x="0.381" y="-4.445"/>
<vertex x="0.635" y="-4.445"/>
<vertex x="0.635" y="-4.953"/>
<vertex x="1.651" y="-4.953"/>
<vertex x="1.651" y="-5.461"/>
<vertex x="2.159" y="-5.461"/>
<vertex x="2.159" y="-5.969"/>
<vertex x="3.683" y="-5.969"/>
<vertex x="3.683" y="-7.493"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="2.667" y="-8.001"/>
<vertex x="2.667" y="-8.255"/>
<vertex x="1.905" y="-8.255"/>
<vertex x="1.905" y="-7.747"/>
<vertex x="1.397" y="-7.747"/>
<vertex x="1.397" y="-7.239"/>
<vertex x="0.889" y="-7.239"/>
<vertex x="0.889" y="-6.985"/>
<vertex x="2.159" y="-6.985"/>
<vertex x="2.159" y="-8.001"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="0.381" y="-7.493"/>
<vertex x="0.635" y="-7.493"/>
<vertex x="0.635" y="-7.747"/>
<vertex x="0.381" y="-7.747"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="0.889" y="-8.001"/>
<vertex x="1.143" y="-8.001"/>
<vertex x="1.143" y="-8.255"/>
<vertex x="0.889" y="-8.255"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="0.889" y="-3.937"/>
<vertex x="1.651" y="-3.937"/>
<vertex x="1.651" y="-4.191"/>
<vertex x="0.889" y="-4.191"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="-6.223" y="0.635"/>
<vertex x="-4.953" y="0.635"/>
<vertex x="-4.953" y="0.381"/>
<vertex x="-5.461" y="0.381"/>
<vertex x="-5.461" y="-0.381"/>
<vertex x="-4.445" y="-0.381"/>
<vertex x="-4.445" y="-0.635"/>
<vertex x="-5.461" y="-0.635"/>
<vertex x="-5.461" y="-1.143"/>
<vertex x="-5.969" y="-1.143"/>
<vertex x="-5.969" y="-2.159"/>
<vertex x="-6.223" y="-2.159"/>
<vertex x="-6.223" y="-1.651"/>
<vertex x="-6.731" y="-1.651"/>
<vertex x="-6.731" y="-1.397"/>
<vertex x="-6.223" y="-1.397"/>
<vertex x="-6.223" y="-0.889"/>
<vertex x="-5.715" y="-0.889"/>
<vertex x="-5.715" y="-0.127"/>
<vertex x="-6.223" y="-0.127"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="-5.207" y="-1.397"/>
<vertex x="-4.953" y="-1.397"/>
<vertex x="-4.953" y="-1.651"/>
<vertex x="-5.207" y="-1.651"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="-8.255" y="0.127"/>
<vertex x="-6.985" y="0.127"/>
<vertex x="-6.985" y="-0.127"/>
<vertex x="-7.493" y="-0.127"/>
<vertex x="-7.493" y="-0.889"/>
<vertex x="-6.985" y="-0.889"/>
<vertex x="-6.985" y="-1.143"/>
<vertex x="-7.747" y="-1.143"/>
<vertex x="-7.747" y="-0.127"/>
<vertex x="-8.255" y="-0.127"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="-6.731" y="-0.381"/>
<vertex x="-6.477" y="-0.381"/>
<vertex x="-6.477" y="-0.635"/>
<vertex x="-6.731" y="-0.635"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="-8.255" y="-1.397"/>
<vertex x="-8.001" y="-1.397"/>
<vertex x="-8.001" y="-2.159"/>
<vertex x="-8.255" y="-2.159"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="-3.683" y="-1.905"/>
<vertex x="-3.429" y="-1.905"/>
<vertex x="-3.429" y="-3.175"/>
<vertex x="-3.937" y="-3.175"/>
<vertex x="-3.937" y="-3.683"/>
<vertex x="-4.445" y="-3.683"/>
<vertex x="-4.445" y="-5.461"/>
<vertex x="-3.683" y="-5.461"/>
<vertex x="-3.683" y="-3.937"/>
<vertex x="-2.667" y="-3.937"/>
<vertex x="-2.667" y="-2.413"/>
<vertex x="-2.413" y="-2.413"/>
<vertex x="-2.413" y="-2.921"/>
<vertex x="-1.905" y="-2.921"/>
<vertex x="-1.905" y="-3.175"/>
<vertex x="-2.413" y="-3.175"/>
<vertex x="-2.413" y="-4.445"/>
<vertex x="-1.651" y="-4.445"/>
<vertex x="-1.651" y="-3.937"/>
<vertex x="-1.397" y="-3.937"/>
<vertex x="-1.397" y="-4.445"/>
<vertex x="-0.381" y="-4.445"/>
<vertex x="-0.381" y="-4.699"/>
<vertex x="-0.889" y="-4.699"/>
<vertex x="-0.889" y="-5.207"/>
<vertex x="-1.397" y="-5.207"/>
<vertex x="-1.397" y="-5.969"/>
<vertex x="-0.889" y="-5.969"/>
<vertex x="-0.889" y="-6.223"/>
<vertex x="-2.159" y="-6.223"/>
<vertex x="-2.159" y="-5.461"/>
<vertex x="-1.651" y="-5.461"/>
<vertex x="-1.651" y="-4.699"/>
<vertex x="-2.667" y="-4.699"/>
<vertex x="-2.667" y="-4.191"/>
<vertex x="-3.429" y="-4.191"/>
<vertex x="-3.429" y="-4.953"/>
<vertex x="-2.921" y="-4.953"/>
<vertex x="-2.921" y="-6.477"/>
<vertex x="-2.413" y="-6.477"/>
<vertex x="-2.413" y="-6.985"/>
<vertex x="-1.905" y="-6.985"/>
<vertex x="-1.905" y="-7.239"/>
<vertex x="-2.413" y="-7.239"/>
<vertex x="-2.413" y="-8.255"/>
<vertex x="-2.667" y="-8.255"/>
<vertex x="-2.667" y="-7.747"/>
<vertex x="-3.429" y="-7.747"/>
<vertex x="-3.429" y="-8.255"/>
<vertex x="-3.683" y="-8.255"/>
<vertex x="-3.683" y="-7.493"/>
<vertex x="-2.667" y="-7.493"/>
<vertex x="-2.667" y="-6.731"/>
<vertex x="-3.175" y="-6.731"/>
<vertex x="-3.175" y="-6.223"/>
<vertex x="-3.683" y="-6.223"/>
<vertex x="-3.683" y="-5.715"/>
<vertex x="-4.445" y="-5.715"/>
<vertex x="-4.445" y="-8.255"/>
<vertex x="-4.699" y="-8.255"/>
<vertex x="-4.699" y="-4.699"/>
<vertex x="-8.255" y="-4.699"/>
<vertex x="-8.255" y="-4.445"/>
<vertex x="-7.747" y="-4.445"/>
<vertex x="-7.747" y="-2.413"/>
<vertex x="-6.985" y="-2.413"/>
<vertex x="-6.985" y="-2.667"/>
<vertex x="-7.493" y="-2.667"/>
<vertex x="-7.493" y="-4.445"/>
<vertex x="-6.223" y="-4.445"/>
<vertex x="-6.223" y="-3.937"/>
<vertex x="-5.715" y="-3.937"/>
<vertex x="-5.715" y="-2.413"/>
<vertex x="-4.699" y="-2.413"/>
<vertex x="-4.699" y="-2.794"/>
<vertex x="-5.461" y="-2.794"/>
<vertex x="-5.461" y="-3.429"/>
<vertex x="-4.699" y="-3.429"/>
<vertex x="-4.699" y="-3.683"/>
<vertex x="-5.461" y="-3.683"/>
<vertex x="-5.461" y="-4.445"/>
<vertex x="-4.699" y="-4.445"/>
<vertex x="-4.699" y="-2.413"/>
<vertex x="-3.683" y="-2.413"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="-6.731" y="-2.921"/>
<vertex x="-6.477" y="-2.921"/>
<vertex x="-6.477" y="-3.683"/>
<vertex x="-6.731" y="-3.683"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="-1.143" y="-3.429"/>
<vertex x="-0.889" y="-3.429"/>
<vertex x="-0.889" y="-3.683"/>
<vertex x="-1.143" y="-3.683"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="-1.143" y="-7.493"/>
<vertex x="-0.889" y="-7.493"/>
<vertex x="-0.889" y="-7.747"/>
<vertex x="-1.143" y="-7.747"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="-1.651" y="-8.001"/>
<vertex x="-1.397" y="-8.001"/>
<vertex x="-1.397" y="-8.255"/>
<vertex x="-1.651" y="-8.255"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="-7.747" y="-5.461"/>
<vertex x="-7.747" y="-7.747"/>
<vertex x="-5.461" y="-7.747"/>
<vertex x="-5.461" y="-5.461"/>
<vertex x="-7.62" y="-5.461"/>
<vertex x="-7.62" y="-5.715"/>
<vertex x="-5.715" y="-5.715"/>
<vertex x="-5.715" y="-7.493"/>
<vertex x="-7.493" y="-7.493"/>
<vertex x="-7.493" y="-5.461"/>
</polygon>
</package>
<package name="IKON_TSU_SMILE_NEGATIVE">
<wire x1="-3" y1="-0.25" x2="-2.5" y2="-0.25" width="0.1" layer="21"/>
<wire x1="-2.5" y1="-0.25" x2="-1.875" y2="-0.25" width="0.1" layer="21"/>
<wire x1="-1.875" y1="-0.25" x2="-1.125" y2="-0.25" width="0.1" layer="21"/>
<wire x1="-1.125" y1="-0.25" x2="0" y2="-0.25" width="0.1" layer="21"/>
<wire x1="0" y1="-0.25" x2="1.125" y2="-0.25" width="0.1" layer="21"/>
<wire x1="1.125" y1="-0.25" x2="1.875" y2="-0.25" width="0.1" layer="21"/>
<wire x1="1.875" y1="-0.25" x2="2.5" y2="-0.25" width="0.1" layer="21"/>
<wire x1="2.5" y1="-0.25" x2="3" y2="-0.25" width="0.1" layer="21"/>
<wire x1="-1" y1="-3.25" x2="-0.875" y2="-3.25" width="0.1" layer="21"/>
<wire x1="-0.875" y1="-3.25" x2="0" y2="-3.25" width="0.1" layer="21"/>
<wire x1="0" y1="-3.25" x2="0.875" y2="-3.25" width="0.1" layer="21"/>
<wire x1="0.875" y1="-3.25" x2="1" y2="-3.25" width="0.1" layer="21"/>
<wire x1="3" y1="-0.25" x2="1" y2="-3.25" width="0.1" layer="21" curve="-70.435186"/>
<wire x1="-3" y1="-0.25" x2="-1" y2="-3.25" width="0.1" layer="21" curve="70.435186"/>
<wire x1="0" y1="-0.25" x2="0" y2="-3.25" width="0.1" layer="21"/>
<wire x1="2.875" y1="-1.25" x2="2.5" y2="-1.25" width="0.1" layer="21"/>
<wire x1="2.5" y1="-1.25" x2="1.875" y2="-1.25" width="0.1" layer="21"/>
<wire x1="1.875" y1="-1.25" x2="1.125" y2="-1.25" width="0.1" layer="21"/>
<wire x1="1.125" y1="-1.25" x2="-1.125" y2="-1.25" width="0.1" layer="21"/>
<wire x1="-1.125" y1="-1.25" x2="-1.875" y2="-1.25" width="0.1" layer="21"/>
<wire x1="-1.875" y1="-1.25" x2="-2.5" y2="-1.25" width="0.1" layer="21"/>
<wire x1="-2.5" y1="-1.25" x2="-2.875" y2="-1.25" width="0.1" layer="21"/>
<wire x1="-1.125" y1="-0.25" x2="-1.125" y2="-1.25" width="0.1" layer="21"/>
<wire x1="-1.875" y1="-0.25" x2="-1.875" y2="-1.25" width="0.1" layer="21"/>
<wire x1="-2.5" y1="-0.25" x2="-2.5" y2="-1.25" width="0.1" layer="21"/>
<wire x1="1.125" y1="-0.25" x2="1.125" y2="-1.25" width="0.1" layer="21"/>
<wire x1="1.875" y1="-0.25" x2="1.875" y2="-1.25" width="0.1" layer="21"/>
<wire x1="2.5" y1="-0.25" x2="2.5" y2="-1.25" width="0.1" layer="21"/>
<wire x1="1.875" y1="-1.25" x2="1.875" y2="-1.5" width="0.1" layer="21"/>
<wire x1="1.875" y1="-1.5" x2="1.625" y2="-2.875" width="0.1" layer="21" curve="-12.680383"/>
<wire x1="1.125" y1="-1.25" x2="1.125" y2="-1.625" width="0.1" layer="21"/>
<wire x1="1.125" y1="-1.625" x2="0.875" y2="-3.25" width="0.1" layer="21" curve="-20.609467"/>
<wire x1="2.5" y1="-1.25" x2="2.5" y2="-1.375" width="0.1" layer="21"/>
<wire x1="2.5" y1="-1.375" x2="2.25" y2="-2.375" width="0.1" layer="21" curve="-28.072487"/>
<wire x1="-2.5" y1="-1.25" x2="-2.5" y2="-1.375" width="0.1" layer="21"/>
<wire x1="-2.5" y1="-1.375" x2="-2.25" y2="-2.375" width="0.1" layer="21" curve="31.892522"/>
<wire x1="-1.875" y1="-1.25" x2="-1.875" y2="-1.5" width="0.1" layer="21"/>
<wire x1="-1.875" y1="-1.5" x2="-1.625" y2="-2.875" width="0.1" layer="21" curve="20.609426"/>
<wire x1="-1.125" y1="-1.25" x2="-1.125" y2="-1.675" width="0.1" layer="21"/>
<wire x1="-1.125" y1="-1.675" x2="-0.875" y2="-3.25" width="0.1" layer="21" curve="20.60946"/>
<circle x="0" y="0" radius="4" width="0.1" layer="51"/>
<polygon width="0" layer="21">
<vertex x="0" y="4" curve="-90"/>
<vertex x="4" y="0" curve="-90"/>
<vertex x="0" y="-4"/>
<vertex x="0" y="-3.25"/>
<vertex x="1" y="-3.25" curve="72.055468"/>
<vertex x="3" y="-0.5"/>
<vertex x="3" y="-0.25"/>
<vertex x="1.875" y="-0.25"/>
<vertex x="1.875" y="0.125" curve="90"/>
<vertex x="3.25" y="1.5" curve="90"/>
<vertex x="1.875" y="2.875" curve="90"/>
<vertex x="0.5" y="1.5" curve="90"/>
<vertex x="1.875" y="0.125"/>
<vertex x="1.875" y="-0.25"/>
<vertex x="-1.875" y="-0.25"/>
<vertex x="-1.875" y="0.125" curve="90"/>
<vertex x="-0.5" y="1.5" curve="90"/>
<vertex x="-1.875" y="2.875" curve="90"/>
<vertex x="-3.25" y="1.5" curve="90"/>
<vertex x="-1.875" y="0.125"/>
<vertex x="-1.875" y="-0.25"/>
<vertex x="-3" y="-0.25"/>
<vertex x="-3" y="-0.5" curve="72.055468"/>
<vertex x="-1" y="-3.25"/>
<vertex x="0" y="-3.25"/>
<vertex x="0" y="-4" curve="-90"/>
<vertex x="-4" y="0" curve="-90"/>
</polygon>
<polygon width="0" layer="51">
<vertex x="-2.25" y="1.5" curve="-90"/>
<vertex x="-1.875" y="1.875" curve="-90"/>
<vertex x="-1.5" y="1.5" curve="-90"/>
<vertex x="-1.875" y="1.125" curve="-90"/>
</polygon>
<polygon width="0" layer="51">
<vertex x="1.5" y="1.5" curve="-90"/>
<vertex x="1.875" y="1.875" curve="-90"/>
<vertex x="2.25" y="1.5" curve="-90"/>
<vertex x="1.875" y="1.125" curve="-90"/>
</polygon>
<polygon width="0" layer="51">
<vertex x="-1" y="-1.375"/>
<vertex x="-1" y="-1.625" curve="18.924644"/>
<vertex x="-0.75" y="-3.125"/>
<vertex x="-0.125" y="-3.125"/>
<vertex x="-0.125" y="-1.375"/>
</polygon>
<polygon width="0" layer="51">
<vertex x="1" y="-1.375"/>
<vertex x="1" y="-1.625" curve="-18.924644"/>
<vertex x="0.75" y="-3.125"/>
<vertex x="0.125" y="-3.125"/>
<vertex x="0.125" y="-1.375"/>
</polygon>
<polygon width="0" layer="51">
<vertex x="1.75" y="-1.375"/>
<vertex x="1.75" y="-1.5" curve="-20.609426"/>
<vertex x="1.5" y="-2.875"/>
<vertex x="1" y="-3.125" curve="20.609204"/>
<vertex x="1.25" y="-1.625"/>
<vertex x="1.25" y="-1.375"/>
</polygon>
<polygon width="0" layer="51">
<vertex x="-1.75" y="-1.375"/>
<vertex x="-1.75" y="-1.5" curve="20.609426"/>
<vertex x="-1.5" y="-2.875"/>
<vertex x="-1" y="-3.125" curve="-18.924644"/>
<vertex x="-1.25" y="-1.625"/>
<vertex x="-1.25" y="-1.375"/>
</polygon>
<polygon width="0" layer="51">
<vertex x="-2.375" y="-1.375"/>
<vertex x="-2.375" y="-1.5" curve="53.130102"/>
<vertex x="-1.75" y="-2.75" curve="-25.057136"/>
<vertex x="-2" y="-1.625"/>
<vertex x="-2" y="-1.375"/>
</polygon>
<polygon width="0" layer="51">
<vertex x="2.375" y="-1.375"/>
<vertex x="2.375" y="-1.5" curve="-53.130102"/>
<vertex x="1.75" y="-2.75" curve="25.057136"/>
<vertex x="2" y="-1.625"/>
<vertex x="2" y="-1.375"/>
</polygon>
<polygon width="0" layer="51">
<vertex x="-2.375" y="-0.375"/>
<vertex x="-2" y="-0.375"/>
<vertex x="-2" y="-1.125"/>
<vertex x="-2.375" y="-1.125"/>
</polygon>
<polygon width="0" layer="51">
<vertex x="-1.75" y="-0.375"/>
<vertex x="-1.25" y="-0.375"/>
<vertex x="-1.25" y="-1.125"/>
<vertex x="-1.75" y="-1.125"/>
</polygon>
<polygon width="0" layer="51">
<vertex x="-1" y="-0.375"/>
<vertex x="-0.125" y="-0.375"/>
<vertex x="-0.125" y="-1.125"/>
<vertex x="-1" y="-1.125"/>
</polygon>
<polygon width="0" layer="51">
<vertex x="0.125" y="-0.375"/>
<vertex x="1" y="-0.375"/>
<vertex x="1" y="-1.125"/>
<vertex x="0.125" y="-1.125"/>
</polygon>
<polygon width="0" layer="51">
<vertex x="1.25" y="-0.375"/>
<vertex x="1.75" y="-0.375"/>
<vertex x="1.75" y="-1.125"/>
<vertex x="1.25" y="-1.125"/>
</polygon>
<polygon width="0" layer="51">
<vertex x="2" y="-0.375"/>
<vertex x="2.375" y="-0.375"/>
<vertex x="2.375" y="-1.125"/>
<vertex x="2" y="-1.125"/>
</polygon>
<polygon width="0" layer="51">
<vertex x="2.875" y="-0.375"/>
<vertex x="2.875" y="-0.5" curve="-22.62057"/>
<vertex x="2.7813" y="-1.125"/>
<vertex x="2.625" y="-1.125"/>
<vertex x="2.625" y="-0.375"/>
</polygon>
<polygon width="0" layer="51">
<vertex x="-2.875" y="-0.375"/>
<vertex x="-2.875" y="-0.5" curve="22.62057"/>
<vertex x="-2.7813" y="-1.125"/>
<vertex x="-2.625" y="-1.125"/>
<vertex x="-2.625" y="-0.375"/>
</polygon>
<polygon width="0" layer="51">
<vertex x="-2.6875" y="-1.375"/>
<vertex x="-2.5938" y="-1.375"/>
<vertex x="-2.5" y="-1.875"/>
</polygon>
<polygon width="0" layer="51">
<vertex x="2.6875" y="-1.375"/>
<vertex x="2.5937" y="-1.375"/>
<vertex x="2.5" y="-1.875"/>
</polygon>
<polygon width="0" layer="21">
<vertex x="-1.875" y="0.375" curve="90"/>
<vertex x="-0.75" y="1.5" curve="90"/>
<vertex x="-1.875" y="2.625" curve="90"/>
<vertex x="-3" y="1.5"/>
<vertex x="-2.25" y="1.5" curve="-90"/>
<vertex x="-1.875" y="1.875" curve="-90"/>
<vertex x="-1.5" y="1.5" curve="-90"/>
<vertex x="-1.875" y="1.125" curve="-90"/>
<vertex x="-2.25" y="1.5"/>
<vertex x="-3" y="1.5" curve="90"/>
</polygon>
<polygon width="0" layer="21">
<vertex x="1.875" y="0.375" curve="90"/>
<vertex x="3" y="1.5" curve="90"/>
<vertex x="1.875" y="2.625" curve="90"/>
<vertex x="0.75" y="1.5"/>
<vertex x="1.5" y="1.5" curve="-90"/>
<vertex x="1.875" y="1.875" curve="-90"/>
<vertex x="2.25" y="1.5" curve="-90"/>
<vertex x="1.875" y="1.125" curve="-90"/>
<vertex x="1.5" y="1.5"/>
<vertex x="0.75" y="1.5" curve="90"/>
</polygon>
<polygon width="0" layer="51">
<vertex x="-1.875" y="0.125" curve="90"/>
<vertex x="-0.5" y="1.5" curve="90"/>
<vertex x="-1.875" y="2.875" curve="90"/>
<vertex x="-3.25" y="1.5"/>
<vertex x="-3" y="1.5" curve="-90"/>
<vertex x="-1.875" y="2.625" curve="-90"/>
<vertex x="-0.75" y="1.5" curve="-90"/>
<vertex x="-1.875" y="0.375" curve="-90"/>
<vertex x="-3" y="1.5"/>
<vertex x="-3.25" y="1.5" curve="90"/>
</polygon>
<polygon width="0" layer="51">
<vertex x="1.875" y="0.125" curve="90"/>
<vertex x="3.25" y="1.5" curve="90"/>
<vertex x="1.875" y="2.875" curve="90"/>
<vertex x="0.5" y="1.5"/>
<vertex x="0.75" y="1.5" curve="-90"/>
<vertex x="1.875" y="2.625" curve="-90"/>
<vertex x="3" y="1.5" curve="-90"/>
<vertex x="1.875" y="0.375" curve="-90"/>
<vertex x="0.75" y="1.5"/>
<vertex x="0.5" y="1.5" curve="90"/>
</polygon>
</package>
<package name="IKON_TSU_SMILE">
<wire x1="-3" y1="-0.25" x2="-2.5" y2="-0.25" width="0.1" layer="51"/>
<wire x1="-2.5" y1="-0.25" x2="-1.875" y2="-0.25" width="0.1" layer="51"/>
<wire x1="-1.875" y1="-0.25" x2="-1.125" y2="-0.25" width="0.1" layer="51"/>
<wire x1="-1.125" y1="-0.25" x2="0" y2="-0.25" width="0.1" layer="51"/>
<wire x1="0" y1="-0.25" x2="1.125" y2="-0.25" width="0.1" layer="51"/>
<wire x1="1.125" y1="-0.25" x2="1.875" y2="-0.25" width="0.1" layer="51"/>
<wire x1="1.875" y1="-0.25" x2="2.5" y2="-0.25" width="0.1" layer="51"/>
<wire x1="2.5" y1="-0.25" x2="3" y2="-0.25" width="0.1" layer="51"/>
<wire x1="-1" y1="-3.25" x2="-0.875" y2="-3.25" width="0.1" layer="51"/>
<wire x1="-0.875" y1="-3.25" x2="0" y2="-3.25" width="0.1" layer="51"/>
<wire x1="0" y1="-3.25" x2="0.875" y2="-3.25" width="0.1" layer="51"/>
<wire x1="0.875" y1="-3.25" x2="1" y2="-3.25" width="0.1" layer="51"/>
<wire x1="3" y1="-0.25" x2="1" y2="-3.25" width="0.1" layer="51" curve="-70.435186"/>
<wire x1="-3" y1="-0.25" x2="-1" y2="-3.25" width="0.1" layer="51" curve="70.435186"/>
<wire x1="0" y1="-0.25" x2="0" y2="-3.25" width="0.1" layer="51"/>
<wire x1="2.875" y1="-1.25" x2="2.5" y2="-1.25" width="0.1" layer="51"/>
<wire x1="2.5" y1="-1.25" x2="1.875" y2="-1.25" width="0.1" layer="51"/>
<wire x1="1.875" y1="-1.25" x2="1.125" y2="-1.25" width="0.1" layer="51"/>
<wire x1="1.125" y1="-1.25" x2="-1.125" y2="-1.25" width="0.1" layer="51"/>
<wire x1="-1.125" y1="-1.25" x2="-1.875" y2="-1.25" width="0.1" layer="51"/>
<wire x1="-1.875" y1="-1.25" x2="-2.5" y2="-1.25" width="0.1" layer="51"/>
<wire x1="-2.5" y1="-1.25" x2="-2.875" y2="-1.25" width="0.1" layer="51"/>
<wire x1="-1.125" y1="-0.25" x2="-1.125" y2="-1.25" width="0.1" layer="51"/>
<wire x1="-1.875" y1="-0.25" x2="-1.875" y2="-1.25" width="0.1" layer="51"/>
<wire x1="-2.5" y1="-0.25" x2="-2.5" y2="-1.25" width="0.1" layer="51"/>
<wire x1="1.125" y1="-0.25" x2="1.125" y2="-1.25" width="0.1" layer="51"/>
<wire x1="1.875" y1="-0.25" x2="1.875" y2="-1.25" width="0.1" layer="51"/>
<wire x1="2.5" y1="-0.25" x2="2.5" y2="-1.25" width="0.1" layer="51"/>
<wire x1="1.875" y1="-1.25" x2="1.875" y2="-1.5" width="0.1" layer="51"/>
<wire x1="1.875" y1="-1.5" x2="1.625" y2="-2.875" width="0.1" layer="51" curve="-12.680383"/>
<wire x1="1.125" y1="-1.25" x2="1.125" y2="-1.625" width="0.1" layer="51"/>
<wire x1="1.125" y1="-1.625" x2="0.875" y2="-3.25" width="0.1" layer="51" curve="-20.609467"/>
<wire x1="2.5" y1="-1.25" x2="2.5" y2="-1.375" width="0.1" layer="51"/>
<wire x1="2.5" y1="-1.375" x2="2.25" y2="-2.375" width="0.1" layer="51" curve="-28.072487"/>
<wire x1="-2.5" y1="-1.25" x2="-2.5" y2="-1.375" width="0.1" layer="51"/>
<wire x1="-2.5" y1="-1.375" x2="-2.25" y2="-2.375" width="0.1" layer="51" curve="31.892522"/>
<wire x1="-1.875" y1="-1.25" x2="-1.875" y2="-1.5" width="0.1" layer="51"/>
<wire x1="-1.875" y1="-1.5" x2="-1.625" y2="-2.875" width="0.1" layer="51" curve="20.609426"/>
<wire x1="-1.125" y1="-1.25" x2="-1.125" y2="-1.675" width="0.1" layer="51"/>
<wire x1="-1.125" y1="-1.675" x2="-0.875" y2="-3.25" width="0.1" layer="51" curve="20.60946"/>
<circle x="0" y="0" radius="3.825" width="0.15" layer="21"/>
<polygon width="0" layer="51">
<vertex x="0" y="4" curve="-90"/>
<vertex x="4" y="0" curve="-90"/>
<vertex x="0" y="-4"/>
<vertex x="0" y="-3.25"/>
<vertex x="1" y="-3.25" curve="72.055468"/>
<vertex x="3" y="-0.5"/>
<vertex x="3" y="-0.25"/>
<vertex x="1.875" y="-0.25"/>
<vertex x="1.875" y="0.125" curve="90"/>
<vertex x="3.25" y="1.5" curve="90"/>
<vertex x="1.875" y="2.875" curve="90"/>
<vertex x="0.5" y="1.5" curve="90"/>
<vertex x="1.875" y="0.125"/>
<vertex x="1.875" y="-0.25"/>
<vertex x="-1.875" y="-0.25"/>
<vertex x="-1.875" y="0.125" curve="90"/>
<vertex x="-0.5" y="1.5" curve="90"/>
<vertex x="-1.875" y="2.875" curve="90"/>
<vertex x="-3.25" y="1.5" curve="90"/>
<vertex x="-1.875" y="0.125"/>
<vertex x="-1.875" y="-0.25"/>
<vertex x="-3" y="-0.25"/>
<vertex x="-3" y="-0.5" curve="72.055468"/>
<vertex x="-1" y="-3.25"/>
<vertex x="0" y="-3.25"/>
<vertex x="0" y="-4" curve="-90"/>
<vertex x="-4" y="0" curve="-90"/>
</polygon>
<polygon width="0.2" layer="21">
<vertex x="-1.775" y="1.5" curve="-90"/>
<vertex x="-1.625" y="1.65" curve="-90"/>
<vertex x="-1.475" y="1.5" curve="-90"/>
<vertex x="-1.625" y="1.35" curve="-90"/>
</polygon>
<polygon width="0.2" layer="21">
<vertex x="1.475" y="1.5" curve="-90"/>
<vertex x="1.625" y="1.65" curve="-90"/>
<vertex x="1.775" y="1.5" curve="-90"/>
<vertex x="1.625" y="1.35" curve="-90"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-1" y="-1.375"/>
<vertex x="-1" y="-1.625" curve="18.924644"/>
<vertex x="-0.75" y="-3.125"/>
<vertex x="-0.125" y="-3.125"/>
<vertex x="-0.125" y="-1.375"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="1" y="-1.375"/>
<vertex x="1" y="-1.625" curve="-18.924644"/>
<vertex x="0.75" y="-3.125"/>
<vertex x="0.125" y="-3.125"/>
<vertex x="0.125" y="-1.375"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="1.75" y="-1.375"/>
<vertex x="1.75" y="-1.5" curve="-20.609426"/>
<vertex x="1.5" y="-2.875"/>
<vertex x="1" y="-3.125" curve="20.609204"/>
<vertex x="1.25" y="-1.625"/>
<vertex x="1.25" y="-1.375"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-1.75" y="-1.375"/>
<vertex x="-1.75" y="-1.5" curve="20.609426"/>
<vertex x="-1.5" y="-2.875"/>
<vertex x="-1" y="-3.125" curve="-18.924644"/>
<vertex x="-1.25" y="-1.625"/>
<vertex x="-1.25" y="-1.375"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-2.375" y="-1.375"/>
<vertex x="-2.375" y="-1.5" curve="53.130102"/>
<vertex x="-1.75" y="-2.75" curve="-25.057136"/>
<vertex x="-2" y="-1.625"/>
<vertex x="-2" y="-1.375"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="2.375" y="-1.375"/>
<vertex x="2.375" y="-1.5" curve="-53.130102"/>
<vertex x="1.75" y="-2.75" curve="25.057136"/>
<vertex x="2" y="-1.625"/>
<vertex x="2" y="-1.375"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-2.375" y="-0.375"/>
<vertex x="-2" y="-0.375"/>
<vertex x="-2" y="-1.125"/>
<vertex x="-2.375" y="-1.125"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-1.75" y="-0.375"/>
<vertex x="-1.25" y="-0.375"/>
<vertex x="-1.25" y="-1.125"/>
<vertex x="-1.75" y="-1.125"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-1" y="-0.375"/>
<vertex x="-0.125" y="-0.375"/>
<vertex x="-0.125" y="-1.125"/>
<vertex x="-1" y="-1.125"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="0.125" y="-0.375"/>
<vertex x="1" y="-0.375"/>
<vertex x="1" y="-1.125"/>
<vertex x="0.125" y="-1.125"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="1.25" y="-0.375"/>
<vertex x="1.75" y="-0.375"/>
<vertex x="1.75" y="-1.125"/>
<vertex x="1.25" y="-1.125"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="2" y="-0.375"/>
<vertex x="2.375" y="-0.375"/>
<vertex x="2.375" y="-1.125"/>
<vertex x="2" y="-1.125"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="2.875" y="-0.375"/>
<vertex x="2.875" y="-0.5" curve="-22.62057"/>
<vertex x="2.7813" y="-1.125"/>
<vertex x="2.625" y="-1.125"/>
<vertex x="2.625" y="-0.375"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-2.875" y="-0.375"/>
<vertex x="-2.875" y="-0.5" curve="22.62057"/>
<vertex x="-2.7813" y="-1.125"/>
<vertex x="-2.625" y="-1.125"/>
<vertex x="-2.625" y="-0.375"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="-2.6875" y="-1.375"/>
<vertex x="-2.5938" y="-1.375"/>
<vertex x="-2.5" y="-1.875"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="2.6875" y="-1.375"/>
<vertex x="2.5937" y="-1.375"/>
<vertex x="2.5" y="-1.875"/>
</polygon>
<polygon width="0" layer="51">
<vertex x="-1.875" y="0.375" curve="90"/>
<vertex x="-0.75" y="1.5" curve="90"/>
<vertex x="-1.875" y="2.625" curve="90"/>
<vertex x="-3" y="1.5"/>
<vertex x="-2.25" y="1.5" curve="-90"/>
<vertex x="-1.875" y="1.875" curve="-90"/>
<vertex x="-1.5" y="1.5" curve="-90"/>
<vertex x="-1.875" y="1.125" curve="-90"/>
<vertex x="-2.25" y="1.5"/>
<vertex x="-3" y="1.5" curve="90"/>
</polygon>
<polygon width="0" layer="51">
<vertex x="1.875" y="0.375" curve="90"/>
<vertex x="3" y="1.5" curve="90"/>
<vertex x="1.875" y="2.625" curve="90"/>
<vertex x="0.75" y="1.5"/>
<vertex x="1.5" y="1.5" curve="-90"/>
<vertex x="1.875" y="1.875" curve="-90"/>
<vertex x="2.25" y="1.5" curve="-90"/>
<vertex x="1.875" y="1.125" curve="-90"/>
<vertex x="1.5" y="1.5"/>
<vertex x="0.75" y="1.5" curve="90"/>
</polygon>
<polygon width="0.2" layer="21">
<vertex x="-1.625" y="0.35" curve="90"/>
<vertex x="-0.475" y="1.5" curve="90"/>
<vertex x="-1.625" y="2.65" curve="90"/>
<vertex x="-2.775" y="1.5"/>
<vertex x="-2.725" y="1.5" curve="-90"/>
<vertex x="-1.625" y="2.6" curve="-90"/>
<vertex x="-0.525" y="1.5" curve="-90"/>
<vertex x="-1.625" y="0.4" curve="-90"/>
<vertex x="-2.725" y="1.5"/>
<vertex x="-2.775" y="1.5" curve="90"/>
</polygon>
<polygon width="0.2" layer="21">
<vertex x="1.625" y="0.35" curve="90"/>
<vertex x="2.775" y="1.5" curve="90"/>
<vertex x="1.625" y="2.65" curve="90"/>
<vertex x="0.475" y="1.5"/>
<vertex x="0.525" y="1.5" curve="-90"/>
<vertex x="1.625" y="2.6" curve="-90"/>
<vertex x="2.725" y="1.5" curve="-90"/>
<vertex x="1.625" y="0.4" curve="-90"/>
<vertex x="0.525" y="1.5"/>
<vertex x="0.475" y="1.5" curve="90"/>
</polygon>
</package>
<package name="LSM330-AXES">
<wire x1="-0.3" y1="0" x2="-1.2" y2="0" width="0.1" layer="21"/>
<wire x1="-1.2" y1="0" x2="-0.9" y2="0.3" width="0.1" layer="21"/>
<wire x1="-1.2" y1="0" x2="-0.9" y2="-0.3" width="0.1" layer="21"/>
<wire x1="0" y1="-1.2" x2="-0.3" y2="-0.9" width="0.1" layer="21"/>
<wire x1="0" y1="-1.2" x2="0.3" y2="-0.9" width="0.1" layer="21"/>
<wire x1="0" y1="-0.3" x2="0" y2="-1.2" width="0.1" layer="21"/>
<wire x1="-0.6" y1="-0.3" x2="-0.5" y2="0.3" width="0.1" layer="21" curve="-180"/>
<wire x1="0.3" y1="-0.6" x2="-0.3" y2="-0.5" width="0.1" layer="21" curve="-180"/>
<wire x1="-0.2" y1="-0.6" x2="-0.3" y2="-0.5" width="0.1" layer="21"/>
<wire x1="-0.3" y1="-0.5" x2="-0.4" y2="-0.6" width="0.1" layer="21"/>
<wire x1="-0.5" y1="0.3" x2="-0.6" y2="0.4" width="0.1" layer="21"/>
<wire x1="-0.5" y1="0.3" x2="-0.6" y2="0.2" width="0.1" layer="21"/>
<wire x1="0.5" y1="-0.3" x2="-0.1" y2="0.6" width="0.1" layer="21" curve="119.982359"/>
<wire x1="-0.1" y1="0.6" x2="0" y2="0.7" width="0.1" layer="21"/>
<wire x1="-0.1" y1="0.6" x2="0" y2="0.5" width="0.1" layer="21"/>
<circle x="0" y="0" radius="0.3" width="0.1" layer="21"/>
<circle x="0" y="0" radius="0.05" width="0.175" layer="21"/>
<text x="-1.1" y="0.4" size="0.6" layer="21" font="vector" ratio="20">x</text>
<text x="0.4" y="-1.1" size="0.6" layer="21" font="vector" ratio="20">y</text>
<text x="0.5" y="0.4" size="0.6" layer="21" font="vector" ratio="20">z</text>
</package>
<package name="TO-227A">
<smd name="1" x="-1.05" y="-1.8" dx="1.4" dy="1.4" layer="1" thermals="no"/>
<smd name="2" x="1.05" y="-1.8" dx="1.4" dy="1.4" layer="1" thermals="no"/>
<smd name="3" x="0" y="2" dx="4.8" dy="5" layer="1" thermals="no"/>
<rectangle x1="-2.15" y1="-2.1" x2="2.15" y2="4" layer="51"/>
<rectangle x1="-1.65" y1="-2.3" x2="-0.45" y2="-1.21" layer="51"/>
<rectangle x1="0.45" y1="-2.3" x2="1.65" y2="-1.21" layer="51"/>
<rectangle x1="-1.775" y1="-0.4" x2="1.775" y2="4.2" layer="51"/>
</package>
<package name="VREG-V78XX-SFSR">
<wire x1="6" y1="-2.35" x2="-6" y2="-2.35" width="0.25" layer="21"/>
<wire x1="-6" y1="-2.35" x2="-6" y2="5.8" width="0.25" layer="21"/>
<wire x1="-6" y1="5.8" x2="6" y2="5.8" width="0.25" layer="21"/>
<wire x1="6" y1="5.8" x2="6" y2="-2.35" width="0.25" layer="21"/>
<pad name="VIN" x="-2.54" y="0" drill="1" diameter="1.8" thermals="no"/>
<pad name="GND" x="0" y="0" drill="1" diameter="1.8" thermals="no"/>
<pad name="VOUT" x="2.54" y="0" drill="1" diameter="1.8" thermals="no"/>
<rectangle x1="-5.75" y1="-2.1" x2="5.75" y2="5.55" layer="51"/>
</package>
<package name="VREG-LMZ1420X_BREAKOUT_BOT">
<smd name="1" x="-8.88" y="-4.15" dx="3.3" dy="2.7" layer="16" rot="R90" thermals="no"/>
<smd name="2" x="8.64" y="-4.43" dx="3.3" dy="2.7" layer="16" rot="R180" thermals="no"/>
<smd name="3" x="3.81" y="4.49" dx="3.3" dy="2.7" layer="16" rot="R180" thermals="no"/>
<smd name="4" x="-0.24" y="4.49" dx="3.3" dy="2.7" layer="16" rot="R180" thermals="no"/>
<smd name="5" x="-4.31" y="4.49" dx="3.3" dy="2.7" layer="16" rot="R180" thermals="no"/>
<wire x1="-11" y1="-8.5" x2="11" y2="-8.5" width="0.25" layer="52"/>
<wire x1="11" y1="-8.5" x2="11" y2="6.5" width="0.25" layer="52"/>
<wire x1="11" y1="6.5" x2="8" y2="9.5" width="0.25" layer="52"/>
<wire x1="8" y1="9.5" x2="-2.5" y2="9.5" width="0.25" layer="52"/>
<wire x1="-2.5" y1="9.5" x2="-5.5" y2="6.5" width="0.25" layer="52"/>
<wire x1="-5.5" y1="6.5" x2="-11" y2="6.5" width="0.25" layer="52"/>
<wire x1="-11" y1="6.5" x2="-11" y2="-8.5" width="0.25" layer="52"/>
</package>
<package name="VREG-LMZ1420X_BREAKOUT_TOP">
<smd name="1" x="-8.88" y="-4.15" dx="3.3" dy="2.7" layer="1" rot="R90" thermals="no"/>
<smd name="2" x="8.64" y="-4.43" dx="3.3" dy="2.7" layer="1" thermals="no"/>
<smd name="3" x="3.81" y="4.49" dx="3.3" dy="2.7" layer="1" thermals="no"/>
<smd name="4" x="-0.24" y="4.49" dx="3.3" dy="2.7" layer="1" thermals="no"/>
<smd name="5" x="-4.31" y="4.49" dx="3.3" dy="2.7" layer="1" thermals="no"/>
<wire x1="-11" y1="-8.5" x2="-11" y2="6.5" width="0.25" layer="51"/>
<wire x1="-11" y1="6.5" x2="-5.5" y2="6.5" width="0.25" layer="51"/>
<wire x1="-5.5" y1="6.5" x2="-2.5" y2="9.5" width="0.25" layer="51"/>
<wire x1="-2.5" y1="9.5" x2="8" y2="9.5" width="0.25" layer="51"/>
<wire x1="8" y1="9.5" x2="11" y2="6.5" width="0.25" layer="51"/>
<wire x1="11" y1="6.5" x2="11" y2="-8.5" width="0.25" layer="51"/>
<wire x1="11" y1="-8.5" x2="-11" y2="-8.5" width="0.25" layer="51"/>
</package>
<package name="SOT-223">
<smd name="1" x="-2.3" y="-3.1" dx="1.2" dy="2.2" layer="1" thermals="no"/>
<smd name="2" x="0" y="-3.1" dx="1.2" dy="2.2" layer="1" thermals="no"/>
<smd name="3" x="2.3" y="-3.1" dx="1.2" dy="2.2" layer="1" thermals="no"/>
<smd name="4" x="0" y="3.1" dx="3.5" dy="2.2" layer="1" thermals="no"/>
<wire x1="-3.25" y1="1.75" x2="3.25" y2="1.75" width="0.25" layer="51"/>
<wire x1="3.25" y1="1.75" x2="3.25" y2="-1.75" width="0.25" layer="51"/>
<wire x1="3.25" y1="-1.75" x2="-3.25" y2="-1.75" width="0.25" layer="51"/>
<wire x1="-3.25" y1="-1.75" x2="-3.25" y2="1.75" width="0.25" layer="51"/>
<rectangle x1="-2.65" y1="-3.5" x2="-1.95" y2="-1.75" layer="51"/>
<rectangle x1="-0.35" y1="-3.5" x2="0.35" y2="-1.75" layer="51"/>
<rectangle x1="1.95" y1="-3.5" x2="2.65" y2="-1.75" layer="51"/>
<rectangle x1="-1.5" y1="1.75" x2="1.5" y2="3.5" layer="51"/>
<wire x1="-2.25" y1="2.25" x2="-3.75" y2="2.25" width="0.25" layer="21"/>
<wire x1="-3.75" y1="2.25" x2="-3.75" y2="-2.25" width="0.25" layer="21"/>
<wire x1="-3.75" y1="-2.25" x2="-3.25" y2="-2.25" width="0.25" layer="21"/>
<wire x1="2.25" y1="2.25" x2="3.75" y2="2.25" width="0.25" layer="21"/>
<wire x1="3.75" y1="2.25" x2="3.75" y2="-2.25" width="0.25" layer="21"/>
<wire x1="3.75" y1="-2.25" x2="3.25" y2="-2.25" width="0.25" layer="21"/>
</package>
<package name="TO-252-3-BARE">
<smd name="3D" x="0" y="6.75" dx="7" dy="7.5" layer="1" thermals="no"/>
<smd name="1G" x="-2.3" y="0" dx="2" dy="3" layer="1" thermals="no"/>
<smd name="2S" x="2.3" y="0" dx="2" dy="3" layer="1" thermals="no"/>
<rectangle x1="-2.75" y1="3.7" x2="2.75" y2="9.5" layer="51"/>
<rectangle x1="-2.9" y1="-1" x2="-1.7" y2="1" layer="51"/>
<rectangle x1="1.7" y1="-1" x2="2.9" y2="1" layer="51"/>
</package>
<package name="TO-263-3-BARE">
<smd name="1G" x="-2.6" y="0" dx="2.5" dy="4" layer="1" thermals="no"/>
<smd name="2S" x="2.6" y="0" dx="2.5" dy="4" layer="1" thermals="no"/>
<smd name="3D" x="0" y="10.2" dx="12" dy="11" layer="1" thermals="no"/>
<rectangle x1="-3.3" y1="-1.4" x2="-1.9" y2="1.4" layer="51"/>
<rectangle x1="1.9" y1="-1.4" x2="3.3" y2="1.4" layer="51"/>
<rectangle x1="-5.2" y1="5.6" x2="5.2" y2="14.6" layer="51"/>
</package>
<package name="8MM_LED_PTH">
<wire x1="-4" y1="2" x2="-4" y2="-2" width="0.25" layer="21"/>
<wire x1="-4" y1="2" x2="-4" y2="-2" width="0.25" layer="21" curve="-306.869898"/>
<pad name="P$1" x="-2.5" y="0" drill="1.016" diameter="2.1844" shape="offset" thermals="no"/>
<pad name="P$2" x="2.5" y="0" drill="1.016" diameter="2.1844" shape="square" thermals="no"/>
</package>
<package name="P4XX-RM">
<wire x1="-1.35" y1="0.3" x2="-2.1" y2="0.3" width="0.25" layer="21"/>
<wire x1="-2.1" y1="0.3" x2="-2.1" y2="-1" width="0.25" layer="21"/>
<wire x1="2.1" y1="1" x2="2.1" y2="-0.3" width="0.25" layer="21"/>
<wire x1="2.1" y1="-0.3" x2="1.35" y2="-0.3" width="0.25" layer="21"/>
<wire x1="-1.35" y1="0.3" x2="0.95" y2="1" width="0.25" layer="21" curve="-121.048222"/>
<wire x1="1.35" y1="-0.3" x2="-0.95" y2="-1" width="0.25" layer="21" curve="-121.048222"/>
<wire x1="-2.1" y1="-1" x2="-0.95" y2="-1" width="0.25" layer="21"/>
<wire x1="2.1" y1="1" x2="0.95" y2="1" width="0.25" layer="21"/>
<wire x1="2.375" y1="0" x2="3" y2="0" width="0.125" layer="21"/>
<wire x1="3" y1="0" x2="3.125" y2="0" width="0.125" layer="21"/>
<wire x1="3" y1="0.25" x2="3" y2="0" width="0.125" layer="21"/>
<wire x1="3" y1="0" x2="3" y2="-0.25" width="0.125" layer="21"/>
<wire x1="-2.625" y1="-0.125" x2="-2.375" y2="-0.125" width="0.125" layer="21"/>
<wire x1="-2.375" y1="-0.125" x2="-2.375" y2="0.125" width="0.125" layer="21"/>
<wire x1="-2.375" y1="0.125" x2="-2.625" y2="0.125" width="0.125" layer="21"/>
<wire x1="-2.625" y1="-0.125" x2="-2.625" y2="0.125" width="0.125" layer="21" curve="-304.641586"/>
<circle x="0" y="0" radius="1.25" width="0" layer="51"/>
<circle x="-2.875" y="0" radius="0.1" width="0.125" layer="21"/>
<smd name="A" x="-2.35" y="0" dx="2.1" dy="2.2" layer="1" stop="no" thermals="no" cream="no"/>
<smd name="C" x="2.35" y="0" dx="2.1" dy="2.2" layer="1" stop="no" thermals="no" cream="no"/>
<rectangle x1="-1.8" y1="-0.725" x2="-1.3" y2="-0.025" layer="31"/>
<rectangle x1="-1.9" y1="-0.825" x2="-1.2" y2="0.075" layer="29"/>
<rectangle x1="1.3" y1="0.025" x2="1.8" y2="0.725" layer="31"/>
<rectangle x1="1.2" y1="-0.075" x2="1.9" y2="0.825" layer="29"/>
<hole x="0" y="0" drill="2.1"/>
<polygon width="0" layer="51">
<vertex x="-1.225" y="-0.075"/>
<vertex x="-1.75" y="-0.075"/>
<vertex x="-1.75" y="-0.675"/>
<vertex x="-1.025" y="-0.675"/>
<vertex x="-1.025" y="-0.275"/>
</polygon>
<polygon width="0" layer="51">
<vertex x="1.225" y="0.075"/>
<vertex x="1.75" y="0.075"/>
<vertex x="1.75" y="0.675"/>
<vertex x="1.025" y="0.675"/>
<vertex x="1.025" y="0.275"/>
</polygon>
<polygon width="0.127" layer="21">
<vertex x="2.5" y="0.25"/>
<vertex x="2.5" y="-0.25"/>
<vertex x="3" y="0"/>
</polygon>
</package>
<package name="XLAMP_XM-L">
<wire x1="-2.25" y1="3" x2="3" y2="3" width="0.25" layer="21"/>
<wire x1="3" y1="3" x2="3" y2="-3" width="0.25" layer="21"/>
<wire x1="3" y1="-3" x2="-2.25" y2="-3" width="0.25" layer="21"/>
<wire x1="-2.25" y1="-3" x2="-3" y2="-2.25" width="0.25" layer="21"/>
<wire x1="-3" y1="-2.25" x2="-3" y2="2.25" width="0.25" layer="21"/>
<wire x1="-3" y1="2.25" x2="-2.25" y2="3" width="0.25" layer="21"/>
<wire x1="-2.45" y1="2.45" x2="2.45" y2="2.45" width="0.127" layer="51"/>
<wire x1="2.45" y1="2.45" x2="2.45" y2="0" width="0.127" layer="51"/>
<wire x1="2.45" y1="0" x2="2.45" y2="-2.45" width="0.127" layer="51"/>
<wire x1="2.45" y1="-2.45" x2="-2.45" y2="-2.45" width="0.127" layer="51"/>
<wire x1="-2.45" y1="-2.45" x2="-2.45" y2="2.45" width="0.127" layer="51"/>
<wire x1="2" y1="0.5" x2="2" y2="-0.5" width="0.127" layer="51"/>
<wire x1="1.5" y1="0" x2="2.45" y2="0" width="0.127" layer="51"/>
<wire x1="-3" y1="3" x2="-3" y2="2.25" width="0.25" layer="21"/>
<wire x1="-3" y1="-2.25" x2="-3" y2="-3" width="0.25" layer="21"/>
<circle x="0" y="0" radius="2.236" width="0.127" layer="51"/>
<smd name="C" x="-2.4" y="0" dx="1" dy="4.8" layer="1" stop="no" thermals="no" cream="no"/>
<smd name="A" x="2.4" y="0" dx="1" dy="4.8" layer="1" stop="no" thermals="no" cream="no"/>
<smd name="T" x="0" y="0" dx="2.782" dy="4.8" layer="1" stop="no" thermals="no" cream="no"/>
<rectangle x1="-2.5" y1="-2.5" x2="-1.55" y2="-1.7" layer="51"/>
<rectangle x1="1.55" y1="-2.5" x2="2.5" y2="-1.7" layer="51"/>
<rectangle x1="-2.5" y1="2" x2="-2" y2="2.5" layer="51"/>
<rectangle x1="2" y1="2" x2="2.5" y2="2.5" layer="51"/>
<rectangle x1="-2.5" y1="-2.5" x2="-1.8" y2="2.5" layer="29"/>
<rectangle x1="1.8" y1="-2.5" x2="2.5" y2="2.5" layer="29"/>
<rectangle x1="-2.35" y1="-2.35" x2="-1.95" y2="2.35" layer="31"/>
<rectangle x1="1.95" y1="-2.35" x2="2.35" y2="2.35" layer="31"/>
<rectangle x1="-1.5" y1="-2.5" x2="1.5" y2="2.5" layer="29"/>
<rectangle x1="-1.35" y1="-2.35" x2="1.35" y2="2.35" layer="31"/>
</package>
<package name="Z-BEND_RM">
<wire x1="-2.5" y1="1.25" x2="1.5" y2="1.25" width="0.25" layer="21"/>
<wire x1="-2.5" y1="0.875" x2="-2.5" y2="1.25" width="0.25" layer="21"/>
<wire x1="-2.5" y1="-0.875" x2="-2.5" y2="-1.25" width="0.25" layer="21"/>
<wire x1="-2.5" y1="-1.25" x2="1.5" y2="-1.25" width="0.25" layer="21"/>
<wire x1="1.5" y1="-1.25" x2="1.5" y2="-0.875" width="0.25" layer="21"/>
<smd name="A" x="-2.5" y="0" dx="1.6" dy="1" layer="1" thermals="no"/>
<smd name="K" x="2.5" y="0" dx="1.6" dy="1" layer="1" thermals="no"/>
<hole x="0" y="0" drill="2"/>
<circle x="0" y="0" radius="0.95" width="0" layer="51"/>
<wire x1="1.1" y1="1" x2="1.1" y2="-1" width="0.25" layer="51"/>
<wire x1="1.1" y1="-1" x2="-1.4" y2="-1" width="0.25" layer="51"/>
<wire x1="-1.4" y1="-1" x2="-1.4" y2="1" width="0.25" layer="51"/>
<wire x1="-1.4" y1="1" x2="1.1" y2="1" width="0.25" layer="51"/>
<rectangle x1="2.15" y1="-0.25" x2="2.9" y2="0.25" layer="51"/>
<rectangle x1="-2.9" y1="-0.25" x2="-2.15" y2="0.25" layer="51"/>
<polygon width="0.25" layer="21">
<vertex x="1.5" y="0.875"/>
<vertex x="1.5" y="1.25"/>
<vertex x="1.8125" y="1.0625"/>
</polygon>
<wire x1="2" y1="0.875" x2="2" y2="1.25" width="0.25" layer="21"/>
</package>
<package name="8MM_LED_PTH_A">
<wire x1="-4" y1="2" x2="-4" y2="-2" width="0.25" layer="21"/>
<wire x1="-4" y1="2" x2="-4" y2="-2" width="0.25" layer="21" curve="-306.869898"/>
<pad name="P$1" x="-2.5" y="0" drill="1.016" diameter="2.1844" shape="square" thermals="no"/>
<pad name="P$2" x="2.5" y="0" drill="1.016" diameter="2.1844" shape="square" thermals="no"/>
</package>
<package name="DO-214AC(SMA)">
<wire x1="-0.254" y1="-0.508" x2="-0.254" y2="0" width="0.25" layer="21"/>
<wire x1="-0.254" y1="0" x2="-0.254" y2="0.508" width="0.25" layer="21"/>
<wire x1="-0.254" y1="0" x2="0.254" y2="-0.508" width="0.25" layer="21"/>
<wire x1="0.254" y1="-0.508" x2="0.254" y2="0" width="0.25" layer="21"/>
<wire x1="0.254" y1="0" x2="0.254" y2="0.508" width="0.25" layer="21"/>
<wire x1="0.254" y1="0.508" x2="-0.254" y2="0" width="0.25" layer="21"/>
<wire x1="0.254" y1="0" x2="0.508" y2="0" width="0.25" layer="21"/>
<wire x1="-0.254" y1="0" x2="-0.508" y2="0" width="0.25" layer="21"/>
<wire x1="-2.794" y1="1.524" x2="-2.794" y2="1.778" width="0.25" layer="21"/>
<wire x1="-2.794" y1="1.778" x2="2.794" y2="1.778" width="0.25" layer="21"/>
<wire x1="2.794" y1="1.778" x2="2.794" y2="1.524" width="0.25" layer="21"/>
<wire x1="2.794" y1="-1.524" x2="2.794" y2="-1.778" width="0.25" layer="21"/>
<wire x1="-2.794" y1="-1.778" x2="2.794" y2="-1.778" width="0.25" layer="21"/>
<wire x1="-2.794" y1="-1.778" x2="-2.794" y2="-1.524" width="0.25" layer="21"/>
<smd name="C" x="-2.032" y="0" dx="2.159" dy="1.778" layer="1" rot="R90" thermals="no"/>
<smd name="A" x="2.032" y="0" dx="2.159" dy="1.778" layer="1" rot="R90" thermals="no"/>
</package>
<package name="DO-216AA">
<smd name="K" x="-1.655" y="0" dx="2.67" dy="2.54" layer="1" thermals="no"/>
<smd name="A" x="0.7" y="0" dx="0.76" dy="1.27" layer="1" thermals="no"/>
<wire x1="-1.5" y1="0" x2="-1" y2="0" width="0.25" layer="51"/>
<wire x1="-1" y1="0" x2="-1" y2="0.5" width="0.25" layer="51"/>
<wire x1="-1" y1="0" x2="-1" y2="-0.5" width="0.25" layer="51"/>
<wire x1="-1" y1="0" x2="0" y2="0.5" width="0.25" layer="51"/>
<wire x1="0" y1="0.5" x2="0" y2="0" width="0.25" layer="51"/>
<wire x1="0" y1="0" x2="0" y2="-0.5" width="0.25" layer="51"/>
<wire x1="0" y1="-0.5" x2="-1" y2="0" width="0.25" layer="51"/>
<wire x1="0" y1="0" x2="0.5" y2="0" width="0.25" layer="51"/>
<wire x1="-3.5" y1="1.25" x2="-3.5" y2="1.75" width="0.25" layer="21"/>
<wire x1="-3.5" y1="1.75" x2="0.25" y2="1.75" width="0.25" layer="21"/>
<wire x1="0.25" y1="1.75" x2="0.25" y2="1.25" width="0.25" layer="21"/>
<wire x1="-3.5" y1="-1.25" x2="-3.5" y2="-1.75" width="0.25" layer="21"/>
<wire x1="-3.5" y1="-1.75" x2="0.25" y2="-1.75" width="0.25" layer="21"/>
<wire x1="0.25" y1="-1.75" x2="0.25" y2="-1.25" width="0.25" layer="21"/>
</package>
<package name="DO-214AB(SMC)">
<smd name="A" x="3.4" y="0" dx="2.5" dy="3.3" layer="1" rot="R180" thermals="no"/>
<smd name="K" x="-3.4" y="0" dx="2.5" dy="3.3" layer="1" rot="R180" thermals="no"/>
<rectangle x1="-4" y1="-1.6" x2="4" y2="1.6" layer="51" rot="R180"/>
<rectangle x1="-3.55" y1="-3.1" x2="3.55" y2="3.1" layer="51" rot="R180"/>
<wire x1="3.75" y1="-2" x2="3.75" y2="-3.3" width="0.25" layer="21"/>
<wire x1="3.75" y1="-3.3" x2="-3.75" y2="-3.3" width="0.25" layer="21"/>
<wire x1="-3.75" y1="-3.3" x2="-3.75" y2="-2" width="0.25" layer="21"/>
<wire x1="3.75" y1="2" x2="3.75" y2="3.3" width="0.25" layer="21"/>
<wire x1="3.75" y1="3.3" x2="-3.75" y2="3.3" width="0.25" layer="21"/>
<wire x1="-3.75" y1="3.3" x2="-3.75" y2="2" width="0.25" layer="21"/>
<wire x1="0.375" y1="-0.5" x2="-0.375" y2="0" width="0.25" layer="21"/>
<wire x1="-0.375" y1="0" x2="0.375" y2="0.5" width="0.25" layer="21"/>
<wire x1="0.375" y1="0.5" x2="0.375" y2="0" width="0.25" layer="21"/>
<wire x1="0.375" y1="0" x2="0.375" y2="-0.5" width="0.25" layer="21"/>
<wire x1="-0.375" y1="-0.5" x2="-0.375" y2="0" width="0.25" layer="21"/>
<wire x1="-0.375" y1="0" x2="-0.375" y2="0.5" width="0.25" layer="21"/>
<wire x1="0.375" y1="0" x2="0.625" y2="0" width="0.25" layer="21"/>
<wire x1="-0.375" y1="0" x2="-0.625" y2="0" width="0.25" layer="21"/>
</package>
<package name="TO-252-3-BIGBARE">
<smd name="3D" x="0" y="6.75" dx="7" dy="7.5" layer="1" thermals="no"/>
<smd name="1G" x="-2.3" y="0" dx="2" dy="3" layer="1" thermals="no"/>
<smd name="2S" x="1.75" y="0" dx="3.5" dy="3" layer="1" thermals="no"/>
<rectangle x1="-2.75" y1="3.7" x2="2.75" y2="9.5" layer="51"/>
<rectangle x1="-2.9" y1="-1" x2="-1.7" y2="1" layer="51"/>
<rectangle x1="1.7" y1="-1" x2="2.9" y2="1" layer="51"/>
</package>
<package name="ESP8266-02">
<smd name="GND" x="-7.1" y="3.81" dx="2" dy="1.5" layer="1" thermals="no"/>
<smd name="RXD" x="-7.1" y="1.27" dx="2" dy="1.5" layer="1" thermals="no"/>
<smd name="TXD" x="-7.1" y="-1.27" dx="2" dy="1.5" layer="1" thermals="no"/>
<smd name="VCC" x="-7.1" y="-3.81" dx="2" dy="1.5" layer="1" thermals="no"/>
<smd name="GPIO15" x="7.1" y="-3.81" dx="2" dy="1.5" layer="1" thermals="no"/>
<smd name="GPIO0" x="7.1" y="-1.27" dx="2" dy="1.5" layer="1" thermals="no"/>
<smd name="GPIO2" x="7.1" y="1.27" dx="2" dy="1.5" layer="1" thermals="no"/>
<smd name="RESET" x="7.1" y="3.81" dx="2" dy="1.5" layer="1" thermals="no"/>
<wire x1="-7.5" y1="-5" x2="7.5" y2="-5" width="0.25" layer="51"/>
<wire x1="7.5" y1="-5" x2="7.5" y2="10" width="0.25" layer="51"/>
<wire x1="7.5" y1="10" x2="-7.5" y2="10" width="0.25" layer="51"/>
<wire x1="-7.5" y1="10" x2="-7.5" y2="-5" width="0.25" layer="51"/>
<circle x="5.5" y="7.5" radius="1" width="0.25" layer="51"/>
<circle x="5.5" y="7.5" radius="0.2" width="0" layer="51"/>
<wire x1="-8" y1="5" x2="-8" y2="10.5" width="0.25" layer="21"/>
<wire x1="-8" y1="10.5" x2="8" y2="10.5" width="0.25" layer="21"/>
<wire x1="8" y1="10.5" x2="8" y2="5" width="0.25" layer="21"/>
<wire x1="-8" y1="-5" x2="-8" y2="-5.5" width="0.25" layer="21"/>
<wire x1="-8" y1="-5.5" x2="8" y2="-5.5" width="0.25" layer="21"/>
<wire x1="8" y1="-5.5" x2="8" y2="-5" width="0.25" layer="21"/>
</package>
<package name="HEADER-0.1&quot;_1X6">
<pad name="1" x="-6.35" y="0.05" drill="1" shape="square" thermals="no"/>
<pad name="2" x="-3.81" y="-0.05" drill="1" shape="square" thermals="no"/>
<pad name="3" x="-1.27" y="0.05" drill="1" shape="square" thermals="no"/>
<wire x1="-7.62" y1="1.27" x2="-7.62" y2="-1.27" width="0.25" layer="21"/>
<wire x1="-7.62" y1="-1.27" x2="7.62" y2="-1.27" width="0.25" layer="21"/>
<wire x1="7.62" y1="-1.27" x2="7.62" y2="1.27" width="0.25" layer="21"/>
<wire x1="7.62" y1="1.27" x2="-7.62" y2="1.27" width="0.25" layer="21"/>
<circle x="-7.62" y="1.27" radius="0.25" width="0" layer="21"/>
<pad name="4" x="1.27" y="-0.05" drill="1" shape="square" thermals="no"/>
<pad name="5" x="3.81" y="0.05" drill="1" shape="square" thermals="no"/>
<pad name="6" x="6.35" y="-0.05" drill="1" shape="square" thermals="no"/>
</package>
<package name="HEADER-2MM_1X6-SMD">
<smd name="1@1" x="-5" y="-1.25" dx="2" dy="0.89" layer="1" rot="R90" thermals="no"/>
<smd name="2@1" x="-3" y="-1.25" dx="2" dy="0.89" layer="1" rot="R90" thermals="no"/>
<smd name="3@1" x="-1" y="-1.25" dx="2" dy="0.89" layer="1" rot="R90" thermals="no"/>
<smd name="4@1" x="1" y="-1.25" dx="2" dy="0.89" layer="1" rot="R90" thermals="no"/>
<wire x1="-6.75" y1="1.5" x2="-5.75" y2="1.5" width="0.25" layer="21"/>
<wire x1="-2.25" y1="1.5" x2="-1.75" y2="1.5" width="0.25" layer="21"/>
<wire x1="5.75" y1="1.5" x2="6.75" y2="1.5" width="0.25" layer="21"/>
<wire x1="6.75" y1="1.5" x2="6.75" y2="-1.5" width="0.25" layer="21"/>
<wire x1="6.75" y1="-1.5" x2="5.75" y2="-1.5" width="0.25" layer="21"/>
<wire x1="-3.75" y1="-1.5" x2="-4.25" y2="-1.5" width="0.25" layer="21"/>
<wire x1="-5.75" y1="-1.5" x2="-6.25" y2="-1.5" width="0.25" layer="21"/>
<wire x1="-6.25" y1="-1.5" x2="-6.75" y2="-1" width="0.25" layer="21"/>
<wire x1="-6.75" y1="-1" x2="-6.75" y2="1.5" width="0.25" layer="21"/>
<rectangle x1="-6.35" y1="-1.2" x2="6.35" y2="1.2" layer="51"/>
<wire x1="-6.75" y1="-1" x2="-6.25" y2="-1.5" width="0.25" layer="21" curve="180"/>
<wire x1="-4.25" y1="1.5" x2="-3.75" y2="1.5" width="0.25" layer="21"/>
<wire x1="-0.25" y1="1.5" x2="0.25" y2="1.5" width="0.25" layer="21"/>
<wire x1="-0.25" y1="-1.5" x2="0.25" y2="-1.5" width="0.25" layer="21"/>
<wire x1="-2.25" y1="-1.5" x2="-1.75" y2="-1.5" width="0.25" layer="21"/>
<smd name="5@1" x="3" y="-1.25" dx="2" dy="0.89" layer="1" rot="R90" thermals="no"/>
<smd name="6@1" x="5" y="-1.25" dx="2" dy="0.89" layer="1" rot="R90" thermals="no"/>
<wire x1="1.75" y1="1.5" x2="2.25" y2="1.5" width="0.25" layer="21"/>
<wire x1="3.75" y1="1.5" x2="4.25" y2="1.5" width="0.25" layer="21"/>
<wire x1="1.75" y1="-1.5" x2="2.25" y2="-1.5" width="0.25" layer="21"/>
<wire x1="3.75" y1="-1.5" x2="4.25" y2="-1.5" width="0.25" layer="21"/>
<rectangle x1="-5.25" y1="-2" x2="-4.75" y2="-0.4" layer="51"/>
<smd name="1@2" x="-5" y="1.25" dx="2" dy="0.89" layer="1" rot="R270" thermals="no"/>
<smd name="2@2" x="-3" y="1.25" dx="2" dy="0.89" layer="1" rot="R270" thermals="no"/>
<smd name="3@2" x="-1" y="1.25" dx="2" dy="0.89" layer="1" rot="R270" thermals="no"/>
<smd name="4@2" x="1" y="1.25" dx="2" dy="0.89" layer="1" rot="R270" thermals="no"/>
<smd name="5@2" x="3" y="1.25" dx="2" dy="0.89" layer="1" rot="R270" thermals="no"/>
<smd name="6@2" x="5" y="1.25" dx="2" dy="0.89" layer="1" rot="R270" thermals="no"/>
<rectangle x1="-3.25" y1="-2" x2="-2.75" y2="-0.4" layer="51"/>
<rectangle x1="-1.25" y1="-2" x2="-0.75" y2="-0.4" layer="51"/>
<rectangle x1="0.75" y1="-2" x2="1.25" y2="-0.4" layer="51"/>
<rectangle x1="2.75" y1="-2" x2="3.25" y2="-0.4" layer="51"/>
<rectangle x1="4.75" y1="-2" x2="5.25" y2="-0.4" layer="51"/>
<rectangle x1="-5.25" y1="0.4" x2="-4.75" y2="2" layer="51"/>
<rectangle x1="-3.25" y1="0.4" x2="-2.75" y2="2" layer="51"/>
<rectangle x1="-1.25" y1="0.4" x2="-0.75" y2="2" layer="51"/>
<rectangle x1="0.75" y1="0.4" x2="1.25" y2="2" layer="51"/>
<rectangle x1="2.75" y1="0.4" x2="3.25" y2="2" layer="51"/>
<rectangle x1="4.75" y1="0.4" x2="5.25" y2="2" layer="51"/>
</package>
<package name="HEADER-0.1&quot;_2X3-SMD-SULLINS">
<smd name="1" x="-2.54" y="-3.175" dx="1.27" dy="5.08" layer="1" thermals="no"/>
<smd name="3" x="0" y="-3.175" dx="1.27" dy="5.08" layer="1" thermals="no"/>
<smd name="5" x="2.54" y="-3.175" dx="1.27" dy="5.08" layer="1" thermals="no"/>
<smd name="6" x="2.54" y="3.175" dx="1.27" dy="5.08" layer="1" thermals="no"/>
<smd name="4" x="0" y="3.175" dx="1.27" dy="5.08" layer="1" thermals="no"/>
<smd name="2" x="-2.54" y="3.175" dx="1.27" dy="5.08" layer="1" thermals="no"/>
<rectangle x1="-3.81" y1="-2.54" x2="3.81" y2="2.54" layer="51"/>
<rectangle x1="-0.32" y1="-5.335" x2="0.32" y2="-0.95" layer="51"/>
<rectangle x1="-2.86" y1="-5.335" x2="-2.22" y2="-0.95" layer="51"/>
<rectangle x1="2.22" y1="-5.335" x2="2.86" y2="-0.95" layer="51"/>
<rectangle x1="2.22" y1="0.95" x2="2.86" y2="5.335" layer="51"/>
<rectangle x1="-0.32" y1="0.95" x2="0.32" y2="5.335" layer="51"/>
<rectangle x1="-2.86" y1="0.95" x2="-2.22" y2="5.335" layer="51"/>
<wire x1="-4" y1="2.75" x2="-4" y2="-2" width="0.25" layer="21"/>
<wire x1="-4" y1="-2" x2="-4" y2="-2.25" width="0.25" layer="21"/>
<wire x1="-4" y1="-2.25" x2="-4" y2="-2.5" width="0.25" layer="21"/>
<wire x1="-4" y1="-2.5" x2="-4" y2="-2.75" width="0.25" layer="21"/>
<wire x1="-4" y1="-2.75" x2="-3.75" y2="-2.75" width="0.25" layer="21"/>
<wire x1="-3.75" y1="-2.75" x2="-3.5" y2="-2.75" width="0.25" layer="21"/>
<wire x1="-3.5" y1="2.75" x2="-4" y2="2.75" width="0.25" layer="21"/>
<wire x1="-1.5" y1="2.75" x2="-1" y2="2.75" width="0.25" layer="21"/>
<wire x1="1" y1="2.75" x2="1.5" y2="2.75" width="0.25" layer="21"/>
<wire x1="3.5" y1="2.75" x2="4" y2="2.75" width="0.25" layer="21"/>
<wire x1="-1.5" y1="-2.75" x2="-1" y2="-2.75" width="0.25" layer="21"/>
<wire x1="1" y1="-2.75" x2="1.5" y2="-2.75" width="0.25" layer="21"/>
<wire x1="3.5" y1="-2.75" x2="4" y2="-2.75" width="0.25" layer="21"/>
<wire x1="4" y1="-2.75" x2="4" y2="2.75" width="0.25" layer="21"/>
<wire x1="-4" y1="-2.5" x2="-3.75" y2="-2.75" width="0.25" layer="21" curve="180"/>
<wire x1="-4" y1="-2.25" x2="-4" y2="-2.75" width="0.25" layer="21" curve="87.753395"/>
<wire x1="-4" y1="-2.75" x2="-3.5" y2="-2.75" width="0.25" layer="21" curve="92.246605"/>
<wire x1="-3.5" y1="-3" x2="-4" y2="-2" width="0.25" layer="21" curve="-180"/>
<wire x1="-3.5" y1="-2.75" x2="-3.5" y2="-3" width="0.25" layer="21"/>
</package>
<package name="0603_YAGEO">
<description>&lt;b&gt;0603&lt;/b&gt;
&lt;p&gt;
Yageo reflow footprint dimensions</description>
<smd name="1" x="0" y="0.85" dx="0.9" dy="0.9" layer="1" thermals="no"/>
<smd name="2" x="0" y="-0.85" dx="0.9" dy="0.9" layer="1" thermals="no"/>
<rectangle x1="-0.4" y1="-0.8" x2="0.4" y2="0.8" layer="51"/>
</package>
<package name="0805_YAGEO">
<description>&lt;b&gt;0805&lt;/b&gt;
&lt;p&gt;
Yageo reflow footprint dimensions</description>
<smd name="1" x="0" y="1.05" dx="1.4" dy="0.9" layer="1" thermals="no"/>
<smd name="2" x="0" y="-1.05" dx="1.4" dy="0.9" layer="1" thermals="no"/>
<rectangle x1="-0.635" y1="-1.05" x2="0.635" y2="1.05" layer="51"/>
</package>
<package name="1206_YAGEO">
<description>&lt;b&gt;1206&lt;/b&gt;
&lt;p&gt;
Yageo reflow footprint dimensions</description>
<smd name="1" x="0" y="1.6" dx="1.6" dy="1" layer="1" thermals="no"/>
<smd name="2" x="0" y="-1.6" dx="1.6" dy="1" layer="1" thermals="no"/>
<rectangle x1="-0.76" y1="-1.6" x2="0.76" y2="1.6" layer="51"/>
</package>
<package name="1218_YAGEO">
<description>&lt;b&gt;1218&lt;/b&gt;
&lt;p&gt;
Yageo reflow footprint dimensions</description>
<smd name="1" x="0" y="1.6" dx="4.8" dy="1" layer="1" thermals="no"/>
<smd name="2" x="0" y="-1.6" dx="4.8" dy="1" layer="1" thermals="no"/>
<rectangle x1="-2.3" y1="-1.6" x2="2.3" y2="1.6" layer="51"/>
</package>
<package name="1210_YAGEO">
<description>&lt;b&gt;1210&lt;/b&gt;
&lt;p&gt;
Yageo reflow footprint dimensions</description>
<smd name="1" x="0" y="1.6" dx="2.6" dy="1" layer="1" thermals="no"/>
<smd name="2" x="0" y="-1.6" dx="2.6" dy="1" layer="1" thermals="no"/>
<rectangle x1="-1.3" y1="-1.6" x2="1.3" y2="1.6" layer="51"/>
</package>
<package name="2010_YAGEO">
<description>&lt;b&gt;2010&lt;/b&gt;
&lt;p&gt;
Yageo reflow footprint dimensions</description>
<smd name="1" x="0" y="2.35" dx="2.6" dy="1.4" layer="1" thermals="no"/>
<smd name="2" x="0" y="-2.35" dx="2.6" dy="1.4" layer="1" thermals="no"/>
<rectangle x1="-1.27" y1="-2.54" x2="1.27" y2="2.54" layer="51"/>
</package>
<package name="2512_YAGEO">
<description>&lt;b&gt;2512&lt;/b&gt;
&lt;p&gt;
Yageo reflow footprint dimensions</description>
<smd name="1" x="0" y="3.1" dx="3.2" dy="1.8" layer="1" thermals="no"/>
<smd name="2" x="0" y="-3.1" dx="3.2" dy="1.8" layer="1" thermals="no"/>
<rectangle x1="-1.53" y1="-3.2" x2="1.53" y2="3.2" layer="51"/>
</package>
<package name="2512_SUSUMU_POWER">
<description>&lt;b&gt;2512&lt;/b&gt;
&lt;p&gt;
Susumu power resistor footprint dimensions</description>
<smd name="1" x="0" y="2.2" dx="3.5" dy="2.8" layer="1" thermals="no"/>
<smd name="2" x="0" y="-2.2" dx="3.5" dy="2.8" layer="1" thermals="no"/>
<rectangle x1="-1.6" y1="-3.15" x2="1.6" y2="3.15" layer="51"/>
</package>
<package name="0201_YAGEO">
<description>&lt;b&gt;0201&lt;/b&gt;
&lt;p&gt;
Yageo reflow footprint dimensions</description>
<smd name="1" x="0" y="0.325" dx="0.4" dy="0.35" layer="1" thermals="no"/>
<smd name="2" x="0" y="-0.325" dx="0.4" dy="0.35" layer="1" thermals="no"/>
<rectangle x1="-0.15" y1="-0.33" x2="0.15" y2="0.3" layer="51"/>
</package>
<package name="SOT-23-3">
<description>SOT-23-3, TO-236-3, SC-59</description>
<smd name="1G" x="-0.95" y="-1.1" dx="0.8" dy="0.9" layer="1" thermals="no"/>
<smd name="2S" x="0.95" y="-1.1" dx="0.8" dy="0.9" layer="1" thermals="no"/>
<smd name="3D" x="0" y="1.1" dx="0.8" dy="0.9" layer="1" thermals="no"/>
<wire x1="-1.5" y1="0.8" x2="1.5" y2="0.8" width="0.1" layer="51"/>
<wire x1="1.5" y1="0.8" x2="1.5" y2="-0.8" width="0.1" layer="51"/>
<wire x1="1.5" y1="-0.8" x2="-1.5" y2="-0.8" width="0.1" layer="51"/>
<wire x1="-1.5" y1="-0.8" x2="-1.5" y2="0.8" width="0.1" layer="51"/>
<rectangle x1="-1.15" y1="-1.4" x2="-0.75" y2="-0.8" layer="51"/>
<rectangle x1="0.75" y1="-1.4" x2="1.15" y2="-0.8" layer="51"/>
<rectangle x1="-0.2" y1="0.8" x2="0.2" y2="1.4" layer="51"/>
<wire x1="-0.75" y1="1" x2="-1.75" y2="1" width="0.25" layer="21"/>
<wire x1="-1.75" y1="1" x2="-1.75" y2="-1" width="0.25" layer="21"/>
<wire x1="-1.75" y1="-1" x2="-1.625" y2="-1" width="0.25" layer="21"/>
<wire x1="0.75" y1="1" x2="1.75" y2="1" width="0.25" layer="21"/>
<wire x1="1.75" y1="1" x2="1.75" y2="-1" width="0.25" layer="21"/>
<wire x1="1.75" y1="-1" x2="1.625" y2="-1" width="0.25" layer="21"/>
<wire x1="-0.25" y1="-1" x2="0.25" y2="-1" width="0.25" layer="21"/>
</package>
<package name="SWITCH_KMT0">
<smd name="1@1" x="-1.475" y="0.95" dx="0.65" dy="0.7" layer="1" thermals="no"/>
<smd name="2@1" x="-1.475" y="-0.95" dx="0.65" dy="0.7" layer="1" thermals="no"/>
<smd name="2@2" x="1.475" y="-0.95" dx="0.65" dy="0.7" layer="1" thermals="no"/>
<smd name="1@2" x="1.475" y="0.95" dx="0.65" dy="0.7" layer="1" thermals="no"/>
<rectangle x1="-1.5" y1="-1.3" x2="1.5" y2="1.3" layer="51"/>
<wire x1="-1.75" y1="0.25" x2="-1.75" y2="-0.25" width="0.25" layer="21"/>
<wire x1="1.75" y1="0.25" x2="1.75" y2="-0.25" width="0.25" layer="21"/>
<wire x1="-1.375" y1="1.625" x2="1.375" y2="1.625" width="0.25" layer="21"/>
<wire x1="-1.375" y1="-1.625" x2="1.375" y2="-1.625" width="0.25" layer="21"/>
</package>
<package name="SWITCH_TL3315">
<wire x1="-2.25" y1="2.5" x2="2.25" y2="2.5" width="0.25" layer="21"/>
<wire x1="2.5" y1="0.75" x2="2.5" y2="-0.75" width="0.25" layer="21"/>
<wire x1="-2.25" y1="-2.5" x2="2.25" y2="-2.5" width="0.25" layer="21"/>
<wire x1="-2.5" y1="0.75" x2="-2.5" y2="-0.75" width="0.25" layer="21"/>
<smd name="1@1" x="-2.25" y="1.75" dx="0.8" dy="0.8" layer="1" thermals="no"/>
<smd name="1@2" x="2.25" y="1.75" dx="0.8" dy="0.8" layer="1" thermals="no"/>
<smd name="2@1" x="-2.25" y="-1.75" dx="0.8" dy="0.8" layer="1" thermals="no"/>
<smd name="2@2" x="2.25" y="-1.75" dx="0.8" dy="0.8" layer="1" thermals="no"/>
<rectangle x1="-2.375" y1="-2" x2="2.375" y2="-1.5" layer="51"/>
<rectangle x1="-2.375" y1="1.5" x2="2.375" y2="2" layer="51"/>
<wire x1="-1.85" y1="-2.25" x2="1.85" y2="-2.25" width="0.25" layer="51"/>
<wire x1="1.85" y1="-2.25" x2="1.85" y2="-1.5" width="0.25" layer="51"/>
<wire x1="1.85" y1="-1.5" x2="2.25" y2="-1" width="0.25" layer="51"/>
<wire x1="2.25" y1="-1" x2="2.25" y2="1" width="0.25" layer="51"/>
<wire x1="2.25" y1="1" x2="1.85" y2="1.5" width="0.25" layer="51"/>
<wire x1="1.85" y1="1.5" x2="1.85" y2="2.25" width="0.25" layer="51"/>
<wire x1="1.85" y1="2.25" x2="-1.85" y2="2.25" width="0.25" layer="51"/>
<wire x1="-1.85" y1="2.25" x2="-1.85" y2="1.5" width="0.25" layer="51"/>
<wire x1="-1.85" y1="1.5" x2="-2.25" y2="1" width="0.25" layer="51"/>
<wire x1="-2.25" y1="1" x2="-2.25" y2="-1" width="0.25" layer="51"/>
<wire x1="-2.25" y1="-1" x2="-1.85" y2="-1.5" width="0.25" layer="51"/>
<wire x1="-1.85" y1="-1.5" x2="-1.85" y2="-2.25" width="0.25" layer="51"/>
</package>
<package name="SWITCH_TE_1825910-7">
<pad name="1@1" x="-3.25" y="2.25" drill="1" shape="square" thermals="no"/>
<pad name="1@2" x="3.25" y="2.25" drill="1" shape="square" thermals="no"/>
<pad name="2@1" x="-3.25" y="-2.25" drill="1" shape="square" thermals="no"/>
<pad name="2@2" x="3.25" y="-2.25" drill="1" shape="square" thermals="no"/>
<wire x1="-3" y1="3" x2="3" y2="3" width="0.25" layer="51"/>
<wire x1="3" y1="3" x2="3" y2="-3" width="0.25" layer="51"/>
<wire x1="3" y1="-3" x2="-3" y2="-3" width="0.25" layer="51"/>
<wire x1="-3" y1="-3" x2="-3" y2="3" width="0.25" layer="51"/>
<circle x="0" y="0" radius="1.75" width="0" layer="51"/>
<rectangle x1="-3.9" y1="1.895" x2="3.9" y2="2.605" layer="51"/>
<rectangle x1="-3.9" y1="-2.605" x2="3.9" y2="-1.895" layer="51"/>
<wire x1="-3.25" y1="1" x2="-3.25" y2="-1" width="0.25" layer="21"/>
<wire x1="3.25" y1="1" x2="3.25" y2="-1" width="0.25" layer="21"/>
<wire x1="-2" y1="3.25" x2="2" y2="3.25" width="0.25" layer="21"/>
<wire x1="-2" y1="-3.25" x2="2" y2="-3.25" width="0.25" layer="21"/>
</package>
<package name="SWITCH_TE_1825027-5">
<pad name="1" x="0" y="2.25" drill="1" shape="square" thermals="no"/>
<pad name="MNT@1" x="2.5" y="3.5" drill="1.3" shape="square" thermals="no"/>
<pad name="2" x="0" y="-2.25" drill="1" shape="square" thermals="no"/>
<pad name="MNT@2" x="2.5" y="-3.5" drill="1.3" shape="square" thermals="no"/>
<wire x1="-2.61" y1="3.35" x2="1.39" y2="3.35" width="0.4" layer="51"/>
<wire x1="1.39" y1="3.35" x2="4" y2="3.35" width="0.4" layer="51"/>
<wire x1="4" y1="-3.35" x2="1.39" y2="-3.35" width="0.4" layer="51"/>
<wire x1="1.39" y1="-3.35" x2="-2.61" y2="-3.35" width="0.4" layer="51"/>
<wire x1="-2.61" y1="-3.35" x2="-2.61" y2="3.35" width="0.4" layer="51"/>
<rectangle x1="-0.15" y1="-2.6" x2="0.15" y2="-1.9" layer="51"/>
<rectangle x1="-0.15" y1="1.9" x2="0.15" y2="2.6" layer="51"/>
<rectangle x1="2" y1="-3.7" x2="3" y2="-3.3" layer="51"/>
<rectangle x1="2" y1="3.3" x2="3" y2="3.7" layer="51"/>
<wire x1="-3.86" y1="1.75" x2="-3.86" y2="-1.75" width="0.25" layer="51"/>
<wire x1="-3.86" y1="-1.75" x2="-3" y2="-1.75" width="0.25" layer="51"/>
<wire x1="-3" y1="1.75" x2="-3.86" y2="1.75" width="0.25" layer="51"/>
<wire x1="1.39" y1="-3.35" x2="1.39" y2="3.35" width="0.4" layer="51"/>
<wire x1="1.25" y1="3.75" x2="-1" y2="3.75" width="0.25" layer="21"/>
<wire x1="3.75" y1="3.75" x2="4.5" y2="3.75" width="0.25" layer="21"/>
<wire x1="4.5" y1="3.75" x2="4.5" y2="3" width="0.25" layer="21"/>
<wire x1="4.5" y1="3" x2="3.75" y2="3" width="0.25" layer="21"/>
<wire x1="3.75" y1="3" x2="3.75" y2="2.25" width="0.25" layer="21"/>
<wire x1="3.75" y1="2.25" x2="2" y2="2.25" width="0.25" layer="21"/>
<wire x1="2" y1="2.25" x2="2" y2="-2.25" width="0.25" layer="21"/>
<wire x1="2" y1="-2.25" x2="3.75" y2="-2.25" width="0.25" layer="21"/>
<wire x1="3.75" y1="-2.25" x2="3.75" y2="-3" width="0.25" layer="21"/>
<wire x1="3.75" y1="-3" x2="4.5" y2="-3" width="0.25" layer="21"/>
<wire x1="4.5" y1="-3" x2="4.5" y2="-3.75" width="0.25" layer="21"/>
<wire x1="4.5" y1="-3.75" x2="3.75" y2="-3.75" width="0.25" layer="21"/>
<wire x1="1.25" y1="-3.75" x2="-1" y2="-3.75" width="0.25" layer="21"/>
</package>
<package name="7.6MM_LED_PTH">
<description>&lt;b&gt;7.6mm PTH LED&lt;/b&gt;
&lt;p&gt;
Common LED footprint.  Often called Piranha after Cree 'Piranha' CP42B.</description>
<wire x1="3.8" y1="-3.8" x2="-3.8" y2="-3.8" width="0.25" layer="21"/>
<wire x1="-3.8" y1="-3.8" x2="-3.8" y2="2.7" width="0.25" layer="21"/>
<wire x1="-3.8" y1="2.7" x2="-2.7" y2="3.8" width="0.25" layer="21"/>
<wire x1="-2.7" y1="3.8" x2="3.8" y2="3.8" width="0.25" layer="21"/>
<wire x1="3.8" y1="3.8" x2="3.8" y2="-3.8" width="0.25" layer="21"/>
<pad name="2" x="2.54" y="2.54" drill="1" thermals="no"/>
<pad name="3" x="2.54" y="-2.54" drill="1" thermals="no"/>
<pad name="4" x="-2.54" y="-2.54" drill="1" thermals="no"/>
<pad name="1" x="-2.54" y="2.54" drill="1" shape="octagon" rot="R90" thermals="no"/>
<circle x="0" y="0" radius="2.5" width="0" layer="51"/>
<rectangle x1="-2.94" y1="-2.74" x2="-2.14" y2="-2.34" layer="51" rot="R90"/>
<rectangle x1="2.14" y1="-2.74" x2="2.94" y2="-2.34" layer="51" rot="R90"/>
<rectangle x1="2.14" y1="2.34" x2="2.94" y2="2.74" layer="51" rot="R90"/>
<rectangle x1="-2.94" y1="2.34" x2="-2.14" y2="2.74" layer="51" rot="R90"/>
</package>
<package name="MOLEX_53253-3">
<description>&lt;b&gt;Molex Micro-Latch 53253 3-Pin Top Entry&lt;/b&gt;
&lt;p&gt;
53253-3</description>
<pad name="1" x="0" y="-2" drill="0.8" diameter="1.4" shape="square" thermals="no"/>
<pad name="2" x="0" y="0" drill="0.8" diameter="1.4" shape="square" thermals="no"/>
<pad name="3" x="0" y="2" drill="0.8" diameter="1.4" shape="square" thermals="no"/>
<wire x1="-1.65" y1="-4.15" x2="-1.65" y2="4.15" width="0.25" layer="21"/>
<wire x1="-1.65" y1="4.15" x2="2.3" y2="4.15" width="0.25" layer="21"/>
<wire x1="2.3" y1="4.15" x2="2.3" y2="3.6" width="0.25" layer="21"/>
<wire x1="2.3" y1="3.6" x2="2.3" y2="-3.6" width="0.25" layer="21"/>
<wire x1="2.3" y1="-3.6" x2="2.3" y2="-4.15" width="0.25" layer="21"/>
<wire x1="2.3" y1="-4.15" x2="-1.65" y2="-4.15" width="0.25" layer="21"/>
<rectangle x1="-1.5" y1="-4" x2="2.15" y2="4" layer="51"/>
<wire x1="2.25" y1="-2.25" x2="2" y2="-2.25" width="0.25" layer="21"/>
<wire x1="2" y1="-2.25" x2="2" y2="-2" width="0.25" layer="21"/>
<wire x1="2" y1="-2" x2="2" y2="-1.75" width="0.25" layer="21"/>
<wire x1="2" y1="-1.75" x2="2.25" y2="-1.75" width="0.25" layer="21"/>
<wire x1="2.25" y1="-1.75" x2="2.25" y2="-2" width="0.25" layer="21"/>
<wire x1="2.25" y1="-2" x2="2.25" y2="-2.25" width="0.25" layer="21"/>
<wire x1="2" y1="-1.75" x2="2.25" y2="-2.25" width="0.25" layer="21"/>
<wire x1="2.25" y1="-0.25" x2="2" y2="-0.25" width="0.25" layer="21"/>
<wire x1="2" y1="-0.25" x2="2" y2="0.25" width="0.25" layer="21"/>
<wire x1="2" y1="0.25" x2="2.25" y2="0.25" width="0.25" layer="21"/>
<wire x1="2.25" y1="0.25" x2="2.25" y2="-0.25" width="0.25" layer="21"/>
<wire x1="2.25" y1="2.25" x2="2" y2="2.25" width="0.25" layer="21"/>
<wire x1="2" y1="2.25" x2="2" y2="1.75" width="0.25" layer="21"/>
<wire x1="2" y1="1.75" x2="2.25" y2="1.75" width="0.25" layer="21"/>
<wire x1="2.25" y1="1.75" x2="2.25" y2="2.25" width="0.25" layer="21"/>
<wire x1="2" y1="-2.25" x2="2.25" y2="-1.75" width="0.25" layer="21"/>
<wire x1="2" y1="-1.75" x2="2.25" y2="-2" width="0.25" layer="21"/>
<wire x1="2" y1="-2" x2="2.25" y2="-1.75" width="0.25" layer="21"/>
<wire x1="2" y1="-2.25" x2="2.25" y2="-2" width="0.25" layer="21"/>
<wire x1="2.25" y1="-2.25" x2="2" y2="-2" width="0.25" layer="21"/>
<wire x1="-1.05" y1="3.6" x2="-1.05" y2="-3.6" width="0.25" layer="21"/>
<wire x1="-1.05" y1="3.6" x2="2.3" y2="3.6" width="0.25" layer="21"/>
<wire x1="-1.05" y1="-3.6" x2="2.3" y2="-3.6" width="0.25" layer="21"/>
</package>
<package name="MOLEX_5267-3">
<description>&lt;b&gt;Molex SPOX 5267/5268 3-Pin Top Entry&lt;/b&gt;
&lt;p&gt;
22-03-5035
&lt;p&gt;
5267-03A</description>
<wire x1="-3.15" y1="-4.95" x2="-3.15" y2="4.95" width="0.25" layer="21"/>
<wire x1="-3.15" y1="-4.95" x2="1.85" y2="-4.95" width="0.25" layer="21"/>
<wire x1="1.85" y1="-4.95" x2="1.85" y2="3.45" width="0.25" layer="21"/>
<wire x1="1.85" y1="3.45" x2="0.35" y2="4.95" width="0.25" layer="21"/>
<wire x1="0.35" y1="4.95" x2="-3.15" y2="4.95" width="0.25" layer="21"/>
<wire x1="-2.4" y1="4.5" x2="-2.4" y2="-4.5" width="0.25" layer="21"/>
<wire x1="-2.4" y1="-4.5" x2="0.25" y2="-4.5" width="0.25" layer="21"/>
<wire x1="1.5" y1="-3.25" x2="1.5" y2="-1.75" width="0.25" layer="21"/>
<wire x1="1.5" y1="-0.75" x2="1.5" y2="0.75" width="0.25" layer="21"/>
<wire x1="1.5" y1="1.75" x2="1.5" y2="3.25" width="0.25" layer="21"/>
<wire x1="1.5" y1="3.25" x2="0.25" y2="4.5" width="0.25" layer="21"/>
<wire x1="0.25" y1="4.5" x2="-2.4" y2="4.5" width="0.25" layer="21"/>
<wire x1="1.5" y1="1.75" x2="1" y2="1.25" width="0.25" layer="21"/>
<wire x1="1" y1="1.25" x2="1.5" y2="0.75" width="0.25" layer="21"/>
<wire x1="1.5" y1="-0.75" x2="1" y2="-1.25" width="0.25" layer="21"/>
<wire x1="1" y1="-1.25" x2="1.5" y2="-1.75" width="0.25" layer="21"/>
<wire x1="1.5" y1="-3.25" x2="0.25" y2="-4.5" width="0.25" layer="21"/>
<pad name="3" x="0.04" y="2.5" drill="0.8" diameter="1.5" shape="octagon" thermals="no"/>
<pad name="2" x="-0.04" y="0" drill="0.8" diameter="1.5" shape="octagon" thermals="no"/>
<pad name="1" x="0.04" y="-2.5" drill="0.8" diameter="1.5" shape="octagon" rot="R90" thermals="no"/>
<circle x="0" y="-2.5" radius="0.35" width="0" layer="51"/>
<circle x="0" y="0" radius="0.35" width="0" layer="51"/>
<circle x="0" y="2.5" radius="0.35" width="0" layer="51"/>
</package>
<package name="MOLEX_5268-3">
<description>&lt;b&gt;Molex SPOX 5267/5268 3-Pin Side Entry&lt;/b&gt;
&lt;p&gt;
22-05-7035</description>
<wire x1="-1.5" y1="-5" x2="-1.5" y2="-2.9" width="0.25" layer="21"/>
<wire x1="-1.5" y1="-2.9" x2="-1.1" y2="-2.75" width="0.25" layer="21"/>
<wire x1="-1.1" y1="-2.75" x2="-1.1" y2="-2.25" width="0.25" layer="21"/>
<wire x1="-1.1" y1="-2.25" x2="-1.5" y2="-2.1" width="0.25" layer="21"/>
<wire x1="-1.5" y1="-2.1" x2="-1.5" y2="-0.4" width="0.25" layer="21"/>
<wire x1="-1.5" y1="-0.4" x2="-1.15" y2="-0.25" width="0.25" layer="21"/>
<wire x1="-1.15" y1="-0.25" x2="-1.15" y2="0.25" width="0.25" layer="21"/>
<wire x1="-1.15" y1="0.25" x2="-1.5" y2="0.4" width="0.25" layer="21"/>
<wire x1="-1.5" y1="0.4" x2="-1.5" y2="2.1" width="0.25" layer="21"/>
<wire x1="-1.5" y1="2.1" x2="-1.1" y2="2.25" width="0.25" layer="21"/>
<wire x1="-1.1" y1="2.25" x2="-1.1" y2="2.75" width="0.25" layer="21"/>
<wire x1="-1.1" y1="2.75" x2="-1.5" y2="2.9" width="0.25" layer="21"/>
<wire x1="-1.5" y1="2.9" x2="-1.5" y2="5" width="0.25" layer="21"/>
<wire x1="-1.5" y1="-5" x2="7" y2="-5" width="0.25" layer="21"/>
<wire x1="7" y1="-5" x2="7" y2="5" width="0.25" layer="21"/>
<wire x1="7" y1="5" x2="-1.5" y2="5" width="0.25" layer="21"/>
<pad name="3" x="0" y="2.5" drill="0.8" diameter="1.5" shape="octagon" thermals="no"/>
<pad name="2" x="-0.1" y="0" drill="0.8" diameter="1.5" shape="octagon" thermals="no"/>
<pad name="1" x="0" y="-2.5" drill="0.8" diameter="1.5" shape="octagon" rot="R90" thermals="no"/>
<wire x1="5.5" y1="4.5" x2="6.5" y2="3.5" width="0.25" layer="21"/>
<polygon width="0.25" layer="21">
<vertex x="5" y="-5"/>
<vertex x="7" y="-3"/>
<vertex x="7" y="-5"/>
</polygon>
</package>
<package name="MOLEX_53254-3">
<description>&lt;b&gt;Molex Micro-Latch 53254 3-Pin Side Entry&lt;/b&gt;
&lt;p&gt;
53254-3</description>
<pad name="1" x="0" y="-2" drill="0.8" shape="square" thermals="no"/>
<pad name="2" x="0" y="0" drill="0.8" shape="square" thermals="no"/>
<pad name="3" x="0" y="2" drill="0.8" shape="square" thermals="no"/>
<wire x1="-6.05" y1="-4.15" x2="-6.05" y2="4.15" width="0.25" layer="21"/>
<wire x1="-6.05" y1="4.15" x2="0.4" y2="4.15" width="0.25" layer="21"/>
<rectangle x1="-5.9" y1="-4" x2="1.4" y2="4" layer="51"/>
<wire x1="1.55" y1="3.9" x2="1.55" y2="2.2" width="0.25" layer="21"/>
<wire x1="1.55" y1="1.8" x2="1.55" y2="0.2" width="0.25" layer="21"/>
<wire x1="1.55" y1="-0.2" x2="1.55" y2="-1.8" width="0.25" layer="21"/>
<wire x1="1.55" y1="-1.8" x2="1.55" y2="-2.2" width="0.25" layer="21"/>
<wire x1="1.55" y1="-2.2" x2="1.55" y2="-3.9" width="0.25" layer="21"/>
<wire x1="0.4" y1="-4.15" x2="-6.05" y2="-4.15" width="0.25" layer="21"/>
<wire x1="1.55" y1="-2.2" x2="0.9" y2="-2.1" width="0.25" layer="21"/>
<wire x1="0.9" y1="-2.1" x2="0.9" y2="-2" width="0.25" layer="21"/>
<wire x1="0.9" y1="-2" x2="0.9" y2="-1.9" width="0.25" layer="21"/>
<wire x1="0.9" y1="-1.9" x2="1.55" y2="-1.8" width="0.25" layer="21"/>
<wire x1="0.9" y1="-2" x2="1.5" y2="-1.9" width="0.25" layer="21"/>
<wire x1="0.9" y1="-2" x2="1.5" y2="-2.1" width="0.25" layer="21"/>
<wire x1="0.9" y1="-2" x2="1.5" y2="-2" width="0.25" layer="21"/>
<wire x1="0.9" y1="0.1" x2="0.9" y2="-0.1" width="0.25" layer="21"/>
<wire x1="0.9" y1="-0.1" x2="1.55" y2="-0.2" width="0.25" layer="21"/>
<wire x1="0.9" y1="0.1" x2="1.55" y2="0.2" width="0.25" layer="21"/>
<wire x1="0.9" y1="2.1" x2="0.9" y2="1.9" width="0.25" layer="21"/>
<wire x1="0.9" y1="1.9" x2="1.55" y2="1.8" width="0.25" layer="21"/>
<wire x1="0.9" y1="2.1" x2="1.55" y2="2.2" width="0.25" layer="21"/>
<wire x1="0.9" y1="-4" x2="1.55" y2="-3.9" width="0.25" layer="21"/>
<wire x1="0.9" y1="-4" x2="0.4" y2="-4" width="0.25" layer="21"/>
<wire x1="0.4" y1="-4" x2="0.4" y2="-4.15" width="0.25" layer="21"/>
<wire x1="0.9" y1="4" x2="1.55" y2="3.9" width="0.25" layer="21"/>
<wire x1="0.9" y1="4" x2="0.4" y2="4" width="0.25" layer="21"/>
<wire x1="0.4" y1="4" x2="0.4" y2="4.15" width="0.25" layer="21"/>
</package>
<package name="HEADER-0.1&quot;_2X4-SMD-SULLINS">
<smd name="1" x="-3.81" y="-3.175" dx="1.27" dy="5.08" layer="1" thermals="no"/>
<smd name="3" x="-1.27" y="-3.175" dx="1.27" dy="5.08" layer="1" thermals="no"/>
<smd name="5" x="1.27" y="-3.175" dx="1.27" dy="5.08" layer="1" thermals="no"/>
<smd name="7" x="3.81" y="-3.175" dx="1.27" dy="5.08" layer="1" thermals="no"/>
<smd name="8" x="3.81" y="3.175" dx="1.27" dy="5.08" layer="1" thermals="no"/>
<smd name="6" x="1.27" y="3.175" dx="1.27" dy="5.08" layer="1" thermals="no"/>
<smd name="4" x="-1.27" y="3.175" dx="1.27" dy="5.08" layer="1" thermals="no"/>
<smd name="2" x="-3.81" y="3.175" dx="1.27" dy="5.08" layer="1" thermals="no"/>
<rectangle x1="-5.08" y1="-2.54" x2="5.08" y2="2.54" layer="51"/>
<rectangle x1="-1.59" y1="-5.335" x2="-0.95" y2="-0.95" layer="51"/>
<rectangle x1="-4.13" y1="-5.335" x2="-3.49" y2="-0.95" layer="51"/>
<rectangle x1="0.95" y1="-5.335" x2="1.59" y2="-0.95" layer="51"/>
<rectangle x1="3.49" y1="-5.335" x2="4.13" y2="-0.95" layer="51"/>
<rectangle x1="0.95" y1="0.95" x2="1.59" y2="5.335" layer="51"/>
<rectangle x1="3.49" y1="0.95" x2="4.13" y2="5.335" layer="51"/>
<rectangle x1="-1.59" y1="0.95" x2="-0.95" y2="5.335" layer="51"/>
<rectangle x1="-4.13" y1="0.95" x2="-3.49" y2="5.335" layer="51"/>
<wire x1="-5.25" y1="2.75" x2="-5.25" y2="-2" width="0.25" layer="21"/>
<wire x1="-5.25" y1="-2" x2="-5.25" y2="-2.25" width="0.25" layer="21"/>
<wire x1="-5.25" y1="-2.25" x2="-5.25" y2="-2.5" width="0.25" layer="21"/>
<wire x1="-5.25" y1="-2.5" x2="-5.25" y2="-2.75" width="0.25" layer="21"/>
<wire x1="-5.25" y1="-2.75" x2="-5" y2="-2.75" width="0.25" layer="21"/>
<wire x1="-5" y1="-2.75" x2="-4.75" y2="-2.75" width="0.25" layer="21"/>
<wire x1="-4.75" y1="2.75" x2="-5.25" y2="2.75" width="0.25" layer="21"/>
<wire x1="-2.75" y1="2.75" x2="-2.25" y2="2.75" width="0.25" layer="21"/>
<wire x1="-0.25" y1="2.75" x2="0.25" y2="2.75" width="0.25" layer="21"/>
<wire x1="2.25" y1="2.75" x2="2.75" y2="2.75" width="0.25" layer="21"/>
<wire x1="-2.75" y1="-2.75" x2="-2.25" y2="-2.75" width="0.25" layer="21"/>
<wire x1="-0.25" y1="-2.75" x2="0.25" y2="-2.75" width="0.25" layer="21"/>
<wire x1="2.25" y1="-2.75" x2="2.75" y2="-2.75" width="0.25" layer="21"/>
<wire x1="4.75" y1="-2.75" x2="5.25" y2="-2.75" width="0.25" layer="21"/>
<wire x1="5.25" y1="-2.75" x2="5.25" y2="2.75" width="0.25" layer="21"/>
<wire x1="5.25" y1="2.75" x2="4.75" y2="2.75" width="0.25" layer="21"/>
<wire x1="-5.25" y1="-2.5" x2="-5" y2="-2.75" width="0.25" layer="21" curve="180"/>
<wire x1="-5.25" y1="-2.25" x2="-4.75" y2="-2.75" width="0.25" layer="21" curve="180"/>
<wire x1="-4.75" y1="-3" x2="-5.25" y2="-2" width="0.25" layer="21" curve="-180"/>
<wire x1="-4.75" y1="-2.75" x2="-4.75" y2="-3" width="0.25" layer="21"/>
</package>
<package name="DCK(R-PDSO-G5)_SC70">
<wire x1="-1.1375" y1="0.975" x2="-1.3" y2="0.975" width="0.25" layer="21"/>
<wire x1="-1.3" y1="0.975" x2="-1.3" y2="-0.975" width="0.25" layer="21"/>
<wire x1="1.1375" y1="0.975" x2="1.3" y2="0.975" width="0.25" layer="21"/>
<wire x1="1.3" y1="0.975" x2="1.3" y2="-0.975" width="0.25" layer="21"/>
<wire x1="-1.3" y1="-0.975" x2="-1.1375" y2="-0.975" width="0.25" layer="21"/>
<wire x1="1.3" y1="-0.975" x2="1.1375" y2="-0.975" width="0.25" layer="21"/>
<smd name="1" x="-0.65" y="-1.1" dx="0.35" dy="0.85" layer="1" thermals="no"/>
<smd name="2" x="0" y="-1.1" dx="0.35" dy="0.85" layer="1" thermals="no"/>
<smd name="3" x="0.65" y="-1.1" dx="0.35" dy="0.85" layer="1" thermals="no"/>
<smd name="4" x="0.65" y="1.1" dx="0.35" dy="0.85" layer="1" thermals="no"/>
<smd name="5" x="-0.65" y="1.1" dx="0.35" dy="0.85" layer="1" thermals="no"/>
<rectangle x1="-1.075" y1="-0.7" x2="1.075" y2="0.7" layer="51"/>
<wire x1="0.1625" y1="0.975" x2="-0.1625" y2="0.975" width="0.25" layer="21"/>
<rectangle x1="-0.15" y1="-1.3" x2="0.15" y2="-0.7" layer="51"/>
<rectangle x1="0.5" y1="-1.3" x2="0.8" y2="-0.7" layer="51"/>
<rectangle x1="-0.8" y1="-1.3" x2="-0.5" y2="-0.7" layer="51"/>
<rectangle x1="0.5" y1="0.7" x2="0.8" y2="1.3" layer="51" rot="R180"/>
<rectangle x1="-0.8" y1="0.7" x2="-0.5" y2="1.3" layer="51" rot="R180"/>
</package>
<package name="SOT-23-3-LITTLEFOOT">
<description>SOT-23-3, TO-236-3, SC-59</description>
<wire x1="-1.5" y1="0.8" x2="-1.5" y2="-0.8" width="0.1" layer="51"/>
<wire x1="-1.5" y1="-0.8" x2="1.5" y2="-0.8" width="0.1" layer="51"/>
<wire x1="1.5" y1="-0.8" x2="1.5" y2="0.8" width="0.1" layer="51"/>
<wire x1="-0.75" y1="1" x2="-1.75" y2="1" width="0.25" layer="21"/>
<wire x1="-1.75" y1="1" x2="-1.75" y2="-1" width="0.25" layer="21"/>
<wire x1="-1.75" y1="-1" x2="-1.625" y2="-1" width="0.25" layer="21"/>
<wire x1="0.75" y1="1" x2="1.75" y2="1" width="0.25" layer="21"/>
<wire x1="1.75" y1="1" x2="1.75" y2="-1" width="0.25" layer="21"/>
<wire x1="1.75" y1="-1" x2="1.625" y2="-1" width="0.25" layer="21"/>
<wire x1="-0.25" y1="-1" x2="0.25" y2="-1" width="0.25" layer="21"/>
<smd name="G" x="-0.95" y="-1" dx="1" dy="1.5" layer="1" stop="no" thermals="no" cream="no"/>
<smd name="S@0" x="0.95" y="-1" dx="1" dy="1.5" layer="1" stop="no" thermals="no" cream="no"/>
<smd name="D@0" x="0" y="1.025" dx="2.9" dy="2.05" layer="1" stop="no" thermals="no" cream="no"/>
<rectangle x1="-0.4" y1="0.65" x2="0.4" y2="1.55" layer="31"/>
<rectangle x1="-0.5" y1="0.55" x2="0.5" y2="1.65" layer="29"/>
<rectangle x1="-1.35" y1="-1.55" x2="-0.55" y2="-0.65" layer="31"/>
<rectangle x1="-1.45" y1="-1.65" x2="-0.45" y2="-0.55" layer="29"/>
<rectangle x1="0.55" y1="-1.55" x2="1.35" y2="-0.65" layer="31"/>
<rectangle x1="0.45" y1="-1.65" x2="1.45" y2="-0.55" layer="29"/>
<wire x1="-1.5" y1="0.8" x2="1.5" y2="0.8" width="0.1" layer="51"/>
<rectangle x1="-1.15" y1="-1.4" x2="-0.75" y2="-0.8" layer="51"/>
<rectangle x1="0.75" y1="-1.4" x2="1.15" y2="-0.8" layer="51"/>
<rectangle x1="-0.2" y1="0.8" x2="0.2" y2="1.4" layer="51"/>
</package>
<package name="TO-252-3">
<wire x1="-4" y1="11" x2="4" y2="11" width="0.25" layer="21"/>
<wire x1="4" y1="11" x2="4" y2="2.5" width="0.25" layer="21"/>
<wire x1="4" y1="2.5" x2="4" y2="-2" width="0.25" layer="21"/>
<wire x1="4" y1="-2" x2="1" y2="-2" width="0.25" layer="21"/>
<wire x1="-1" y1="-2" x2="-4" y2="-2" width="0.25" layer="21"/>
<wire x1="-4" y1="-2" x2="-4" y2="2.5" width="0.25" layer="21"/>
<wire x1="-4" y1="2.5" x2="-4" y2="11" width="0.25" layer="21"/>
<wire x1="-4" y1="2.5" x2="4" y2="2.5" width="0.25" layer="21"/>
<smd name="3D" x="0" y="6.75" dx="7" dy="7.5" layer="1" thermals="no"/>
<smd name="1G" x="-2.3" y="0" dx="2" dy="3" layer="1" thermals="no"/>
<smd name="2S" x="2.3" y="0" dx="2" dy="3" layer="1" thermals="no"/>
<rectangle x1="-2.75" y1="3.7" x2="2.75" y2="9.5" layer="51"/>
<rectangle x1="-2.9" y1="-1" x2="-1.7" y2="1" layer="51"/>
<rectangle x1="1.7" y1="-1" x2="2.9" y2="1" layer="51"/>
</package>
<package name="TO-263-3">
<wire x1="-6.35" y1="16" x2="-6.35" y2="3.81" width="0.25" layer="21"/>
<wire x1="-6.35" y1="3.81" x2="-4.58" y2="3.81" width="0.25" layer="21"/>
<wire x1="-4.58" y1="3.81" x2="-4.58" y2="-2.54" width="0.25" layer="21"/>
<wire x1="-4.58" y1="-2.54" x2="-1" y2="-2.54" width="0.25" layer="21"/>
<wire x1="1" y1="-2.54" x2="4.58" y2="-2.54" width="0.25" layer="21"/>
<wire x1="4.58" y1="-2.54" x2="4.58" y2="3.81" width="0.25" layer="21"/>
<wire x1="4.58" y1="3.81" x2="6.35" y2="3.81" width="0.25" layer="21"/>
<wire x1="6.35" y1="3.81" x2="6.35" y2="16" width="0.25" layer="21"/>
<wire x1="6.35" y1="16" x2="-6.35" y2="16" width="0.25" layer="21"/>
<smd name="1G" x="-2.6" y="0" dx="2.5" dy="4" layer="1" thermals="no"/>
<smd name="2S" x="2.6" y="0" dx="2.5" dy="4" layer="1" thermals="no"/>
<smd name="3D" x="0" y="10.2" dx="12" dy="11" layer="1" thermals="no"/>
<rectangle x1="-3.3" y1="-1.4" x2="-1.9" y2="1.4" layer="51"/>
<rectangle x1="1.9" y1="-1.4" x2="3.3" y2="1.4" layer="51"/>
<rectangle x1="-5.2" y1="5.6" x2="5.2" y2="14.6" layer="51"/>
</package>
<package name="TO-263-3-BIGBARE">
<smd name="1G" x="-2.6" y="0" dx="2.5" dy="4" layer="1" thermals="no"/>
<smd name="2S" x="3" y="0" dx="4.9" dy="4" layer="1" thermals="no"/>
<smd name="3D" x="0" y="10.2" dx="12" dy="11" layer="1" thermals="no"/>
<rectangle x1="-3.3" y1="-1.4" x2="-1.9" y2="1.4" layer="51"/>
<rectangle x1="1.9" y1="-1.4" x2="3.3" y2="1.4" layer="51"/>
<rectangle x1="-5.2" y1="5.6" x2="5.2" y2="14.6" layer="51"/>
</package>
<package name="DIRECTFET_L8">
<wire x1="-5.5" y1="4" x2="-4.75" y2="4" width="0.127" layer="21"/>
<wire x1="-5.5" y1="4" x2="-5.5" y2="-4" width="0.127" layer="21"/>
<wire x1="4.75" y1="4" x2="5.5" y2="4" width="0.127" layer="21"/>
<wire x1="5.5" y1="4" x2="5.5" y2="-4" width="0.127" layer="21"/>
<wire x1="5.5" y1="-4" x2="4.75" y2="-4" width="0.127" layer="21"/>
<wire x1="-5.5" y1="-4" x2="-4.75" y2="-4" width="0.127" layer="21"/>
<smd name="DL@1" x="-4.5" y="2.2" dx="1.1" dy="1.7" layer="1" thermals="no"/>
<smd name="DL@2" x="-4.5" y="0" dx="1.1" dy="1.7" layer="1" thermals="no"/>
<smd name="DL@3" x="-4.5" y="-2.2" dx="1.1" dy="1.7" layer="1" thermals="no"/>
<smd name="DR@1" x="4.5" y="2.2" dx="1.1" dy="1.7" layer="1" thermals="no"/>
<smd name="DR@2" x="4.5" y="0" dx="1.1" dy="1.7" layer="1" thermals="no"/>
<smd name="DR@3" x="4.5" y="-2.2" dx="1.1" dy="1.7" layer="1" thermals="no"/>
<smd name="G" x="-2.25" y="0" dx="0.7" dy="1.3" layer="1" thermals="no"/>
<smd name="SL@1" x="-0.85" y="1.725" dx="1.1" dy="0.85" layer="1" thermals="no"/>
<smd name="SL@2" x="-0.85" y="0.575" dx="1.1" dy="0.85" layer="1" thermals="no"/>
<smd name="SL@3" x="-0.85" y="-0.575" dx="1.1" dy="0.85" layer="1" thermals="no"/>
<smd name="SL@4" x="-0.85" y="-1.725" dx="1.1" dy="0.85" layer="1" thermals="no"/>
<smd name="SR@1" x="1.95" y="1.725" dx="1.1" dy="0.85" layer="1" thermals="no"/>
<smd name="SR@2" x="1.95" y="0.575" dx="1.1" dy="0.85" layer="1" thermals="no"/>
<smd name="SR@3" x="1.95" y="-0.575" dx="1.1" dy="0.85" layer="1" thermals="no"/>
<smd name="SR@4" x="1.95" y="-1.725" dx="1.1" dy="0.85" layer="1" thermals="no"/>
</package>
<package name="TO-263-7">
<description>TO-263-7, D²Pak (6 Leads + Tab), TO-263CB, D2PAK (7-Lead)</description>
<wire x1="-6.35" y1="16" x2="-6.35" y2="3.81" width="0.127" layer="21"/>
<wire x1="-6.35" y1="3.81" x2="-5.08" y2="3.81" width="0.127" layer="21"/>
<wire x1="-5.08" y1="3.81" x2="-5.08" y2="-2.54" width="0.127" layer="21"/>
<wire x1="-5.08" y1="-2.54" x2="5.08" y2="-2.54" width="0.127" layer="21"/>
<wire x1="5.08" y1="-2.54" x2="5.08" y2="3.81" width="0.127" layer="21"/>
<wire x1="5.08" y1="3.81" x2="6.35" y2="3.81" width="0.127" layer="21"/>
<wire x1="6.35" y1="3.81" x2="6.35" y2="16" width="0.127" layer="21"/>
<wire x1="6.35" y1="16" x2="-6.35" y2="16" width="0.127" layer="21"/>
<smd name="G" x="-3.81" y="0" dx="0.9" dy="4" layer="1" thermals="no"/>
<smd name="S@0" x="-2.54" y="0" dx="0.9" dy="4" layer="1" thermals="no"/>
<smd name="S@1" x="-1.27" y="0" dx="0.9" dy="4" layer="1" thermals="no"/>
<smd name="S@2" x="1.27" y="0" dx="0.9" dy="4" layer="1" thermals="no"/>
<smd name="S@3" x="2.54" y="0" dx="0.9" dy="4" layer="1" thermals="no"/>
<smd name="S@4" x="3.81" y="0" dx="0.9" dy="4" layer="1" thermals="no"/>
<smd name="D" x="0" y="10.2" dx="12" dy="11" layer="1" thermals="no"/>
<rectangle x1="-1.6256" y1="-1.143" x2="-0.9144" y2="1.143" layer="51"/>
<rectangle x1="-2.8956" y1="-1.143" x2="-2.1844" y2="1.143" layer="51"/>
<rectangle x1="-4.1656" y1="-1.143" x2="-3.4544" y2="1.143" layer="51"/>
<rectangle x1="0.9144" y1="-1.143" x2="1.6256" y2="1.143" layer="51"/>
<rectangle x1="2.1844" y1="-1.143" x2="2.8956" y2="1.143" layer="51"/>
<rectangle x1="3.4544" y1="-1.143" x2="4.1656" y2="1.143" layer="51"/>
<rectangle x1="-5.08" y1="7.239" x2="5.08" y2="14.097" layer="51"/>
</package>
<package name="0402_PGB2">
<wire x1="-0.635" y1="0.762" x2="-0.635" y2="-0.635" width="0.127" layer="25"/>
<wire x1="0.635" y1="0.762" x2="0.635" y2="-0.635" width="0.127" layer="25"/>
<smd name="1" x="0" y="0.6858" dx="0.5842" dy="0.6096" layer="1" thermals="no"/>
<smd name="2" x="0" y="-0.6858" dx="0.5842" dy="0.6096" layer="1" thermals="no"/>
</package>
<package name="M2_SCREW_TENTED">
<pad name="P$1" x="0" y="0" drill="2.05" diameter="4.2" stop="no" thermals="no"/>
<circle x="0" y="0" radius="1.9" width="0.5" layer="22"/>
<circle x="0" y="0" radius="1.9" width="0.5" layer="21"/>
</package>
<package name="M3_SCREW_TENTED">
<pad name="P$1" x="0" y="0" drill="3.05" diameter="6.2" stop="no" thermals="no"/>
<circle x="0" y="0" radius="2.9" width="0.5" layer="22"/>
<circle x="0" y="0" radius="2.9" width="0.5" layer="21"/>
</package>
<package name="HEADER-0.1&quot;_2X4-TH-1.0MM">
<pad name="4" x="-1.27" y="1.27" drill="1" shape="square" rot="R90" thermals="no"/>
<pad name="5" x="1.27" y="-1.27" drill="1" shape="square" rot="R270" thermals="no"/>
<pad name="3" x="-1.27" y="-1.27" drill="1" shape="square" rot="R270" thermals="no"/>
<pad name="2" x="-3.81" y="1.27" drill="1" shape="square" rot="R90" thermals="no"/>
<pad name="1" x="-3.81" y="-1.27" drill="1" shape="octagon" rot="R270" thermals="no"/>
<pad name="6" x="1.27" y="1.27" drill="1" shape="square" rot="R90" thermals="no"/>
<pad name="7" x="3.81" y="-1.27" drill="1" shape="square" rot="R270" thermals="no"/>
<pad name="8" x="3.81" y="1.27" drill="1" shape="square" rot="R90" thermals="no"/>
<rectangle x1="-5.08" y1="-2.54" x2="5.08" y2="2.54" layer="51"/>
<wire x1="-5.25" y1="2.75" x2="-5.25" y2="-2" width="0.25" layer="21"/>
<wire x1="-5.25" y1="-2" x2="-5.25" y2="-2.25" width="0.25" layer="21"/>
<wire x1="-5.25" y1="-2.25" x2="-5.25" y2="-2.5" width="0.25" layer="21"/>
<wire x1="-5.25" y1="-2.5" x2="-5.25" y2="-2.75" width="0.25" layer="21"/>
<wire x1="-5.25" y1="-2.75" x2="-5" y2="-2.75" width="0.25" layer="21"/>
<wire x1="-5" y1="-2.75" x2="-4.75" y2="-2.75" width="0.25" layer="21"/>
<wire x1="-4.75" y1="2.75" x2="-5.25" y2="2.75" width="0.25" layer="21"/>
<wire x1="-2.75" y1="2.75" x2="-2.25" y2="2.75" width="0.25" layer="21"/>
<wire x1="-0.25" y1="2.75" x2="0.25" y2="2.75" width="0.25" layer="21"/>
<wire x1="2.25" y1="2.75" x2="2.75" y2="2.75" width="0.25" layer="21"/>
<wire x1="-2.75" y1="-2.75" x2="-2.25" y2="-2.75" width="0.25" layer="21"/>
<wire x1="-0.25" y1="-2.75" x2="0.25" y2="-2.75" width="0.25" layer="21"/>
<wire x1="2.25" y1="-2.75" x2="2.75" y2="-2.75" width="0.25" layer="21"/>
<wire x1="4.75" y1="-2.75" x2="5.25" y2="-2.75" width="0.25" layer="21"/>
<wire x1="5.25" y1="-2.75" x2="5.25" y2="2.75" width="0.25" layer="21"/>
<wire x1="5.25" y1="2.75" x2="4.75" y2="2.75" width="0.25" layer="21"/>
<wire x1="-5.25" y1="-2.5" x2="-5" y2="-2.75" width="0.25" layer="21" curve="180"/>
<wire x1="-5.25" y1="-2.25" x2="-4.75" y2="-2.75" width="0.25" layer="21" curve="180"/>
<wire x1="-4.75" y1="-3" x2="-5.25" y2="-2" width="0.25" layer="21" curve="-180"/>
<wire x1="-4.75" y1="-2.75" x2="-4.75" y2="-3" width="0.25" layer="21"/>
</package>
<package name="TO-263/252-3-BARE">
<smd name="1G" x="-2.5" y="0.25" dx="3" dy="4.5" layer="1" thermals="no"/>
<smd name="2S" x="2.5" y="0.25" dx="3" dy="4.5" layer="1" thermals="no"/>
<smd name="3D" x="0" y="10" dx="12" dy="12" layer="1" thermals="no"/>
<rectangle x1="-3.3" y1="-1.4" x2="-1.9" y2="1.4" layer="51"/>
<rectangle x1="1.9" y1="-1.4" x2="3.3" y2="1.4" layer="51"/>
<rectangle x1="-5.2" y1="5.6" x2="5.2" y2="14.6" layer="51"/>
<rectangle x1="-2.75" y1="4.7" x2="2.75" y2="10.5" layer="51"/>
<rectangle x1="-2.9" y1="0" x2="-1.7" y2="2" layer="51"/>
<rectangle x1="1.7" y1="0" x2="2.9" y2="2" layer="51"/>
</package>
<package name="OARS_XP_KELVIN">
<smd name="P1@1" x="-3.5" y="2.15" dx="3.8" dy="2.8" layer="1" thermals="no"/>
<smd name="P1@2" x="-3.5" y="-2.15" dx="3.8" dy="2.8" layer="1" thermals="no"/>
<smd name="P2@1" x="3.5" y="2.15" dx="3.8" dy="2.8" layer="1" thermals="no"/>
<smd name="P2@2" x="3.5" y="-2.15" dx="3.8" dy="2.8" layer="1" thermals="no"/>
<smd name="P1@3" x="-3.2" y="0" dx="3.2" dy="0.5" layer="1" thermals="no"/>
<smd name="P2@3" x="3.2" y="0" dx="3.2" dy="0.5" layer="1" thermals="no"/>
<rectangle x1="-6" y1="-3.3" x2="6" y2="3.3" layer="51"/>
<rectangle x1="-4.8" y1="0.25" x2="-1.6" y2="0.75" layer="41"/>
<rectangle x1="-4.8" y1="-0.75" x2="-1.6" y2="-0.25" layer="41"/>
<rectangle x1="1.6" y1="0.25" x2="4.8" y2="0.75" layer="41"/>
<rectangle x1="1.6" y1="-0.75" x2="4.8" y2="-0.25" layer="41"/>
</package>
<package name="HEADER-1.5MM_1X6-TH">
<pad name="1" x="-3.75" y="0.025" drill="0.5" shape="square" thermals="no"/>
<pad name="2" x="-2.25" y="-0.025" drill="0.5" shape="square" thermals="no"/>
<pad name="3" x="-0.75" y="0.025" drill="0.5" shape="square" thermals="no"/>
<wire x1="-4.75" y1="1" x2="-4.75" y2="-1" width="0.25" layer="21"/>
<wire x1="-4.75" y1="-1" x2="4.75" y2="-1" width="0.25" layer="21"/>
<wire x1="4.75" y1="-1" x2="4.75" y2="1" width="0.25" layer="21"/>
<wire x1="4.75" y1="1" x2="-4.75" y2="1" width="0.25" layer="21"/>
<circle x="-4.75" y="1" radius="0.25" width="0" layer="21"/>
<pad name="4" x="0.75" y="-0.025" drill="0.5" shape="square" thermals="no"/>
<pad name="5" x="2.25" y="0.025" drill="0.5" shape="square" thermals="no"/>
<pad name="6" x="3.75" y="-0.025" drill="0.5" shape="square" thermals="no"/>
</package>
<package name="HEADER-0.05&quot;_1X6-PTH-0.6MM">
<pad name="4" x="0.635" y="-0.025" drill="0.6" diameter="0.95" thermals="no"/>
<pad name="5" x="1.905" y="0.025" drill="0.6" diameter="0.95" thermals="no"/>
<pad name="6" x="3.175" y="-0.025" drill="0.6" diameter="0.95" thermals="no"/>
<pad name="3" x="-0.635" y="0.025" drill="0.6" diameter="0.95" thermals="no"/>
<pad name="2" x="-1.905" y="-0.025" drill="0.6" diameter="0.95" thermals="no"/>
<pad name="1" x="-3.175" y="0.025" drill="0.6" diameter="0.95" thermals="no"/>
<wire x1="-4" y1="0.3" x2="-3.5" y2="0.8" width="0.25" layer="21"/>
<wire x1="-3.5" y1="0.8" x2="4" y2="0.8" width="0.25" layer="21"/>
<wire x1="4" y1="0.8" x2="4" y2="-0.8" width="0.25" layer="21"/>
<wire x1="4" y1="-0.8" x2="-3.5" y2="-0.8" width="0.25" layer="21"/>
<wire x1="-3.5" y1="-0.8" x2="-4" y2="-0.3" width="0.25" layer="21"/>
<wire x1="-4" y1="-0.3" x2="-4" y2="0.3" width="0.25" layer="21"/>
</package>
<package name="HEADER-2MM_1X6-TH">
<pad name="4" x="1" y="-0.05" drill="0.8" thermals="no"/>
<pad name="5" x="3" y="0.05" drill="0.8" thermals="no"/>
<pad name="6" x="5" y="-0.05" drill="0.8" thermals="no"/>
<pad name="3" x="-1" y="0.05" drill="0.8" thermals="no"/>
<pad name="2" x="-3" y="-0.05" drill="0.8" thermals="no"/>
<pad name="1" x="-5" y="0.05" drill="0.8" thermals="no"/>
<wire x1="-6" y1="0.5" x2="-5.5" y2="1" width="0.25" layer="21"/>
<wire x1="-5.5" y1="1" x2="6" y2="1" width="0.25" layer="21"/>
<wire x1="6" y1="1" x2="6" y2="-1" width="0.25" layer="21"/>
<wire x1="6" y1="-1" x2="-5.5" y2="-1" width="0.25" layer="21"/>
<wire x1="-5.5" y1="-1" x2="-6" y2="-0.5" width="0.25" layer="21"/>
<wire x1="-6" y1="-0.5" x2="-6" y2="0.5" width="0.25" layer="21"/>
</package>
<package name="POWER-DI5">
<smd name="PAD" x="0" y="2.856" dx="3.36" dy="4.86" layer="1" thermals="no"/>
<smd name="LEFT" x="-0.92" y="-1.126" dx="1.39" dy="1.4" layer="1" thermals="no"/>
<smd name="RIGHT" x="0.92" y="-1.126" dx="1.39" dy="1.4" layer="1" thermals="no"/>
<rectangle x1="-2.025" y1="-0.9805" x2="2.025" y2="4.3895" layer="51"/>
<rectangle x1="-1.365" y1="-1.5505" x2="-0.475" y2="-0.9805" layer="51"/>
<rectangle x1="0.475" y1="-1.5505" x2="1.365" y2="-0.9805" layer="51"/>
<rectangle x1="-0.89" y1="4.3895" x2="0.89" y2="4.9595" layer="51"/>
<wire x1="-2" y1="4.75" x2="-2.5" y2="4.75" width="0.25" layer="21"/>
<wire x1="-2.5" y1="4.75" x2="-2.5" y2="-1.5" width="0.25" layer="21"/>
<wire x1="-2.5" y1="-1.5" x2="-2" y2="-1.5" width="0.25" layer="21"/>
<wire x1="2" y1="-1.5" x2="2.5" y2="-1.5" width="0.25" layer="21"/>
<wire x1="2.5" y1="-1.5" x2="2.5" y2="4.75" width="0.25" layer="21"/>
<wire x1="2.5" y1="4.75" x2="2" y2="4.75" width="0.25" layer="21"/>
</package>
<package name="1225_VISHAY">
<smd name="1" x="0" y="1.5" dx="7.6" dy="1.8" layer="1" thermals="no"/>
<smd name="2" x="0" y="-1.5" dx="7.6" dy="1.8" layer="1" thermals="no"/>
<rectangle x1="-3.15" y1="-1.6" x2="3.15" y2="1.6" layer="51"/>
</package>
<package name="TO-126-2">
<pad name="K@1" x="-2.54" y="0" drill="1.2" shape="square" rot="R90" thermals="no"/>
<pad name="A@1" x="2.54" y="0" drill="1.2" shape="square" rot="R90" thermals="no"/>
<wire x1="-4" y1="1.75" x2="4" y2="1.75" width="0.25" layer="21"/>
<wire x1="4" y1="1.75" x2="4" y2="-1" width="0.25" layer="21"/>
<wire x1="1" y1="-1" x2="-1" y2="-1" width="0.25" layer="21"/>
<wire x1="-4" y1="-1" x2="-4" y2="1.75" width="0.25" layer="21"/>
<rectangle x1="-2.94" y1="-0.325" x2="-2.14" y2="0.325" layer="51"/>
<rectangle x1="2.14" y1="-0.325" x2="2.94" y2="0.325" layer="51"/>
<rectangle x1="-4.06" y1="-1" x2="4.06" y2="1.8" layer="51"/>
</package>
<package name="XLAMP_MK-R">
<wire x1="4" y1="3.5" x2="4" y2="-3" width="0.25" layer="21"/>
<wire x1="4" y1="-3" x2="4" y2="-3.5" width="0.25" layer="21"/>
<wire x1="-4" y1="-3.5" x2="-4" y2="3.5" width="0.25" layer="21"/>
<wire x1="-3.5" y1="3.5" x2="3.5" y2="3.5" width="0.25" layer="51"/>
<wire x1="3.5" y1="3.5" x2="3.5" y2="-3.5" width="0.25" layer="51"/>
<wire x1="3.5" y1="-3.5" x2="-3.5" y2="-3.5" width="0.25" layer="51"/>
<wire x1="-3.5" y1="-3.5" x2="-3.5" y2="3.5" width="0.25" layer="51"/>
<circle x="0" y="0" radius="3.25" width="0.25" layer="51"/>
<smd name="C" x="-3.15" y="0" dx="1" dy="6.7" layer="1" thermals="no" cream="no"/>
<smd name="A" x="3.15" y="0" dx="1" dy="6.7" layer="1" thermals="no" cream="no"/>
<smd name="T" x="0" y="0" dx="3.9" dy="6.7" layer="1" thermals="no" cream="no"/>
<rectangle x1="-3.275" y1="-2.635" x2="-2.725" y2="2.635" layer="31"/>
<rectangle x1="2.725" y1="-2.635" x2="3.275" y2="2.635" layer="31"/>
<rectangle x1="-1.5" y1="-2.635" x2="1.5" y2="2.635" layer="31"/>
<circle x="-3" y="-3" radius="0.25" width="0" layer="51"/>
<circle x="3" y="3" radius="0.25" width="0" layer="51"/>
<wire x1="2.75" y1="-3" x2="3.25" y2="-3" width="0.25" layer="51"/>
<wire x1="3" y1="-2.75" x2="3" y2="-3.25" width="0.25" layer="51"/>
<circle x="-4.5" y="-3" radius="0.5" width="0" layer="21"/>
<circle x="4.5" y="3" radius="0.5" width="0" layer="21"/>
<wire x1="4.5" y1="-3" x2="5" y2="-3" width="0.25" layer="21"/>
<wire x1="4.5" y1="-2.5" x2="4.5" y2="-3" width="0.25" layer="21"/>
<wire x1="4.5" y1="-3" x2="4.5" y2="-3.5" width="0.25" layer="21"/>
<wire x1="4" y1="-3" x2="4.5" y2="-3" width="0.25" layer="21"/>
</package>
<package name="OPTO_IFE91">
<pad name="K" x="1.27" y="0" drill="1" shape="square" thermals="no"/>
<pad name="A" x="-1.27" y="0" drill="1" shape="square" thermals="no"/>
<hole x="-2.54" y="2.54" drill="1.6"/>
<hole x="2.54" y="2.54" drill="1.6"/>
<hole x="0" y="-5.08" drill="3.05"/>
<wire x1="-3.875" y1="3.6" x2="3.875" y2="3.6" width="0.25" layer="51"/>
<wire x1="4" y1="3.5" x2="4" y2="-2.575953125" width="0.25" layer="21"/>
<wire x1="4" y1="-2.575953125" x2="3.882471875" y2="-3.40743125" width="0.25" layer="21" curve="-16.09074"/>
<wire x1="3.882471875" y1="-3.40743125" x2="3.125534375" y2="-6.03148125" width="0.25" layer="21"/>
<wire x1="3.125534375" y1="-6.03148125" x2="0.2430625" y2="-8.2" width="0.25" layer="21" curve="-73.909202"/>
<wire x1="0.2430625" y1="-8.2" x2="-0.2430625" y2="-8.2" width="0.25" layer="21"/>
<wire x1="-0.2430625" y1="-8.2" x2="-3.125534375" y2="-6.03148125" width="0.25" layer="21" curve="-73.909202"/>
<wire x1="-3.125534375" y1="-6.03148125" x2="-3.882471875" y2="-3.40743125" width="0.25" layer="21"/>
<wire x1="-3.882471875" y1="-3.40743125" x2="-4" y2="-2.575953125" width="0.25" layer="21" curve="-16.090738"/>
<wire x1="-4" y1="-2.575953125" x2="-4" y2="3.5" width="0.25" layer="21"/>
<rectangle x1="-4.6" y1="5.8" x2="4.6" y2="16.8" layer="51"/>
<wire x1="-3.875" y1="3.6" x2="-3.875" y2="5.8" width="0.25" layer="51"/>
<wire x1="3.875" y1="3.6" x2="3.875" y2="5.8" width="0.25" layer="51"/>
</package>
<package name="TO-220-2FP">
<pad name="K@1" x="-2.54" y="0" drill="1.3" shape="long" rot="R90" thermals="no"/>
<pad name="A@1" x="2.54" y="0" drill="1.3" shape="long" rot="R90" thermals="no"/>
<wire x1="-5.5" y1="3.75" x2="5.5" y2="3.75" width="0.25" layer="21"/>
<wire x1="5.5" y1="3.75" x2="5.5" y2="-2" width="0.25" layer="21"/>
<wire x1="5.5" y1="-2" x2="4" y2="-2" width="0.25" layer="21"/>
<wire x1="1" y1="-2" x2="-1" y2="-2" width="0.25" layer="21"/>
<wire x1="-4" y1="-2" x2="-5.5" y2="-2" width="0.25" layer="21"/>
<wire x1="-5.5" y1="-2" x2="-5.5" y2="3.75" width="0.25" layer="21"/>
<rectangle x1="-2.94" y1="-0.4" x2="-2.14" y2="0.4" layer="51"/>
<rectangle x1="2.14" y1="-0.4" x2="2.94" y2="0.4" layer="51"/>
<rectangle x1="-5" y1="-1.6" x2="5" y2="3.3" layer="51"/>
</package>
<package name="DO-214AA">
<wire x1="-0.254" y1="-0.508" x2="-0.254" y2="0" width="0.25" layer="21"/>
<wire x1="-0.254" y1="0" x2="-0.254" y2="0.508" width="0.25" layer="21"/>
<wire x1="-0.254" y1="0" x2="0.254" y2="-0.508" width="0.25" layer="21"/>
<wire x1="0.254" y1="-0.508" x2="0.254" y2="0" width="0.25" layer="21"/>
<wire x1="0.254" y1="0" x2="0.254" y2="0.508" width="0.25" layer="21"/>
<wire x1="0.254" y1="0.508" x2="-0.254" y2="0" width="0.25" layer="21"/>
<wire x1="0.254" y1="0" x2="0.508" y2="0" width="0.25" layer="21"/>
<wire x1="-0.254" y1="0" x2="-0.508" y2="0" width="0.25" layer="21"/>
<wire x1="-3" y1="1.5" x2="-3" y2="2" width="0.25" layer="21"/>
<wire x1="-3" y1="2" x2="-2.5" y2="2" width="0.25" layer="21"/>
<wire x1="-2.5" y1="2" x2="2.5" y2="2" width="0.25" layer="21"/>
<wire x1="2.5" y1="2" x2="2.5" y2="1.5" width="0.25" layer="21"/>
<wire x1="2.5" y1="-1.5" x2="2.5" y2="-2" width="0.25" layer="21"/>
<wire x1="-3" y1="-2" x2="-2.5" y2="-2" width="0.25" layer="21"/>
<wire x1="-2.5" y1="-2" x2="2.5" y2="-2" width="0.25" layer="21"/>
<wire x1="-3" y1="-2" x2="-3" y2="-1.5" width="0.25" layer="21"/>
<smd name="K" x="-2.28" y="0" dx="2.5" dy="2.3" layer="1" thermals="no"/>
<smd name="A" x="2.28" y="0" dx="2.5" dy="2.3" layer="1" thermals="no"/>
<wire x1="-2.125" y1="1.75" x2="2.125" y2="1.75" width="0.25" layer="51"/>
<wire x1="2.125" y1="1.75" x2="2.125" y2="-1.75" width="0.25" layer="51"/>
<wire x1="2.125" y1="-1.75" x2="-2.125" y2="-1.75" width="0.25" layer="51"/>
<wire x1="-2.125" y1="-1.75" x2="-2.125" y2="1.75" width="0.25" layer="51"/>
<wire x1="-1.5" y1="1.5" x2="-1.5" y2="-1.5" width="0.25" layer="51"/>
<rectangle x1="-2.8" y1="-1.1" x2="-1.1" y2="1.1" layer="51"/>
<rectangle x1="1.1" y1="-1.1" x2="2.8" y2="1.1" layer="51"/>
<wire x1="-2.5" y1="2" x2="-2.5" y2="1.5" width="0.25" layer="21"/>
<wire x1="-2.5" y1="-2" x2="-2.5" y2="-1.5" width="0.25" layer="21"/>
</package>
<package name="OPTO_IFD91">
<pad name="K" x="-1.27" y="0" drill="1" shape="square" thermals="no"/>
<pad name="A" x="1.27" y="0" drill="1" shape="square" thermals="no"/>
<hole x="-2.54" y="2.54" drill="1.6"/>
<hole x="2.54" y="2.54" drill="1.6"/>
<hole x="0" y="-5.08" drill="3.05"/>
<wire x1="-3.875" y1="3.6" x2="3.875" y2="3.6" width="0.25" layer="51"/>
<wire x1="4" y1="3.5" x2="4" y2="-2.575953125" width="0.25" layer="21"/>
<wire x1="4" y1="-2.575953125" x2="3.882471875" y2="-3.40743125" width="0.25" layer="21" curve="-16.09074"/>
<wire x1="3.882471875" y1="-3.40743125" x2="3.125534375" y2="-6.03148125" width="0.25" layer="21"/>
<wire x1="3.125534375" y1="-6.03148125" x2="0.2430625" y2="-8.2" width="0.25" layer="21" curve="-73.909202"/>
<wire x1="0.2430625" y1="-8.2" x2="-0.2430625" y2="-8.2" width="0.25" layer="21"/>
<wire x1="-0.2430625" y1="-8.2" x2="-3.125534375" y2="-6.03148125" width="0.25" layer="21" curve="-73.909202"/>
<wire x1="-3.125534375" y1="-6.03148125" x2="-3.882471875" y2="-3.40743125" width="0.25" layer="21"/>
<wire x1="-3.882471875" y1="-3.40743125" x2="-4" y2="-2.575953125" width="0.25" layer="21" curve="-16.090738"/>
<wire x1="-4" y1="-2.575953125" x2="-4" y2="3.5" width="0.25" layer="21"/>
<rectangle x1="-4.6" y1="5.8" x2="4.6" y2="16.8" layer="51"/>
<wire x1="-3.875" y1="3.6" x2="-3.875" y2="5.8" width="0.25" layer="51"/>
<wire x1="3.875" y1="3.6" x2="3.875" y2="5.8" width="0.25" layer="51"/>
</package>
<package name="IKON_VERSACOMA_10MM">
<wire x1="-1" y1="1" x2="0" y2="2" width="1" layer="21"/>
<wire x1="0" y1="2" x2="1" y2="1" width="1" layer="21"/>
<wire x1="1" y1="1" x2="0" y2="0" width="1" layer="21"/>
<wire x1="0" y1="0" x2="-1" y2="1" width="1" layer="21"/>
<wire x1="0" y1="4" x2="-3" y2="1" width="1" layer="21"/>
<wire x1="-3" y1="1" x2="0" y2="-2" width="1" layer="21"/>
<wire x1="0" y1="-2" x2="3" y2="1" width="1" layer="21"/>
<wire x1="-4" y1="0" x2="-2" y2="-2" width="1" layer="21"/>
<wire x1="-2" y1="-2" x2="0" y2="-4" width="1" layer="21"/>
<wire x1="0" y1="-4" x2="1" y2="-3" width="1" layer="21"/>
<wire x1="1" y1="-3" x2="2" y2="-2" width="1" layer="21"/>
<wire x1="2" y1="-2" x2="4" y2="0" width="1" layer="21"/>
<wire x1="-2" y1="-2" x2="-4" y2="-4" width="1" layer="21"/>
<wire x1="2" y1="-2" x2="3" y2="-3" width="1" layer="21"/>
<wire x1="3" y1="-3" x2="4" y2="-4" width="1" layer="21"/>
<wire x1="1" y1="-3" x2="2" y2="-4" width="1" layer="21"/>
<wire x1="2" y1="-4" x2="3" y2="-3" width="1" layer="21"/>
</package>
<package name="IKON_VERSACOMA_5MM">
<wire x1="-0.5" y1="0.5" x2="0" y2="1" width="0.5" layer="21"/>
<wire x1="0" y1="1" x2="0.5" y2="0.5" width="0.5" layer="21"/>
<wire x1="0.5" y1="0.5" x2="0" y2="0" width="0.5" layer="21"/>
<wire x1="0" y1="0" x2="-0.5" y2="0.5" width="0.5" layer="21"/>
<wire x1="-1.5" y1="0.5" x2="0" y2="-1" width="0.5" layer="21"/>
<wire x1="0" y1="-1" x2="1.5" y2="0.5" width="0.5" layer="21"/>
<wire x1="-1.5" y1="0.5" x2="0" y2="2" width="0.5" layer="21"/>
<wire x1="-2" y1="0" x2="-1" y2="-1" width="0.5" layer="21"/>
<wire x1="-1" y1="-1" x2="0" y2="-2" width="0.5" layer="21"/>
<wire x1="0" y1="-2" x2="0.5" y2="-1.5" width="0.5" layer="21"/>
<wire x1="0.5" y1="-1.5" x2="1" y2="-1" width="0.5" layer="21"/>
<wire x1="1" y1="-1" x2="2" y2="0" width="0.5" layer="21"/>
<wire x1="-1" y1="-1" x2="-2" y2="-2" width="0.5" layer="21"/>
<wire x1="1" y1="-1" x2="1.5" y2="-1.5" width="0.5" layer="21"/>
<wire x1="1.5" y1="-1.5" x2="2" y2="-2" width="0.5" layer="21"/>
<wire x1="0.5" y1="-1.5" x2="1" y2="-2" width="0.5" layer="21"/>
<wire x1="1" y1="-2" x2="1.5" y2="-1.5" width="0.5" layer="21"/>
</package>
<package name="IKON_VERSACOMA_2.5MM">
<wire x1="-0.25" y1="0.25" x2="0" y2="0.5" width="0.25" layer="1"/>
<wire x1="0" y1="0.5" x2="0.25" y2="0.25" width="0.25" layer="1"/>
<wire x1="0.25" y1="0.25" x2="0" y2="0" width="0.25" layer="1"/>
<wire x1="0" y1="0" x2="-0.25" y2="0.25" width="0.25" layer="1"/>
<wire x1="0" y1="1" x2="-0.75" y2="0.25" width="0.25" layer="1"/>
<wire x1="-0.75" y1="0.25" x2="0" y2="-0.5" width="0.25" layer="1"/>
<wire x1="0" y1="-0.5" x2="0.75" y2="0.25" width="0.25" layer="1"/>
<wire x1="-1" y1="0" x2="-0.5" y2="-0.5" width="0.25" layer="1"/>
<wire x1="-0.5" y1="-0.5" x2="0" y2="-1" width="0.25" layer="1"/>
<wire x1="0" y1="-1" x2="0.25" y2="-0.75" width="0.25" layer="1"/>
<wire x1="0.25" y1="-0.75" x2="0.5" y2="-0.5" width="0.25" layer="1"/>
<wire x1="0.5" y1="-0.5" x2="1" y2="0" width="0.25" layer="1"/>
<wire x1="-0.5" y1="-0.5" x2="-1" y2="-1" width="0.25" layer="1"/>
<wire x1="0.5" y1="-0.5" x2="0.75" y2="-0.75" width="0.25" layer="1"/>
<wire x1="0.75" y1="-0.75" x2="1" y2="-1" width="0.25" layer="1"/>
<wire x1="0.25" y1="-0.75" x2="0.5" y2="-1" width="0.25" layer="1"/>
<wire x1="0.5" y1="-1" x2="0.75" y2="-0.75" width="0.25" layer="1"/>
<wire x1="0" y1="1" x2="-0.75" y2="0.25" width="0.275" layer="29"/>
<wire x1="-0.75" y1="0.25" x2="0" y2="-0.5" width="0.275" layer="29"/>
<wire x1="0" y1="-0.5" x2="0.75" y2="0.25" width="0.275" layer="29"/>
<wire x1="-0.25" y1="0.25" x2="0" y2="0.5" width="0.275" layer="29"/>
<wire x1="0" y1="0.5" x2="0.25" y2="0.25" width="0.275" layer="29"/>
<wire x1="0.25" y1="0.25" x2="0" y2="0" width="0.275" layer="29"/>
<wire x1="0" y1="0" x2="-0.25" y2="0.25" width="0.275" layer="29"/>
<wire x1="-1" y1="0" x2="-0.5" y2="-0.5" width="0.275" layer="29"/>
<wire x1="-0.5" y1="-0.5" x2="0" y2="-1" width="0.275" layer="29"/>
<wire x1="0" y1="-1" x2="0.25" y2="-0.75" width="0.275" layer="29"/>
<wire x1="0.25" y1="-0.75" x2="0.5" y2="-0.5" width="0.275" layer="29"/>
<wire x1="0.5" y1="-0.5" x2="1" y2="0" width="0.275" layer="29"/>
<wire x1="0.5" y1="-0.5" x2="0.75" y2="-0.75" width="0.275" layer="29"/>
<wire x1="0.75" y1="-0.75" x2="1" y2="-1" width="0.275" layer="29"/>
<wire x1="0.25" y1="-0.75" x2="0.5" y2="-1" width="0.275" layer="29"/>
<wire x1="0.5" y1="-1" x2="0.75" y2="-0.75" width="0.275" layer="29"/>
<wire x1="-1" y1="-1" x2="-0.5" y2="-0.5" width="0.275" layer="29"/>
<wire x1="-1.25" y1="-1" x2="-1.25" y2="0.021446875" width="0" layer="41"/>
<wire x1="-1.25" y1="0.021446875" x2="-1.176778125" y2="0.198221875" width="0" layer="41" curve="-44.999494"/>
<wire x1="-1.176778125" y1="0.198221875" x2="-0.176778125" y2="1.198221875" width="0" layer="41"/>
<wire x1="-0.176778125" y1="1.198221875" x2="0.176778125" y2="1.198221875" width="0" layer="41" curve="-90"/>
<wire x1="0.176778125" y1="1.198221875" x2="1.176778125" y2="0.198221875" width="0" layer="41"/>
<wire x1="1.176778125" y1="0.198221875" x2="1.25" y2="0.021446875" width="0" layer="41" curve="-44.999284"/>
<wire x1="1.25" y1="0.021446875" x2="1.25" y2="-1" width="0" layer="41"/>
<wire x1="1.25" y1="-1" x2="1" y2="-1.25" width="0" layer="41" curve="-90"/>
<wire x1="1" y1="-1.25" x2="-1" y2="-1.25" width="0" layer="41"/>
<wire x1="-1" y1="-1.25" x2="-1.25" y2="-1" width="0" layer="41" curve="-90"/>
</package>
<package name="IKON_VERSACOMA_2.5MM-MASK">
<wire x1="0" y1="1" x2="-0.75" y2="0.25" width="0.275" layer="29"/>
<wire x1="-0.75" y1="0.25" x2="0" y2="-0.5" width="0.275" layer="29"/>
<wire x1="0" y1="-0.5" x2="0.75" y2="0.25" width="0.275" layer="29"/>
<wire x1="-0.25" y1="0.25" x2="0" y2="0.5" width="0.275" layer="29"/>
<wire x1="0" y1="0.5" x2="0.25" y2="0.25" width="0.275" layer="29"/>
<wire x1="0.25" y1="0.25" x2="0" y2="0" width="0.275" layer="29"/>
<wire x1="0" y1="0" x2="-0.25" y2="0.25" width="0.275" layer="29"/>
<wire x1="-1" y1="0" x2="-0.5" y2="-0.5" width="0.275" layer="29"/>
<wire x1="-0.5" y1="-0.5" x2="0" y2="-1" width="0.275" layer="29"/>
<wire x1="0" y1="-1" x2="0.25" y2="-0.75" width="0.275" layer="29"/>
<wire x1="0.25" y1="-0.75" x2="0.5" y2="-0.5" width="0.275" layer="29"/>
<wire x1="0.5" y1="-0.5" x2="1" y2="0" width="0.275" layer="29"/>
<wire x1="0.5" y1="-0.5" x2="0.75" y2="-0.75" width="0.275" layer="29"/>
<wire x1="0.75" y1="-0.75" x2="1" y2="-1" width="0.275" layer="29"/>
<wire x1="0.25" y1="-0.75" x2="0.5" y2="-1" width="0.275" layer="29"/>
<wire x1="0.5" y1="-1" x2="0.75" y2="-0.75" width="0.275" layer="29"/>
<wire x1="-1" y1="-1" x2="-0.5" y2="-0.5" width="0.275" layer="29"/>
</package>
<package name="BOURNS_70AAJ-6-F1">
<smd name="1@1" x="-6.35" y="-4.43" dx="2" dy="2.4" layer="1" thermals="no"/>
<smd name="1@2" x="-6.35" y="4.43" dx="2" dy="2.4" layer="1" thermals="no"/>
<smd name="2@1" x="-3.81" y="-4.43" dx="2" dy="2.4" layer="1" thermals="no"/>
<smd name="2@2" x="-3.81" y="4.43" dx="2" dy="2.4" layer="1" thermals="no"/>
<smd name="3@1" x="-1.27" y="-4.43" dx="2" dy="2.4" layer="1" thermals="no"/>
<smd name="3@2" x="-1.27" y="4.43" dx="2" dy="2.4" layer="1" thermals="no"/>
<smd name="4@1" x="1.27" y="-4.43" dx="2" dy="2.4" layer="1" thermals="no"/>
<smd name="4@2" x="1.27" y="4.43" dx="2" dy="2.4" layer="1" thermals="no"/>
<wire x1="-7.57" y1="-5" x2="7.57" y2="-5" width="0.25" layer="51"/>
<wire x1="-7.57" y1="5" x2="7.57" y2="5" width="0.25" layer="51"/>
<rectangle x1="-7.175" y1="3.55" x2="-5.525" y2="5" layer="51"/>
<rectangle x1="-4.635" y1="3.55" x2="-2.985" y2="5" layer="51"/>
<rectangle x1="-2.095" y1="3.55" x2="-0.445" y2="5" layer="51"/>
<rectangle x1="0.445" y1="3.55" x2="2.095" y2="5" layer="51"/>
<rectangle x1="-7.175" y1="-5" x2="-5.525" y2="-3.55" layer="51"/>
<rectangle x1="-4.635" y1="-5" x2="-2.985" y2="-3.55" layer="51"/>
<rectangle x1="-2.095" y1="-5" x2="-0.445" y2="-3.55" layer="51"/>
<rectangle x1="0.445" y1="-5" x2="2.095" y2="-3.55" layer="51"/>
<hole x="-6.35" y="0" drill="1.3"/>
<hole x="6.35" y="0" drill="1.3"/>
<wire x1="-8.04" y1="5" x2="-8.04" y2="-5" width="0.25" layer="21"/>
<wire x1="8.04" y1="5" x2="8.04" y2="-5" width="0.25" layer="21"/>
<wire x1="-7.57" y1="5" x2="-7.57" y2="-5" width="0.25" layer="51"/>
<wire x1="7.57" y1="5" x2="7.57" y2="-5" width="0.25" layer="51"/>
<smd name="5@1" x="3.81" y="-4.43" dx="2" dy="2.4" layer="1" thermals="no"/>
<smd name="6@1" x="6.35" y="-4.43" dx="2" dy="2.4" layer="1" thermals="no"/>
<rectangle x1="2.985" y1="-5" x2="4.635" y2="-3.55" layer="51"/>
<rectangle x1="5.525" y1="-5" x2="7.175" y2="-3.55" layer="51"/>
<rectangle x1="2.985" y1="3.55" x2="4.635" y2="5" layer="51"/>
<rectangle x1="5.525" y1="3.55" x2="7.175" y2="5" layer="51"/>
<smd name="5@2" x="3.81" y="4.43" dx="2" dy="2.4" layer="1" thermals="no"/>
<smd name="6@2" x="6.35" y="4.43" dx="2" dy="2.4" layer="1" thermals="no"/>
<rectangle x1="-7.175" y1="-5" x2="-5.525" y2="5" layer="49"/>
<rectangle x1="-4.635" y1="-5" x2="-2.985" y2="5" layer="49"/>
<rectangle x1="-2.095" y1="-5" x2="-0.445" y2="5" layer="49"/>
<rectangle x1="0.445" y1="-5" x2="2.095" y2="5" layer="49"/>
<rectangle x1="2.985" y1="-5" x2="4.635" y2="5" layer="49"/>
<rectangle x1="5.525" y1="-5" x2="7.175" y2="5" layer="49"/>
</package>
<package name="BOURNS_70AAJ-6-M0">
<smd name="1@1" x="-6.35" y="-3.75" dx="1.3" dy="2.25" layer="1" thermals="no"/>
<smd name="2@1" x="-3.81" y="-3.75" dx="1.3" dy="2.25" layer="1" thermals="no"/>
<smd name="3@1" x="-1.27" y="-3.75" dx="1.3" dy="2.25" layer="1" thermals="no"/>
<smd name="4@1" x="1.27" y="-3.75" dx="1.3" dy="2.25" layer="1" thermals="no"/>
<smd name="5@1" x="3.81" y="-3.75" dx="1.3" dy="2.25" layer="1" thermals="no"/>
<smd name="6@1" x="6.35" y="-3.75" dx="1.3" dy="2.25" layer="1" thermals="no"/>
<wire x1="-6.945" y1="-4.24" x2="7.58" y2="-4.24" width="0.25" layer="51"/>
<wire x1="7.58" y1="-4.24" x2="7.58" y2="-2.85" width="0.25" layer="51"/>
<wire x1="7.58" y1="-2.85" x2="7.58" y2="4.24" width="0.25" layer="51"/>
<wire x1="7.58" y1="4.24" x2="-7.58" y2="4.24" width="0.25" layer="51"/>
<wire x1="-7.58" y1="4.24" x2="-7.58" y2="-2.85" width="0.25" layer="51"/>
<smd name="1@2" x="-6.35" y="3.75" dx="1.3" dy="2.25" layer="1" thermals="no"/>
<smd name="2@2" x="-3.81" y="3.75" dx="1.3" dy="2.25" layer="1" thermals="no"/>
<smd name="3@2" x="-1.27" y="3.75" dx="1.3" dy="2.25" layer="1" thermals="no"/>
<smd name="4@2" x="1.27" y="3.75" dx="1.3" dy="2.25" layer="1" thermals="no"/>
<smd name="5@2" x="3.81" y="3.75" dx="1.3" dy="2.25" layer="1" thermals="no"/>
<smd name="6@2" x="6.35" y="3.75" dx="1.3" dy="2.25" layer="1" thermals="no"/>
<rectangle x1="-6.73" y1="3.075" x2="-5.97" y2="4.24" layer="51"/>
<rectangle x1="-4.19" y1="3.075" x2="-3.43" y2="4.24" layer="51"/>
<rectangle x1="-1.65" y1="3.075" x2="-0.89" y2="4.24" layer="51"/>
<rectangle x1="0.89" y1="3.075" x2="1.65" y2="4.24" layer="51"/>
<rectangle x1="3.43" y1="3.075" x2="4.19" y2="4.24" layer="51"/>
<rectangle x1="5.97" y1="3.075" x2="6.73" y2="4.24" layer="51"/>
<rectangle x1="5.97" y1="-4.24" x2="6.73" y2="-3.075" layer="51"/>
<rectangle x1="3.43" y1="-4.24" x2="4.19" y2="-3.075" layer="51"/>
<rectangle x1="0.89" y1="-4.24" x2="1.65" y2="-3.075" layer="51"/>
<rectangle x1="-1.65" y1="-4.24" x2="-0.89" y2="-3.075" layer="51"/>
<rectangle x1="-4.19" y1="-4.24" x2="-3.43" y2="-3.075" layer="51"/>
<rectangle x1="-6.73" y1="-4.24" x2="-5.97" y2="-3.075" layer="51"/>
<rectangle x1="-6.8" y1="-2.85" x2="-5.9" y2="4.24" layer="49"/>
<rectangle x1="-4.26" y1="-2.85" x2="-3.36" y2="4.24" layer="49"/>
<rectangle x1="-1.72" y1="-2.85" x2="-0.82" y2="4.24" layer="49"/>
<rectangle x1="0.82" y1="-2.85" x2="1.72" y2="4.24" layer="49"/>
<rectangle x1="3.36" y1="-2.85" x2="4.26" y2="4.24" layer="49"/>
<rectangle x1="5.9" y1="-2.85" x2="6.8" y2="4.24" layer="49"/>
<wire x1="-7.58" y1="-2.85" x2="-6.945" y2="-4.24" width="0.25" layer="51"/>
<wire x1="-7.58" y1="-2.85" x2="7.58" y2="-2.85" width="0.25" layer="51"/>
<wire x1="-8" y1="4.25" x2="-8" y2="-2.875" width="0.25" layer="21"/>
<wire x1="-8" y1="-2.875" x2="-7.375" y2="-4.25" width="0.25" layer="21"/>
<wire x1="8" y1="4.25" x2="8" y2="-4.25" width="0.25" layer="21"/>
</package>
<package name="TO-252AA-3-BIGBARE">
<description>IRFR7546 - TO-252AA footprint</description>
<smd name="3D" x="0" y="6.125" dx="7" dy="7.75" layer="1" thermals="no" cream="no"/>
<smd name="1G" x="-2.29" y="0.1" dx="1.5" dy="2.25" layer="1" thermals="no" cream="no"/>
<smd name="2S" x="1.75" y="0.1" dx="3.5" dy="2.25" layer="1" thermals="no" cream="no"/>
<rectangle x1="-2.16" y1="3.74" x2="2.16" y2="9.33" layer="51"/>
<rectangle x1="-2.86" y1="-0.78" x2="-1.72" y2="1" layer="51"/>
<rectangle x1="1.72" y1="-0.78" x2="2.86" y2="1" layer="51"/>
<wire x1="-3.25" y1="1.96" x2="3.25" y2="1.96" width="0.25" layer="51"/>
<wire x1="3.25" y1="1.96" x2="3.25" y2="8.06" width="0.25" layer="51"/>
<wire x1="3.25" y1="8.06" x2="-3.25" y2="8.06" width="0.25" layer="51"/>
<wire x1="-3.25" y1="8.06" x2="-3.25" y2="1.96" width="0.25" layer="51"/>
<wire x1="3.365" y1="-0.78" x2="3.365" y2="9.63" width="0.25" layer="49"/>
<wire x1="-3.365" y1="-0.78" x2="-3.365" y2="9.63" width="0.25" layer="49"/>
<wire x1="-3.365" y1="9.63" x2="3.365" y2="9.63" width="0.25" layer="49"/>
<wire x1="-3.365" y1="-0.78" x2="3.365" y2="-0.78" width="0.25" layer="49"/>
<rectangle x1="1.575" y1="-1" x2="3.025" y2="1.2" layer="31"/>
<rectangle x1="-2.75" y1="2.5" x2="2.75" y2="9.7" layer="31"/>
<rectangle x1="-3.025" y1="-1" x2="-1.575" y2="1.2" layer="31"/>
</package>
<package name="TO-263-7-BARE">
<smd name="G" x="-3.81" y="0" dx="0.9" dy="4" layer="1" thermals="no"/>
<smd name="S@0" x="-2.54" y="0" dx="0.9" dy="4" layer="1" thermals="no"/>
<smd name="S@1" x="-1.27" y="0" dx="0.9" dy="4" layer="1" thermals="no"/>
<smd name="S@2" x="1.27" y="0" dx="0.9" dy="4" layer="1" thermals="no"/>
<smd name="S@3" x="2.54" y="0" dx="0.9" dy="4" layer="1" thermals="no"/>
<smd name="S@4" x="3.81" y="0" dx="0.9" dy="4" layer="1" thermals="no"/>
<smd name="D" x="0" y="10.2" dx="12" dy="11" layer="1" thermals="no"/>
<rectangle x1="-1.6256" y1="-1.143" x2="-0.9144" y2="1.143" layer="51"/>
<rectangle x1="-2.8956" y1="-1.143" x2="-2.1844" y2="1.143" layer="51"/>
<rectangle x1="-4.1656" y1="-1.143" x2="-3.4544" y2="1.143" layer="51"/>
<rectangle x1="0.9144" y1="-1.143" x2="1.6256" y2="1.143" layer="51"/>
<rectangle x1="2.1844" y1="-1.143" x2="2.8956" y2="1.143" layer="51"/>
<rectangle x1="3.4544" y1="-1.143" x2="4.1656" y2="1.143" layer="51"/>
<rectangle x1="-5.08" y1="7.239" x2="5.08" y2="14.097" layer="51"/>
</package>
<package name="SOT-23-6">
<description>SOT-23-6, ?</description>
<wire x1="-1.5" y1="0.8" x2="1.5" y2="0.8" width="0.1" layer="51"/>
<wire x1="1.5" y1="0.8" x2="1.5" y2="-0.8" width="0.1" layer="51"/>
<wire x1="1.5" y1="-0.8" x2="-1.5" y2="-0.8" width="0.1" layer="51"/>
<wire x1="-1.5" y1="-0.8" x2="-1.5" y2="0.8" width="0.1" layer="51"/>
<smd name="1" x="-0.95" y="-1.1" dx="0.6" dy="0.9" layer="1" thermals="no"/>
<smd name="3" x="0.95" y="-1.1" dx="0.6" dy="0.9" layer="1" thermals="no"/>
<smd name="5" x="0" y="1.1" dx="0.6" dy="0.9" layer="1" thermals="no"/>
<rectangle x1="-1.15" y1="-1.4" x2="-0.75" y2="-0.8" layer="51"/>
<rectangle x1="0.75" y1="-1.4" x2="1.15" y2="-0.8" layer="51"/>
<rectangle x1="-0.2" y1="0.8" x2="0.2" y2="1.4" layer="51"/>
<rectangle x1="-1.15" y1="0.8" x2="-0.75" y2="1.4" layer="51"/>
<rectangle x1="0.75" y1="0.8" x2="1.15" y2="1.4" layer="51"/>
<rectangle x1="-0.2" y1="-1.4" x2="0.2" y2="-0.8" layer="51"/>
<smd name="2" x="0" y="-1.1" dx="0.6" dy="0.9" layer="1" thermals="no"/>
<smd name="4" x="0.95" y="1.1" dx="0.6" dy="0.9" layer="1" thermals="no"/>
<smd name="6" x="-0.95" y="1.1" dx="0.6" dy="0.9" layer="1" thermals="no"/>
<wire x1="-1.65" y1="1" x2="-1.75" y2="1" width="0.25" layer="21"/>
<wire x1="-1.75" y1="1" x2="-1.75" y2="-1" width="0.25" layer="21"/>
<wire x1="-1.75" y1="-1" x2="-1.625" y2="-1" width="0.25" layer="21"/>
<wire x1="1.65" y1="1" x2="1.75" y2="1" width="0.25" layer="21"/>
<wire x1="1.75" y1="1" x2="1.75" y2="-1" width="0.25" layer="21"/>
<wire x1="1.75" y1="-1" x2="1.625" y2="-1" width="0.25" layer="21"/>
<wire x1="-1.6" y1="-1" x2="-1.8" y2="-0.7" width="0.25" layer="21" curve="-180"/>
</package>
</packages>
<symbols>
<symbol name="CAPACITOR">
<wire x1="0.762" y1="1.27" x2="0.762" y2="0" width="0.508" layer="94"/>
<wire x1="0.762" y1="0" x2="0.762" y2="-1.27" width="0.508" layer="94"/>
<wire x1="-0.762" y1="0" x2="-0.762" y2="1.27" width="0.508" layer="94"/>
<wire x1="-0.762" y1="0" x2="-0.762" y2="-1.27" width="0.508" layer="94"/>
<wire x1="2.54" y1="0" x2="0.762" y2="0" width="0.1524" layer="94"/>
<wire x1="-0.762" y1="0" x2="-2.54" y2="0" width="0.1524" layer="94"/>
<text x="0" y="1.524" size="1.778" layer="95" align="bottom-center">&gt;NAME</text>
<text x="0" y="-1.524" size="1.778" layer="96" font="vector" align="top-center">&gt;VALUE</text>
<pin name="P$2" x="5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1" rot="R180"/>
<pin name="P$1" x="-5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1"/>
</symbol>
<symbol name="VREG_3-PIN">
<wire x1="-7.62" y1="2.54" x2="-7.62" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="-7.62" y1="-5.08" x2="7.62" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="7.62" y1="-5.08" x2="7.62" y2="2.54" width="0.4064" layer="94"/>
<wire x1="7.62" y1="2.54" x2="-7.62" y2="2.54" width="0.4064" layer="94"/>
<text x="-2.2225" y="-4.572" size="1.778" layer="95" font="vector">GND</text>
<text x="-6.985" y="-0.889" size="1.778" layer="95" font="vector">VIN</text>
<text x="0.8382" y="-0.889" size="1.778" layer="95" font="vector">VOUT</text>
<pin name="VIN" x="-10.16" y="0" visible="off" length="short"/>
<pin name="VOUT" x="10.16" y="0" visible="off" length="short" rot="R180"/>
<pin name="GND" x="0" y="-7.62" visible="off" length="short" rot="R90"/>
<text x="-7.62" y="3.175" size="1.27" layer="95">&gt;NAME</text>
<text x="0" y="3.175" size="1.27" layer="96">&gt;VALUE</text>
</symbol>
<symbol name="SCREW">
<circle x="0" y="0" radius="0.508" width="0.254" layer="94"/>
<circle x="0" y="0" radius="1.27" width="0.254" layer="94"/>
<pin name="P$1" x="0" y="0" visible="off" length="point" direction="pas"/>
</symbol>
<symbol name="SWITCH_SPST_2">
<wire x1="1.905" y1="0" x2="2.54" y2="0" width="0.254" layer="94"/>
<wire x1="1.905" y1="3.175" x2="1.905" y2="1.905" width="0.254" layer="94"/>
<wire x1="-1.905" y1="3.175" x2="-1.905" y2="1.905" width="0.254" layer="94"/>
<wire x1="1.905" y1="3.175" x2="0" y2="3.175" width="0.254" layer="94"/>
<wire x1="0" y1="3.175" x2="-1.905" y2="3.175" width="0.254" layer="94"/>
<wire x1="0" y1="1.27" x2="0" y2="0.635" width="0.1524" layer="94"/>
<wire x1="0" y1="3.175" x2="0" y2="1.905" width="0.1524" layer="94"/>
<wire x1="2.54" y1="1.27" x2="2.54" y2="0" width="0.1524" layer="94"/>
<wire x1="-2.54" y1="1.27" x2="-2.54" y2="0" width="0.1524" layer="94"/>
<wire x1="-2.54" y1="0" x2="1.905" y2="1.27" width="0.254" layer="94"/>
<circle x="-2.54" y="0" radius="0.127" width="0.4064" layer="94"/>
<circle x="2.54" y="0" radius="0.127" width="0.4064" layer="94"/>
<text x="-2.54" y="3.81" size="1.778" layer="95">&gt;NAME</text>
<pin name="2" x="-5.08" y="0" visible="off" length="short" direction="pas" swaplevel="2"/>
<pin name="1" x="5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1" rot="R180"/>
</symbol>
<symbol name="RESISTOR">
<wire x1="-2.54" y1="0" x2="-2.2225" y2="1.27" width="0.254" layer="94"/>
<wire x1="-2.2225" y1="1.27" x2="-1.5875" y2="-1.27" width="0.254" layer="94"/>
<wire x1="-1.5875" y1="-1.27" x2="-0.9525" y2="1.27" width="0.254" layer="94"/>
<wire x1="-0.9525" y1="1.27" x2="-0.3175" y2="-1.27" width="0.254" layer="94"/>
<wire x1="-0.3175" y1="-1.27" x2="0.3175" y2="1.27" width="0.254" layer="94"/>
<wire x1="0.3175" y1="1.27" x2="0.9525" y2="-1.27" width="0.254" layer="94"/>
<wire x1="0.9525" y1="-1.27" x2="1.5875" y2="1.27" width="0.254" layer="94"/>
<wire x1="1.5875" y1="1.27" x2="2.2225" y2="-1.27" width="0.254" layer="94"/>
<wire x1="2.2225" y1="-1.27" x2="2.54" y2="0" width="0.254" layer="94"/>
<text x="0" y="1.524" size="1.778" layer="95" align="bottom-center">&gt;NAME</text>
<text x="0" y="-1.524" size="1.778" layer="96" align="top-center">&gt;VALUE</text>
<pin name="1" x="-5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1"/>
<pin name="2" x="5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1" rot="R180"/>
</symbol>
<symbol name="LED">
<wire x1="1.27" y1="0" x2="0" y2="-2.54" width="0.254" layer="94"/>
<wire x1="0" y1="-2.54" x2="-1.27" y2="0" width="0.254" layer="94"/>
<wire x1="1.27" y1="-2.54" x2="0" y2="-2.54" width="0.254" layer="94"/>
<wire x1="0" y1="-2.54" x2="-1.27" y2="-2.54" width="0.254" layer="94"/>
<wire x1="1.27" y1="0" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="0" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="-2.032" y1="-0.762" x2="-3.429" y2="-2.159" width="0.1524" layer="94"/>
<wire x1="-1.905" y1="-1.905" x2="-3.302" y2="-3.302" width="0.1524" layer="94"/>
<text x="3.556" y="-4.572" size="1.778" layer="95" rot="R90">&gt;NAME</text>
<text x="5.715" y="-4.572" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
<pin name="C" x="0" y="-5.08" visible="off" length="short" direction="pas" rot="R90"/>
<pin name="A" x="0" y="2.54" visible="off" length="short" direction="pas" rot="R270"/>
<polygon width="0.1524" layer="94">
<vertex x="-3.429" y="-2.159"/>
<vertex x="-3.048" y="-1.27"/>
<vertex x="-2.54" y="-1.778"/>
</polygon>
<polygon width="0.1524" layer="94">
<vertex x="-3.302" y="-3.302"/>
<vertex x="-2.921" y="-2.413"/>
<vertex x="-2.413" y="-2.921"/>
</polygon>
</symbol>
<symbol name="DXL_TTL">
<wire x1="1.905" y1="-4.445" x2="0.635" y2="-4.445" width="0.254" layer="94"/>
<wire x1="0.635" y1="-4.445" x2="-1.905" y2="-4.445" width="0.254" layer="94"/>
<wire x1="-1.905" y1="-4.445" x2="-1.905" y2="4.445" width="0.254" layer="94"/>
<wire x1="0.635" y1="4.445" x2="1.905" y2="3.175" width="0.254" layer="94"/>
<wire x1="1.905" y1="-4.445" x2="1.905" y2="-3.175" width="0.254" layer="94"/>
<wire x1="1.905" y1="-3.175" x2="1.905" y2="-1.905" width="0.254" layer="94"/>
<wire x1="1.905" y1="-1.905" x2="1.27" y2="-1.27" width="0.254" layer="94"/>
<wire x1="1.27" y1="-1.27" x2="1.905" y2="-0.635" width="0.254" layer="94"/>
<wire x1="1.905" y1="-0.635" x2="1.905" y2="0.635" width="0.254" layer="94"/>
<wire x1="1.905" y1="0.635" x2="1.27" y2="1.27" width="0.254" layer="94"/>
<wire x1="1.27" y1="1.27" x2="1.905" y2="1.905" width="0.254" layer="94"/>
<wire x1="1.905" y1="1.905" x2="1.905" y2="3.175" width="0.254" layer="94"/>
<wire x1="0.635" y1="4.445" x2="-1.905" y2="4.445" width="0.254" layer="94"/>
<wire x1="1.905" y1="-3.175" x2="1.905" y2="1.905" width="0.254" layer="94"/>
<wire x1="1.905" y1="-3.175" x2="0.635" y2="-4.445" width="0.254" layer="94"/>
<circle x="0" y="-2.54" radius="0.635" width="0.254" layer="94"/>
<circle x="0" y="0" radius="0.635" width="0.254" layer="94"/>
<circle x="0" y="2.54" radius="0.635" width="0.254" layer="94"/>
<text x="-2.54" y="5.08" size="1.778" layer="95">&gt;NAME</text>
<pin name="TTL" x="0" y="-2.54" visible="pin" length="point"/>
<pin name="VDD" x="0" y="0" visible="pin" length="point"/>
<pin name="GND" x="0" y="2.54" visible="pin" length="point"/>
</symbol>
<symbol name="DIODE_RECTIFIER">
<wire x1="-0.9525" y1="1.27" x2="-0.9525" y2="0" width="0.254" layer="94"/>
<wire x1="-0.9525" y1="0" x2="-0.9525" y2="-1.27" width="0.254" layer="94"/>
<wire x1="-0.9525" y1="-1.27" x2="0.9525" y2="0" width="0.254" layer="94"/>
<wire x1="0.9525" y1="0" x2="-0.9525" y2="1.27" width="0.254" layer="94"/>
<wire x1="0.9525" y1="1.27" x2="0.9525" y2="0" width="0.254" layer="94"/>
<wire x1="0.9525" y1="0" x2="0.9525" y2="-1.27" width="0.254" layer="94"/>
<wire x1="-0.9525" y1="0" x2="-2.54" y2="0" width="0.254" layer="94"/>
<wire x1="0.9525" y1="0" x2="2.54" y2="0" width="0.254" layer="94"/>
<text x="-2.54" y="1.5875" size="1.778" layer="95">&gt;NAME</text>
<text x="-2.54" y="-3.3655" size="1.778" layer="96">&gt;VALUE</text>
<pin name="A" x="-2.54" y="0" visible="off" length="point"/>
<pin name="C" x="2.54" y="0" visible="off" length="point" rot="R180"/>
</symbol>
<symbol name="IKON">
<wire x1="-3.048" y1="1.016" x2="3.048" y2="1.016" width="0.254" layer="94"/>
<wire x1="3.048" y1="1.016" x2="3.048" y2="-1.27" width="0.254" layer="94"/>
<wire x1="3.048" y1="-1.27" x2="-3.048" y2="-1.27" width="0.254" layer="94"/>
<wire x1="-3.048" y1="-1.27" x2="-3.048" y2="1.016" width="0.254" layer="94"/>
<text x="-2.794" y="-1.016" size="1.778" layer="94">IKON</text>
</symbol>
<symbol name="ESP8266-02">
<pin name="GND" x="-12.7" y="0" length="short"/>
<pin name="RXD" x="-12.7" y="-2.54" length="short"/>
<pin name="TXD" x="-12.7" y="-5.08" length="short"/>
<pin name="VCC" x="-12.7" y="-7.62" length="short"/>
<pin name="GPIO15" x="12.7" y="-7.62" length="short" rot="R180"/>
<pin name="GPIO0" x="12.7" y="-5.08" length="short" rot="R180"/>
<pin name="GPIO2" x="12.7" y="-2.54" length="short" rot="R180"/>
<pin name="RST" x="12.7" y="0" length="short" rot="R180"/>
<wire x1="-10.16" y1="6.985" x2="-10.16" y2="-9.525" width="0.254" layer="94"/>
<wire x1="-10.16" y1="-9.525" x2="10.16" y2="-9.525" width="0.254" layer="94"/>
<wire x1="10.16" y1="-9.525" x2="10.16" y2="6.985" width="0.254" layer="94"/>
<wire x1="10.16" y1="6.985" x2="-10.16" y2="6.985" width="0.254" layer="94"/>
<text x="-10.16" y="7.62" size="1.778" layer="95" font="vector">&gt;NAME</text>
</symbol>
<symbol name="HEADER_1X6">
<wire x1="-5.08" y1="7.62" x2="0" y2="7.62" width="0.254" layer="94"/>
<wire x1="0" y1="7.62" x2="0" y2="-10.16" width="0.254" layer="94"/>
<wire x1="0" y1="-10.16" x2="-5.08" y2="-10.16" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-10.16" x2="-5.08" y2="7.62" width="0.254" layer="94"/>
<text x="-5.334" y="8.128" size="1.778" layer="95">&gt;NAME</text>
<pin name="1" x="0" y="-7.62" length="point" swaplevel="1" rot="R180"/>
<pin name="2" x="0" y="-5.08" length="point" swaplevel="1" rot="R180"/>
<pin name="3" x="0" y="-2.54" length="point" swaplevel="1" rot="R180"/>
<pin name="4" x="0" y="0" length="point" swaplevel="1" rot="R180"/>
<pin name="5" x="0" y="2.54" length="point" swaplevel="1" rot="R180"/>
<pin name="6" x="0" y="5.08" length="point" swaplevel="1" rot="R180"/>
</symbol>
<symbol name="HEADER_1X8">
<wire x1="-5.08" y1="10.16" x2="0" y2="10.16" width="0.254" layer="94"/>
<wire x1="0" y1="10.16" x2="0" y2="-12.7" width="0.254" layer="94"/>
<wire x1="0" y1="-12.7" x2="-5.08" y2="-12.7" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-12.7" x2="-5.08" y2="10.16" width="0.254" layer="94"/>
<text x="-5.334" y="10.668" size="1.778" layer="95">&gt;NAME</text>
<pin name="1" x="0" y="-10.16" length="point" swaplevel="1" rot="R180"/>
<pin name="2" x="0" y="-7.62" length="point" swaplevel="1" rot="R180"/>
<pin name="3" x="0" y="-5.08" length="point" swaplevel="1" rot="R180"/>
<pin name="4" x="0" y="-2.54" length="point" swaplevel="1" rot="R180"/>
<pin name="5" x="0" y="0" length="point" swaplevel="1" rot="R180"/>
<pin name="6" x="0" y="2.54" length="point" swaplevel="1" rot="R180"/>
<pin name="7" x="0" y="5.08" length="point" swaplevel="1" rot="R180"/>
<pin name="8" x="0" y="7.62" length="point" swaplevel="1" rot="R180"/>
</symbol>
<symbol name="LOGIC_74_1G126">
<pin name="OE" x="-10.16" y="2.54" length="short"/>
<pin name="A" x="-10.16" y="0" length="short"/>
<pin name="GND" x="-10.16" y="-2.54" length="short"/>
<pin name="Y" x="10.16" y="-2.54" length="short" rot="R180"/>
<pin name="VCC" x="10.16" y="2.54" length="short" rot="R180"/>
<wire x1="-7.62" y1="5.08" x2="-7.62" y2="2.54" width="0.254" layer="94"/>
<wire x1="-7.62" y1="2.54" x2="-7.62" y2="0" width="0.254" layer="94"/>
<wire x1="-7.62" y1="0" x2="-7.62" y2="-5.08" width="0.254" layer="94"/>
<wire x1="-7.62" y1="-5.08" x2="7.62" y2="-5.08" width="0.254" layer="94"/>
<wire x1="7.62" y1="-5.08" x2="7.62" y2="-2.54" width="0.254" layer="94"/>
<wire x1="7.62" y1="-2.54" x2="7.62" y2="5.08" width="0.254" layer="94"/>
<wire x1="7.62" y1="5.08" x2="-7.62" y2="5.08" width="0.254" layer="94"/>
<text x="-7.112" y="5.588" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-7.112" y="-7.112" size="1.778" layer="97" font="vector">74_1G126</text>
<wire x1="-1.27" y1="2.54" x2="-1.27" y2="1.27" width="0.127" layer="94"/>
<wire x1="-1.27" y1="1.27" x2="-1.27" y2="0" width="0.127" layer="94"/>
<wire x1="-1.27" y1="2.54" x2="0.635" y2="1.27" width="0.127" layer="94"/>
<wire x1="0.635" y1="1.27" x2="-1.27" y2="0" width="0.127" layer="94"/>
<wire x1="0.635" y1="1.27" x2="1.905" y2="1.27" width="0.127" layer="94"/>
<wire x1="1.905" y1="1.27" x2="1.905" y2="-0.635" width="0.127" layer="94"/>
<wire x1="0.635" y1="0" x2="1.905" y2="-0.635" width="0.127" layer="94"/>
<wire x1="1.905" y1="-0.635" x2="3.175" y2="-1.27" width="0.127" layer="94"/>
<wire x1="3.175" y1="-1.27" x2="0.635" y2="-2.54" width="0.127" layer="94"/>
<wire x1="0.635" y1="-2.54" x2="0.635" y2="-1.27" width="0.127" layer="94"/>
<wire x1="0.635" y1="-1.27" x2="0.635" y2="0" width="0.127" layer="94"/>
<wire x1="-7.62" y1="0" x2="-6.985" y2="0" width="0.127" layer="94"/>
<wire x1="-6.985" y1="0" x2="-5.715" y2="-1.27" width="0.127" layer="94"/>
<wire x1="-5.715" y1="-1.27" x2="0.635" y2="-1.27" width="0.127" layer="94"/>
<wire x1="3.175" y1="-1.27" x2="5.08" y2="-1.27" width="0.127" layer="94"/>
<wire x1="-1.27" y1="1.27" x2="-5.715" y2="1.27" width="0.127" layer="94"/>
<wire x1="-5.715" y1="1.27" x2="-6.985" y2="2.54" width="0.127" layer="94"/>
<wire x1="-6.985" y1="2.54" x2="-7.62" y2="2.54" width="0.127" layer="94"/>
<wire x1="5.08" y1="-1.27" x2="6.35" y2="-2.54" width="0.127" layer="94"/>
<wire x1="6.35" y1="-2.54" x2="7.62" y2="-2.54" width="0.127" layer="94"/>
</symbol>
<symbol name="LOGIC_74_1G125">
<pin name="!OE!" x="-10.16" y="2.54" length="short"/>
<pin name="A" x="-10.16" y="0" length="short"/>
<pin name="GND" x="-10.16" y="-2.54" length="short"/>
<pin name="Y" x="10.16" y="-2.54" length="short" rot="R180"/>
<pin name="VCC" x="10.16" y="2.54" length="short" rot="R180"/>
<wire x1="-7.62" y1="5.08" x2="-7.62" y2="2.54" width="0.254" layer="94"/>
<wire x1="-7.62" y1="2.54" x2="-7.62" y2="0" width="0.254" layer="94"/>
<wire x1="-7.62" y1="0" x2="-7.62" y2="-5.08" width="0.254" layer="94"/>
<wire x1="-7.62" y1="-5.08" x2="7.62" y2="-5.08" width="0.254" layer="94"/>
<wire x1="7.62" y1="-5.08" x2="7.62" y2="-2.54" width="0.254" layer="94"/>
<wire x1="7.62" y1="-2.54" x2="7.62" y2="5.08" width="0.254" layer="94"/>
<wire x1="7.62" y1="5.08" x2="-7.62" y2="5.08" width="0.254" layer="94"/>
<text x="-7.112" y="5.588" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-7.112" y="-7.112" size="1.778" layer="97" font="vector">74_1G125</text>
<wire x1="-1.27" y1="2.54" x2="-1.27" y2="0" width="0.127" layer="94"/>
<wire x1="-1.27" y1="2.54" x2="0.635" y2="1.27" width="0.127" layer="94"/>
<wire x1="0.635" y1="1.27" x2="-1.27" y2="0" width="0.127" layer="94"/>
<wire x1="0.635" y1="1.27" x2="1.905" y2="1.27" width="0.127" layer="94"/>
<wire x1="1.905" y1="1.27" x2="1.905" y2="-0.635" width="0.127" layer="94"/>
<circle x="-1.5875" y="1.27" radius="0.254" width="0.127" layer="94"/>
<wire x1="0.635" y1="0" x2="1.905" y2="-0.635" width="0.127" layer="94"/>
<wire x1="1.905" y1="-0.635" x2="3.175" y2="-1.27" width="0.127" layer="94"/>
<wire x1="3.175" y1="-1.27" x2="0.635" y2="-2.54" width="0.127" layer="94"/>
<wire x1="0.635" y1="-2.54" x2="0.635" y2="-1.27" width="0.127" layer="94"/>
<wire x1="0.635" y1="-1.27" x2="0.635" y2="0" width="0.127" layer="94"/>
<wire x1="-7.62" y1="0" x2="-6.985" y2="0" width="0.127" layer="94"/>
<wire x1="-6.985" y1="0" x2="-5.715" y2="-1.27" width="0.127" layer="94"/>
<wire x1="-5.715" y1="-1.27" x2="0.635" y2="-1.27" width="0.127" layer="94"/>
<wire x1="3.175" y1="-1.27" x2="5.08" y2="-1.27" width="0.127" layer="94"/>
<wire x1="-1.905" y1="1.27" x2="-5.715" y2="1.27" width="0.127" layer="94"/>
<wire x1="-5.715" y1="1.27" x2="-6.985" y2="2.54" width="0.127" layer="94"/>
<wire x1="-6.985" y1="2.54" x2="-7.62" y2="2.54" width="0.127" layer="94"/>
<wire x1="5.08" y1="-1.27" x2="6.35" y2="-2.54" width="0.127" layer="94"/>
<wire x1="6.35" y1="-2.54" x2="7.62" y2="-2.54" width="0.127" layer="94"/>
</symbol>
<symbol name="EMI_2CH">
<pin name="D1" x="-10.16" y="2.54" length="short"/>
<pin name="GND@1" x="-10.16" y="0" length="short"/>
<pin name="O1" x="-10.16" y="-2.54" length="short"/>
<pin name="O2" x="10.16" y="-2.54" length="short" rot="R180"/>
<pin name="GND@2" x="10.16" y="0" length="short" rot="R180"/>
<pin name="D2" x="10.16" y="2.54" length="short" rot="R180"/>
<wire x1="-7.62" y1="5.08" x2="-7.62" y2="-5.08" width="0.254" layer="94"/>
<wire x1="-7.62" y1="-5.08" x2="7.62" y2="-5.08" width="0.254" layer="94"/>
<wire x1="7.62" y1="-5.08" x2="7.62" y2="5.08" width="0.254" layer="94"/>
<wire x1="7.62" y1="5.08" x2="-7.62" y2="5.08" width="0.254" layer="94"/>
<text x="-7.112" y="5.588" size="1.778" layer="95" font="vector">&gt;NAME</text>
</symbol>
<symbol name="FET_N_1D-1S">
<wire x1="-3.6576" y1="2.413" x2="-3.6576" y2="-2.54" width="0.254" layer="94"/>
<wire x1="-3.6576" y1="-2.54" x2="-5.08" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="0" y1="2.54" x2="0" y2="1.905" width="0.1524" layer="94"/>
<wire x1="0" y1="0" x2="0" y2="-1.905" width="0.1524" layer="94"/>
<wire x1="-2.032" y1="-1.905" x2="0" y2="-1.905" width="0.1524" layer="94"/>
<wire x1="0" y1="-1.905" x2="0" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="-0.889" y1="0" x2="0" y2="0" width="0.1524" layer="94"/>
<wire x1="0.762" y1="0.508" x2="1.27" y2="0.508" width="0.1524" layer="94"/>
<wire x1="1.27" y1="0.508" x2="1.778" y2="0.508" width="0.1524" layer="94"/>
<wire x1="1.27" y1="1.905" x2="0" y2="1.905" width="0.1524" layer="94"/>
<wire x1="0" y1="1.905" x2="-2.0066" y2="1.905" width="0.1524" layer="94"/>
<wire x1="1.27" y1="0.508" x2="1.27" y2="1.905" width="0.1524" layer="94"/>
<wire x1="1.27" y1="-1.905" x2="1.27" y2="-0.127" width="0.1524" layer="94"/>
<wire x1="1.27" y1="-1.905" x2="0" y2="-1.905" width="0.1524" layer="94"/>
<circle x="0" y="-1.905" radius="0.127" width="0.4064" layer="94"/>
<text x="4.699" y="-3.81" size="1.778" layer="95" rot="R90">&gt;NAME</text>
<rectangle x1="-2.794" y1="-2.54" x2="-2.032" y2="-1.27" layer="94"/>
<rectangle x1="-2.794" y1="1.27" x2="-2.032" y2="2.54" layer="94"/>
<rectangle x1="-2.794" y1="-0.889" x2="-2.032" y2="0.889" layer="94"/>
<pin name="G" x="-5.08" y="-2.54" visible="off" length="point" direction="pas"/>
<pin name="D@0" x="0" y="5.08" visible="off" length="short" direction="pas" rot="R270"/>
<pin name="S@0" x="0" y="-5.08" visible="off" length="short" direction="pas" rot="R90"/>
<polygon width="0.1524" layer="94">
<vertex x="-2.032" y="0"/>
<vertex x="-0.762" y="-0.508"/>
<vertex x="-0.762" y="0.508"/>
</polygon>
<polygon width="0.1524" layer="94">
<vertex x="1.27" y="0.508"/>
<vertex x="0.762" y="-0.254"/>
<vertex x="1.778" y="-0.254"/>
</polygon>
</symbol>
<symbol name="TVS">
<wire x1="-2.54" y1="0" x2="2.54" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="1.27" x2="0" y2="-1.27" width="0.254" layer="94"/>
<wire x1="0" y1="-1.27" x2="-0.635" y2="-1.905" width="0.254" layer="94"/>
<wire x1="0" y1="1.27" x2="0.635" y2="1.905" width="0.254" layer="94"/>
<text x="0" y="2.032" size="1.778" layer="95" font="vector" align="bottom-center">&gt;NAME</text>
<pin name="P$1" x="-2.54" y="0" visible="off" length="point" direction="pas" swaplevel="1"/>
<pin name="P$2" x="2.54" y="0" visible="off" length="point" direction="pas" swaplevel="1" rot="R180"/>
<polygon width="0.254" layer="94">
<vertex x="0" y="0"/>
<vertex x="1.5875" y="0.9525"/>
<vertex x="1.5875" y="-0.9525"/>
</polygon>
<polygon width="0.254" layer="94">
<vertex x="0" y="0"/>
<vertex x="-1.5875" y="0.9525"/>
<vertex x="-1.5875" y="-0.9525"/>
</polygon>
<text x="0" y="-2.032" size="1.778" layer="95" font="vector" align="top-center">&gt;VALUE</text>
</symbol>
<symbol name="VREG_REG710XX">
<pin name="VOUT" x="-10.16" y="5.08" visible="pin" length="short"/>
<pin name="GND" x="-10.16" y="0" visible="pin" length="short"/>
<pin name="EN" x="-10.16" y="-5.08" visible="pin" length="short"/>
<pin name="CP-" x="10.16" y="-5.08" visible="pin" length="short" rot="R180"/>
<pin name="VIN" x="10.16" y="0" visible="pin" length="short" rot="R180"/>
<pin name="CP+" x="10.16" y="5.08" visible="pin" length="short" rot="R180"/>
<wire x1="-7.62" y1="7.62" x2="-7.62" y2="-7.62" width="0.254" layer="94"/>
<wire x1="-7.62" y1="-7.62" x2="7.62" y2="-7.62" width="0.254" layer="94"/>
<wire x1="7.62" y1="-7.62" x2="7.62" y2="7.62" width="0.254" layer="94"/>
<wire x1="7.62" y1="7.62" x2="-7.62" y2="7.62" width="0.254" layer="94"/>
<text x="-7.112" y="8.001" size="1.778" layer="95">&gt;NAME</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="CAPACITOR" prefix="C" uservalue="yes">
<gates>
<gate name="G$1" symbol="CAPACITOR" x="0" y="0"/>
</gates>
<devices>
<device name="-0402" package="0402_YAGEO">
<connects>
<connect gate="G$1" pin="P$1" pad="1"/>
<connect gate="G$1" pin="P$2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-0603" package="0603_YAGEO">
<connects>
<connect gate="G$1" pin="P$1" pad="1"/>
<connect gate="G$1" pin="P$2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-0805" package="0805_YAGEO">
<connects>
<connect gate="G$1" pin="P$1" pad="1"/>
<connect gate="G$1" pin="P$2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-1206" package="1206_YAGEO">
<connects>
<connect gate="G$1" pin="P$1" pad="1"/>
<connect gate="G$1" pin="P$2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-1210" package="1210_YAGEO">
<connects>
<connect gate="G$1" pin="P$1" pad="1"/>
<connect gate="G$1" pin="P$2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-1218" package="1218_YAGEO">
<connects>
<connect gate="G$1" pin="P$1" pad="1"/>
<connect gate="G$1" pin="P$2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-2010" package="2010_YAGEO">
<connects>
<connect gate="G$1" pin="P$1" pad="1"/>
<connect gate="G$1" pin="P$2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-2512" package="2512_YAGEO">
<connects>
<connect gate="G$1" pin="P$1" pad="1"/>
<connect gate="G$1" pin="P$2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-0201" package="0201_YAGEO">
<connects>
<connect gate="G$1" pin="P$1" pad="1"/>
<connect gate="G$1" pin="P$2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="VREG_78XX" prefix="VREG" uservalue="yes">
<description>&lt;b&gt;3-pin LDO Voltage Regulators&lt;/b&gt;

&lt;p&gt;
		&lt;b&gt;SOT-23-3&lt;/b&gt;
&lt;p&gt;
IOG: 
&lt;i&gt;Diodes, Inc.&lt;/i&gt; - AP7313, AP7333; 
&lt;i&gt;Richtek&lt;/i&gt; - RT9058; 

&lt;p&gt;
GOI: 
&lt;i&gt;Diodes, Inc.&lt;/i&gt; - AP2210, AP7313-R, AP7333-R;  
&lt;i&gt;Microchip&lt;/i&gt; - MCP1700, MCP1702, MCP1745S; 
&lt;i&gt;Richtek&lt;/i&gt; - RT9169L, RT9058L; 

&lt;p&gt;
GIO: 
&lt;i&gt;Diodes, Inc.&lt;/i&gt; - AP1117; 

&lt;p&gt;
OGI: 
&lt;i&gt;Richtek&lt;/i&gt; - RT9169; 

&lt;p&gt;
OIG: 
&lt;i&gt;Diodes, Inc.&lt;/i&gt; - ZMRxxx; 
&lt;i&gt;TI&lt;/i&gt; - LM3480; 


&lt;p&gt;
		&lt;b&gt;SOT-223&lt;/b&gt;
&lt;p&gt;
IGO: 
&lt;i&gt;Diodes, Inc.&lt;/i&gt; - AZ1117-H2; AP2114-HA;
&lt;i&gt;Microchip&lt;/i&gt; - MCP1745S, MCP1826; 

&lt;p&gt;
GOI: 
&lt;i&gt;Diodes, Inc.&lt;/i&gt; - AZ1117-H; AP2114-H; 
&lt;i&gt;ST&lt;/i&gt; - LD1117; 





&lt;p&gt;
		&lt;b&gt;SOT-89-3&lt;/b&gt;
&lt;p&gt;
IGO: 
&lt;i&gt;Diodes, Inc.&lt;/i&gt; - AP2204-R; 
&lt;i&gt;Microchip&lt;/i&gt; - MCP1745S; 

&lt;p&gt;
IOG: 
&lt;i&gt;Richtek&lt;/i&gt; - RT9058; 

&lt;p&gt;
GIO: 
&lt;i&gt;Diodes, Inc.&lt;/i&gt; - AP1117, AZ1117-R2, AP2204-RA, ZXTR2012Z; 
&lt;i&gt;Microchip&lt;/i&gt; - MCP1700, MCP1702; 
&lt;i&gt;Ricktek&lt;/i&gt; - RT9169; 

&lt;p&gt;
GOI: 
&lt;i&gt;Diodes, Inc.&lt;/i&gt; - AZ1117-R; 

&lt;p&gt;
OGI: 
&lt;i&gt;Fairchild&lt;/i&gt; - MC78LxxA; 
&lt;i&gt;TI&lt;/i&gt; - uA78L00; 
&lt;i&gt;ST&lt;/i&gt; - L78L;


&lt;p&gt;
		&lt;b&gt;POWER-DI5&lt;/b&gt;
&lt;p&gt;
GOI: 
&lt;i&gt;Diodes, Inc.&lt;/i&gt; - ZXTR2012P5;

&lt;p&gt;
		&lt;b&gt;TO-252-3&lt;/b&gt;
&lt;p&gt;
GOI: 
&lt;i&gt;Diodes, Inc.&lt;/i&gt; - AZ1117, AP1117; 
&lt;i&gt;ST&lt;/i&gt; - LD1117; 

&lt;p&gt;
&lt;p&gt;
&lt;p&gt;




&lt;p&gt;
		&lt;b&gt;TO-263-3&lt;/b&gt;
&lt;p&gt;
GOI: 
&lt;i&gt;Diodes, Inc.&lt;/i&gt; - AP1117; 

&lt;p&gt;
&lt;p&gt;
&lt;p&gt;</description>
<gates>
<gate name="G$1" symbol="VREG_3-PIN" x="0" y="0"/>
</gates>
<devices>
<device name="-V78XX-SFSR" package="VREG-V78XX-SFSR">
<connects>
<connect gate="G$1" pin="GND" pad="GND"/>
<connect gate="G$1" pin="VIN" pad="VIN"/>
<connect gate="G$1" pin="VOUT" pad="VOUT"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-SOT-89-3-OGI" package="SOT-89-ROUND">
<connects>
<connect gate="G$1" pin="GND" pad="2@1 2@2"/>
<connect gate="G$1" pin="VIN" pad="3"/>
<connect gate="G$1" pin="VOUT" pad="1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-SOT-23-3-IOG" package="SOT-23-3">
<connects>
<connect gate="G$1" pin="GND" pad="3D"/>
<connect gate="G$1" pin="VIN" pad="1G"/>
<connect gate="G$1" pin="VOUT" pad="2S"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-V78W-500" package="VREG-V78W-500">
<connects>
<connect gate="G$1" pin="GND" pad="GND"/>
<connect gate="G$1" pin="VIN" pad="VIN"/>
<connect gate="G$1" pin="VOUT" pad="VOUT"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-V78W-500R" package="VREG-V78W-500R">
<connects>
<connect gate="G$1" pin="GND" pad="GND"/>
<connect gate="G$1" pin="VIN" pad="VIN"/>
<connect gate="G$1" pin="VOUT" pad="VOUT"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-OKI-78SR-H" package="VREG-OKI-78SR-H">
<connects>
<connect gate="G$1" pin="GND" pad="2"/>
<connect gate="G$1" pin="VIN" pad="1"/>
<connect gate="G$1" pin="VOUT" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-POWER-DI5-GOI" package="POWER-DI5">
<connects>
<connect gate="G$1" pin="GND" pad="LEFT"/>
<connect gate="G$1" pin="VIN" pad="PAD"/>
<connect gate="G$1" pin="VOUT" pad="RIGHT"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-SOT-89-3-GIO" package="SOT-89-ROUND">
<connects>
<connect gate="G$1" pin="GND" pad="1"/>
<connect gate="G$1" pin="VIN" pad="2@1 2@2"/>
<connect gate="G$1" pin="VOUT" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-LMZ1420X_BREAKOUT_REF" package="VREG-LMZ1420X_BREAKOUT_BOT">
<connects>
<connect gate="G$1" pin="GND" pad="3"/>
<connect gate="G$1" pin="VIN" pad="2"/>
<connect gate="G$1" pin="VOUT" pad="5"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-LMZ1420X_BREAKOUT" package="VREG-LMZ1420X_BREAKOUT_TOP">
<connects>
<connect gate="G$1" pin="GND" pad="3"/>
<connect gate="G$1" pin="VIN" pad="2"/>
<connect gate="G$1" pin="VOUT" pad="5"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-SOT-223-GOI" package="SOT-223">
<connects>
<connect gate="G$1" pin="GND" pad="1"/>
<connect gate="G$1" pin="VIN" pad="3"/>
<connect gate="G$1" pin="VOUT" pad="2 4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-SOT-223-IGO" package="SOT-223">
<connects>
<connect gate="G$1" pin="GND" pad="2 4"/>
<connect gate="G$1" pin="VIN" pad="1"/>
<connect gate="G$1" pin="VOUT" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-SOT-23-3-GOI" package="SOT-23-3">
<connects>
<connect gate="G$1" pin="GND" pad="1G"/>
<connect gate="G$1" pin="VIN" pad="3D"/>
<connect gate="G$1" pin="VOUT" pad="2S"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-SOT-23-3-OGI" package="SOT-23-3">
<connects>
<connect gate="G$1" pin="GND" pad="2S"/>
<connect gate="G$1" pin="VIN" pad="3D"/>
<connect gate="G$1" pin="VOUT" pad="1G"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-SOT-23-3-OIG" package="SOT-23-3">
<connects>
<connect gate="G$1" pin="GND" pad="3D"/>
<connect gate="G$1" pin="VIN" pad="2S"/>
<connect gate="G$1" pin="VOUT" pad="1G"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-SOT-89-3-GOI" package="SOT-89-ROUND">
<connects>
<connect gate="G$1" pin="GND" pad="1"/>
<connect gate="G$1" pin="VIN" pad="3"/>
<connect gate="G$1" pin="VOUT" pad="2@1 2@2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-SOT-89-3-IGO" package="SOT-89-ROUND">
<connects>
<connect gate="G$1" pin="GND" pad="2@1 2@2"/>
<connect gate="G$1" pin="VIN" pad="1"/>
<connect gate="G$1" pin="VOUT" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-SOT-23-3-GIO" package="SOT-23-3">
<connects>
<connect gate="G$1" pin="GND" pad="1G"/>
<connect gate="G$1" pin="VIN" pad="2S"/>
<connect gate="G$1" pin="VOUT" pad="3D"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-SOT-89-3-IOG" package="SOT-89-ROUND">
<connects>
<connect gate="G$1" pin="GND" pad="3"/>
<connect gate="G$1" pin="VIN" pad="1"/>
<connect gate="G$1" pin="VOUT" pad="2@1 2@2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-TO-252-3-GOI" package="TO-252-3-BARE">
<connects>
<connect gate="G$1" pin="GND" pad="1G"/>
<connect gate="G$1" pin="VIN" pad="3D"/>
<connect gate="G$1" pin="VOUT" pad="2S"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-TO-263-3-GOI" package="TO-263-3-BARE">
<connects>
<connect gate="G$1" pin="GND" pad="1G"/>
<connect gate="G$1" pin="VIN" pad="3D"/>
<connect gate="G$1" pin="VOUT" pad="2S"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="METRIC_SCREWS" prefix="S" uservalue="yes">
<gates>
<gate name="G$1" symbol="SCREW" x="0" y="0"/>
</gates>
<devices>
<device name="-M2_T" package="M2_SCREW_TENTED">
<connects>
<connect gate="G$1" pin="P$1" pad="P$1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-M2_U" package="M2_SCREW_UNTENTED">
<connects>
<connect gate="G$1" pin="P$1" pad="P$1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-M8_U" package="M8_SCREW_UNTENTED">
<connects>
<connect gate="G$1" pin="P$1" pad="P$1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-M4_U" package="M4_SCREW_UNTENTED">
<connects>
<connect gate="G$1" pin="P$1" pad="P$1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-M8_UH" package="M8_SCREW_HALF">
<connects>
<connect gate="G$1" pin="P$1" pad="P$1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-M2.5_T" package="M2.5_SCREW_TENTED">
<connects>
<connect gate="G$1" pin="P$1" pad="P$1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-M2.5_U" package="M2.5_SCREW_UNTENTED">
<connects>
<connect gate="G$1" pin="P$1" pad="P$1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-M3_T" package="M3_SCREW_TENTED">
<connects>
<connect gate="G$1" pin="P$1" pad="P$1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-M3_U" package="M3_SCREW_UNTENTED">
<connects>
<connect gate="G$1" pin="P$1" pad="P$1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-M2_N" package="M2_NUT">
<connects>
<connect gate="G$1" pin="P$1" pad="P$1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-M5_U" package="M5_SCREW_UNTENTED">
<connects>
<connect gate="G$1" pin="P$1" pad="P$1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-M6_U" package="M6_SCREW_UNTENTED">
<connects>
<connect gate="G$1" pin="P$1" pad="P$1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-M4_U-ONESIDE" package="4MM_PIN">
<connects>
<connect gate="G$1" pin="P$1" pad="1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-SOLARSPEC" package="MOLEX_SOLARSPEC">
<connects>
<connect gate="G$1" pin="P$1" pad="1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="SWITCH_SPST" prefix="SW">
<gates>
<gate name="G$1" symbol="SWITCH_SPST_2" x="0" y="0"/>
</gates>
<devices>
<device name="-PTS-525" package="SWITCH_PTS-525">
<connects>
<connect gate="G$1" pin="1" pad="1@2 2@2"/>
<connect gate="G$1" pin="2" pad="1@1 2@1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-KMT0" package="SWITCH_KMT0">
<connects>
<connect gate="G$1" pin="1" pad="1@1 1@2"/>
<connect gate="G$1" pin="2" pad="2@1 2@2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-TL3315" package="SWITCH_TL3315">
<connects>
<connect gate="G$1" pin="1" pad="1@1 1@2"/>
<connect gate="G$1" pin="2" pad="2@1 2@2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-6MMX6MM-PTH" package="SWITCH_TE_1825910-7">
<connects>
<connect gate="G$1" pin="1" pad="1@1 1@2"/>
<connect gate="G$1" pin="2" pad="2@1 2@2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-FSMRA" package="SWITCH_TE_1825027-5">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="RESISTOR" prefix="R" uservalue="yes">
<gates>
<gate name="G$1" symbol="RESISTOR" x="0" y="0"/>
</gates>
<devices>
<device name="-0402" package="0402_YAGEO">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-0603" package="0603_YAGEO">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-0805" package="0805_YAGEO">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-1206" package="1206_YAGEO">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-1218" package="1218_YAGEO">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-1210" package="1210_YAGEO">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-2010" package="2010_YAGEO">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-2512" package="2512_YAGEO">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-2512_SUSUMU_POWER" package="2512_SUSUMU_POWER">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-0201" package="0201_YAGEO">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-DPAK-BARE-ISOPAD" package="TO-252-3-BARE">
<connects>
<connect gate="G$1" pin="1" pad="1G"/>
<connect gate="G$1" pin="2" pad="2S"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-OARS_XP_KELVIN" package="OARS_XP_KELVIN">
<connects>
<connect gate="G$1" pin="1" pad="P1@1 P1@2 P1@3"/>
<connect gate="G$1" pin="2" pad="P2@1 P2@2 P2@3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-1225" package="1225_VISHAY">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-TO-126" package="TO-126-2">
<connects>
<connect gate="G$1" pin="1" pad="A@1"/>
<connect gate="G$1" pin="2" pad="K@1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="LED" prefix="LED" uservalue="yes">
<description>&lt;b&gt;LEDs&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="LED" x="0" y="0"/>
</gates>
<devices>
<device name="-8MM" package="8MM_LED_PTH">
<connects>
<connect gate="G$1" pin="A" pad="P$2"/>
<connect gate="G$1" pin="C" pad="P$1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-RM" package="P4XX-RM">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-0402" package="0402_LED">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-XM-L" package="XLAMP_XM-L">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-ZBEND_RM" package="Z-BEND_RM">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="K"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-8MM_ALT" package="8MM_LED_PTH_A">
<connects>
<connect gate="G$1" pin="A" pad="P$2"/>
<connect gate="G$1" pin="C" pad="P$1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-1206-RM" package="1206_LITE-ON_RM">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="K"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-XM-L_ALT" package="XLAMP_XM-L_ALT_OUTLINE">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-7.62MM-PTH" package="7.6MM_LED_PTH">
<connects>
<connect gate="G$1" pin="A" pad="3 4"/>
<connect gate="G$1" pin="C" pad="1 2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-MK-R" package="XLAMP_MK-R">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-IFE91" package="OPTO_IFE91">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="K"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-1206" package="1206_YAGEO">
<connects>
<connect gate="G$1" pin="A" pad="1"/>
<connect gate="G$1" pin="C" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-0805" package="0805_YAGEO">
<connects>
<connect gate="G$1" pin="A" pad="1"/>
<connect gate="G$1" pin="C" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="DXL_TTL" prefix="DXL">
<gates>
<gate name="G$1" symbol="DXL_TTL" x="0" y="0"/>
</gates>
<devices>
<device name="-V" package="MOLEX_5267-3">
<connects>
<connect gate="G$1" pin="GND" pad="3"/>
<connect gate="G$1" pin="TTL" pad="1"/>
<connect gate="G$1" pin="VDD" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-SMD" package="SMD_PIN_3">
<connects>
<connect gate="G$1" pin="GND" pad="GND"/>
<connect gate="G$1" pin="TTL" pad="DATA"/>
<connect gate="G$1" pin="VDD" pad="VDD"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-RA" package="MOLEX_5268-3">
<connects>
<connect gate="G$1" pin="GND" pad="3"/>
<connect gate="G$1" pin="TTL" pad="1"/>
<connect gate="G$1" pin="VDD" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-XL-V" package="MOLEX_53253-3">
<connects>
<connect gate="G$1" pin="GND" pad="1"/>
<connect gate="G$1" pin="TTL" pad="3"/>
<connect gate="G$1" pin="VDD" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-XL-RA" package="MOLEX_53254-3">
<connects>
<connect gate="G$1" pin="GND" pad="1"/>
<connect gate="G$1" pin="TTL" pad="3"/>
<connect gate="G$1" pin="VDD" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="DIODE_RECTIFIER" prefix="D" uservalue="yes">
<gates>
<gate name="G$1" symbol="DIODE_RECTIFIER" x="0" y="0"/>
</gates>
<devices>
<device name="-DO-214AC" package="DO-214AC(SMA)">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-POWER-DI123" package="POWER-DI123">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="K"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-DO-216AA" package="DO-216AA">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="K"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-0603" package="0603_YAGEO">
<connects>
<connect gate="G$1" pin="A" pad="1"/>
<connect gate="G$1" pin="C" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-DO-213AB" package="DO-214AB(SMC)">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="K"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-POWER-DI5" package="POWER-DI5">
<connects>
<connect gate="G$1" pin="A" pad="LEFT RIGHT"/>
<connect gate="G$1" pin="C" pad="PAD"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-TO-227A" package="TO-227A">
<connects>
<connect gate="G$1" pin="A" pad="1 2"/>
<connect gate="G$1" pin="C" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-TO-252-3-BIGBARE" package="TO-252-3-BIGBARE">
<connects>
<connect gate="G$1" pin="A" pad="2S"/>
<connect gate="G$1" pin="C" pad="3D"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-TO-263/252-3-BARE" package="TO-263/252-3-BARE">
<connects>
<connect gate="G$1" pin="A" pad="2S"/>
<connect gate="G$1" pin="C" pad="3D"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-TO-220-2FP" package="TO-220-2FP">
<connects>
<connect gate="G$1" pin="A" pad="A@1"/>
<connect gate="G$1" pin="C" pad="K@1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-DO-214AA" package="DO-214AA">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="K"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-IFD91" package="OPTO_IFD91">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="K"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-1206" package="1206_YAGEO">
<connects>
<connect gate="G$1" pin="A" pad="1"/>
<connect gate="G$1" pin="C" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-Z-BEND_RM" package="Z-BEND_RM">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="K"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="IKON" prefix="IKON">
<gates>
<gate name="G$1" symbol="IKON" x="0" y="0"/>
</gates>
<devices>
<device name="SMILEY" package="IKON_SMILEY">
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="MAHAL-TENGWAR" package="IKON_MAHAL-TENGWAR">
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="AULE-TENGWAR" package="IKON_AULE-TENGWAR">
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="LEARNING-10MIL" package="IKON_LEARNING_10MIL">
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="LEARNING-20MIL" package="IKON_LEARNING_20MIL">
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="TSU_N" package="IKON_TSU_SMILE_NEGATIVE">
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="TSU" package="IKON_TSU_SMILE">
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="LSM330" package="LSM330-AXES">
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-VERSACOMA-10" package="IKON_VERSACOMA_10MM">
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-VERSACOMA-5" package="IKON_VERSACOMA_5MM">
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-VERSACOMA-2.5" package="IKON_VERSACOMA_2.5MM">
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-VERSACOMA-2.5-MASK" package="IKON_VERSACOMA_2.5MM-MASK">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="ESP8266-02" prefix="ESP8266-">
<gates>
<gate name="G$1" symbol="ESP8266-02" x="0" y="0"/>
</gates>
<devices>
<device name="" package="ESP8266-02">
<connects>
<connect gate="G$1" pin="GND" pad="GND"/>
<connect gate="G$1" pin="GPIO0" pad="GPIO0"/>
<connect gate="G$1" pin="GPIO15" pad="GPIO15"/>
<connect gate="G$1" pin="GPIO2" pad="GPIO2"/>
<connect gate="G$1" pin="RST" pad="RESET"/>
<connect gate="G$1" pin="RXD" pad="RXD"/>
<connect gate="G$1" pin="TXD" pad="TXD"/>
<connect gate="G$1" pin="VCC" pad="VCC"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="HEADER_6P" prefix="H">
<gates>
<gate name="G$1" symbol="HEADER_1X6" x="0" y="0"/>
</gates>
<devices>
<device name="-1.5MM" package="HEADER-1.5MM_1X6-TH">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-0.1&quot;" package="HEADER-0.1&quot;_1X6">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-0.05&quot;-0.6MM" package="HEADER-0.05&quot;_1X6-PTH-0.6MM">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-2MM-TH" package="HEADER-2MM_1X6-TH">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-2MM-SMD" package="HEADER-2MM_1X6-SMD">
<connects>
<connect gate="G$1" pin="1" pad="1@1 1@2"/>
<connect gate="G$1" pin="2" pad="2@1 2@2"/>
<connect gate="G$1" pin="3" pad="3@1 3@2"/>
<connect gate="G$1" pin="4" pad="4@1 4@2"/>
<connect gate="G$1" pin="5" pad="5@1 5@2"/>
<connect gate="G$1" pin="6" pad="6@1 6@2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-0.1&quot;_2X3-SMD-SULLINS" package="HEADER-0.1&quot;_2X3-SMD-SULLINS">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-BOURNS_70AAJ-6-F1" package="BOURNS_70AAJ-6-F1">
<connects>
<connect gate="G$1" pin="1" pad="1@1 1@2"/>
<connect gate="G$1" pin="2" pad="2@1 2@2"/>
<connect gate="G$1" pin="3" pad="3@1 3@2"/>
<connect gate="G$1" pin="4" pad="4@1 4@2"/>
<connect gate="G$1" pin="5" pad="5@1 5@2"/>
<connect gate="G$1" pin="6" pad="6@1 6@2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-BOURNS_70AAJ-6-M0" package="BOURNS_70AAJ-6-M0">
<connects>
<connect gate="G$1" pin="1" pad="1@1 1@2"/>
<connect gate="G$1" pin="2" pad="2@1 2@2"/>
<connect gate="G$1" pin="3" pad="3@1 3@2"/>
<connect gate="G$1" pin="4" pad="4@1 4@2"/>
<connect gate="G$1" pin="5" pad="5@1 5@2"/>
<connect gate="G$1" pin="6" pad="6@1 6@2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="HEADER_8P" prefix="H">
<gates>
<gate name="G$1" symbol="HEADER_1X8" x="0" y="0"/>
</gates>
<devices>
<device name="-0.1&quot;_2X4-SMD-SULLINS" package="HEADER-0.1&quot;_2X4-SMD-SULLINS">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
<connect gate="G$1" pin="7" pad="7"/>
<connect gate="G$1" pin="8" pad="8"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-0.1&quot;-2X4-TH" package="HEADER-0.1&quot;_2X4-TH-1.0MM">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
<connect gate="G$1" pin="7" pad="7"/>
<connect gate="G$1" pin="8" pad="8"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="LOGIC_74_1G126" prefix="IC">
<gates>
<gate name="G$1" symbol="LOGIC_74_1G126" x="0" y="0"/>
</gates>
<devices>
<device name="-DCK" package="DCK(R-PDSO-G5)_SC70">
<connects>
<connect gate="G$1" pin="A" pad="2"/>
<connect gate="G$1" pin="GND" pad="3"/>
<connect gate="G$1" pin="OE" pad="1"/>
<connect gate="G$1" pin="VCC" pad="5"/>
<connect gate="G$1" pin="Y" pad="4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="LOGIC_74_1G125" prefix="IC">
<gates>
<gate name="G$1" symbol="LOGIC_74_1G125" x="0" y="0"/>
</gates>
<devices>
<device name="-DCK" package="DCK(R-PDSO-G5)_SC70">
<connects>
<connect gate="G$1" pin="!OE!" pad="1"/>
<connect gate="G$1" pin="A" pad="2"/>
<connect gate="G$1" pin="GND" pad="3"/>
<connect gate="G$1" pin="VCC" pad="5"/>
<connect gate="G$1" pin="Y" pad="4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="EMI_2CH" prefix="EMI">
<description>2CH EMI/ESD Filter
&lt;p&gt;
NUF2230XV6
(D1-O1)(D2-O2)</description>
<gates>
<gate name="G$1" symbol="EMI_2CH" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SOT-563">
<connects>
<connect gate="G$1" pin="D1" pad="1"/>
<connect gate="G$1" pin="D2" pad="6"/>
<connect gate="G$1" pin="GND@1" pad="2"/>
<connect gate="G$1" pin="GND@2" pad="5"/>
<connect gate="G$1" pin="O1" pad="3"/>
<connect gate="G$1" pin="O2" pad="4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="FET_N-CH" prefix="NF">
<gates>
<gate name="G$1" symbol="FET_N_1D-1S" x="0" y="0"/>
</gates>
<devices>
<device name="-SOT-23-3-LITTLEFOOT" package="SOT-23-3-LITTLEFOOT">
<connects>
<connect gate="G$1" pin="D@0" pad="D@0"/>
<connect gate="G$1" pin="G" pad="G"/>
<connect gate="G$1" pin="S@0" pad="S@0"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-SOT-23-3" package="SOT-23-3">
<connects>
<connect gate="G$1" pin="D@0" pad="3D"/>
<connect gate="G$1" pin="G" pad="1G"/>
<connect gate="G$1" pin="S@0" pad="2S"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-TO-252-3" package="TO-252-3">
<connects>
<connect gate="G$1" pin="D@0" pad="3D"/>
<connect gate="G$1" pin="G" pad="1G"/>
<connect gate="G$1" pin="S@0" pad="2S"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-TO-263-3" package="TO-263-3">
<connects>
<connect gate="G$1" pin="D@0" pad="3D"/>
<connect gate="G$1" pin="G" pad="1G"/>
<connect gate="G$1" pin="S@0" pad="2S"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-TO-252-3-BIGBARE" package="TO-252-3-BIGBARE">
<connects>
<connect gate="G$1" pin="D@0" pad="3D"/>
<connect gate="G$1" pin="G" pad="1G"/>
<connect gate="G$1" pin="S@0" pad="2S"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-TO-263-3-BIGBARE" package="TO-263-3-BIGBARE">
<connects>
<connect gate="G$1" pin="D@0" pad="3D"/>
<connect gate="G$1" pin="G" pad="1G"/>
<connect gate="G$1" pin="S@0" pad="2S"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-DIRECTFET_L8" package="DIRECTFET_L8">
<connects>
<connect gate="G$1" pin="D@0" pad="DL@1 DL@2 DL@3 DR@1 DR@2 DR@3"/>
<connect gate="G$1" pin="G" pad="G"/>
<connect gate="G$1" pin="S@0" pad="SL@1 SL@2 SL@3 SL@4 SR@1 SR@2 SR@3 SR@4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-TO-263-7" package="TO-263-7">
<connects>
<connect gate="G$1" pin="D@0" pad="D"/>
<connect gate="G$1" pin="G" pad="G"/>
<connect gate="G$1" pin="S@0" pad="S@0 S@1 S@2 S@3 S@4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-TO-263-3-BARE" package="TO-263-3-BARE">
<connects>
<connect gate="G$1" pin="D@0" pad="3D"/>
<connect gate="G$1" pin="G" pad="1G"/>
<connect gate="G$1" pin="S@0" pad="2S"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-TO-252-3-BARE" package="TO-252-3-BARE">
<connects>
<connect gate="G$1" pin="D@0" pad="3D"/>
<connect gate="G$1" pin="G" pad="1G"/>
<connect gate="G$1" pin="S@0" pad="2S"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-TO-252AA-3-BIGBARE" package="TO-252AA-3-BIGBARE">
<connects>
<connect gate="G$1" pin="D@0" pad="3D"/>
<connect gate="G$1" pin="G" pad="1G"/>
<connect gate="G$1" pin="S@0" pad="2S"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-TO-263/252-3-BARE" package="TO-263/252-3-BARE">
<connects>
<connect gate="G$1" pin="D@0" pad="3D"/>
<connect gate="G$1" pin="G" pad="1G"/>
<connect gate="G$1" pin="S@0" pad="2S"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-TO-263-7-BARE" package="TO-263-7-BARE">
<connects>
<connect gate="G$1" pin="D@0" pad="D"/>
<connect gate="G$1" pin="G" pad="G"/>
<connect gate="G$1" pin="S@0" pad="S@0 S@1 S@2 S@3 S@4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="TVS" prefix="TVS" uservalue="yes">
<gates>
<gate name="G$1" symbol="TVS" x="0" y="0"/>
</gates>
<devices>
<device name="-0402_PGB2" package="0402_PGB2">
<connects>
<connect gate="G$1" pin="P$1" pad="1"/>
<connect gate="G$1" pin="P$2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-0402" package="0402_YAGEO">
<connects>
<connect gate="G$1" pin="P$1" pad="1"/>
<connect gate="G$1" pin="P$2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-0603" package="0603_YAGEO">
<connects>
<connect gate="G$1" pin="P$1" pad="1"/>
<connect gate="G$1" pin="P$2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="VREG_REG710XX" prefix="VREG">
<gates>
<gate name="G$1" symbol="VREG_REG710XX" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SOT-23-6">
<connects>
<connect gate="G$1" pin="CP+" pad="6"/>
<connect gate="G$1" pin="CP-" pad="4"/>
<connect gate="G$1" pin="EN" pad="3"/>
<connect gate="G$1" pin="GND" pad="2"/>
<connect gate="G$1" pin="VIN" pad="5"/>
<connect gate="G$1" pin="VOUT" pad="1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="C1" library="NaN" deviceset="CAPACITOR" device="-0805" value="10uF"/>
<part name="S1" library="NaN" deviceset="METRIC_SCREWS" device="-M2.5_T"/>
<part name="S2" library="NaN" deviceset="METRIC_SCREWS" device="-M2.5_T"/>
<part name="SW1" library="NaN" deviceset="SWITCH_SPST" device="-6MMX6MM-PTH" value="SWITCH_SPST-6MMX6MM-PTH"/>
<part name="LED1" library="NaN" deviceset="LED" device="-0402" value="red"/>
<part name="LED2" library="NaN" deviceset="LED" device="-0402" value="orng"/>
<part name="R3" library="NaN" deviceset="RESISTOR" device="-0402"/>
<part name="R4" library="NaN" deviceset="RESISTOR" device="-0402"/>
<part name="DXL1" library="NaN" deviceset="DXL_TTL" device="-V"/>
<part name="C5" library="NaN" deviceset="CAPACITOR" device="-0402" value="0.1uF"/>
<part name="R6" library="NaN" deviceset="RESISTOR" device="-0402" value="10k"/>
<part name="R5" library="NaN" deviceset="RESISTOR" device="-0402" value="10k"/>
<part name="VREG1" library="NaN" deviceset="VREG_78XX" device="-OKI-78SR-H"/>
<part name="D1" library="NaN" deviceset="DIODE_RECTIFIER" device="-POWER-DI123"/>
<part name="R2" library="NaN" deviceset="RESISTOR" device="-0402" value="330"/>
<part name="IKON1" library="NaN" deviceset="IKON" device="-VERSACOMA-5" value="IKON-VERSACOMA-5"/>
<part name="ESP8266-1" library="NaN" deviceset="ESP8266-02" device=""/>
<part name="R1" library="NaN" deviceset="RESISTOR" device="-0402" value="10k"/>
<part name="H3" library="NaN" deviceset="HEADER_6P" device="-0.1&quot;"/>
<part name="R7" library="NaN" deviceset="RESISTOR" device="-0402" value="10k"/>
<part name="C2" library="NaN" deviceset="CAPACITOR" device="-0402" value="0.1uF"/>
<part name="SW2" library="NaN" deviceset="SWITCH_SPST" device="-6MMX6MM-PTH" value="SWITCH_SPST-6MMX6MM-PTH"/>
<part name="R10" library="NaN" deviceset="RESISTOR" device="-0402" value="330"/>
<part name="H1" library="NaN" deviceset="HEADER_8P" device="-0.1&quot;_2X4-SMD-SULLINS"/>
<part name="IC1" library="NaN" deviceset="LOGIC_74_1G126" device="-DCK"/>
<part name="IC2" library="NaN" deviceset="LOGIC_74_1G125" device="-DCK"/>
<part name="EMI1" library="NaN" deviceset="EMI_2CH" device=""/>
<part name="LED3" library="NaN" deviceset="LED" device="-0402" value="yllw"/>
<part name="R11" library="NaN" deviceset="RESISTOR" device="-0402"/>
<part name="C3" library="NaN" deviceset="CAPACITOR" device="-0805" value="10uF"/>
<part name="C4" library="NaN" deviceset="CAPACITOR" device="-0402" value="0.1uF"/>
<part name="C6" library="NaN" deviceset="CAPACITOR" device="-0402" value="0.1uF"/>
<part name="NF1" library="NaN" deviceset="FET_N-CH" device="-SOT-23-3"/>
<part name="NF2" library="NaN" deviceset="FET_N-CH" device="-SOT-23-3"/>
<part name="C7" library="NaN" deviceset="CAPACITOR" device="-0402" value="0.1uF"/>
<part name="NF3" library="NaN" deviceset="FET_N-CH" device="-SOT-23-3"/>
<part name="C8" library="NaN" deviceset="CAPACITOR" device="-0402" value="0.1uF"/>
<part name="R8" library="NaN" deviceset="RESISTOR" device="-0402" value="10k"/>
<part name="R9" library="NaN" deviceset="RESISTOR" device="-0402" value="10k"/>
<part name="R12" library="NaN" deviceset="RESISTOR" device="-0402" value="10k"/>
<part name="R13" library="NaN" deviceset="RESISTOR" device="-0402" value="10k"/>
<part name="R14" library="NaN" deviceset="RESISTOR" device="-0402" value="10k"/>
<part name="C9" library="NaN" deviceset="CAPACITOR" device="-0805" value="10uF"/>
<part name="TVS1" library="NaN" deviceset="TVS" device="-0402"/>
<part name="TVS2" library="NaN" deviceset="TVS" device="-0603"/>
<part name="R15" library="NaN" deviceset="RESISTOR" device="-0402"/>
<part name="R16" library="NaN" deviceset="RESISTOR" device="-0402"/>
<part name="VREG2" library="NaN" deviceset="VREG_REG710XX" device=""/>
<part name="C10" library="NaN" deviceset="CAPACITOR" device="-0402" value="0.22uF"/>
<part name="C11" library="NaN" deviceset="CAPACITOR" device="-0402" value="2.2uF"/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="C1" gate="G$1" x="157.48" y="-30.48" rot="R90"/>
<instance part="S1" gate="G$1" x="-7.62" y="-22.86"/>
<instance part="S2" gate="G$1" x="-5.08" y="-22.86"/>
<instance part="SW1" gate="G$1" x="0" y="15.24"/>
<instance part="LED1" gate="G$1" x="190.5" y="27.94"/>
<instance part="LED2" gate="G$1" x="203.2" y="27.94"/>
<instance part="R3" gate="G$1" x="190.5" y="35.56" rot="R90"/>
<instance part="R4" gate="G$1" x="203.2" y="35.56" rot="R90"/>
<instance part="DXL1" gate="G$1" x="30.48" y="-71.12" rot="R180"/>
<instance part="C5" gate="G$1" x="106.68" y="-53.34" rot="R90"/>
<instance part="R6" gate="G$1" x="165.1" y="-5.08"/>
<instance part="R5" gate="G$1" x="157.48" y="-7.62"/>
<instance part="VREG1" gate="G$1" x="86.36" y="-25.4"/>
<instance part="D1" gate="G$1" x="48.26" y="-71.12"/>
<instance part="R2" gate="G$1" x="10.16" y="15.24"/>
<instance part="IKON1" gate="G$1" x="5.08" y="-25.4"/>
<instance part="ESP8266-1" gate="G$1" x="114.3" y="0"/>
<instance part="R1" gate="G$1" x="17.78" y="22.86" rot="R90"/>
<instance part="H3" gate="G$1" x="99.06" y="48.26"/>
<instance part="R7" gate="G$1" x="172.72" y="-2.54"/>
<instance part="C2" gate="G$1" x="33.02" y="15.24"/>
<instance part="SW2" gate="G$1" x="0" y="-7.62"/>
<instance part="R10" gate="G$1" x="10.16" y="-7.62"/>
<instance part="H1" gate="G$1" x="58.42" y="50.8"/>
<instance part="IC1" gate="G$1" x="-7.62" y="-55.88"/>
<instance part="IC2" gate="G$1" x="-7.62" y="-71.12" rot="MR0"/>
<instance part="EMI1" gate="G$1" x="45.72" y="-58.42"/>
<instance part="LED3" gate="G$1" x="215.9" y="27.94"/>
<instance part="R11" gate="G$1" x="215.9" y="35.56" rot="R90"/>
<instance part="C3" gate="G$1" x="121.92" y="-30.48" rot="R90"/>
<instance part="C4" gate="G$1" x="99.06" y="-53.34" rot="R90"/>
<instance part="C6" gate="G$1" x="114.3" y="-53.34" rot="R90"/>
<instance part="NF1" gate="G$1" x="93.98" y="20.32" rot="MR270"/>
<instance part="NF2" gate="G$1" x="93.98" y="30.48" rot="MR90"/>
<instance part="C7" gate="G$1" x="121.92" y="-53.34" rot="R90"/>
<instance part="NF3" gate="G$1" x="144.78" y="40.64" rot="MR270"/>
<instance part="C8" gate="G$1" x="129.54" y="-53.34" rot="R90"/>
<instance part="R8" gate="G$1" x="76.2" y="-2.54"/>
<instance part="R9" gate="G$1" x="83.82" y="-5.08"/>
<instance part="R12" gate="G$1" x="119.38" y="48.26"/>
<instance part="R13" gate="G$1" x="127" y="50.8"/>
<instance part="R14" gate="G$1" x="127" y="43.18"/>
<instance part="C9" gate="G$1" x="114.3" y="-30.48" rot="R90"/>
<instance part="TVS1" gate="G$1" x="25.4" y="-91.44" rot="R90"/>
<instance part="TVS2" gate="G$1" x="33.02" y="-91.44" rot="R90"/>
<instance part="R15" gate="G$1" x="20.32" y="-86.36"/>
<instance part="R16" gate="G$1" x="20.32" y="-81.28"/>
<instance part="VREG2" gate="G$1" x="185.42" y="-66.04"/>
<instance part="C10" gate="G$1" x="200.66" y="-66.04" rot="R90"/>
<instance part="C11" gate="G$1" x="160.02" y="-60.96" rot="R90"/>
</instances>
<busses>
</busses>
<nets>
<net name="3V3" class="0">
<segment>
<wire x1="149.86" y1="-25.4" x2="157.48" y2="-25.4" width="0.1524" layer="91"/>
<pinref part="C1" gate="G$1" pin="P$2"/>
<junction x="157.48" y="-25.4"/>
<wire x1="157.48" y1="-25.4" x2="162.56" y2="-25.4" width="0.1524" layer="91"/>
<label x="149.86" y="-25.4" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="C5" gate="G$1" pin="P$2"/>
<wire x1="106.68" y1="-48.26" x2="99.06" y2="-48.26" width="0.1524" layer="91"/>
<label x="91.44" y="-48.26" size="1.778" layer="95"/>
<pinref part="C4" gate="G$1" pin="P$2"/>
<wire x1="99.06" y1="-48.26" x2="93.98" y2="-48.26" width="0.1524" layer="91"/>
<junction x="99.06" y="-48.26"/>
<pinref part="C6" gate="G$1" pin="P$2"/>
<wire x1="106.68" y1="-48.26" x2="114.3" y2="-48.26" width="0.1524" layer="91"/>
<junction x="106.68" y="-48.26"/>
<junction x="114.3" y="-48.26"/>
<wire x1="114.3" y1="-48.26" x2="121.92" y2="-48.26" width="0.1524" layer="91"/>
<pinref part="C7" gate="G$1" pin="P$2"/>
<junction x="121.92" y="-48.26"/>
<wire x1="121.92" y1="-48.26" x2="129.54" y2="-48.26" width="0.1524" layer="91"/>
<pinref part="C8" gate="G$1" pin="P$2"/>
<wire x1="129.54" y1="-48.26" x2="137.16" y2="-48.26" width="0.1524" layer="91"/>
<junction x="129.54" y="-48.26"/>
</segment>
<segment>
<pinref part="ESP8266-1" gate="G$1" pin="VCC"/>
<wire x1="101.6" y1="-7.62" x2="93.98" y2="-7.62" width="0.1524" layer="91"/>
<label x="96.52" y="-7.62" size="1.778" layer="95" rot="MR0"/>
</segment>
<segment>
<pinref part="R1" gate="G$1" pin="2"/>
<wire x1="17.78" y1="27.94" x2="17.78" y2="30.48" width="0.1524" layer="91"/>
<label x="15.24" y="30.48" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="142.24" y1="25.4" x2="152.4" y2="25.4" width="0.1524" layer="91"/>
<label x="149.86" y="25.4" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="R6" gate="G$1" pin="2"/>
<wire x1="170.18" y1="-5.08" x2="182.88" y2="-5.08" width="0.1524" layer="91"/>
<label x="180.34" y="-5.08" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="R7" gate="G$1" pin="2"/>
<wire x1="177.8" y1="-2.54" x2="182.88" y2="-2.54" width="0.1524" layer="91"/>
<label x="180.34" y="-2.54" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="137.16" y1="25.4" x2="127" y2="25.4" width="0.1524" layer="91"/>
<label x="129.54" y="25.4" size="1.778" layer="95" rot="MR0"/>
</segment>
<segment>
<wire x1="-17.78" y1="-68.58" x2="-22.86" y2="-68.58" width="0.1524" layer="91"/>
<label x="-20.32" y="-68.58" size="1.778" layer="95" rot="MR0"/>
<pinref part="IC2" gate="G$1" pin="VCC"/>
</segment>
<segment>
<wire x1="198.12" y1="-25.4" x2="200.66" y2="-25.4" width="0.1524" layer="91"/>
<label x="198.12" y="-25.4" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="96.52" y1="25.4" x2="106.68" y2="25.4" width="0.1524" layer="91"/>
<label x="104.14" y="25.4" size="1.778" layer="95"/>
<pinref part="NF1" gate="G$1" pin="G"/>
</segment>
<segment>
<wire x1="91.44" y1="25.4" x2="81.28" y2="25.4" width="0.1524" layer="91"/>
<label x="83.82" y="25.4" size="1.778" layer="95" rot="MR0"/>
<pinref part="NF2" gate="G$1" pin="G"/>
</segment>
<segment>
<pinref part="R8" gate="G$1" pin="1"/>
<wire x1="71.12" y1="-2.54" x2="66.04" y2="-2.54" width="0.1524" layer="91"/>
<label x="68.58" y="-2.54" size="1.778" layer="95" rot="MR0"/>
</segment>
<segment>
<pinref part="R9" gate="G$1" pin="1"/>
<wire x1="78.74" y1="-5.08" x2="66.04" y2="-5.08" width="0.1524" layer="91"/>
<label x="68.58" y="-5.08" size="1.778" layer="95" rot="MR0"/>
</segment>
<segment>
<label x="66.04" y="45.72" size="1.778" layer="95"/>
<wire x1="35.56" y1="45.72" x2="58.42" y2="45.72" width="0.1524" layer="91"/>
<wire x1="58.42" y1="45.72" x2="63.5" y2="45.72" width="0.1524" layer="91"/>
<wire x1="63.5" y1="45.72" x2="68.58" y2="45.72" width="0.1524" layer="91"/>
<wire x1="35.56" y1="48.26" x2="58.42" y2="48.26" width="0.1524" layer="91"/>
<wire x1="58.42" y1="48.26" x2="63.5" y2="48.26" width="0.1524" layer="91"/>
<wire x1="63.5" y1="45.72" x2="63.5" y2="48.26" width="0.1524" layer="91"/>
<junction x="63.5" y="45.72"/>
<pinref part="H1" gate="G$1" pin="3"/>
<junction x="58.42" y="45.72"/>
<pinref part="H1" gate="G$1" pin="4"/>
<junction x="58.42" y="48.26"/>
</segment>
<segment>
<label x="96.52" y="-25.4" size="1.778" layer="95"/>
<wire x1="96.52" y1="-25.4" x2="101.6" y2="-25.4" width="0.1524" layer="91"/>
<pinref part="VREG1" gate="G$1" pin="VOUT"/>
</segment>
<segment>
<wire x1="129.54" y1="-25.4" x2="121.92" y2="-25.4" width="0.1524" layer="91"/>
<label x="129.54" y="-25.4" size="1.778" layer="95" rot="MR0"/>
<wire x1="121.92" y1="-25.4" x2="114.3" y2="-25.4" width="0.1524" layer="91"/>
<wire x1="114.3" y1="-25.4" x2="111.76" y2="-25.4" width="0.1524" layer="91"/>
<wire x1="137.16" y1="-33.02" x2="129.54" y2="-33.02" width="0.1524" layer="91"/>
<wire x1="129.54" y1="-33.02" x2="129.54" y2="-25.4" width="0.1524" layer="91"/>
<pinref part="C3" gate="G$1" pin="P$2"/>
<junction x="121.92" y="-25.4"/>
<pinref part="C9" gate="G$1" pin="P$2"/>
<junction x="114.3" y="-25.4"/>
</segment>
<segment>
<pinref part="R3" gate="G$1" pin="2"/>
<wire x1="190.5" y1="40.64" x2="190.5" y2="43.18" width="0.1524" layer="91"/>
<label x="187.96" y="43.18" size="1.778" layer="95"/>
<pinref part="R4" gate="G$1" pin="2"/>
<wire x1="203.2" y1="40.64" x2="203.2" y2="43.18" width="0.1524" layer="91"/>
<wire x1="203.2" y1="43.18" x2="190.5" y2="43.18" width="0.1524" layer="91"/>
<pinref part="R11" gate="G$1" pin="2"/>
<wire x1="215.9" y1="40.64" x2="215.9" y2="43.18" width="0.1524" layer="91"/>
<wire x1="215.9" y1="43.18" x2="203.2" y2="43.18" width="0.1524" layer="91"/>
<junction x="190.5" y="43.18"/>
<junction x="203.2" y="43.18"/>
<junction x="215.9" y="43.18"/>
</segment>
<segment>
<pinref part="H3" gate="G$1" pin="3"/>
<label x="104.14" y="45.72" size="1.778" layer="95"/>
<pinref part="R12" gate="G$1" pin="2"/>
<wire x1="124.46" y1="48.26" x2="132.08" y2="48.26" width="0.1524" layer="91"/>
<wire x1="132.08" y1="48.26" x2="132.08" y2="45.72" width="0.1524" layer="91"/>
<pinref part="R13" gate="G$1" pin="2"/>
<wire x1="132.08" y1="50.8" x2="132.08" y2="48.26" width="0.1524" layer="91"/>
<wire x1="132.08" y1="45.72" x2="99.06" y2="45.72" width="0.1524" layer="91"/>
<junction x="132.08" y="48.26"/>
<pinref part="R14" gate="G$1" pin="2"/>
<wire x1="132.08" y1="43.18" x2="132.08" y2="45.72" width="0.1524" layer="91"/>
<junction x="132.08" y="45.72"/>
</segment>
<segment>
<wire x1="172.72" y1="-25.4" x2="170.18" y2="-25.4" width="0.1524" layer="91"/>
<label x="172.72" y="-25.4" size="1.778" layer="95" rot="MR0"/>
<wire x1="177.8" y1="-33.02" x2="172.72" y2="-33.02" width="0.1524" layer="91"/>
<wire x1="172.72" y1="-33.02" x2="172.72" y2="-25.4" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="VREG2" gate="G$1" pin="VIN"/>
<wire x1="195.58" y1="-66.04" x2="208.28" y2="-66.04" width="0.1524" layer="91"/>
<label x="205.74" y="-66.04" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="VREG2" gate="G$1" pin="EN"/>
<wire x1="175.26" y1="-71.12" x2="170.18" y2="-71.12" width="0.1524" layer="91"/>
<label x="172.72" y="-71.12" size="1.778" layer="95" rot="MR0"/>
</segment>
</net>
<net name="GND" class="0">
<segment>
<pinref part="SW1" gate="G$1" pin="2"/>
<wire x1="-5.08" y1="15.24" x2="-7.62" y2="15.24" width="0.1524" layer="91"/>
<label x="-5.08" y="15.24" size="1.778" layer="95" rot="MR0"/>
</segment>
<segment>
<wire x1="142.24" y1="-33.02" x2="142.24" y2="-35.56" width="0.1524" layer="91"/>
<pinref part="C1" gate="G$1" pin="P$1"/>
<wire x1="142.24" y1="-35.56" x2="157.48" y2="-35.56" width="0.1524" layer="91"/>
<wire x1="142.24" y1="-35.56" x2="139.7" y2="-35.56" width="0.1524" layer="91"/>
<wire x1="139.7" y1="-35.56" x2="121.92" y2="-35.56" width="0.1524" layer="91"/>
<wire x1="121.92" y1="-35.56" x2="114.3" y2="-35.56" width="0.1524" layer="91"/>
<wire x1="114.3" y1="-35.56" x2="111.76" y2="-35.56" width="0.1524" layer="91"/>
<wire x1="157.48" y1="-35.56" x2="162.56" y2="-35.56" width="0.1524" layer="91"/>
<junction x="142.24" y="-35.56"/>
<junction x="157.48" y="-35.56"/>
<label x="137.16" y="-38.1" size="1.778" layer="95"/>
<pinref part="C3" gate="G$1" pin="P$1"/>
<junction x="121.92" y="-35.56"/>
<wire x1="139.7" y1="-35.56" x2="139.7" y2="-33.02" width="0.1524" layer="91"/>
<junction x="139.7" y="-35.56"/>
<pinref part="C9" gate="G$1" pin="P$1"/>
<junction x="114.3" y="-35.56"/>
</segment>
<segment>
<label x="53.34" y="-73.66" size="1.778" layer="95"/>
<pinref part="DXL1" gate="G$1" pin="GND"/>
<wire x1="55.88" y1="-73.66" x2="30.48" y2="-73.66" width="0.1524" layer="91"/>
</segment>
<segment>
<label x="129.54" y="-60.96" size="1.778" layer="95"/>
<wire x1="142.24" y1="-58.42" x2="129.54" y2="-58.42" width="0.1524" layer="91"/>
<pinref part="C5" gate="G$1" pin="P$1"/>
<wire x1="129.54" y1="-58.42" x2="121.92" y2="-58.42" width="0.1524" layer="91"/>
<wire x1="121.92" y1="-58.42" x2="114.3" y2="-58.42" width="0.1524" layer="91"/>
<wire x1="114.3" y1="-58.42" x2="106.68" y2="-58.42" width="0.1524" layer="91"/>
<wire x1="106.68" y1="-58.42" x2="99.06" y2="-58.42" width="0.1524" layer="91"/>
<junction x="106.68" y="-58.42"/>
<pinref part="C4" gate="G$1" pin="P$1"/>
<wire x1="99.06" y1="-58.42" x2="93.98" y2="-58.42" width="0.1524" layer="91"/>
<junction x="99.06" y="-58.42"/>
<pinref part="C6" gate="G$1" pin="P$1"/>
<junction x="114.3" y="-58.42"/>
<pinref part="C7" gate="G$1" pin="P$1"/>
<junction x="121.92" y="-58.42"/>
<pinref part="C8" gate="G$1" pin="P$1"/>
<junction x="129.54" y="-58.42"/>
</segment>
<segment>
<label x="66.04" y="40.64" size="1.778" layer="95"/>
<wire x1="35.56" y1="40.64" x2="58.42" y2="40.64" width="0.1524" layer="91"/>
<wire x1="58.42" y1="40.64" x2="63.5" y2="40.64" width="0.1524" layer="91"/>
<wire x1="63.5" y1="40.64" x2="68.58" y2="40.64" width="0.1524" layer="91"/>
<wire x1="35.56" y1="43.18" x2="58.42" y2="43.18" width="0.1524" layer="91"/>
<wire x1="58.42" y1="43.18" x2="63.5" y2="43.18" width="0.1524" layer="91"/>
<wire x1="63.5" y1="40.64" x2="63.5" y2="43.18" width="0.1524" layer="91"/>
<junction x="63.5" y="40.64"/>
<pinref part="H1" gate="G$1" pin="1"/>
<junction x="58.42" y="40.64"/>
<pinref part="H1" gate="G$1" pin="2"/>
<junction x="58.42" y="43.18"/>
</segment>
<segment>
<pinref part="LED1" gate="G$1" pin="C"/>
<wire x1="190.5" y1="22.86" x2="190.5" y2="20.32" width="0.1524" layer="91"/>
<label x="187.96" y="17.78" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="86.36" y1="-33.02" x2="86.36" y2="-35.56" width="0.1524" layer="91"/>
<wire x1="86.36" y1="-35.56" x2="101.6" y2="-35.56" width="0.1524" layer="91"/>
<wire x1="86.36" y1="-35.56" x2="71.12" y2="-35.56" width="0.1524" layer="91"/>
<junction x="86.36" y="-35.56"/>
<label x="83.82" y="-38.1" size="1.778" layer="95"/>
<pinref part="VREG1" gate="G$1" pin="GND"/>
</segment>
<segment>
<pinref part="ESP8266-1" gate="G$1" pin="GND"/>
<wire x1="101.6" y1="0" x2="93.98" y2="0" width="0.1524" layer="91"/>
<label x="96.52" y="0" size="1.778" layer="95" rot="MR0"/>
</segment>
<segment>
<pinref part="R5" gate="G$1" pin="2"/>
<wire x1="162.56" y1="-7.62" x2="182.88" y2="-7.62" width="0.1524" layer="91"/>
<label x="180.34" y="-7.62" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="H3" gate="G$1" pin="1"/>
<wire x1="99.06" y1="40.64" x2="106.68" y2="40.64" width="0.1524" layer="91"/>
<label x="104.14" y="40.64" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="SW2" gate="G$1" pin="2"/>
<wire x1="-5.08" y1="-7.62" x2="-7.62" y2="-7.62" width="0.1524" layer="91"/>
<label x="-5.08" y="-7.62" size="1.778" layer="95" rot="MR0"/>
</segment>
<segment>
<wire x1="-17.78" y1="-58.42" x2="-22.86" y2="-58.42" width="0.1524" layer="91"/>
<label x="-20.32" y="-58.42" size="1.778" layer="95" rot="MR0"/>
<pinref part="IC1" gate="G$1" pin="GND"/>
</segment>
<segment>
<wire x1="2.54" y1="-73.66" x2="7.62" y2="-73.66" width="0.1524" layer="91"/>
<label x="5.08" y="-73.66" size="1.778" layer="95"/>
<pinref part="IC2" gate="G$1" pin="GND"/>
</segment>
<segment>
<pinref part="EMI1" gate="G$1" pin="GND@1"/>
<wire x1="35.56" y1="-58.42" x2="30.48" y2="-58.42" width="0.1524" layer="91"/>
<label x="33.02" y="-58.42" size="1.778" layer="95" rot="MR0"/>
</segment>
<segment>
<pinref part="EMI1" gate="G$1" pin="GND@2"/>
<wire x1="55.88" y1="-58.42" x2="60.96" y2="-58.42" width="0.1524" layer="91"/>
<label x="58.42" y="-58.42" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="190.5" y1="-33.02" x2="190.5" y2="-35.56" width="0.1524" layer="91"/>
<label x="187.96" y="-38.1" size="1.778" layer="95"/>
<wire x1="182.88" y1="-33.02" x2="182.88" y2="-35.56" width="0.1524" layer="91"/>
<label x="180.34" y="-38.1" size="1.778" layer="95"/>
<wire x1="182.88" y1="-35.56" x2="190.5" y2="-35.56" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="NF3" gate="G$1" pin="S@0"/>
<wire x1="149.86" y1="40.64" x2="154.94" y2="40.64" width="0.1524" layer="91"/>
<label x="152.4" y="40.64" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="TVS1" gate="G$1" pin="P$1"/>
<wire x1="25.4" y1="-93.98" x2="25.4" y2="-96.52" width="0.1524" layer="91"/>
<wire x1="25.4" y1="-96.52" x2="33.02" y2="-96.52" width="0.1524" layer="91"/>
<pinref part="TVS2" gate="G$1" pin="P$1"/>
<wire x1="33.02" y1="-96.52" x2="33.02" y2="-93.98" width="0.1524" layer="91"/>
<label x="25.4" y="-99.06" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="VREG2" gate="G$1" pin="GND"/>
<label x="172.72" y="-66.04" size="1.778" layer="95" rot="MR0"/>
<pinref part="C11" gate="G$1" pin="P$1"/>
<wire x1="175.26" y1="-66.04" x2="160.02" y2="-66.04" width="0.1524" layer="91"/>
</segment>
</net>
<net name="LV_!RESET!" class="0">
<segment>
<label x="15.24" y="12.7" size="1.778" layer="95"/>
<pinref part="R2" gate="G$1" pin="2"/>
<pinref part="R1" gate="G$1" pin="1"/>
<wire x1="17.78" y1="15.24" x2="27.94" y2="15.24" width="0.1524" layer="91"/>
<wire x1="15.24" y1="15.24" x2="17.78" y2="15.24" width="0.1524" layer="91"/>
<wire x1="17.78" y1="15.24" x2="17.78" y2="17.78" width="0.1524" layer="91"/>
<junction x="17.78" y="15.24"/>
<pinref part="C2" gate="G$1" pin="P$1"/>
</segment>
<segment>
<pinref part="ESP8266-1" gate="G$1" pin="RST"/>
<wire x1="127" y1="0" x2="137.16" y2="0" width="0.1524" layer="91"/>
<label x="134.62" y="0" size="1.778" layer="95"/>
</segment>
</net>
<net name="VBAT" class="0">
<segment>
<label x="53.34" y="-71.12" size="1.778" layer="95"/>
<wire x1="55.88" y1="-71.12" x2="50.8" y2="-71.12" width="0.1524" layer="91"/>
<pinref part="D1" gate="G$1" pin="C"/>
</segment>
<segment>
<label x="76.2" y="-25.4" size="1.778" layer="95" rot="MR0"/>
<wire x1="76.2" y1="-25.4" x2="71.12" y2="-25.4" width="0.1524" layer="91"/>
<pinref part="VREG1" gate="G$1" pin="VIN"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<pinref part="LED1" gate="G$1" pin="A"/>
<pinref part="R3" gate="G$1" pin="1"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<pinref part="LED2" gate="G$1" pin="A"/>
<pinref part="R4" gate="G$1" pin="1"/>
</segment>
</net>
<net name="LV_SCL" class="0">
<segment>
<pinref part="ESP8266-1" gate="G$1" pin="GPIO2"/>
<label x="137.16" y="-2.54" size="1.778" layer="95"/>
<pinref part="R7" gate="G$1" pin="1"/>
<wire x1="127" y1="-2.54" x2="167.64" y2="-2.54" width="0.1524" layer="91"/>
</segment>
<segment>
<wire x1="144.78" y1="20.32" x2="152.4" y2="20.32" width="0.1524" layer="91"/>
<label x="149.86" y="20.32" size="1.778" layer="95"/>
</segment>
<segment>
<label x="66.04" y="50.8" size="1.778" layer="95"/>
<wire x1="35.56" y1="50.8" x2="58.42" y2="50.8" width="0.1524" layer="91"/>
<wire x1="58.42" y1="50.8" x2="63.5" y2="50.8" width="0.1524" layer="91"/>
<wire x1="63.5" y1="50.8" x2="68.58" y2="50.8" width="0.1524" layer="91"/>
<wire x1="35.56" y1="53.34" x2="58.42" y2="53.34" width="0.1524" layer="91"/>
<wire x1="58.42" y1="53.34" x2="63.5" y2="53.34" width="0.1524" layer="91"/>
<wire x1="63.5" y1="50.8" x2="63.5" y2="53.34" width="0.1524" layer="91"/>
<junction x="63.5" y="50.8"/>
<pinref part="H1" gate="G$1" pin="5"/>
<junction x="58.42" y="50.8"/>
<pinref part="H1" gate="G$1" pin="6"/>
<junction x="58.42" y="53.34"/>
</segment>
<segment>
<wire x1="134.62" y1="20.32" x2="127" y2="20.32" width="0.1524" layer="91"/>
<label x="129.54" y="20.32" size="1.778" layer="95" rot="MR0"/>
</segment>
<segment>
<pinref part="LED2" gate="G$1" pin="C"/>
<wire x1="203.2" y1="22.86" x2="203.2" y2="20.32" width="0.1524" layer="91"/>
<label x="200.66" y="17.78" size="1.778" layer="95"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<pinref part="DXL1" gate="G$1" pin="VDD"/>
<pinref part="D1" gate="G$1" pin="A"/>
<wire x1="45.72" y1="-71.12" x2="30.48" y2="-71.12" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<pinref part="SW1" gate="G$1" pin="1"/>
<pinref part="R2" gate="G$1" pin="1"/>
</segment>
</net>
<net name="LV_RXD" class="0">
<segment>
<pinref part="ESP8266-1" gate="G$1" pin="RXD"/>
<label x="96.52" y="-2.54" size="1.778" layer="95" rot="MR0"/>
<wire x1="101.6" y1="-2.54" x2="81.28" y2="-2.54" width="0.1524" layer="91"/>
<pinref part="R8" gate="G$1" pin="2"/>
</segment>
<segment>
<wire x1="-17.78" y1="-73.66" x2="-22.86" y2="-73.66" width="0.1524" layer="91"/>
<label x="-20.32" y="-73.66" size="1.778" layer="95" rot="MR0"/>
<pinref part="IC2" gate="G$1" pin="Y"/>
</segment>
<segment>
<wire x1="88.9" y1="30.48" x2="81.28" y2="30.48" width="0.1524" layer="91"/>
<label x="83.82" y="30.48" size="1.778" layer="95" rot="MR0"/>
<pinref part="NF2" gate="G$1" pin="S@0"/>
</segment>
</net>
<net name="LV_TXD" class="0">
<segment>
<pinref part="ESP8266-1" gate="G$1" pin="TXD"/>
<wire x1="101.6" y1="-5.08" x2="88.9" y2="-5.08" width="0.1524" layer="91"/>
<label x="96.52" y="-5.08" size="1.778" layer="95" rot="MR0"/>
<pinref part="R9" gate="G$1" pin="2"/>
</segment>
<segment>
<wire x1="-17.78" y1="-55.88" x2="-22.86" y2="-55.88" width="0.1524" layer="91"/>
<label x="-20.32" y="-55.88" size="1.778" layer="95" rot="MR0"/>
<pinref part="IC1" gate="G$1" pin="A"/>
</segment>
<segment>
<wire x1="99.06" y1="20.32" x2="106.68" y2="20.32" width="0.1524" layer="91"/>
<label x="104.14" y="20.32" size="1.778" layer="95"/>
<pinref part="NF1" gate="G$1" pin="S@0"/>
</segment>
</net>
<net name="HV_TXD" class="0">
<segment>
<pinref part="H3" gate="G$1" pin="5"/>
<wire x1="99.06" y1="50.8" x2="121.92" y2="50.8" width="0.1524" layer="91"/>
<label x="104.14" y="50.8" size="1.778" layer="95"/>
<pinref part="R13" gate="G$1" pin="1"/>
</segment>
<segment>
<wire x1="88.9" y1="20.32" x2="81.28" y2="20.32" width="0.1524" layer="91"/>
<label x="83.82" y="20.32" size="1.778" layer="95" rot="MR0"/>
<pinref part="NF1" gate="G$1" pin="D@0"/>
</segment>
</net>
<net name="HV_RXD" class="0">
<segment>
<pinref part="H3" gate="G$1" pin="4"/>
<wire x1="99.06" y1="48.26" x2="114.3" y2="48.26" width="0.1524" layer="91"/>
<label x="104.14" y="48.26" size="1.778" layer="95"/>
<pinref part="R12" gate="G$1" pin="1"/>
</segment>
<segment>
<wire x1="99.06" y1="30.48" x2="106.68" y2="30.48" width="0.1524" layer="91"/>
<label x="104.14" y="30.48" size="1.778" layer="95"/>
<pinref part="NF2" gate="G$1" pin="D@0"/>
</segment>
</net>
<net name="LV_SDA" class="0">
<segment>
<pinref part="ESP8266-1" gate="G$1" pin="GPIO0"/>
<label x="137.16" y="-5.08" size="1.778" layer="95"/>
<pinref part="R6" gate="G$1" pin="1"/>
<wire x1="127" y1="-5.08" x2="160.02" y2="-5.08" width="0.1524" layer="91"/>
</segment>
<segment>
<label x="15.24" y="-10.16" size="1.778" layer="95"/>
<pinref part="R10" gate="G$1" pin="2"/>
<wire x1="15.24" y1="-7.62" x2="27.94" y2="-7.62" width="0.1524" layer="91"/>
</segment>
<segment>
<wire x1="134.62" y1="30.48" x2="127" y2="30.48" width="0.1524" layer="91"/>
<label x="129.54" y="30.48" size="1.778" layer="95" rot="MR0"/>
</segment>
<segment>
<wire x1="144.78" y1="30.48" x2="152.4" y2="30.48" width="0.1524" layer="91"/>
<label x="149.86" y="30.48" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="68.58" y1="55.88" x2="63.5" y2="55.88" width="0.1524" layer="91"/>
<wire x1="63.5" y1="55.88" x2="63.5" y2="58.42" width="0.1524" layer="91"/>
<wire x1="63.5" y1="58.42" x2="58.42" y2="58.42" width="0.1524" layer="91"/>
<wire x1="58.42" y1="58.42" x2="35.56" y2="58.42" width="0.1524" layer="91"/>
<wire x1="63.5" y1="55.88" x2="58.42" y2="55.88" width="0.1524" layer="91"/>
<junction x="63.5" y="55.88"/>
<pinref part="H1" gate="G$1" pin="7"/>
<junction x="58.42" y="55.88"/>
<wire x1="58.42" y1="55.88" x2="35.56" y2="55.88" width="0.1524" layer="91"/>
<pinref part="H1" gate="G$1" pin="8"/>
<junction x="58.42" y="58.42"/>
<label x="66.04" y="55.88" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="LED3" gate="G$1" pin="C"/>
<wire x1="215.9" y1="22.86" x2="215.9" y2="20.32" width="0.1524" layer="91"/>
<label x="213.36" y="17.78" size="1.778" layer="95"/>
</segment>
</net>
<net name="HV_!RESET!" class="0">
<segment>
<pinref part="H3" gate="G$1" pin="6"/>
<wire x1="99.06" y1="53.34" x2="106.68" y2="53.34" width="0.1524" layer="91"/>
<label x="104.14" y="53.34" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="C2" gate="G$1" pin="P$2"/>
<wire x1="38.1" y1="15.24" x2="40.64" y2="15.24" width="0.1524" layer="91"/>
<label x="38.1" y="15.24" size="1.778" layer="95"/>
</segment>
</net>
<net name="N$1" class="0">
<segment>
<pinref part="SW2" gate="G$1" pin="1"/>
<pinref part="R10" gate="G$1" pin="1"/>
</segment>
</net>
<net name="HV_BOOT" class="0">
<segment>
<wire x1="38.1" y1="-7.62" x2="40.64" y2="-7.62" width="0.1524" layer="91"/>
<label x="38.1" y="-7.62" size="1.778" layer="95"/>
</segment>
</net>
<net name="LV_TXEN" class="0">
<segment>
<pinref part="ESP8266-1" gate="G$1" pin="GPIO15"/>
<label x="137.16" y="-7.62" size="1.778" layer="95"/>
<pinref part="R5" gate="G$1" pin="1"/>
<wire x1="127" y1="-7.62" x2="152.4" y2="-7.62" width="0.1524" layer="91"/>
</segment>
<segment>
<wire x1="2.54" y1="-68.58" x2="7.62" y2="-68.58" width="0.1524" layer="91"/>
<label x="5.08" y="-68.58" size="1.778" layer="95"/>
<pinref part="IC2" gate="G$1" pin="!OE!"/>
</segment>
<segment>
<wire x1="-17.78" y1="-53.34" x2="-22.86" y2="-53.34" width="0.1524" layer="91"/>
<label x="-20.32" y="-53.34" size="1.778" layer="95" rot="MR0"/>
<pinref part="IC1" gate="G$1" pin="OE"/>
</segment>
<segment>
<wire x1="147.32" y1="45.72" x2="154.94" y2="45.72" width="0.1524" layer="91"/>
<label x="152.4" y="45.72" size="1.778" layer="95"/>
<pinref part="NF3" gate="G$1" pin="G"/>
</segment>
</net>
<net name="DXL" class="0">
<segment>
<pinref part="DXL1" gate="G$1" pin="TTL"/>
<label x="53.34" y="-68.58" size="1.778" layer="95"/>
<wire x1="30.48" y1="-68.58" x2="55.88" y2="-68.58" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="EMI1" gate="G$1" pin="O1"/>
<wire x1="35.56" y1="-60.96" x2="30.48" y2="-60.96" width="0.1524" layer="91"/>
<label x="33.02" y="-60.96" size="1.778" layer="95" rot="MR0"/>
<pinref part="EMI1" gate="G$1" pin="O2"/>
<wire x1="55.88" y1="-60.96" x2="35.56" y2="-60.96" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="TVS2" gate="G$1" pin="P$2"/>
<wire x1="33.02" y1="-88.9" x2="33.02" y2="-86.36" width="0.1524" layer="91"/>
<wire x1="33.02" y1="-86.36" x2="25.4" y2="-86.36" width="0.1524" layer="91"/>
<pinref part="TVS1" gate="G$1" pin="P$2"/>
<wire x1="25.4" y1="-86.36" x2="25.4" y2="-88.9" width="0.1524" layer="91"/>
<label x="25.4" y="-86.36" size="1.778" layer="95"/>
<pinref part="R15" gate="G$1" pin="2"/>
<junction x="25.4" y="-86.36"/>
<pinref part="R16" gate="G$1" pin="2"/>
<wire x1="25.4" y1="-81.28" x2="25.4" y2="-86.36" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="LED3" gate="G$1" pin="A"/>
<pinref part="R11" gate="G$1" pin="1"/>
</segment>
</net>
<net name="HV_!TXEN!" class="0">
<segment>
<pinref part="H3" gate="G$1" pin="2"/>
<wire x1="99.06" y1="43.18" x2="121.92" y2="43.18" width="0.1524" layer="91"/>
<wire x1="121.92" y1="43.18" x2="121.92" y2="40.64" width="0.1524" layer="91"/>
<wire x1="121.92" y1="40.64" x2="139.7" y2="40.64" width="0.1524" layer="91"/>
<label x="104.14" y="43.18" size="1.778" layer="95"/>
<pinref part="NF3" gate="G$1" pin="D@0"/>
<pinref part="R14" gate="G$1" pin="1"/>
<junction x="121.92" y="43.18"/>
</segment>
</net>
<net name="DXL_O" class="0">
<segment>
<pinref part="R16" gate="G$1" pin="1"/>
<wire x1="15.24" y1="-81.28" x2="10.16" y2="-81.28" width="0.1524" layer="91"/>
<label x="15.24" y="-81.28" size="1.778" layer="95" rot="MR0"/>
</segment>
<segment>
<pinref part="EMI1" gate="G$1" pin="D1"/>
<wire x1="35.56" y1="-55.88" x2="30.48" y2="-55.88" width="0.1524" layer="91"/>
<label x="33.02" y="-55.88" size="1.778" layer="95" rot="MR0"/>
</segment>
<segment>
<wire x1="2.54" y1="-58.42" x2="7.62" y2="-58.42" width="0.1524" layer="91"/>
<label x="5.08" y="-58.42" size="1.778" layer="95"/>
<pinref part="IC1" gate="G$1" pin="Y"/>
</segment>
</net>
<net name="DXL_I" class="0">
<segment>
<wire x1="15.24" y1="-86.36" x2="10.16" y2="-86.36" width="0.1524" layer="91"/>
<label x="15.24" y="-86.36" size="1.778" layer="95" rot="MR0"/>
<pinref part="R15" gate="G$1" pin="1"/>
</segment>
<segment>
<wire x1="2.54" y1="-71.12" x2="7.62" y2="-71.12" width="0.1524" layer="91"/>
<label x="5.08" y="-71.12" size="1.778" layer="95"/>
<pinref part="IC2" gate="G$1" pin="A"/>
</segment>
<segment>
<pinref part="EMI1" gate="G$1" pin="D2"/>
<wire x1="55.88" y1="-55.88" x2="60.96" y2="-55.88" width="0.1524" layer="91"/>
<label x="58.42" y="-55.88" size="1.778" layer="95"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<pinref part="VREG2" gate="G$1" pin="CP+"/>
<pinref part="C10" gate="G$1" pin="P$2"/>
<wire x1="195.58" y1="-60.96" x2="200.66" y2="-60.96" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$9" class="0">
<segment>
<pinref part="VREG2" gate="G$1" pin="CP-"/>
<pinref part="C10" gate="G$1" pin="P$1"/>
<wire x1="195.58" y1="-71.12" x2="200.66" y2="-71.12" width="0.1524" layer="91"/>
</segment>
</net>
<net name="5V" class="0">
<segment>
<pinref part="VREG2" gate="G$1" pin="VOUT"/>
<label x="172.72" y="-60.96" size="1.778" layer="95" rot="MR0"/>
<wire x1="175.26" y1="-60.96" x2="165.1" y2="-60.96" width="0.1524" layer="91"/>
<wire x1="165.1" y1="-60.96" x2="165.1" y2="-55.88" width="0.1524" layer="91"/>
<pinref part="C11" gate="G$1" pin="P$2"/>
<wire x1="165.1" y1="-55.88" x2="160.02" y2="-55.88" width="0.1524" layer="91"/>
</segment>
<segment>
<wire x1="2.54" y1="-53.34" x2="7.62" y2="-53.34" width="0.1524" layer="91"/>
<label x="5.08" y="-53.34" size="1.778" layer="95"/>
<pinref part="IC1" gate="G$1" pin="VCC"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
