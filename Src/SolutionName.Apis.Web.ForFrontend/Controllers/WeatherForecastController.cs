using Microsoft.AspNetCore.Mvc;

namespace SolutionName.Apis.Web.ForFrontend.Controllers;

/// <summary>
/// Class WeatherForecastController.
/// </summary>
[ApiController]
[Route("[controller]")]
public class WeatherForecastController : ControllerBase
{
    /// <summary>
    /// The summaries
    /// </summary>
    private static readonly string[] Summaries =
    [
        "Freezing",
        "Bracing",
        "Chilly",
        "Cool",
        "Mild",
        "Warm",
        "Balmy",
        "Hot",
        "Sweltering",
        "Scorching",
    ];

    /// <summary>
    /// The logger
    /// </summary>
    private readonly ILogger<WeatherForecastController> _logger;

    /// <summary>
    /// Initializes a new instance of the <see cref="WeatherForecastController"/> class.
    /// </summary>
    /// <param name="logger">The logger.</param>
    public WeatherForecastController(ILogger<WeatherForecastController> logger)
    {
        _logger = logger;
    }

    /// <summary>
    /// Retrieves a collection of weather forecasts for the upcoming days.
    /// </summary>
    /// <returns>
    /// An enumerable collection of <see cref="WeatherForecast"/> objects, each representing the weather forecast for a specific day.
    /// </returns>
    /// <remarks>
    /// This method handles HTTP GET requests to the "GetWeatherForecast" endpoint. It logs the request using the provided logger and generates a list of weather forecasts for the next five days.
    /// Each forecast includes a date, a randomly generated temperature in Celsius, and a summary that describes the weather conditions.
    /// The temperature is generated within a range of -20 to 55 degrees Celsius, and the summary is selected randomly from a predefined array of summaries.
    /// The method returns the forecasts as an array, ensuring that the caller receives a complete set of data in a single response.
    /// </remarks>
    [HttpGet(Name = "GetWeatherForecast")]
    public IEnumerable<WeatherForecast> Get()
    {
        _logger.LogInformation("Requesting GetWeatherForecast endpoint");
        return Enumerable
            .Range(1, 5)
            .Select(index => new WeatherForecast
            {
                Date = DateOnly.FromDateTime(DateTime.UtcNow.AddDays(index)),
                TemperatureC = Random.Shared.Next(-20, 55),
                Summary = Summaries[Random.Shared.Next(Summaries.Length)],
            })
            .ToArray();
    }
}
