using FluentAssertions;

namespace SolutionName.Tests.UnitTests;

public class UnitTest1
{
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