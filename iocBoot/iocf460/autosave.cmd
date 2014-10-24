# autosave/restore mechanisms
save_restoreSet_Debug(0)
save_restoreSet_IncompleteSetsOk(1)
save_restoreSet_DatedBackupFiles(1)

system "install -m 0766 -d $(TOP)/as/req/"
system "install -m 0766 -d $(TOP)/as/save/"

set_savefile_path("${TOP}/as","/save")
set_requestfile_path("${TOP}/as","/req")

cd $(TOP)/as/req
makeAutosaveFiles()
cd ${TOP}/iocBoot/${IOC}/

set_pass1_restoreFile("F460.sav")


