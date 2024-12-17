# 🚀 CQRS (API + Worker) boilerplate template for .NET 🔷

💡🏗️ A boilerplate template for building **CQRS projects** (API + Worker) in **.NET C#**

---

## 📜 About

This repository is a **template** for kickstarting **CQRS-based solutions** in **.NET C#**. It includes both an **API project** and a **worker project** to streamline development and maintain a clean separation of concerns.  

🧩 **CQRS** (Command Query Responsibility Segregation) is an architectural pattern that separates the **read operations** (queries) from **write operations** (commands), improving scalability and maintainability.

🔧 **Out of the box** features include:  
- Pre-configured solution structure.  
- **CI pipeline** with [AppVeyor](https://www.appveyor.com/).  
- Support for **Windows**, **Linux**, and **macOS** environments.  

> 💡 **Tip:**  
> AppVeyor CI is free for open-source projects. For private repositories, explore other CI tools like GitHub Actions, CircleCI, TeamCity, or Azure DevOps.

---

## ⚙️ Setup Instructions

> ⚠️ **Note:** The automated process supports **Windows**, **Linux**, and **macOS** environments.

### 🚀 Automated process  

1. Click the green button **USE THIS TEMPLATE**.  
2. Name your new project/repository.  
3. Clone your newly created repository to your local machine.  
4. Run the appropriate setup script for your OS:  
   - 🪟 On Windows: Execute `initial-setup.bat` or `initial-setup.ps1` 
   - 🐧 On Linux/Mac: Execute `initial-setup.sh`
5. Follow the on-screen instructions in your terminal.

---

### 🛠️ Manual process

If you prefer setting things up manually:  

1. Click the green button **USE THIS TEMPLATE**.  
2. Name your new project/repository.  
3. Clone your newly created repository to your local machine.  
4. Clean up and customize the project structure:  
   - Delete this file (`README.md`) and rename `README.template.md` to `README.md`.  
   - Update `appveyor.yml` with your **CI tokens** (use secure tokens) or replace AppVeyor with your preferred CI tool (GitHub Actions, Jenkins, CircleCI, TeamCity, Azure DevOps).  
   - Rename `SolutionName.sln` to your project/solution name.  
   - Update project names:  
     - `SolutionName.csproj`  
     - `SolutionName.Tests.csproj`  
     - `SolutionName.IntegrationTests.csproj`  
     - Update namespaces in the `Src/` and `Tests/` directories.  
   - Adjust test project references in:  
     - `Tests/SolutionName.Tests.csproj`  
     - `Tests/SolutionName.IntegrationTests.csproj`.  
   - Fix the badge paths in `README.md` (replace `{username}/{repo}` with your own details).  
   - Add usage instructions for your CQRS solution to `README.md`.  
   - Update `_config.yml` with project metadata for your GitHub Pages documentation site.

---

## 📄 License

This project is licensed under the **MIT License**.  

🔗 [View LICENSE](https://github.com/guibranco/cqrs-boilerplate-dotnet/blob/main/LICENSE) or read more at [opensource.org/licenses/MIT](http://opensource.org/licenses/MIT).

⚖️ Feel free to replace the license with one that better suits your project's needs.

---

## 🎯 Key Highlights  

- 🔷 **Built with .NET C#**  
- 🏗️ **CQRS Design**: Clean separation of commands and queries.  
- 🔄 **Cross-platform Support**: Windows, Linux, and macOS.  
- 🛠️ **CI Ready**: Pre-configured AppVeyor pipeline (customizable).  
- 🚀 **Quick Setup**: Automated scripts for easy initialization.

---

## 📢 Contributing

We welcome contributions! Feel free to submit issues, pull requests, or suggestions to improve this boilerplate.

---

**Happy coding!** 🎉👨‍💻👩‍💻
