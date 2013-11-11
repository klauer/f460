# autosave/restore mechanisms
save_restoreSet_Debug(0)
save_restoreSet_IncompleteSetsOk(1)
save_restoreSet_DatedBackupFiles(1)

set_savefile_path("${TOP}/as","/save")
set_requestfile_path("${TOP}/as","/req")

makeAutosaveFileFromDbInfo("${TOP}/as/req/F460.req", "autosaveFields")
set_pass1_restoreFile("F460.sav")


