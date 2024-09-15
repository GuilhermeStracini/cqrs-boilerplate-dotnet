using FluentAssertions;

namespace SolutionName.Tests.UnitTests;

/// <summary>
/// Class UnitTest1.
/// </summary>
public class UnitTest1
/// <summary>
/// Tests the functionality of a specific feature in the application.
/// </summary>
/// <remarks>
/// This test method, named <c>Test1</c>, is designed to verify that the expected output matches the actual output.
/// In this case, it checks if the string "Hello World!" is correctly asserted as the expected value.
/// The test uses the FluentAssertions library to perform the assertion, which provides a more readable syntax for verifying conditions.
/// The method is marked with the <c>[Fact]</c> attribute, indicating that it is a test method that should be executed by the testing framework.
/// </remarks>
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
