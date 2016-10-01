using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(File_Upload_Project.Startup))]
namespace File_Upload_Project
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
