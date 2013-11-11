F460 EPICS Driver
-----------------

StreamDevice-based EPICS support for the FMB Oxford F460 four-channel 
fast current measurement device.

Requirements
============

Though it may work on other versions, the driver was tested on these:

1. EPICS base 3.14.12.3 http://www.aps.anl.gov/epics/
2. asyn 4-21 http://www.aps.anl.gov/epics/modules/soft/asyn/
3. StreamDevice 2.6 http://epics.web.psi.ch/software/streamdevice/

A newer StreamDevice may be required than the NSLS-II Debian package has (as of early 2013).
If included in $(TOP)/StreamDevice, it will be built automatically.
The newer StreamDevice also requires a newer asyn (>= 4-18).

Installation
============

1. Install EPICS
    a. If using a Debian-based system (e.g., Ubuntu), use the packages here http://epics.nsls2.bnl.gov/debian/
    b. If no packages are available for your distribution, build from source
2. Edit configure/RELEASE
    a. Point the directories listed in there to the appropriate places
    b. If using the Debian packages, everything can be pointed to /usr/lib/epics
3. Edit iocBoot/iocf460/st.cmd
    a. Change the shebang on the top of the script if your architecture is different than linux-x86:
        #!../../bin/linux-x86/f460
        (check if the environment variable EPICS_HOST_ARCH is set, or perhaps `uname -a`, or ask someone if
         you don't know)
    b. The following line sets the prefix to all of your F460 PVs:
        epicsEnvSet("P", "E1:F460:")
       Set the second quoted string appropriately.
    c. The following line sets the IP address of the serial device server communicating with the F460:
        drvAsynIPPortConfigure("$(PORT)", "10.0.0.11:4001")
       Change the 10.0.0.11 to the IP address, and 4001 to the correct port number.
    d. Alternatively, if you have the device directly connected to a serial port on the machine,
       modify the drvAsynSerialPort* lines appropriately.
4. Go to the top directory and make
5. If all goes well
    cd iocBoot/iocf460
    chmod +x st.cmd
    ./st.cmd
