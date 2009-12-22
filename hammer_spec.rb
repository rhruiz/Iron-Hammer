require 'hammer'
require 'spec'

describe Hammer do

    before :each do
        @fully_set_hammer = Hammer.new(
            :project            => @project            = "MyProject",
            :solution           => @solution           = "MySolution",
            :configuration      => @configuration      = "Debug",
            :dot_net_path       => @dot_net_path       = "path/to/.net",
            :test_project       => @test_project       = "TestProject",
            :test_config        => @test_config        = "TestConfig.testrunconfig",
            :test_dll           => @test_dll           = "MyTests.dll",
            :visual_studio_path => @visual_studio_path = "path/to/vs2008")
        @basic_hammer = Hammer.new :project => @project
    end

    it "should require either a project or solution name" do
        lambda{ Hammer.new }.should(raise_error ArgumentError)
    end

    it "should consider solution and project name to be the same when only one of them is informed" do
        Hammer.new(:project => "MyProject").project.should(be_eql "MyProject")
        Hammer.new(:project => "MyProject").solution.should(be_eql "MyProject.sln")
        Hammer.new(:solution => "MySolution").solution.should(be_eql "MySolution.sln")
        Hammer.new(:solution => "MySolution").project.should(be_eql "MySolution")
    end
    
    it "should consider solution and project name to be different when both are informed" do
        hammer = Hammer.new :project => "MyProject", :solution => "MySolution"
        hammer.project.should(be_eql "MyProject")
        hammer.solution.should(be_eql "MySolution.sln")
    end
    
    it "should consider the test project to assume a default name when its name is not informed" do
        hammer = Hammer.new :project => "MyProject", :solution => "MySolution"
        hammer.test_project.should(be_eql "MyProject.Tests") 
    end
    
    it "should consider the test project to be named as provided" do
        hammer = Hammer.new :test_project => "TestProject", 
            :project => "MyProject", 
            :solution => "MySolution"
        hammer.test_project.should(be_eql "TestProject") 
    end
    
    it "should assume the default path to .net framework when it is not informed" do
        @basic_hammer.dot_net_path.should(
            be_eql File.join(ENV["SystemRoot"], "Microsoft.NET", "Framework", "v3.5"))
    end
    
    it "should assume the provided path to .net framework when it is informed" do
        Hammer.new(:project => "MyProject", :dot_net_path => "path").dot_net_path.should(
            be_eql "path")
    end
    
    it "should assume the default configuration when it is not informed" do
        @basic_hammer.configuration.should(be_eql "Release")
    end
    
    it "should assume the provided configuration when it is informed" do
        Hammer.new(:project => "MyProject", :configuration => "conf").configuration.should(
            be_eql "conf")
    end
    
    it "should provide a proper build command line" do
        @fully_set_hammer.build.should(
            be_eql "#{File.join @dot_net_path, 'msbuild.exe'} " + 
                "/p:Configuration=#{@configuration} #{@solution}.sln /t:Rebuild")
    end
    
    it "should point to the default testrun config when it is not provided" do
        @basic_hammer.test_config.should(be_eql "LocalTestRun.testrunconfig")
    end
    
    it "should allow the customization of the test configuration" do
        Hammer.new(:project => "MyProject", :test_config => "TestConfig.testrunconfig").
            test_config.should(be_eql "TestConfig.testrunconfig")
    end
    
     it "should point to the default test dll config when it is not provided" do
        @basic_hammer.test_dll.should(be_eql "#{@basic_hammer.test_project}.dll")
    end
    
    it "should allow the customization of the test dll" do
        Hammer.new(:project => "MyProject", :test_dll => "MyTests.dll").
            test_dll.should(be_eql "MyTests.dll")
    end
    
    it "should point to the default path to visual studio tools when none is provided" do
        @basic_hammer.visual_studio_path.should(
            be_eql File.join(
                ENV["PROGRAMFILES"], "Microsoft Visual Studio 2008", "Common7", "IDE")) 
    end
    
    it "should point to the provided path to visual studio tools when it is informed" do
        Hammer.new(:project => "MyProject", :visual_studio_path => "PathToVisual").
            visual_studio_path.should(be_eql "PathToVisual") 
    end
    
    it "should provide a proper command line to run tests" do
        details = ""
        ["duration", "errorstacktrace", "errormessage", "outcometext"].collect do |detail|
            "/detail:#{detail} "
        end.each do |detail|
            details << detail
        end
        
        @fully_set_hammer.test.should(
            be_eql File.join(
                @visual_studio_path, 
                "mstest.exe /testcontainer:" + 
                File.join(@test_project, "bin", @configuration, @test_dll) +
                " /resultsfile:#{File.join 'TestResults', 'TestResults.trx'} " + details))
    end
end