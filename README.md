# 🚀 Dev Environment Wizard 🧙‍♂️

Welcome to the magical world of automated development environment setup! 🎩✨

## 💁‍♀️ Why this project...

Have you ever been asked to set up a project with specific requirements like npm 8.1.0 and Node.js v16.13.0? Sure, you can use nvm to manage Node.js versions, but this doesn't completely isolate the project from your local machine's configuration. 🖥️

That's where our Docker-based setup script comes in! 🐳 By using Docker, you create a fully isolated and reproducible environment, avoiding the "works on my machine" syndrome. This ensures everyone works in the same setup, free from system-specific quirks. With just a few commands, you're ready to code in a perfectly tailored environment. 🚀✨

Feel free to add whatever dependencies you need to the script. Play around and have fun!

## 🌟 What's This Sorcery?

This script is your personal dev environment genie 🧞‍♂️. With just a few magic words (aka command-line arguments), you can conjure up a fully customized Docker-based development environment faster than you can say "abracadabra"!

## 📋 Prerequisites

Before you begin your magical journey, ensure you have the following:

🐳 Docker Desktop installed on your machine

Download and install from Docker's official website
Make sure Docker Desktop is running before using this script
💻 A terminal or command prompt to run the commands

🧙‍♂️ Basic familiarity with command-line interfaces

## 🔮 Features

🐳 Docker-powered environments
🔧 Customizable npm and Node.js versions
📦 Automatic package.json creation
🏗️ Project structure generation
🧹 Clean and consistent setup across machines

## 🧚‍♀️ Why Use This Magic Spell?

Save Time: No more tedious manual setups! ⏱️
Consistency: Same environment everywhere, every time 🔄
Customization: Tailor your env to your project's needs 🎨
Version Control: Keep your env settings in your repo 📚
Shareable: Easy for team members to get up and running 🤝

## 🧙‍♂️ How to Cast the Spell

Clone this enchanted repository:
```shell
git clone https://github.com/zerodeleo/dev-environment-wizard.git
```

Navigate to the mystical directory:
```shell
cd dev-environment-wizard
```

Make the script executable (give it magical powers):
```shell
chmod +x setup_dev_env.sh
```

Cast your spell (run the script):
```shell
./setup_dev_env.sh [options]
```

E.g.

```shell
./setup_dev_env.sh --name your-project-name --npm 8.1.0 --node 16.13.0
```

Watch in awe as your development environment materializes before your eyes! 🎆

## 🔮 Customization Options

--name NAME: Set the project name (default: dev-environment-wizard)
--npm VERSION: Set npm version (default: latest)
--node VERSION: Set Node.js version (default: latest)
--help: Show the help message

## 🧙‍♀️ Examples

Use all latest versions:
```shell
./setup_dev_env.sh
```

Customize npm and Node.js versions:
```shell
./setup_dev_env.sh --name my-awesome-project --npm 8.1.0 --node 16.13.0
```

Specify a custom project name:
```shell
./setup_dev_env.sh --name cool-project
```

## 🧙‍♂️ What's Inside the Cauldron?

This script conjures:

A new directory for your project 📁
A Dockerfile with your specified versions 📄
A basic package.json 📦
An index.js file that reports your environment details 📊
A CSS file for styling your project 🎨
A Docker image built to your specifications 🐳
A ready-to-use containerized environment 🖥️

## 🦄 Contributing

Found a way to make this spell even more powerful? Contributions are welcome! Fork this repo, wave your wand (make your changes), and send us a magical pull request! ✨

## 🧙‍♂️ About the Wizard

This magical script was crafted by Julia Stjerna, a wizard of development automation. May it serve you well on your coding quests! 🏰

## 🔍 Troubleshooting

If you encounter any issues or the magic seems to fizzle:

Ensure Docker is installed and running on your system 🐳
Check your internet connection for downloading packages 🌐
Make sure you have sufficient permissions to run Docker commands 🔐
If problems persist, open an issue in this repo and our team of wizards will assist you! 🆘

Remember, with great power comes great responsibility. Use this magic wisely! 🧙‍♀️✨
