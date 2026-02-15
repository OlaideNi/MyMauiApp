using interviewMobile.View;
namespace interviewMobile
{
    public partial class AppShell : Shell
    {
        public AppShell()
        {
            InitializeComponent();

            Routing.RegisterRoute(nameof(LoginPg), typeof(LoginPg));
            Routing.RegisterRoute(nameof(Home), typeof(Home));
        }
    }
}
