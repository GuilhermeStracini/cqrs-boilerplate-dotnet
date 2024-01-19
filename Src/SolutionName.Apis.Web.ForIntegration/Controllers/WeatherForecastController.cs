using Microsoft.AspNetCore.Mvc;

namespace SolutionName.Apis.Web.ForIntegration.Controllers;

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
        "Scorching"
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
    /// Gets this instance.
    /// </summary>
    /// <returns>System.Collections.Generic.IEnumerable&lt;SolutionName.Apis.Web.ForIntegration.WeatherForecast&gt;.</returns>
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
                Summary = Summaries[Random.Shared.Next(Summaries.Length)]
            })
            .ToArray();
    }
}
