# Project Name

A brief description of what this project does and who it's for.

## Table of Contents

- [About](#about)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Usage](#usage)
- [Features](#features)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## About

Provide a more detailed description of your project here. Explain what problem it solves, what makes it unique, and any relevant background information.

## Getting Started

### Prerequisites

List any prerequisites needed to run this project. For example:

```bash
# Example prerequisites
node >= 18.0.0
npm >= 9.0.0
```

### Installation

Step-by-step instructions on how to get a development environment running:

```bash
# Clone the repository
git clone https://github.com/yourusername/vanes-test.git

# Navigate to the project directory
cd vanes-test

# Install dependencies
npm install

# Run the project
npm start
```

## Usage

Provide examples of how to use your project. Include code snippets, screenshots, or command-line examples:

```bash
# Example usage
npm run build
```

## Features

- Feature 1
- Feature 2
- Feature 3

## Cursor Commands

### run create new branch

This repository includes a custom Cursor command to streamline the git branching workflow. The command automates the process of safely creating a new branch while ensuring your current work is saved and your main branch is up to date.

#### Usage

In Cursor, simply type or say:

```
run create new branch
```

Or invoke it through Cursor's command interface by typing the command name.

#### What it does

The command follows these steps automatically:

1. **Check current branch** - Shows your current git branch status
2. **Save current work** (if not on main):
   - Detects uncommitted changes and prompts to commit them
   - Checks if branch has unpushed changes
   - Offers to push changes to remote
3. **Switch to main** - Checks out the main branch
4. **Update main** - Fetches and pulls the latest changes from origin/main
5. **Create new branch** - Prompts for a branch name and creates it
6. **Verify** - Confirms successful branch creation

#### How it works

The command is defined in `.cursorrules` and Cursor AI will execute the workflow by:

- Running the appropriate git commands in sequence
- Prompting you for input when needed (commit messages, branch names)
- Handling edge cases (uncommitted changes, unpushed commits, etc.)
- Providing clear feedback at each step

## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

Distributed under the MIT License. See `LICENSE` file for more information.

## Contact

Your Name - [@yourtwitter](https://twitter.com/yourtwitter) - email@example.com

Project Link: [https://github.com/yourusername/vanes-test](https://github.com/yourusername/vanes-test)
