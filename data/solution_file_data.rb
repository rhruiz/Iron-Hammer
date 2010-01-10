module SolutionFileData
  SAMPLE = <<-eos
        
Microsoft Visual Studio Solution File, Format Version 10.00
# Visual Studio 2008
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "Matchers", "Matchers\\Matchers.csproj", "{972A6F44-04B9-4800-B29D-84752AF0444C}"
EndProject
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "Tests", "Tests\\Tests.csproj", "{57F54B10-B076-4DFA-AC34-899B440AD35C}"
EndProject
Project("{2150E333-8FDC-42A3-9474-1A3956D46DE8}") = "Solution Items", "Solution Items", "{96406A85-69F3-4227-B014-3C623B50DC2E}"
	ProjectSection(SolutionItems) = preProject
		LocalTestRun.testrunconfig = LocalTestRun.testrunconfig
		Matchers.vsmdi = Matchers.vsmdi
	EndProjectSection
EndProject
Global
	GlobalSection(TestCaseManagementSettings) = postSolution
		CategoryFile = Matchers.vsmdi
	EndGlobalSection
	GlobalSection(SolutionConfigurationPlatforms) = preSolution
		Debug|Any CPU = Debug|Any CPU
		Release|Any CPU = Release|Any CPU
	EndGlobalSection
	GlobalSection(ProjectConfigurationPlatforms) = postSolution
		{972A6F44-04B9-4800-B29D-84752AF0444C}.Debug|Any CPU.ActiveCfg = Debug|Any CPU
		{972A6F44-04B9-4800-B29D-84752AF0444C}.Debug|Any CPU.Build.0 = Debug|Any CPU
		{972A6F44-04B9-4800-B29D-84752AF0444C}.Release|Any CPU.ActiveCfg = Release|Any CPU
		{972A6F44-04B9-4800-B29D-84752AF0444C}.Release|Any CPU.Build.0 = Release|Any CPU
		{57F54B10-B076-4DFA-AC34-899B440AD35C}.Debug|Any CPU.ActiveCfg = Debug|Any CPU
		{57F54B10-B076-4DFA-AC34-899B440AD35C}.Debug|Any CPU.Build.0 = Debug|Any CPU
		{57F54B10-B076-4DFA-AC34-899B440AD35C}.Release|Any CPU.ActiveCfg = Release|Any CPU
		{57F54B10-B076-4DFA-AC34-899B440AD35C}.Release|Any CPU.Build.0 = Release|Any CPU
	EndGlobalSection
	GlobalSection(SolutionProperties) = preSolution
		HideSolutionNode = FALSE
	EndGlobalSection
EndGlobal
  eos
end unless defined? SolutionFileData
