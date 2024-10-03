#!/bin/bash

echo "Project name (readable version):"
read ProjectName
echo "Brief resume of this project:"
read ProjectDescription
echo "Solution name / NuGet package name (SlugVersion):"
read SolutionName
echo "GitHub username:"
read GitHubUsername
echo "GitHub repository:"
read GitHubRepo
echo "AppVeyor project ID (badge):"
read AppVeyorId
echo "Codacy project ID (badge):"
read CodacyId
echo "Code Climate project ID (badge):"
read CodeClimateId
echo "Codebeat project UUID (badge):"
read CodebeatId
echo "DeepSource project ID (badge):"
read DeepSourceId
echo "Company/Author name (package copyright):"
read CompanyName
echo "Codacy secure token (AppVeyor):"
read CodacyToken
echo "Code Climate secure token (AppVeyor):"
read CodeClimateToken

MainProjectFile="Src/$SolutionName/$SolutionName.csproj"
IntegrationTestProjectFile="Tests/$SolutionName.IntegrationTests/$SolutionName.IntegrationTests.csproj"
UnitTestProjectFile="Tests/$SolutionName.Tests/$SolutionName.Tests.csproj"

rm README.md
mv README.template.md README.md

sed -i "s/{username}/$GitHubUsername/g" README.md
sed -i "s/{repo}/$GitHubRepo/g" README.md
sed -i "s/{appVeyorId}/$AppVeyorId/g" README.md
sed -i "s/{codacyId}/$CodacyId/g" README.md
sed -i "s/{codeClimateId}/$CodeClimateId/g" README.md
sed -i "s/{codebeatId}/$CodebeatId/g" README.md
sed -i "s/{deepSourceId}/$DeepSourceId/g" README.md
sed -i "s/SolutionName/$SolutionName/g" README.md
sed -i "s/{PackageName}/$SolutionName/g" README.md
sed -i "s/{Project Name}/$ProjectName/g" README.md
sed -i "s/{Project Description}/$ProjectDescription/g" README.md

sed -i "s/CQRS (API + Worker) Boilerplate .NET/$ProjectName/g" .wakatime-project

sed -i "s/CQRS (API + Worker) Boilerplate/$ProjectName/g" _config.yml
sed -i "s/A repository template for .NET CQRS (API + Worker) projects./$ProjectDescription/g" _config.yml
sed -i "s/GuilhermeStracini/cqrs-boilerplate-dotnet/$GitHubUsername/$GitHubRepo/g" _config.yml

sed -i "s/<secure token from Codacy>/$CodacyToken/g" appveyor.yml
sed -i "s/<secure token from CodeClimate>/$CodeClimateToken/g" appveyor.yml

find . -type f -name "*.cs*" -exec sed -i "s/SolutionName/$SolutionName/g" {} \;

find . -type f -name "*.csproj*" -exec sed -i "s/SolutionName/$SolutionName/g" {} \;

sed -i "s/SolutionName/$SolutionName/g" SolutionName.sln
mv SolutionName.sln "$SolutionName.sln"

sed -i "s/{username}/$GitHubUsername/g" "$MainProjectFile"
sed -i "s/{repo}/$GitHubRepo/g" "$MainProjectFile"
sed -i "s/{companyName}/$CompanyName/g" "$MainProjectFile"
sed -i "s/{project description}/$ProjectDescription/g" "$MainProjectFile"

mv "$MainProjectFile" "Src/SolutionName/$SolutionName.csproj"
mv "$IntegrationTestProjectFile" "Tests/SolutionName.IntegrationTests/$SolutionName.IntegrationTests.csproj"
mv "$UnitTestProjectFile" "Tests/SolutionName.Tests/$SolutionName.Tests.csproj"

mv "Src/SolutionName" "Src/$SolutionName"
mv "Tests/SolutionName.IntegrationTests" "Tests/$SolutionName.IntegrationTests"
mv "Tests/SolutionName.Tests" "Tests/$SolutionName.Tests"

rm initial-setup.bat
rm initial-setup.ps1
rm initial-setup.sh
