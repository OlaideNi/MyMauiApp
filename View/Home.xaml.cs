using interviewMobile.Models;
using Microsoft.Maui.Controls;
using System.Net.Http;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Net.Http.Json;
using System.Threading.Tasks;
using System.Xml.Linq;




namespace interviewMobile.View
{

    [QueryProperty(nameof(FullName), "name")]

    public partial class Home : ContentPage
    {
        public string FullName { get; set; }

        private readonly ApiService _apiService;

        public Home()
        {
            InitializeComponent();
            _apiService = new ApiService();
            _ = LoadNames(); // fire-and-forget
        }

        // Response wrapper for candidate list
        public class PeopleResponse
        {
            public List<Person> Value { get; set; }
        }

        // Candidate model
        public class Person
        {
            public int Id { get; set; }                // ✅ candidate Id

            public DateTime Date { get; set; }
            public string Name { get; set; } = string.Empty;
            public string Qualification { get; set; } = string.Empty;
            public string Position { get; set; } = string.Empty;
        }
        public class CandidateScoreResponse
        {
            public List<CandidateScore> Value { get; set; }
        }

        // API service class
        public class ApiService
        {
            private readonly HttpClient _httpClient;


            public ApiService()
            {
                _httpClient = new HttpClient
                {
                    BaseAddress = new Uri("http://10.232.141.86:5000")
                };
            }

            // Fetch candidate list
            public async Task<List<Person>> GetPeopleAsync()
            {
                string cDat = DateTime.Now.ToString("yyyy-MM-dd");
                string url = $"api/GetIntervList?dt={Uri.EscapeDataString(cDat)}";

                var response = await _httpClient.GetFromJsonAsync<PeopleResponse>(url);
                return response?.Value ?? new List<Person>();
            }

            ///Check existing scores
            public async Task<CandidateScore?> GetScoresAsync(int candidateId, string reporter)
            {
                string url = $"api/GetIntervScores?candId={candidateId}&reporter={Uri.EscapeDataString(reporter)}";

                var response = await _httpClient.GetFromJsonAsync<CandidateScoreResponse>(url);

                // Return the first score if it exists
                return response?.Value?.FirstOrDefault();

            }


            // Submit scores

            public async Task<bool> SubmitScoresAsync(CandidateScore score)
            {
                var response = await _httpClient.PutAsJsonAsync("api/checkIntervScore", score);
                // Debugging output
                //var content = await response.Content.ReadAsStringAsync();
                //await Application.Current.MainPage.DisplayAlert(
                //    "Debug",
                //    $"Status: {response.StatusCode}\nContent: {content}",
                //    "OK"
                //);

                return response.IsSuccessStatusCode;

            }



        }/////END API SERVICE

        // Load candidate names into Picker
        private async Task LoadNames()
        {
            var people = await _apiService.GetPeopleAsync();
            //   await DisplayAlert("Debug", $"Fetched {people.Count} records", "OK");
            NamePicker.ItemsSource = people;
        }

        // Show qualification when candidate is selected
        private async void NamePicker_SelectedIndexChanged(object sender, EventArgs e)
        {
            var selectedPerson = (Person)NamePicker.SelectedItem;
            if (selectedPerson != null)
            {
                //  

                QualificationLabel.Text = "Qualification: " + selectedPerson.Qualification;
                PositionLabel.Text = "Position: " + selectedPerson.Position;

                // ✅ Now await works
                var existingScore = await _apiService.GetScoresAsync(selectedPerson.Id, FullName);

                if (existingScore != null)
                {
                    //  await DisplayAlert("Debug", $"You picked: {selectedPerson.Name}", "OK");
                    // Load existing scores
                    BasicQualificationEntry.Text = existingScore.Basic.ToString();
                    DressingEntry.Text = existingScore.Dress.ToString();
                    PracticalEntry.Text = existingScore.Practical.ToString();
                    OralEntry.Text = existingScore.Oral.ToString();
                    ComputerKnowledgeEntry.Text = existingScore.Comp.ToString();
                    Diction.Text = existingScore.Diction.ToString();
                    Comportment.Text = existingScore.Comportment.ToString();
                    Written.Text = existingScore.Written.ToString();
                    Experience.Text = existingScore.Experience.ToString();
                    Comment.Text = existingScore.Comment.ToString();


                }
                else
                {
                    // No scores yet → reset to zero
                    BasicQualificationEntry.Text = "0";
                    DressingEntry.Text = "0";
                    PracticalEntry.Text = "0";
                    OralEntry.Text = "0";
                    ComputerKnowledgeEntry.Text = "0";
                    Diction.Text = "0";
                    Comportment.Text = "0";
                    Written.Text = "0";
                    Experience.Text = "0";
                    Comment.Text = "0";
                }

            }
        }

        // Parse score safely (empty = 0)
        private int ParseScore(string input)
        {
            return int.TryParse(input, out int value) ? value : 0;
        }

        // Handle submit button click
        private async void OnSubmitClicked(object sender, EventArgs e)
        {
            // ✅ Ensure a candidate is selected
            var selectedPerson = (Person)NamePicker.SelectedItem;
            if (selectedPerson == null)
            {
                await DisplayAlert("Error", "Please select a candidate before submitting scores.", "OK");
                return; // stop execution
            }


            var score = new CandidateScore
            {

                CandId = selectedPerson.Id,
                Basic = ParseScore(BasicQualificationEntry.Text),
                Dress = ParseScore(DressingEntry.Text),
                Practical = ParseScore(PracticalEntry.Text),
                Oral = ParseScore(OralEntry.Text),
                Comp = ParseScore(ComputerKnowledgeEntry.Text),
                Reporter = FullName,
                Date = DateTime.Now.ToString("yyyy-MM-dd"),
                Diction = ParseScore(Diction.Text),
                Comportment = ParseScore(Comportment.Text),
                Written = ParseScore(Written.Text),
                Experience = ParseScore(Experience.Text),
                Comment = Comment.Text
            };


            // Submit to API
            bool success = await _apiService.SubmitScoresAsync(score);


            if (success)
                await DisplayAlert("Success", "Scores submitted successfully!", "OK");
            else
                await DisplayAlert("Error", "Failed to submit scores.", "OK");


        }
        private async void OnLogClicked(object sender, EventArgs e)
        {
            Preferences.Clear(); // Optional: clear login/session data

            await Shell.Current.GoToAsync("//LoginPg");

            // await DisplayAlert("Test", "Logout button clicked!", "OK");
        }
    }
    }