require 'iron_hammer/projects/assembly_info'

module IronHammer
  module Projects

    describe AssemblyInfo do
      it "should read version from AssemblyInfo" do
        assembly_info = AssemblyInfo.new <<ASSEMBLY
... anything
// by using the '*' as shown below:
// [assembly: AssemblyVersion("1.0.*")]
[assembly: AssemblyVersion("1.0.0.0")]
[assembly: AssemblyFileVersion("1.0.0.0")]
ASSEMBLY
        assembly_info.version.should == '1.0.0.0'
      end
    end
  end
end
