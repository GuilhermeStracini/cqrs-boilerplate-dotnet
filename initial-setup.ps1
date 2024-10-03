$ProjectName = Read-Host -Prompt 'Project name (readable version)'
$ProjectDescription = Read-Host -Prompt 'Brief resume of this project'
$SolutionName = Read-Host -Prompt 'Solution name / NuGet package name (SlugVersion)'
$GitHubUsername = Read-Host -Prompt 'GitHub username'
$GitHubRepo = Read-Host -Prompt 'GitHub repository'
$AppVeyorId = Read-Host -Prompt 'AppVeyor project ID (badge)'
$CodacyId = Read-Host -Prompt 'Codacy project ID (badge)'
$CodeClimateId = Read-Host -Prompt 'Code Climate project ID (badge)'
$CodebeatId = Read-Host -Prompt 'Codebeat project UUID (badge)'
$DeepSourceId = Read-Host -Prompt 'DeepSource project ID (badge)'
$CompanyName = Read-Host -Prompt 'Company/Author name (package copyright)'
$CodacyToken = Read-Host -Prompt 'Codacy secure token (AppVeyor)'
$CodeClimateToken = Read-Host -Prompt 'Code Climate secure token (AppVeyor)'

$MainProjectFile = "Src/SolutionName/SolutionName.csproj"
$IntegrationTestProjectFile = "Tests/SolutionName.IntegrationTests/SolutionName.IntegrationTests.csproj"
$UnitTestProjectFile = "Tests/SolutionName.Tests/SolutionName.Tests.csproj"

Remove-Item README.md
Rename-Item -Path ".\README.template.md" -NewName ".\README.md"

(Get-Content README.md) | ForEach-Object { $_ -replace "{username}", $GitHubUsername } | Set-Content README.md
(Get-Content README.md) | ForEach-Object { $_ -replace "{repo}", $GitHubRepo } | Set-Content README.md
(Get-Content README.md) | ForEach-Object { $_ -replace "{appVeyorId}", $AppVeyorId } | Set-Content README.md
(Get-Content README.md) | ForEach-Object { $_ -replace "{codacyId}", $CodacyId } | Set-Content README.md
(Get-Content README.md) | ForEach-Object { $_ -replace "{codeClimateId}", $CodeClimateId } | Set-Content README.md
(Get-Content README.md) | ForEach-Object { $_ -replace "{codebeatId}", $CodebeatId } | Set-Content README.md
(Get-Content README.md) | ForEach-Object { $_ -replace "{deepSourceId}", $DeepSourceId } | Set-Content README.md
(Get-Content README.md) | ForEach-Object { $_ -replace "SolutionName", $SolutionName } | Set-Content README.md
(Get-Content README.md) | ForEach-Object { $_ -replace "{PackageName}", $SolutionName } | Set-Content README.md
(Get-Content README.md) | ForEach-Object { $_ -replace "{Project Name}", $ProjectName } | Set-Content README.md
(Get-Content README.md) | ForEach-Object { $_ -replace "{Project Description}", $ProjectDescription } | Set-Content README.md

(Get-Content .wakatime-project) | ForEach-Object { $_ -replace "CQRS (API + Worker) Boilerplate .NET", $ProjectName } | Set-Content .wakatime-project

(Get-Content _config.yml) | ForEach-Object { $_ -replace "CQRS (API + Worker) Boilerplate", $ProjectName } | Set-Content _config.yml
(Get-Content _config.yml) | ForEach-Object { $_ -replace "A repository template for .NET CQRS (API + Worker) projects.", $ProjectDescription } | Set-Content _config.yml
(Get-Content _config.yml) | ForEach-Object { $_ -replace "GuilhermeStracini/cqrs-boilerplate-dotnet", "$GitHubUsername/$GitHubRepo" } | Set-Content _config.yml

(Get-Content appveyor.yml) | ForEach-Object { $_ -replace "<secure token from Codacy>", $CodacyToken } | Set-Content appveyor.yml
(Get-Content appveyor.yml) | ForEach-Object { $_ -replace "<secure token from CodeClimate>", $CodeClimateToken } | Set-Content appveyor.yml

(Get-ChildItem -Recurse -Include *.cs*) | ForEach-Object { 
    $Content = Get-Content $_
    $Content = $Content -replace "SolutionName", $SolutionName
    Set-Content -Path $_.fullname -Value $Content
}

(Get-ChildItem -Recurse -Include *.csproj*) | ForEach-Object { 
    $Content = Get-Content $_
    $Content = $Content -replace "SolutionName", $SolutionName
    Set-Content -Path $_.fullname -Value $Content
}

(Get-Content SolutionName.sln) | ForEach-Object { $_ -replace "SolutionName", $SolutionName } | Set-Content SolutionName.sln
Rename-Item -Path ".\SolutionName.sln" ".\$SolutionName.sln"

(Get-Content $MainProjectFile) | ForEach-Object { $_ -replace "{username}", $GitHubUsername } | Set-Content $MainProjectFile
(Get-Content $MainProjectFile) | ForEach-Object { $_ -replace "{repo}", $GitHubRepo } | Set-Content $MainProjectFile
(Get-Content $MainProjectFile) | ForEach-Object { $_ -replace "{companyName}", $CompanyName } | Set-Content $MainProjectFile
(Get-Content $MainProjectFIle) | ForEach-Object { $_ -replace "{project description}", $ProjectDescription } | Set-Content $MainProjectFile

Rename-Item -Path $MainProjectFile -NewName "$SolutionName.csproj"
Rename-Item -Path $IntegrationTestProjectFile -NewName "$SolutionName.IntegrationTests.csproj"
Rename-Item -Path $UnitTestProjectFile -NewName "$SolutionName.Tests.csproj"

Rename-Item -Path "Src/SolutionName" "$SolutionName"
Rename-Item -Path "Tests/SolutionName.IntegrationTests" "$SolutionName.IntegrationTests"
Rename-Item -Path "Tests/SolutionName.Tests" "$SolutionName.Tests"

Remove-Item initial-setup.bat
Remove-Item initial-setup.ps1
Remove-Item initial-setup.sh
