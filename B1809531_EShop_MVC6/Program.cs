using Arch.EntityFrameworkCore.UnitOfWork;
using AspNetCoreHero.ToastNotification;
using B1809531_EShop_MVC6.Data;
using B1809531_EShop_MVC6.Services;
using B1809531_EShop_MVC6.Services.Interfaces;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using reCAPTCHA.AspNetCore;
using System.Configuration;
using System.Text.Json.Serialization;

var builder = WebApplication.CreateBuilder(args);
//Add Auto Mapper
builder.Services.AddAutoMapper(typeof(Program));

// Add services to the container.
builder.Services.AddControllersWithViews()
	.AddRazorRuntimeCompilation()
	.AddJsonOptions(options =>
	{
		options.JsonSerializerOptions.ReferenceHandler = ReferenceHandler.IgnoreCycles;
		options.JsonSerializerOptions.WriteIndented = true;
	});
//add cookie auth
builder.Services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme)
.AddCookie(options =>
{
	options.ExpireTimeSpan = TimeSpan.FromHours(24);
	options.SlidingExpiration = true;
	options.AccessDeniedPath = new PathString("/User/Forbidden");	
});
// Add recaptcha and pass recaptcha configuration section
builder.Services.AddRecaptcha(builder.Configuration.GetSection("RecaptchaSettings"));

//Add noitify
builder.Services.AddNotyf(config => { config.DurationInSeconds = 3; config.IsDismissable = true; config.Position = NotyfPosition.TopRight; });

//Config database
builder.Services.AddDbContext<NIENLUANContext>(
			   x => x.UseSqlServer(builder.Configuration.GetConnectionString("eshop")));

//Add Unitofwork
builder.Services.AddUnitOfWork<NIENLUANContext>();

//Add Services
builder.Services.AddTransient(typeof(IFileManagerServies), typeof(FileManagerServies));

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
	app.UseExceptionHandler("/Home/Error");
	// The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
	app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();
//for cookie auth
var cookiePolicyOptions = new CookiePolicyOptions
{
	MinimumSameSitePolicy = SameSiteMode.Strict,
	HttpOnly = Microsoft.AspNetCore.CookiePolicy.HttpOnlyPolicy.Always,
	Secure = CookieSecurePolicy.None,
};
app.UseCookiePolicy(cookiePolicyOptions);
app.UseAuthentication();
app.UseAuthorization();

app.MapControllerRoute(
	  name: "areas",
	  pattern: "{area:exists}/{controller=Home}/{action=Index}/{id?}"
	);
app.MapControllerRoute(
	name: "default",
	pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
