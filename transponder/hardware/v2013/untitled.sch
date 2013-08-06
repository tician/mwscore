<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="6.4">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
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
<layer number="51" name="tDocu" color="6" fill="9" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="atmel">
<description>&lt;b&gt;AVR Devices&lt;/b&gt;&lt;p&gt;
Configurable logic, microcontrollers, nonvolatile memories&lt;p&gt;
Based on the following sources:&lt;p&gt;
&lt;ul&gt;
&lt;li&gt;www.atmel.com
&lt;li&gt;CD-ROM : Configurable Logic Microcontroller Nonvolatile Memory
&lt;li&gt;CadSoft download site, www.cadsoft.de or www.cadsoftusa.com , file at90smcu_v400.zip
&lt;li&gt;avr.lbr
&lt;/ul&gt;
&lt;author&gt;Revised by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="TQFP44">
<description>&lt;b&gt;44-lead Thin Quad Flat Package&lt;/b&gt;</description>
<wire x1="-4.8" y1="4.4" x2="-4.4" y2="4.8" width="0.2032" layer="21"/>
<wire x1="-4.4" y1="4.8" x2="4.4" y2="4.8" width="0.2032" layer="21"/>
<wire x1="4.4" y1="4.8" x2="4.8" y2="4.4" width="0.2032" layer="21"/>
<wire x1="4.8" y1="4.4" x2="4.8" y2="-4.4" width="0.2032" layer="21"/>
<wire x1="4.8" y1="-4.4" x2="4.4" y2="-4.8" width="0.2032" layer="21"/>
<wire x1="4.4" y1="-4.8" x2="-4.4" y2="-4.8" width="0.2032" layer="21"/>
<wire x1="-4.4" y1="-4.8" x2="-4.8" y2="-4.4" width="0.2032" layer="21"/>
<wire x1="-4.8" y1="-4.4" x2="-4.8" y2="4.4" width="0.2032" layer="21"/>
<circle x="-4" y="4" radius="0.2827" width="0.254" layer="21"/>
<smd name="1" x="-5.8" y="4" dx="1.5" dy="0.5" layer="1"/>
<smd name="2" x="-5.8" y="3.2" dx="1.5" dy="0.5" layer="1"/>
<smd name="3" x="-5.8" y="2.4" dx="1.5" dy="0.5" layer="1"/>
<smd name="4" x="-5.8" y="1.6" dx="1.5" dy="0.5" layer="1"/>
<smd name="5" x="-5.8" y="0.8" dx="1.5" dy="0.5" layer="1"/>
<smd name="6" x="-5.8" y="0" dx="1.5" dy="0.5" layer="1"/>
<smd name="7" x="-5.8" y="-0.8" dx="1.5" dy="0.5" layer="1"/>
<smd name="8" x="-5.8" y="-1.6" dx="1.5" dy="0.5" layer="1"/>
<smd name="9" x="-5.8" y="-2.4" dx="1.5" dy="0.5" layer="1"/>
<smd name="10" x="-5.8" y="-3.2" dx="1.5" dy="0.5" layer="1"/>
<smd name="11" x="-5.8" y="-4" dx="1.5" dy="0.5" layer="1"/>
<smd name="12" x="-4" y="-5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="13" x="-3.2" y="-5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="14" x="-2.4" y="-5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="15" x="-1.6" y="-5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="16" x="-0.8" y="-5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="17" x="0" y="-5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="18" x="0.8" y="-5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="19" x="1.6" y="-5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="20" x="2.4" y="-5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="21" x="3.2" y="-5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="22" x="4" y="-5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="23" x="5.8" y="-4" dx="1.5" dy="0.5" layer="1"/>
<smd name="24" x="5.8" y="-3.2" dx="1.5" dy="0.5" layer="1"/>
<smd name="25" x="5.8" y="-2.4" dx="1.5" dy="0.5" layer="1"/>
<smd name="26" x="5.8" y="-1.6" dx="1.5" dy="0.5" layer="1"/>
<smd name="27" x="5.8" y="-0.8" dx="1.5" dy="0.5" layer="1"/>
<smd name="28" x="5.8" y="0" dx="1.5" dy="0.5" layer="1"/>
<smd name="29" x="5.8" y="0.8" dx="1.5" dy="0.5" layer="1"/>
<smd name="30" x="5.8" y="1.6" dx="1.5" dy="0.5" layer="1"/>
<smd name="31" x="5.8" y="2.4" dx="1.5" dy="0.5" layer="1"/>
<smd name="32" x="5.8" y="3.2" dx="1.5" dy="0.5" layer="1"/>
<smd name="33" x="5.8" y="4" dx="1.5" dy="0.5" layer="1"/>
<smd name="34" x="4" y="5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="35" x="3.2" y="5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="36" x="2.4" y="5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="37" x="1.6" y="5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="38" x="0.8" y="5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="39" x="0" y="5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="40" x="-0.8" y="5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="41" x="-1.6" y="5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="42" x="-2.4" y="5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="43" x="-3.2" y="5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="44" x="-4" y="5.8" dx="0.5" dy="1.5" layer="1"/>
<text x="-3.81" y="6.985" size="1.778" layer="25">&gt;NAME</text>
<text x="-4.445" y="-8.7551" size="1.778" layer="27">&gt;VALUE</text>
<rectangle x1="-6.1001" y1="3.8001" x2="-4.95" y2="4.1999" layer="51"/>
<rectangle x1="-6.1001" y1="3" x2="-4.95" y2="3.4" layer="51"/>
<rectangle x1="-6.1001" y1="2.1999" x2="-4.95" y2="2.5999" layer="51"/>
<rectangle x1="-6.1001" y1="1.4" x2="-4.95" y2="1.8001" layer="51"/>
<rectangle x1="-6.1001" y1="0.5999" x2="-4.95" y2="1" layer="51"/>
<rectangle x1="-6.1001" y1="-0.1999" x2="-4.95" y2="0.1999" layer="51"/>
<rectangle x1="-6.1001" y1="-1" x2="-4.95" y2="-0.5999" layer="51"/>
<rectangle x1="-6.1001" y1="-1.8001" x2="-4.95" y2="-1.4" layer="51"/>
<rectangle x1="-6.1001" y1="-2.5999" x2="-4.95" y2="-2.1999" layer="51"/>
<rectangle x1="-6.1001" y1="-3.4" x2="-4.95" y2="-3" layer="51"/>
<rectangle x1="-6.1001" y1="-4.1999" x2="-4.95" y2="-3.8001" layer="51"/>
<rectangle x1="-4.1999" y1="-6.1001" x2="-3.8001" y2="-4.95" layer="51"/>
<rectangle x1="-3.4" y1="-6.1001" x2="-3" y2="-4.95" layer="51"/>
<rectangle x1="-2.5999" y1="-6.1001" x2="-2.1999" y2="-4.95" layer="51"/>
<rectangle x1="-1.8001" y1="-6.1001" x2="-1.4" y2="-4.95" layer="51"/>
<rectangle x1="-1" y1="-6.1001" x2="-0.5999" y2="-4.95" layer="51"/>
<rectangle x1="-0.1999" y1="-6.1001" x2="0.1999" y2="-4.95" layer="51"/>
<rectangle x1="0.5999" y1="-6.1001" x2="1" y2="-4.95" layer="51"/>
<rectangle x1="1.4" y1="-6.1001" x2="1.8001" y2="-4.95" layer="51"/>
<rectangle x1="2.1999" y1="-6.1001" x2="2.5999" y2="-4.95" layer="51"/>
<rectangle x1="3" y1="-6.1001" x2="3.4" y2="-4.95" layer="51"/>
<rectangle x1="3.8001" y1="-6.1001" x2="4.1999" y2="-4.95" layer="51"/>
<rectangle x1="4.95" y1="-4.1999" x2="6.1001" y2="-3.8001" layer="51"/>
<rectangle x1="4.95" y1="-3.4" x2="6.1001" y2="-3" layer="51"/>
<rectangle x1="4.95" y1="-2.5999" x2="6.1001" y2="-2.1999" layer="51"/>
<rectangle x1="4.95" y1="-1.8001" x2="6.1001" y2="-1.4" layer="51"/>
<rectangle x1="4.95" y1="-1" x2="6.1001" y2="-0.5999" layer="51"/>
<rectangle x1="4.95" y1="-0.1999" x2="6.1001" y2="0.1999" layer="51"/>
<rectangle x1="4.95" y1="0.5999" x2="6.1001" y2="1" layer="51"/>
<rectangle x1="4.95" y1="1.4" x2="6.1001" y2="1.8001" layer="51"/>
<rectangle x1="4.95" y1="2.1999" x2="6.1001" y2="2.5999" layer="51"/>
<rectangle x1="4.95" y1="3" x2="6.1001" y2="3.4" layer="51"/>
<rectangle x1="4.95" y1="3.8001" x2="6.1001" y2="4.1999" layer="51"/>
<rectangle x1="3.8001" y1="4.95" x2="4.1999" y2="6.1001" layer="51"/>
<rectangle x1="3" y1="4.95" x2="3.4" y2="6.1001" layer="51"/>
<rectangle x1="2.1999" y1="4.95" x2="2.5999" y2="6.1001" layer="51"/>
<rectangle x1="1.4" y1="4.95" x2="1.8001" y2="6.1001" layer="51"/>
<rectangle x1="0.5999" y1="4.95" x2="1" y2="6.1001" layer="51"/>
<rectangle x1="-0.1999" y1="4.95" x2="0.1999" y2="6.1001" layer="51"/>
<rectangle x1="-1" y1="4.95" x2="-0.5999" y2="6.1001" layer="51"/>
<rectangle x1="-1.8001" y1="4.95" x2="-1.4" y2="6.1001" layer="51"/>
<rectangle x1="-2.5999" y1="4.95" x2="-2.1999" y2="6.1001" layer="51"/>
<rectangle x1="-3.4" y1="4.95" x2="-3" y2="6.1001" layer="51"/>
<rectangle x1="-4.1999" y1="4.95" x2="-3.8001" y2="6.1001" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="AT89S51">
<wire x1="-15.24" y1="-33.02" x2="15.24" y2="-33.02" width="0.4064" layer="94"/>
<wire x1="15.24" y1="-33.02" x2="15.24" y2="33.02" width="0.4064" layer="94"/>
<wire x1="15.24" y1="33.02" x2="-15.24" y2="33.02" width="0.4064" layer="94"/>
<wire x1="-15.24" y1="33.02" x2="-15.24" y2="-33.02" width="0.4064" layer="94"/>
<text x="-15.24" y="-35.56" size="1.778" layer="96">&gt;VALUE</text>
<text x="-15.24" y="33.655" size="1.778" layer="95">&gt;NAME</text>
<pin name="!EA!/VPP" x="20.32" y="-20.32" length="middle" direction="in" rot="R180"/>
<pin name="P0.0_AD0" x="20.32" y="25.4" length="middle" rot="R180"/>
<pin name="P0.1_AD1" x="20.32" y="22.86" length="middle" rot="R180"/>
<pin name="P0.2_AD2" x="20.32" y="20.32" length="middle" rot="R180"/>
<pin name="P0.3_AD3" x="20.32" y="17.78" length="middle" rot="R180"/>
<pin name="P0.4_AD4" x="20.32" y="15.24" length="middle" rot="R180"/>
<pin name="P0.5_AD5" x="20.32" y="12.7" length="middle" rot="R180"/>
<pin name="P0.6_AD6" x="20.32" y="10.16" length="middle" rot="R180"/>
<pin name="P0.7_AD7" x="20.32" y="7.62" length="middle" rot="R180"/>
<pin name="XTAL1" x="-20.32" y="25.4" length="middle" direction="in"/>
<pin name="XTAL2" x="-20.32" y="17.78" length="middle" direction="in"/>
<pin name="RST" x="-20.32" y="30.48" length="middle" direction="in"/>
<pin name="ALE/!PROG" x="20.32" y="-22.86" length="middle" direction="out" rot="R180"/>
<pin name="!PSEN" x="20.32" y="-25.4" length="middle" direction="out" rot="R180"/>
<pin name="P2.0_A8" x="20.32" y="2.54" length="middle" rot="R180"/>
<pin name="P2.1_A9" x="20.32" y="0" length="middle" rot="R180"/>
<pin name="P2.2_A10" x="20.32" y="-2.54" length="middle" rot="R180"/>
<pin name="P2.3_A11" x="20.32" y="-5.08" length="middle" rot="R180"/>
<pin name="P2.4_A12" x="20.32" y="-7.62" length="middle" rot="R180"/>
<pin name="P2.5_A13" x="20.32" y="-10.16" length="middle" rot="R180"/>
<pin name="P2.6_A14" x="20.32" y="-12.7" length="middle" rot="R180"/>
<pin name="P2.7_A15" x="20.32" y="-15.24" length="middle" rot="R180"/>
<pin name="P1.0" x="-20.32" y="12.7" length="middle"/>
<pin name="P1.1" x="-20.32" y="10.16" length="middle"/>
<pin name="P1.2" x="-20.32" y="7.62" length="middle"/>
<pin name="P1.3" x="-20.32" y="5.08" length="middle"/>
<pin name="P1.4" x="-20.32" y="2.54" length="middle"/>
<pin name="P1.5_MOSI" x="-20.32" y="0" length="middle"/>
<pin name="P1.6_MISO" x="-20.32" y="-2.54" length="middle"/>
<pin name="P1.7_SCK" x="-20.32" y="-5.08" length="middle"/>
<pin name="P3.0/RXD" x="-20.32" y="-10.16" length="middle"/>
<pin name="P3.1/TXD" x="-20.32" y="-12.7" length="middle"/>
<pin name="P3.2/!INT0" x="-20.32" y="-15.24" length="middle"/>
<pin name="P3.3/!INT1" x="-20.32" y="-17.78" length="middle"/>
<pin name="P3.4/T0" x="-20.32" y="-20.32" length="middle"/>
<pin name="P3.5/T1" x="-20.32" y="-22.86" length="middle"/>
<pin name="P3.6/!WR" x="-20.32" y="-25.4" length="middle"/>
<pin name="P3.7/!RD" x="-20.32" y="-27.94" length="middle"/>
<pin name="VCC" x="20.32" y="30.48" length="middle" direction="pwr" rot="R180"/>
<pin name="GND" x="20.32" y="-30.48" length="middle" direction="pwr" rot="R180"/>
</symbol>
<symbol name="GND">
<pin name="GND" x="0" y="-2.54" length="short" direction="pwr" rot="R90"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="AT89S51*P" prefix="IC">
<description>&lt;b&gt;8-bit Microcontroller with 4K BytesIn-System Programmable Flash&lt;/b&gt;&lt;p&gt;
Source: http://www.atmel.com/dyn/resources/prod_documents/doc2487.pdf</description>
<gates>
<gate name="G$1" symbol="AT89S51" x="0" y="0"/>
<gate name="P" symbol="GND" x="2.54" y="-33.02" addlevel="request"/>
</gates>
<devices>
<device name="" package="TQFP44">
<connects>
<connect gate="G$1" pin="!EA!/VPP" pad="29"/>
<connect gate="G$1" pin="!PSEN" pad="26"/>
<connect gate="G$1" pin="ALE/!PROG" pad="27"/>
<connect gate="G$1" pin="GND" pad="16"/>
<connect gate="G$1" pin="P0.0_AD0" pad="37"/>
<connect gate="G$1" pin="P0.1_AD1" pad="36"/>
<connect gate="G$1" pin="P0.2_AD2" pad="35"/>
<connect gate="G$1" pin="P0.3_AD3" pad="34"/>
<connect gate="G$1" pin="P0.4_AD4" pad="33"/>
<connect gate="G$1" pin="P0.5_AD5" pad="32"/>
<connect gate="G$1" pin="P0.6_AD6" pad="31"/>
<connect gate="G$1" pin="P0.7_AD7" pad="30"/>
<connect gate="G$1" pin="P1.0" pad="40"/>
<connect gate="G$1" pin="P1.1" pad="41"/>
<connect gate="G$1" pin="P1.2" pad="42"/>
<connect gate="G$1" pin="P1.3" pad="43"/>
<connect gate="G$1" pin="P1.4" pad="44"/>
<connect gate="G$1" pin="P1.5_MOSI" pad="1"/>
<connect gate="G$1" pin="P1.6_MISO" pad="2"/>
<connect gate="G$1" pin="P1.7_SCK" pad="3"/>
<connect gate="G$1" pin="P2.0_A8" pad="18"/>
<connect gate="G$1" pin="P2.1_A9" pad="19"/>
<connect gate="G$1" pin="P2.2_A10" pad="20"/>
<connect gate="G$1" pin="P2.3_A11" pad="21"/>
<connect gate="G$1" pin="P2.4_A12" pad="22"/>
<connect gate="G$1" pin="P2.5_A13" pad="23"/>
<connect gate="G$1" pin="P2.6_A14" pad="24"/>
<connect gate="G$1" pin="P2.7_A15" pad="25"/>
<connect gate="G$1" pin="P3.0/RXD" pad="5"/>
<connect gate="G$1" pin="P3.1/TXD" pad="7"/>
<connect gate="G$1" pin="P3.2/!INT0" pad="8"/>
<connect gate="G$1" pin="P3.3/!INT1" pad="9"/>
<connect gate="G$1" pin="P3.4/T0" pad="10"/>
<connect gate="G$1" pin="P3.5/T1" pad="11"/>
<connect gate="G$1" pin="P3.6/!WR" pad="12"/>
<connect gate="G$1" pin="P3.7/!RD" pad="13"/>
<connect gate="G$1" pin="RST" pad="4"/>
<connect gate="G$1" pin="VCC" pad="38"/>
<connect gate="G$1" pin="XTAL1" pad="15"/>
<connect gate="G$1" pin="XTAL2" pad="14"/>
<connect gate="P" pin="GND" pad="17"/>
</connects>
<technologies>
<technology name="-24">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
<technology name="-33">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
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
<part name="IC1" library="atmel" deviceset="AT89S51*P" device="" technology="-24"/>
<part name="IC2" library="atmel" deviceset="AT89S51*P" device="" technology="-24"/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="IC1" gate="G$1" x="38.1" y="50.8"/>
<instance part="IC2" gate="G$1" x="152.4" y="66.04"/>
</instances>
<busses>
</busses>
<nets>
<net name="VINPUT" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="VCC"/>
<wire x1="58.42" y1="81.28" x2="66.04" y2="81.28" width="0.1524" layer="91"/>
<label x="60.96" y="81.28" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="VCC"/>
<wire x1="172.72" y1="96.52" x2="182.88" y2="96.52" width="0.1524" layer="91"/>
<label x="177.8" y="96.52" size="1.778" layer="95"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="P0.0_AD0"/>
<wire x1="58.42" y1="76.2" x2="66.04" y2="76.2" width="0.1524" layer="91"/>
<label x="63.5" y="76.2" size="1.778" layer="95"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="P0.1_AD1"/>
<wire x1="58.42" y1="73.66" x2="66.04" y2="73.66" width="0.1524" layer="91"/>
<label x="63.5" y="73.66" size="1.778" layer="95"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="P0.2_AD2"/>
<wire x1="58.42" y1="71.12" x2="66.04" y2="71.12" width="0.1524" layer="91"/>
<label x="63.5" y="71.12" size="1.778" layer="95"/>
</segment>
</net>
<net name="AD3" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="P0.3_AD3"/>
<wire x1="58.42" y1="68.58" x2="66.04" y2="68.58" width="0.1524" layer="91"/>
<label x="63.5" y="68.58" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="P0.0_AD0"/>
<wire x1="172.72" y1="91.44" x2="182.88" y2="91.44" width="0.1524" layer="91"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
