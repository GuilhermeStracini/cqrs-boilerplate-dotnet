using FluentAssertions;

namespace SolutionName.Tests.ForFrontend.IntegrationTests;

/// <summary>
/// Class UnitTest1.
/// </summary>
public class UnitTest1
{
    /// <summary>
    /// Defines the test method Test1.
    /// </summary>
    [Fact]
    public void Test1()
    {
        // Arrange
        var expected = "Hello World!";

        // Act

        // Assert
        expected.Should().Be("Hello World!");
    }
}
