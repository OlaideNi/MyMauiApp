using Newtonsoft.Json;
using System;
using System.IO;
using System.Linq;
using System.Net.Http.Json;
using System.Text.Json.Serialization;
using System.Text.Json;

namespace interviewMobile.View;

public partial class LoginPg : ContentPage
{
    string durl = null;
    public LoginPg()
    {
        InitializeComponent();
        durl = "http://192.168.0.56:5000";
        
    }
    protected override async void OnAppearing()
    {
        base.OnAppearing();
        await LoadBirthAsync();
    }
    public class BirthdayEntry
    {
        [JsonPropertyName("name")]
        public string name { get; set; }

    }
    public class BirthdayResponse
    {
        [JsonPropertyName("value")]
        public List<BirthdayEntry> value { get; set; }

    }
    //private async Task LoadBirthAsync()
    //{
    //    //try
    //    //{
    //    //    using var client = new HttpClient();
    //    //    var result = await client.GetStringAsync("http://10.232.141.86:7500/api/GetBirth");
    //    //    birthLab.Text = result;

    //    //    Console.WriteLine($"Calling API at: {durl}/api/GetBirth");

    //    //}
    //    //catch (Exception ex)
    //    //{
    //    //    await DisplayAlert("Error", $"Unable to connect: {ex.GetType().Name} - {ex.Message}", "OK");
    //    //}
    //}

    private async Task LoadBirthAsync()
    {
        try
        {
            using var client = new HttpClient();

            var response = await client.GetAsync($"{durl}/api/GetBirth");

            if (response.IsSuccessStatusCode)
            {

                var json = await response.Content.ReadAsStringAsync();
                Console.WriteLine($"Raw JSON: {json}");


                var data = System.Text.Json.JsonSerializer.Deserialize<BirthdayResponse>(json);
                // string bname = data?.value?.FirstOrDefault()?.name;
                // birthLab.Text = $"Happy Birthday to: {bname}";
                if (data?.value != null && data.value.Count > 0)
                {
                    var message = "🎂 Happy Birthday to:\n";
                    foreach (var entry in data.value)
                    {
                        message += $"- {entry.name}\n";
                    }

                    birthLab.Text = message;
                }
                else
                {
                    birthLab.Text = "No birthdays found today.";
                }



            }
        }
        catch (HttpRequestException ex)
        {
            // Show a friendly error instead of crashing
            await DisplayAlert("Error", $"Something went wrong: {ex.Message}", "OK");

        }

    }
    private async void Button_Clicked(object sender, EventArgs e)
    {
       

        string pass = passEntry.Text.Trim();
        var httpclient = new HttpClient();

        var baseUrl = durl;
        
        // Correctly pass the parameter by name
        var response = await httpclient.GetAsync($"{durl}/api/GetUser?pass={pass}");
        

        if (response.IsSuccessStatusCode)
        {
            try
            {
                var json = await response.Content.ReadAsStringAsync();

                // Deserialize the JSON into a dynamic object
                var doc = System.Text.Json.JsonSerializer.Deserialize<JsonElement>(json);
                Console.WriteLine($"Raw JSON: {json}");

                // Extract the fullname field
                // Grab the "value" array
                if (doc.TryGetProperty("value", out JsonElement valueArray) &&
     valueArray.ValueKind == JsonValueKind.Array &&
     valueArray.GetArrayLength() > 0)
                {
                    // JsonElement user = valueArray.EnumerateArray().First();
                    JsonElement user = valueArray[0];

                    string fname = user.GetProperty("Fullname").GetString();
                    string sid = user.GetProperty("Staffid").ToString();
                    string sfunit = user.GetProperty("Shiftunit").GetString();

                    await Shell.Current.GoToAsync($"Home?name={Uri.EscapeDataString(fname)}&id={Uri.EscapeDataString(sid)}&shift={Uri.EscapeDataString(sfunit)}");


                    //await Shell.Current.GoToAsync($"StaffLogin?name={Uri.EscapeDataString(fname)}&id={Uri.EscapeDataString(sid)}&shift={Uri.EscapeDataString(sfunit)}");
                    // await Shell.Current.GoToAsync($"StaffLogin?name={Uri.EscapeDataString(fname)}");
                }


                else
                {
                    await DisplayAlert("Error", "Invalid password", "OK");

                    //  userEntry.Text = "No user found.";
                    Console.WriteLine(json); // or
                    System.Diagnostics.Debug.WriteLine(json);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"WebException: {ex.Message}");
                await DisplayAlert("Error", $"Failed to parse user data: {ex.Message}", "OK");

            }

        }
        else
        {
            await DisplayAlert("Alert", "Failed to retrieve item.", "OK");
            // userEntry.Text = "Failed to retrieve item.";
        }

    }
}