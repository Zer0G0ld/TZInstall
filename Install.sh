#!/bin/bash
# Author: Matheus Torres/ CodeOpen/ Odin-Hat
# Function to install a tool
install_tool() {
  pkg=$1
  echo "==================="
  echo "Installing $pkg..."
  echo "==================="
  pkg install -y $pkg
}

# Function to clone a repository
clone_repo() {
  repo=$1
  echo "Cloning $repo..."
  git clone $repo
}

# Ask user if they want to install another tool/repo
install_another() {
  echo "Do you want to install another tool/repo? (y/n)"
  read answer
  if [ "$answer" == "y" ]
  then
    main
  elif [ "$answer" == "n" ]
  then
    exit 0
  else
    echo "Invalid input."
    install_another
  fi
}

# Main function
main() {
  # Ask user for the name of the tool/repo
  echo "Enter the name of the tool/repo to install/clone:"
  echo "If you want to clone a repository, please put the repository URL "
  read name

  # Check if the name is a tool or a repo
  if [ $(pkg list-installed | grep $name | wc -l) -gt 0 ]
  then
    install_tool $name
  else
    clone_repo $name
  fi

  install_another
}

main
