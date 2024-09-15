using System.Diagnostics.CodeAnalysis;

namespace SolutionName.Workers.WorkerDaemon;

/// <summary>
/// Class Worker.
/// </summary>
[ExcludeFromCodeCoverage]
public class Worker : BackgroundService
{
    /// <summary>
    /// The logger.
    /// </summary>
    private readonly ILogger<Worker> _logger;

    /// <summary>
    /// Initializes a new instance of the <see cref="Worker"/> class.
    /// </summary>
    /// <param name="logger">The logger.</param>
    public Worker(ILogger<Worker> logger)
    {
        _logger = logger;
    }

    /// <summary>
    /// Execute as an asynchronous operation.
    /// </summary>
    /// <param name="stoppingToken">
    /// Triggered when <see cref="IHostedService.StopAsync(CancellationToken)"/> is called.
    /// </param>
    /// <returns>A Task representing the asynchronous operation.</returns>
    /// <remarks>
    /// See <see href="https://docs.microsoft.com/dotnet/core/extensions/workers">Worker Services in
    /// .NET</see> for implementation guidelines.
    /// </remarks>
    protected override async Task ExecuteAsync(CancellationToken stoppingToken)
    {
        while (!stoppingToken.IsCancellationRequested)
        {
            if (_logger.IsEnabled(LogLevel.Information))
            {
                _logger.LogInformation("Worker running at: {time}", DateTimeOffset.Now);
            }

            await Task.Delay(1000, stoppingToken);
        }
    }
}
